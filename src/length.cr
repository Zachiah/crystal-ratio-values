abstract class Length
    include Comparable(Length)
    getter value

    def <=>(other)
        if to_cm.value > other.to_cm.value
            1
        elsif to_cm.value < other.to_cm.value
            -1
        else
            0
        end
    end

    macro inherited
        def +(other)
            {{@type}}.new(value + other.to_{{@type.name.downcase}}.value)
        end
    end

    def -
        self.class.new(-value)
    end

    def -(other)
        self + -other
    end

    def *(num)
        self.class.new(value * num)
    end

    def /(num)
        self.class.new(value / num)
    end

    def initialize(@value : Float64)
    end


    macro finished

        {% for subtype in @type.subclasses %}
            def to_{{subtype.name.downcase}}
                final = value * self.class.cm_conv / {{subtype}}.cm_conv
                {{subtype}}.new(final)
            end
        {% end %}
    end
end

class Cm < Length
    def self.cm_conv
        1
    end
end

class In < Length
    def self.cm_conv
        2.54
    end
end

class Ft < Length
    def self.cm_conv
        In.cm_conv * 12
    end
end

class Mm < Length
    def self.cm_conv
        1 / 10
    end
end
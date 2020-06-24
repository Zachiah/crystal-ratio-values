abstract class Length
    include Comparable(Length)
    getter value
    getter power

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
            if power != other.power
                raise ArgumentError.new("Can't add ratio_values of two different powers #{power}, and #{other.power}")
            end
            {{@type}}.new(value + other.to_{{@type.name.downcase}}.value, power)
        end
    end

    def -
        self.class.new(-value, power)
    end

    def -(other)
        self + -other
    end

    def *(num)
        self.class.new(value * num, power)
    end

    def /(num)
        self.class.new(value / num, power)
    end

    def initialize(@value : Float64, @power : UInt32 = 1)
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
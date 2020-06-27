abstract class Length
    include Comparable(Length)
    getter value
    getter power

    def <=>(other)
        if power != other.power
            raise ArgumentError.new("Can't compare ratio_values of two different powers #{power}, and #{other.power}")
        end

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

        def *(other : Length)
            {{@type}}.new(value * other.to_{{@type.name.downcase}}.value, power + other.power)
        end

        def /(other : Length)
            {{@type}}.new(value / other.to_{{@type.name.downcase}}.value, power - other.power)
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

    def **(num)
        self.class.new(value ** num, power * num)
    end

    def initialize(@value : Int32 | Float64, @power : Int32 = 1)
    end


    macro finished

        {% for subtype in @type.subclasses %}
            def to_{{subtype.name.downcase}}
                final = value * self.class.cm_conv / {{subtype}}.cm_conv
                {{subtype}}.new(final, power)
            end
        {% end %}
    end
end

macro new_length(name, cm_conv)
    class {{name}} < Length
        def self.cm_conv
            {{cm_conv}}
        end
    end
end

new_length(Cm, 1)
new_length(In, 2.54)
new_length(Ft, 2.54*12)
new_length(Mm,1/10)
new_length(Dm,10)
new_length(Mi, 2.54*12*5280)
new_length(Yd, 2.54*36)

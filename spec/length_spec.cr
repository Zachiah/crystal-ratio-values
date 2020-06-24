require "./spec_helper"

describe Length do
    it "compares acurately" do
        (Mm.new(2) < Mm.new(5)).should eq(true)
        (Mm.new(3) == Mm.new(3)).should eq(true)
        (Ft.new(1) == In.new(12)).should eq(true)
    end

    it "adds accurately" do
        (Mm.new(2) + Cm.new(4)).should eq(Mm.new(42)) 
    end

    it "gives the first type when adding" do
        (Mm.new(2) + In.new(4)).class.should eq (Mm)
    end

    it "works with unary negative" do
        (-Mm.new(2)).should eq(Mm.new(-2))
    end

    it "returns accurate type when doing unary negative" do
        (-Mm.new(2)).class.should eq(Mm)
    end

    it "subtracts accurately" do
        (Cm.new(4) - Mm.new(2)).should eq(Cm.new(3.8))
    end

    it "gives the first type when subtracting" do
        (Cm.new(4) - Mm.new(2)).class.should eq(Cm)
    end

    it "multiplies accurately" do
        (Cm.new(4) * 5).should eq(Cm.new(20))
    end

    it "gives the right type when multiplying" do
        (Cm.new(4) * 5).class.should eq(Cm)
    end

    it "divides accurately" do
        (Cm.new(20) / 5).should eq(Cm.new(4))
    end

    it "gives the right type when dividing" do
        (Cm.new(20) / 5).class.should eq(Cm)
    end
end
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

    it "gives the right power when adding" do
        (Mm.new(2,3) + In.new(3,3)).power.should eq(3)
    end

    it "should raise an error when adding two different powers" do
        # READ DOCS AND WRITE THIS
        # Cm.new(20) + Cm.new(20,2)
    end

    it "works with unary negative" do
        (-Mm.new(2)).should eq(Mm.new(-2))
    end


    it "gives the right power when doing unary negative" do
        (-Mm.new(2,10)).power.should eq(10)
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

    it "gives the right power when subtracting" do
        (Mm.new(2,3) - In.new(3,3)).power.should eq(3)
    end

    it "should raise an error when subtracting two different powers" do
        # READ DOCS AND WRITE THIS
        # Cm.new(20) - Cm.new(20,2)
    end

    it "multiplies by scalar accurately" do
        (Cm.new(4) * 5).should eq(Cm.new(20))
    end

    it "gives the right type when multiplying by scalar" do
        (Cm.new(4) * 5).class.should eq(Cm)
    end

    it "gives the right power when multiplying by scalar" do
        (Mm.new(2,3) * 4).power.should eq(3)
    end

    it "divides by scalar accurately" do
        (Cm.new(20) / 5).should eq(Cm.new(4))
    end

    it "gives the right type when dividing by scalar" do
        (Cm.new(20) / 5).class.should eq(Cm)
    end

    it "gives the right power when dividing by scalar" do
        (Mm.new(2,3) / 4).power.should eq(3)
    end

    it "multiplies by another length acurately" do
        (Mm.new(3) * Mm.new(2)).should eq(Mm.new(6,2))
    end

    it "gives the right type when multiplying by another length" do
        (Mm.new(2) * In.new(1000)).class.should eq(Mm)
    end

    it "divides by another length acurately" do
        (Mm.new(20,4) / (Mm.new(10,3))).should eq(Mm.new(2,1))
    end

    it "gives the right type when dividing by another length" do
        (Mm.new(20,4) / (In.new(1000))).class.should eq(Mm)
    end

end
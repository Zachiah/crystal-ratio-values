require "./spec_helper"

describe Length do
    it "compares acurately" do
        (Mm.new(2) < Mm.new(5)).should eq(true)
        (Mm.new(3) == Mm.new(3)).should eq(true)
        (Ft.new(1) == In.new(12)).should eq(true)
        (Mm.new(1000) > In.new(1)).should eq(true)
    end

    it "adds accurately" do
        (Mm.new(2) + Cm.new(4)).should eq(Mm.new(42))
        (In.new(10) + Ft.new(1)).should eq(In.new(22)) 
    end

    it "gives the first type when adding" do
        (Mm.new(2) + In.new(4)).class.should eq (Mm)
        (In.new(100) + Mm.new(10)).class.should eq(In)
    end

    it "gives the right power when adding" do
        (Mm.new(2,3) + In.new(3,3)).power.should eq(3)
        (Mm.new(100,4) + Cm.new(3,4)).power.should eq(4)
    end

    it "should raise an error when adding two different powers" do
        # READ DOCS AND WRITE THIS
        # Cm.new(20) + Cm.new(20,2)
    end

    it "works with unary negative" do
        (-Mm.new(2)).should eq(Mm.new(-2))
        (-Ft.new(5)).should eq(Ft.new(-5))
    end


    it "gives the right power when doing unary negative" do
        (-Mm.new(2,10)).power.should eq(10)
        (-Ft.new(2,123)).power.should eq(123)
    end


    it "returns accurate type when doing unary negative" do
        (-Mm.new(2)).class.should eq(Mm)
        (-Ft.new(100,2)).class.should eq(Ft)
    end

    it "subtracts accurately" do
        (Cm.new(4) - Mm.new(2)).should eq(Cm.new(3.8))
        (Ft.new(100) - In.new(12)).should eq(Ft.new(99))
    end

    it "gives the first type when subtracting" do
        (Cm.new(4) - Mm.new(2)).class.should eq(Cm)
        (In.new(5) - Mm.new(23.3)).class.should eq(In)
    end

    it "gives the right power when subtracting" do
        (Mm.new(2,3) - In.new(3,3)).power.should eq(3)
        (Mm.new(2,5) - In.new(1000000,5)).power.should eq(5)
    end

    it "should raise an error when subtracting two different powers" do
        # READ DOCS AND WRITE THIS
        # Cm.new(20) - Cm.new(20,2)
    end

    it "multiplies by numeric accurately" do
        (Cm.new(4) * 5).should eq(Cm.new(20))
        (In.new(10) * 5).should eq(In.new(50))
    end

    it "gives the right type when multiplying by numeric" do
        (Cm.new(4) * 5).class.should eq(Cm)
        (Ft.new(1000) * 0.2).class.should eq(Ft)
    end

    it "gives the right power when multiplying by numeric" do
        (Mm.new(2,3) * 4).power.should eq(3)
        (Ft.new(2,1234) * 4).power.should eq(1234)
    end

    it "divides by numeric accurately" do
        (Cm.new(20) / 5).should eq(Cm.new(4))
        (Cm.new(30000) / 30000).should eq(Cm.new(1))
    end

    it "gives the right type when dividing by numeric" do
        (Cm.new(20) / 5).class.should eq(Cm)
        (Ft.new(20) /5).class.should eq(Ft)
    end

    it "gives the right power when dividing by numeric" do
        (Mm.new(2,3) / 4).power.should eq(3)
        (Ft.new(2,100) / 4).power.should eq(100)
    end

    it "multiplies by another length acurately" do
        (Mm.new(3) * Mm.new(2)).should eq(Mm.new(6,2))
        (Cm.new(40000) * Mm.new(4,10)).should eq(Cm.new(16000,11))
    end

    it "gives the right type when multiplying by another length" do
        (Mm.new(2) * In.new(1000)).class.should eq(Mm)
        (Ft.new(4) * Ft.new(10)).class.should eq(Ft)
    end

    it "divides by another length acurately" do
        (Mm.new(20,4) / (Mm.new(10,3))).should eq(Mm.new(2,1))
        (Ft.new(144,100) / (In.new(144,99))).should eq(Ft.new(12,1))
    end

    it "gives the right type when dividing by another length" do
        (Mm.new(20,4) / (In.new(1000))).class.should eq(Mm)
        (Ft.new(2000,4) / (Cm.new(2000))).class.should eq(Ft)
    end

    it "is accurate when being raised to a power" do
        (Mm.new(20,4) ** 2).should eq(Mm.new(400,8))
        (Dm.new(10) ** 2).should eq(Dm.new(100,2))
    end

end
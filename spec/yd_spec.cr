require "./spec_helper"

describe Yd do
  it "converts yd to in" do
    Yd.new(1).to_in.value.should eq(In.new(36).value)
    Yd.new(12).to_in.value.should eq(In.new(144*3).value)
  end

  it "converts yd to cm" do
    Yd.new(1/12).to_cm.value.round(4).should eq(Cm.new(2.54*3).value.round(4))
    Yd.new(1).to_cm.value.should eq(Cm.new(2.54*12*3).value)
  end

  it "converts yd to mm" do
    Yd.new(1/12).to_mm.value.should eq(Mm.new(25.4*3).value)
    Yd.new(1/24).to_mm.value.should eq(Mm.new(25.4/2*3).value)
  end

  it "converts yd to dm" do
    Yd.new(1/12).to_dm.value.round(4).should eq(Dm.new(0.254*3).value.round(4))
    Yd.new(10/12).to_dm.value.should eq(Dm.new(2.54*3).value)
  end

  it "converts yd to mi" do
    Yd.new(5280).to_mi.value.should eq(Mi.new(3).value)
    Yd.new(10560).to_mi.value.should eq(Mi.new(6).value)
  end
end

require "./spec_helper"

describe Ft do
  it "converts Ft to in" do
    Ft.new(1).to_in.value.should eq(In.new(12).value)
    Ft.new(12).to_in.value.should eq(In.new(144).value)
  end

  it "converts Ft to cm" do
    Ft.new(1/12).to_cm.value.should eq(Cm.new(2.54).value)
    Ft.new(1).to_cm.value.should eq(Cm.new(2.54*12).value)
  end

  it "converts ft to mm" do
    Ft.new(1/12).to_mm.value.should eq(Mm.new(25.4).value)
    Ft.new(1/24).to_mm.value.should eq(Mm.new(25.4/2).value)
  end

  it "converts ft to dm" do
    Ft.new(1/12).to_dm.value.should eq(Cm.new(0.254).value)
  end
end

require "./spec_helper"

describe Cm do
  it "converts cm to in" do
    Cm.new(2.54).to_in.value.should eq(In.new(1).value)
    Cm.new(1).to_in.value.should eq(In.new(1/2.54).value)
  end

  it "converts cm to ft" do
    Cm.new(2.54).to_ft.value.should eq(Ft.new(1/12).value)
    Cm.new(1).to_ft.value.should eq(Ft.new(1/(12*2.54)).value)
  end

  it "converts cm to mm" do
    Cm.new(2.54).to_mm.value.should eq(Mm.new(25.4).value)
    Cm.new(1).to_mm.value.should eq(Mm.new(25.4/2.54).value)
  end
end

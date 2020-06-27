require "./spec_helper"

describe Mi do
  it "converts mi to in" do
    Mi.new(1).to_in.value.should eq(In.new(5280*12).value)
    Mi.new(12).to_in.value.round(2).should eq(In.new(5280*144).value.round(2))
  end

  it "converts mi to cm" do
    Mi.new(1).to_cm.value.round(2).should eq(Cm.new(5280*12*2.54).value.round(2))
    Mi.new(1/12).to_cm.value.round(2).should eq(Cm.new(5280*2.54).value.round(2))
  end

  it "converts mi to mm" do
    Mi.new(1).to_mm.value.round(2).should eq(Mm.new(5280*12*25.4).value.round(2))
    Mi.new(1/12).to_mm.value.round(2).should eq(Mm.new(5280*25.4).value.round(2))
  end

  it "converts mi to dm" do
    Mi.new(1/(5280*12)).to_dm.value.should eq(Dm.new(0.254).value)
    Mi.new(10/(12*5280)).to_dm.value.should eq(Dm.new(2.54).value)
  end

  it "converts mi to ft" do
    Mi.new(1).to_ft.value.should eq(Ft.new(5280).value)
    Mi.new(2).to_ft.value.should eq(Ft.new(10560).value)
  end
end

require "./spec_helper"

describe Dm do
    it "converts dm to in" do
        Dm.new(0.254).to_in.value.should eq(In.new(1).value)
    end

    it "converts dm to cm" do
        Dm.new(10).to_cm.value.should eq(Cm.new(100).value)
    end

    it "converts dm to mm" do
        Dm.new(10).to_mm.value.should eq(Mm.new(1000).value)
    end

    it "converts dm to ft" do
        Dm.new(0.254).to_ft.value.should eq(Ft.new(1/12).value)
    end
end
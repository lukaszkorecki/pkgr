require File.dirname(__FILE__) + '/../../../spec_helper'

describe Pkgr::Distributions::Centos do
  let(:distribution) { Pkgr::Distributions::Centos.new("6.5") }

  it "has file and dir templates" do
    expect(distribution.templates(double(:config, name: "my-app", home: "/opt/my-app"))).to_not be_empty
  end

  describe "#dependencies" do
    it "has the expected default dependencies" do
      expect(distribution.dependencies).to include("postgresql-libs")
    end

    it "includes additional dependencies as well" do
      expect(distribution.dependencies(["dep1", "dep2"])).to include("postgresql-libs", "dep1", "dep2")
    end
  end

  describe "#add_addon" do
    it "does nothing yet" do
      expect(distribution.add_addon(double(:addon))).to eq(true)
    end
  end
end

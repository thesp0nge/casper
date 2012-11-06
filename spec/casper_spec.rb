require 'spec_helper'

describe "Casper transparent proxy" do
  before(:all) do
    @casper = Casper::Proxy.new({:Port=>9999, :disable_ie_xss_protection=>true})
  end

  context "when initialized" do
    it "should handle no options" do
      @casper.should_not be_nil
    end
  end

  context "has some injecting features" do

    it "should have the method disable_ie_xss_protection" do
      @casper.should respond_to(:disable_ie_xss_protection)
    end

  end

end

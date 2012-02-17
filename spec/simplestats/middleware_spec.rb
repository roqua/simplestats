require_relative "../spec_helper"
require 'rack/test'

module SimpleStats
  describe Middleware do
    let(:app) { stub(:call => nil) }
    let(:middleware) { SimpleStats::Middleware.new(app) }

    it 'acts as middleware' do
      status, headers, body = stub, stub, stub
      app.stub(:call).and_return { [status, headers, body] }
      middleware.call({}).should == [status, headers, body]
    end

    it 'creates a stat' do
      middleware.call({})
      Stat.all.should have(1).stat
    end

    it "doesn't crash if Stat can't be created" do
      Stat.stub(:create) { raise "FAIL" }
      expect { middleware.call({}) }.not_to raise_error("FAIL")
    end
  end
end
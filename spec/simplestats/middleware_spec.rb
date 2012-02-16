require_relative "../spec_helper"
require 'rack/test'

module SimpleStats
  describe Middleware do
    it 'acts as middleware' do
      app, status, headers, body = stub, stub, stub, stub
      app.stub(:call).and_return { [status, headers, body] }
      middleware = SimpleStats::Middleware.new(app)
      middleware.call({}).should == [status, headers, body]
    end

    it 'creates a stat' do
      app = stub(:call => nil)
      middleware = SimpleStats::Middleware.new(app)
      middleware.call({})
      Stat.all.should have(1).stat
    end

    it ''
  end
end
require_relative '../spec_helper'
require 'rack/test'

module SimpleStats
  describe Engine do
    include Rack::Test::Methods

    def app
      SimpleStats::Engine
    end

    describe "POST /" do
      before { post '/', "foo" => "bar" }

      it 'saves stats' do
        SimpleStats::Stat.count.should == 1
      end

      it 'saves params' do
        stat = SimpleStats::Stat.first
        stat.attributes.should == {"_id" => stat.id, "foo" => "bar"}
      end

      it 'returns HTTP 200' do
        last_response.should be_ok
      end

      it 'returns no body' do
        last_response.body.should be_empty
      end
    end

    describe "POST /:id" do
      let(:stat) { SimpleStats::Stat.create(:session => {:user_id => 1}) }

      before do
        post "/#{stat.id}", :browser => {:window => {:width => 1032}}
      end

      it 'updates existing stats' do
        stat.reload
        stat.browser.should == {"window" => {"width" => "1032"}}
      end

      it 'returns HTTP 200' do
        last_response.should be_ok
      end

      it 'returns no body' do
        last_response.body.should be_empty
      end
    end
  end
end
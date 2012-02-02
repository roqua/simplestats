require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'rack/test'

describe SimpleStats do
  include Rack::Test::Methods

  def app
    SimpleStats
  end

  it 'saves pageviews' do

  end
end

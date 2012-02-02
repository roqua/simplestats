require 'sinatra/base'
require 'mongoid'

class SimpleStats < Sinatra::Base

  class Pageview
    include Mongoid::Document
  end

  post '/' do
    Pageview.create!(params)
  end

end

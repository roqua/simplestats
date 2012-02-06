require 'sinatra/base'
require 'mongoid'

class SimpleStats < Sinatra::Base

  class Stat
    include Mongoid::Document
  end

  post '/' do
    Stat.create!(params)
    return 200
  end

  post '/:id' do |id|
    Stat.find(id).update_attributes(params)
    return 200
  end

end

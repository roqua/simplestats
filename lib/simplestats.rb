require 'sinatra/base'
require 'mongoid'

class SimpleStats < Sinatra::Base

  class Stat
    include Mongoid::Document
  end

  # This endpoint can be used to create a new stat
  # for a request. If you don't want to store server-side
  # processing information, this is probably what you want.
  post '/' do
    Stat.create!(params)
    return 200
  end

  # This endpoint can be used to update an existing stat
  # for a request. This makes it possible to create the
  # stat from the controller action with information from
  # there, and update it later on from the browser.
  post '/:id' do |id|
    Stat.find(id).update_attributes(params)
    return 200
  end

end

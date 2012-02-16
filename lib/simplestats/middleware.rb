require 'simplestats/stat'

module SimpleStats
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      stat = SimpleStats::Stat.create(:rack_env => env)
      status, headers, body = @app.call(env.merge("simplestats.stat_id" => stat.id.to_s))
      [status, headers, body]
    end
  end
end
require 'simplestats/stat'

module SimpleStats
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      stat = SimpleStats::Stat.create(server_address: env["SERVER_ADDR"],
                                      server_port: env["SERVER_PORT"],
                                      request: {
                                        uri: env["REQUEST_URI"]
                                      })

      status, headers, body = @app.call(env.merge("simplestats.stat_id" => stat.id.to_s))
      [status, headers, body]
    end
  end
end
require 'rack'
require_relative 'error_handler/request_error'
require_relative 'error_handler/version'

module Rack
  class ErrorHandler

    DEFAULT_ERROR_MESSAGE = 'Internal Server Error'.freeze

    def initialize(app, options={})
      @app = app
      @logger = options.fetch(:logger)
      @error_message = options[:error_message] || DEFAULT_ERROR_MESSAGE
    end

    def call(env)
      app.call env

    rescue => error
      request = Rack::Request.new env
      request_error = RequestError.new request, error
      logger.error(self.class) { request_error }
      [500, {}, [error_message]]
    end

    private

    attr_reader :app, :logger, :error_message

  end
end
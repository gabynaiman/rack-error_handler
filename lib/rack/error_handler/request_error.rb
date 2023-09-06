module Rack
  class ErrorHandler
    class RequestError < StandardError

      def initialize(request, error)
        @request = request
        @error = error
      end

      def message
        request.body.rewind
        [
          "#{request.request_method} #{request.path}",
          "Query: \"#{request.query_string}\"",
          "Body: \"#{request.body.read}\"",
          "[#{error.class}] #{error.message}"
        ].join("\n")
      end

      def backtrace
        error.backtrace
      end

      private

      attr_reader :request, :error

    end
  end
end
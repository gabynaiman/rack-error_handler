require 'minitest_helper'

describe Rack::ErrorHandler do

  include Rack::Test::Methods

  let(:logger_io) { StringIO.new }

  let(:logger) { Logger.new logger_io }

  let(:inner_app) do
    proc do |env|
      raise 'Test Error' if env['PATH_INFO'] == '/error'
      [200, {'Content-Type' => 'text/plain'}, ['OK']]
    end
  end

  let(:app) do
    build_rack_app inner_app, logger: logger
  end

  def build_rack_app(inner_app, options={})
    Rack::Builder.new do
      use Rack::ErrorHandler, options
      run inner_app
    end
  end

  def error_log
    logger_io.rewind
    logger_io.read
  end

  it 'Request success' do
    get '/'

    assert last_response.successful?
    assert_equal 'OK', last_response.body
    assert_equal '', error_log
  end

  it 'Request fail' do
    get '/error'

    assert last_response.server_error?
    assert_equal 'Internal Server Error', last_response.body
    assert_match %r{GET /error\nQuery: ""\nBody: ""\n\[RuntimeError\] Test Error}, error_log
  end

  it 'Request fail with params' do
    post '/error?param_1=1&param_2=2', param_3: 3

    assert last_response.server_error?
    assert_equal 'Internal Server Error', last_response.body
    assert_match %r{POST /error\nQuery: "param_1=1&param_2=2"\nBody: "param_3=3"\n\[RuntimeError\] Test Error}, error_log
  end

  describe 'Custom error' do

    let(:custom_error_message) { '<html><body>Custom error message</body></html>' }

    let(:app) do
      build_rack_app inner_app, logger: logger,
                                error_message: custom_error_message
    end

    it 'Request fail' do
      get '/error'

      assert last_response.server_error?
      assert_equal custom_error_message, last_response.body
      assert_match %r{GET /error\nQuery: ""\nBody: ""\n\[RuntimeError\] Test Error}, error_log
    end

  end

end
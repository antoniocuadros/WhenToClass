require "minitest/autorun"
require "minitest/mock"
require "rack/test"

require_relative "../lib/app.rb"

class TestApi < Minitest::Test
    include Rack::Test::Methods
    def app
        App
    end
    
    def test_raiz_ok
        get '/'    
            res = '{"status":200}'
            assert_equal(last_response.content_type, 'application/json')
            assert_equal(last_response.body, res)
    end

end
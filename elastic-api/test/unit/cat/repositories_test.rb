require 'test_helper'

module Elastic
  module Test
    class CatRepositoriesTest < ::Test::Unit::TestCase

      context "Cat: Repositories" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_cat/repositories', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.cat.repositories
        end

      end

    end
  end
end

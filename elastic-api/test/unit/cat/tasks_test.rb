require 'test_helper'

module Elastic
  module Test
    class CatTasksTest < ::Test::Unit::TestCase

      context "Cat: Tasks" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_cat/tasks', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.cat.tasks
        end

      end

    end
  end
end

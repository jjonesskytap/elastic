require 'test_helper'

module Elastic
  module Test
    class WatcherDeleteWatchTest < ::Test::Unit::TestCase

      context "Watcher: Delete watch" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'DELETE', method
            assert_equal "_watcher/watch/foo", url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.watcher.delete_watch id: 'foo'
        end

      end

    end
  end
end

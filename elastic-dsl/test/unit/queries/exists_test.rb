require 'test_helper'

module Elastic
  module Test
    module Queries
      class ExistsTest < ::Test::Unit::TestCase
        include Elastic::DSL::Search::Queries

        context "Exists query" do
          subject { Exists.new }

          should "be converted to a Hash" do
            assert_equal({ exists: {} }, subject.to_hash)
          end

          should "have option methods" do
            subject = Exists.new

            subject.field 'bar'

            assert_equal %w[ field ],
                         subject.to_hash[:exists].keys.map(&:to_s).sort
            assert_equal 'bar', subject.to_hash[:exists][:field]
          end

          should "take a block" do
            subject = Exists.new do
              field 'bar'
            end
            assert_equal({ exists: { field: 'bar' } }, subject.to_hash)
          end
        end
      end
    end
  end
end

require 'test_helper'

module Elastic
  module Test
    module Filters
      class IdsTest < ::Test::Unit::TestCase
        include Elastic::DSL::Search::Filters

        context "Ids filter" do
          subject { Ids.new }

          should "be converted to a Hash" do
            assert_equal({ ids: {} }, subject.to_hash)
          end

          should "have option methods" do
            subject = Ids.new

            subject.type 'bar'
            subject.values 'bar'

            assert_equal %w[ type values ],
                         subject.to_hash[:ids].keys.map(&:to_s).sort
            assert_equal 'bar', subject.to_hash[:ids][:type]
          end

          should "take a block" do
            subject = Ids.new do
              type 'bar'
              values ['1', '2', '3']
            end
            assert_equal({ids: { type: 'bar', values: ['1', '2', '3'] } }, subject.to_hash)
          end
        end
      end
    end
  end
end

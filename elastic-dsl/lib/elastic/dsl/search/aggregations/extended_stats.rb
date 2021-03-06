module Elastic
  module DSL
    module Search
      module Aggregations

        # A multi-value metrics aggregation which returns the extended statistical information on numeric values
        #
        # @example
        #
        #     search do
        #       aggregation :clicks_stats do
        #         extended_stats field: 'clicks'
        #       end
        #     end
        #
        # @see http://www.elastic.org/guide/en/elastic/reference/current/search-aggregations-metrics-extendedstats-aggregation.html
        #
        class ExtendedStats
          include BaseComponent
        end

      end
    end
  end
end

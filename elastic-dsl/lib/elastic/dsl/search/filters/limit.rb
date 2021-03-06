module Elastic
  module DSL
    module Search
      module Filters

        # A filter which limits the number of documents to evaluate
        #
        # @example
        #
        #     search do
        #       query do
        #         filtered do
        #           filter do
        #             limit value: 100
        #           end
        #         end
        #       end
        #     end
        #
        # @see http://elastic.org/guide/en/elastic/reference/current/query-dsl-limit-filter.html
        #
        class Limit
          include BaseComponent

          option_method :value
        end

      end
    end
  end
end

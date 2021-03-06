module Elastic
  module DSL
    module Search
      module Queries

        # A query which returns documents matching the specified IDs
        #
        # @example
        #
        #     search do
        #       query do
        #         ids values: [1, 2, 3]
        #       end
        #     end
        #
        # @see http://elastic.org/guide/en/elastic/reference/current/query-dsl-ids-query.html
        #
        class Ids
          include BaseComponent

          option_method :type
          option_method :values
        end

      end
    end
  end
end

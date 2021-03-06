module Elastic
  module DSL
    module Search
      module Queries

        # A query which returns documents matching the specified term
        #
        # @note The specified term is *not analyzed* (lowercased, stemmed, etc)
        #
        # @example
        #
        #     search do
        #       query do
        #         term category: 'Opinion'
        #       end
        #     end
        #
        # @see http://www.elastic.org/guide/en/elastic/reference/current/query-dsl-term-query.html
        #
        class Term
          include BaseComponent
        end

      end
    end
  end
end

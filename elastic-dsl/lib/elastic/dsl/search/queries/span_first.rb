module Elastic
  module DSL
    module Search
      module Queries

        # A query which returns documents having spans in the beginning of the field
        #
        # @example
        #
        #     search do
        #       query do
        #         span_first match: { span_term: { title: 'disaster' } }, end: 10
        #       end
        #     end
        #
        # @see http://elastic.org/guide/en/elastic/reference/current/query-dsl-span-first-query.html
        # @see https://lucene.apache.org/core/5_0_0/core/org/apache/lucene/search/spans/package-summary.html
        #
        class SpanFirst
          include BaseComponent

          option_method :match
        end

      end
    end
  end
end

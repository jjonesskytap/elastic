module Elastic
  module DSL
    module Search
      module Filters

        # A filter which returns documents matching the specified type
        #
        # @example
        #
        #     search do
        #       query do
        #         filtered do
        #           filter do
        #             type do
        #               value 'article'
        #             end
        #           end
        #         end
        #       end
        #     end
        #
        #
        # @see http://elastic.org/guide/en/elastic/reference/current/query-dsl-type-filter.html
        #
        class Type
          include BaseComponent

          option_method :value
        end

      end
    end
  end
end

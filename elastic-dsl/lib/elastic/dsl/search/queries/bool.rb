module Elastic
  module DSL
    module Search
      module Queries

        # A compound query which matches documents based on combinations of queries
        #
        # @example Defining a bool query with multiple conditions
        #
        #     search do
        #       query do
        #         bool do
        #           must do
        #             term category: 'men'
        #           end
        #
        #           must do
        #             term size:  'xxl'
        #           end
        #
        #           should do
        #             term color: 'red'
        #           end
        #
        #           must_not do
        #             term manufacturer: 'evil'
        #           end
        #         end
        #       end
        #     end
        #
        # See the integration test for a working example.
        #
        # @see http://elastic.org/guide/en/elastic/reference/current/query-dsl-bool-query.html
        #
        class Bool
          include BaseComponent

          def must(*args, &block)
            @hash[name][:must] ||= []
            value = Query.new(*args, &block).to_hash
            @hash[name][:must].push(value).flatten! unless @hash[name][:must].include?(value)
            self
          end

          def must_not(*args, &block)
            @hash[name][:must_not] ||= []
            value = Query.new(*args, &block).to_hash
            @hash[name][:must_not].push(value).flatten! unless @hash[name][:must_not].include?(value)
            self
          end

          def should(*args, &block)
            @hash[name][:should] ||= []
            value = Query.new(*args, &block).to_hash
            @hash[name][:should].push(value).flatten! unless @hash[name][:should].include?(value)
            self
          end

          def filter(*args, &block)
            @filter = block ? Filter.new(*args, &block) : args.first
            self
          end

          def to_hash
            @hash[name].update(@args.to_hash) if @args.respond_to?(:to_hash)

            if @block
              call
            else
              @hash[name] = @args unless @args.nil? || @args.empty?
            end

            if @filter
              _filter = @filter.respond_to?(:to_hash) ? @filter.to_hash : @filter
              @hash[name].update(filter: _filter)
            end

            @hash
          end
        end
      end
    end
  end
end

module Elastic
  module API
    module Cat
      module Actions

        # Return document counts for the entire cluster or specific indices
        #
        # @example Display number of documents in the cluster
        #
        #     puts client.cat.count
        #
        # @example Display number of documents in an index
        #
        #     puts client.cat.count index: 'index-a'
        #
        # @example Display number of documents in a list of indices
        #
        #     puts client.cat.count index: ['index-a', 'index-b']
        #
        # @example Display header names in the output
        #
        #     puts client.cat.count v: true
        #
        # @example Return the information as Ruby objects
        #
        #     client.cat.count format: 'json'
        #
        # @option arguments [List] :index A comma-separated list of index names to limit the returned information
        # @option arguments [List] :h Comma-separated list of column names to display -- see the `help` argument
        # @option arguments [Boolean] :v Display column headers as part of the output
        # @option arguments [String] :format The output format. Options: 'text', 'json'; default: 'text'
        # @option arguments [Boolean] :help Return information about headers
        # @option arguments [Boolean] :local Return local information, do not retrieve the state from master node
        #                                    (default: false)
        # @option arguments [Time] :master_timeout Explicit operation timeout for connection to master node
        #
        # @see http://www.elastic.org/guide/en/elastic/reference/master/cat-count.html
        #
        def count(arguments={})
          valid_params = [
            :local,
            :master_timeout,
            :h,
            :help,
            :v ]

          index = arguments.delete(:index)

          method = HTTP_GET

          path   = Utils.__pathify '_cat/count', Utils.__listify(index)

          params = Utils.__validate_and_extract_params arguments, valid_params
          params[:h] = Utils.__listify(params[:h]) if params[:h]

          body   = nil

          perform_request(method, path, params, body).body
        end
      end
    end
  end
end

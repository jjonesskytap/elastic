module Elastic
  module API
    module Cat
      module Actions

        # Help information for the Cat API
        #
        # @option arguments [Boolean] :help Return help information
        #
        # @see http://www.elastic.org/guide/en/elastic/reference/master/cat.html
        #
        def help(arguments={})
          valid_params = [
            :help ]
          method = HTTP_GET
          path   = "_cat"
          params = Utils.__validate_and_extract_params arguments, valid_params
          body   = nil

          perform_request(method, path, params, body).body
        end
      end
    end
  end
end

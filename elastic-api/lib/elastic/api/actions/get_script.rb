module Elastic
  module API
    module Actions

      # Retrieve an indexed script from Elastic
      #
      # @option arguments [String] :id Script ID (*Required*)
      # @option arguments [String] :lang Script language (*Required*)
      #
      # @see http://www.elastic.org/guide/en/elastic/reference/master/modules-scripting.html#_indexed_scripts
      #
      def get_script(arguments={})
        raise ArgumentError, "Required argument 'id' missing"   unless arguments[:id]
        raise ArgumentError, "Required argument 'lang' missing" unless arguments[:lang]
        method = HTTP_GET
        path   = "_scripts/#{arguments[:lang]}/#{arguments[:id]}"
        params = {}
        body   = nil

        perform_request(method, path, params, body).body
      end
    end
  end
end

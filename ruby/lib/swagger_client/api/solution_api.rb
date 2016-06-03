require "uri"

module SwaggerClient
  class SolutionApi
    attr_accessor :api_client

    def initialize(api_client = nil)
      @api_client = api_client || Configuration.api_client
    end

    # Return the solution associated to the jobId
    # This endpoint returns the solution of a large problems. You can fetch it with the job_id, you have been sent.
    # @param key your API key
    # @param job_id Request solution with jobId
    # @param [Hash] opts the optional parameters
    # @return [Response]
    def get_solution(key, job_id, opts = {})
      if Configuration.debugging
        Configuration.logger.debug "Calling API: SolutionApi#get_solution ..."
      end
      
      # verify the required parameter 'key' is set
      fail "Missing the required parameter 'key' when calling get_solution" if key.nil?
      
      # verify the required parameter 'job_id' is set
      fail "Missing the required parameter 'job_id' when calling get_solution" if job_id.nil?
      
      # resource path
      path = "/solution/{jobId}".sub('{format}','json').sub('{' + 'jobId' + '}', job_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'key'] = key

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['api_key']
      result = @api_client.call_api(:GET, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Response')
      if Configuration.debugging
        Configuration.logger.debug "API called: SolutionApi#get_solution. Result: #{result.inspect}"
      end
      return result
    end
  end
end




module HttpStubExample

  class PostConfigurer
    include HttpStub::Configurer::Part

    def configure_success_scenario
      post_endpoint_template.add_scenario!("Post: Resource Success") do |stub|
        stub.respond_with(status: 204)
        stub.trigger(stubs: get_configurer.stubs_for(HttpStubExample::Resource.created))
      end
    end

    def configure_error_scenario
      post_endpoint_template.add_scenario!("Post: Resource Validation Error", status: 400)
    end

    private

    def post_endpoint_template
      @post_endpoint_template ||= stub_server.endpoint_template do |template|
        template.match_requests(uri: "/resource", method: :post)
      end
    end

  end

end

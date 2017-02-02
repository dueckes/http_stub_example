module HttpStubExample

  class GetConfigurer
    include HttpStub::Configurer::Part

    def configure_success_scenarios
      {
        "Get: Many Resources": HttpStubExample::Resource.many,
        "Get: One Resource":   HttpStubExample::Resource.one,
        "Get: No Resources":   []
      }.each { |scenario_name, resources| add_success_scenario(scenario_name, resources) }
    end

    def configure_not_found_scenario
      stub_server.add_scenario_with_one_stub!("Get: Resource Not Found") do |stub|
        stub.match_requests(uri: %r{^\/resource\/\d+$}, method: :get)
        stub.respond_with(status: 404)
      end
    end

    def stubs_for(*resources)
      resource_array = resources.flatten
      [ stub_server.build_stub { match_requests(uri: "/resource", method: :get).respond_with(json: resource_array) } ] +
        resource_array.map do |resource|
          stub_server.build_stub do
            match_requests(uri: "/resource/#{resource[:id]}", method: :get).respond_with(json: resource)
          end
        end
    end

    private

    def add_success_scenario(name, resources)
      stub_server.add_scenario!(name) { |scenario| scenario.add_stubs!(stubs_for(resources)) }
    end

  end

end

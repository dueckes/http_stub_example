module HttpStubExample

  class Configurer
    include HttpStub::Configurer

    stub_server.response_defaults = { status: 200 }.freeze

    self.parts = {
      get_configurer:  HttpStubExample::GetConfigurer.new,
      post_configurer: HttpStubExample::PostConfigurer.new
    }

  end

end

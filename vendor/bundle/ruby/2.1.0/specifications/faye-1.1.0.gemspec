# -*- encoding: utf-8 -*-
# stub: faye 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "faye"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["James Coglan"]
  s.date = "2014-12-22"
  s.email = "jcoglan@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "http://faye.jcoglan.com"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md", "--markup", "markdown"]
  s.rubygems_version = "2.4.3"
  s.summary = "Simple pub/sub messaging for the web"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cookiejar>, [">= 0.3.0"])
      s.add_runtime_dependency(%q<em-http-request>, [">= 0.3.0"])
      s.add_runtime_dependency(%q<eventmachine>, [">= 0.12.0"])
      s.add_runtime_dependency(%q<faye-websocket>, [">= 0.9.1"])
      s.add_runtime_dependency(%q<multi_json>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<rack>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<websocket-driver>, [">= 0.5.1"])
      s.add_development_dependency(%q<compass>, ["~> 0.11.0"])
      s.add_development_dependency(%q<haml>, ["~> 3.1.0"])
      s.add_development_dependency(%q<permessage_deflate>, [">= 0.1.0"])
      s.add_development_dependency(%q<puma>, [">= 2.0.0"])
      s.add_development_dependency(%q<rack-proxy>, ["~> 0.4.0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.99.0"])
      s.add_development_dependency(%q<rspec-eventmachine>, [">= 0.2.0"])
      s.add_development_dependency(%q<RedCloth>, ["~> 3.0.0"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<sass>, ["~> 3.2.0"])
      s.add_development_dependency(%q<staticmatic>, [">= 0"])
      s.add_development_dependency(%q<rainbows>, ["~> 4.4.0"])
      s.add_development_dependency(%q<thin>, [">= 1.2.0"])
      s.add_development_dependency(%q<goliath>, [">= 0"])
      s.add_development_dependency(%q<passenger>, [">= 4.0.0"])
    else
      s.add_dependency(%q<cookiejar>, [">= 0.3.0"])
      s.add_dependency(%q<em-http-request>, [">= 0.3.0"])
      s.add_dependency(%q<eventmachine>, [">= 0.12.0"])
      s.add_dependency(%q<faye-websocket>, [">= 0.9.1"])
      s.add_dependency(%q<multi_json>, [">= 1.0.0"])
      s.add_dependency(%q<rack>, [">= 1.0.0"])
      s.add_dependency(%q<websocket-driver>, [">= 0.5.1"])
      s.add_dependency(%q<compass>, ["~> 0.11.0"])
      s.add_dependency(%q<haml>, ["~> 3.1.0"])
      s.add_dependency(%q<permessage_deflate>, [">= 0.1.0"])
      s.add_dependency(%q<puma>, [">= 2.0.0"])
      s.add_dependency(%q<rack-proxy>, ["~> 0.4.0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.99.0"])
      s.add_dependency(%q<rspec-eventmachine>, [">= 0.2.0"])
      s.add_dependency(%q<RedCloth>, ["~> 3.0.0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<sass>, ["~> 3.2.0"])
      s.add_dependency(%q<staticmatic>, [">= 0"])
      s.add_dependency(%q<rainbows>, ["~> 4.4.0"])
      s.add_dependency(%q<thin>, [">= 1.2.0"])
      s.add_dependency(%q<goliath>, [">= 0"])
      s.add_dependency(%q<passenger>, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<cookiejar>, [">= 0.3.0"])
    s.add_dependency(%q<em-http-request>, [">= 0.3.0"])
    s.add_dependency(%q<eventmachine>, [">= 0.12.0"])
    s.add_dependency(%q<faye-websocket>, [">= 0.9.1"])
    s.add_dependency(%q<multi_json>, [">= 1.0.0"])
    s.add_dependency(%q<rack>, [">= 1.0.0"])
    s.add_dependency(%q<websocket-driver>, [">= 0.5.1"])
    s.add_dependency(%q<compass>, ["~> 0.11.0"])
    s.add_dependency(%q<haml>, ["~> 3.1.0"])
    s.add_dependency(%q<permessage_deflate>, [">= 0.1.0"])
    s.add_dependency(%q<puma>, [">= 2.0.0"])
    s.add_dependency(%q<rack-proxy>, ["~> 0.4.0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.99.0"])
    s.add_dependency(%q<rspec-eventmachine>, [">= 0.2.0"])
    s.add_dependency(%q<RedCloth>, ["~> 3.0.0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<sass>, ["~> 3.2.0"])
    s.add_dependency(%q<staticmatic>, [">= 0"])
    s.add_dependency(%q<rainbows>, ["~> 4.4.0"])
    s.add_dependency(%q<thin>, [">= 1.2.0"])
    s.add_dependency(%q<goliath>, [">= 0"])
    s.add_dependency(%q<passenger>, [">= 4.0.0"])
  end
end

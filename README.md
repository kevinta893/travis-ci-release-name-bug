# travis-ci-release-name-bug

[![Build Status](https://travis-ci.org/kevinta893/travis-ci-release-name-bug.svg?branch=master)](https://travis-ci.org/kevinta893/travis-ci-release-name-bug)

The 'master' branch is the branch with the failing builds.
The 'release-workaround' branch is the branch with a fix. The idea is that you do not name the file you wish to deploy to Github Releases with a special character like the '+'

Replicating the issue:

1. First setup Travis CI using the Github Personal access tokens method.
2. Make a Github Release deploy for a zip file with a name with characters like the '+' symbol (e.g. travis+bug+here-v1.0.zip)
3. Have Travis-CI build and deploy the release. It should pass the first time. The release folder has a file named travis.bug.here-v1.0.zip instead
4. Restart the build and deploy the release. You should get an issue during the **deploy** phase. Typically I recieve the error below (see Figure 1). This stalls Travis for 10 minutes and fails the build.
5. If you change the name (say the zip is now "Travis-Deploy-Bug-v1.0.zip") it should pass in all subsequent build and deploys.


**Figure 1**
```
/Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/openssl/buffering.rb:326:in`

 `syswrite': Broken pipe (Faraday::ConnectionFailed)
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/openssl/buffering.rb:326:in `do_write'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/openssl/buffering.rb:344:in `write'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/protocol.rb:211:in `write0'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/protocol.rb:185:in `block in write'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/protocol.rb:202:in `writing'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/protocol.rb:184:in `write'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http/generic_request.rb:187:in `send_request_with_body'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http/generic_request.rb:120:in `exec'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http.rb:1412:in `block in transport_request'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http.rb:1411:in `catch'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http.rb:1411:in `transport_request'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http.rb:1384:in `request'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http.rb:1377:in `block in request'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http.rb:853:in `start'
	from /Users/travis/.rvm/rubies/ruby-2.2.9/lib/ruby/2.2.0/net/http.rb:1375:in `request'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/adapter/net_http.rb:80:in `perform_request'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/adapter/net_http.rb:38:in `block in call'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/adapter/net_http.rb:85:in `with_net_http_connection'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/adapter/net_http.rb:33:in `call'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/response.rb:8:in `call'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/response.rb:8:in `call'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/octokit-4.6.2/lib/octokit/middleware/follow_redirects.rb:73:in `perform_with_redirection'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/octokit-4.6.2/lib/octokit/middleware/follow_redirects.rb:61:in `call'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/rack_builder.rb:143:in `build_response'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/connection.rb:387:in `run_request'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/faraday-0.14.0/lib/faraday/connection.rb:175:in `post'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/sawyer-0.8.1/lib/sawyer/agent.rb:94:in `call'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/octokit-4.6.2/lib/octokit/connection.rb:154:in `request'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/octokit-4.6.2/lib/octokit/client/releases.rb:94:in `upload_asset'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-releases-1.9.1/lib/dpl/provider/releases.rb:130:in `upload_file'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-releases-1.9.1/lib/dpl/provider/releases.rb:111:in `block in push_app'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-releases-1.9.1/lib/dpl/provider/releases.rb:102:in `each'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-releases-1.9.1/lib/dpl/provider/releases.rb:102:in `push_app'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-1.9.1/lib/dpl/provider.rb:194:in `block in deploy'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-1.9.1/lib/dpl/cli.rb:41:in `fold'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-1.9.1/lib/dpl/provider.rb:194:in `deploy'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-1.9.1/lib/dpl/cli.rb:32:in `run'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-1.9.1/lib/dpl/cli.rb:7:in `run'
	from /Users/travis/.rvm/gems/ruby-2.2.9/gems/dpl-1.9.1/bin/dpl:5:in `<top (required)>'
	from /Users/travis/.rvm/gems/ruby-2.2.9/bin/dpl:23:in `load'
	from /Users/travis/.rvm/gems/ruby-2.2.9/bin/dpl:23:in `<main>'
 ```

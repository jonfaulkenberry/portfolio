portfolio [ ![Codeship Status for jonfaulkenberry/portfolio](https://www.codeship.io/projects/a2096370-823e-0131-9d4e-36899b34a261/status?branch=master)](https://www.codeship.io/projects/14819)
=========
[![Coverage Status](https://coveralls.io/repos/jonfaulkenberry/portfolio/badge.png)](https://coveralls.io/r/jonfaulkenberry/portfolio)
[![Dependency Status](https://gemnasium.com/jonfaulkenberry/portfolio.svg)](https://gemnasium.com/jonfaulkenberry/portfolio)
[![Code Climate](https://codeclimate.com/github/jonfaulkenberry/portfolio.png)](https://codeclimate.com/github/jonfaulkenberry/portfolio)

####About

The personal website of Jon Faulkenberry, built with Rails and Zurb Foundation.

####Installation
In the [jonfaulkenberry.com](http://jonfaulkenberry.com/) production environment, the application is continuously deployed by [Codeship](https://www.codeship.io/) to a [Digital Ocean droplet running CentOS 6.5 with Phusion Passenger and nginx](https://www.digitalocean.com/community/tutorials/how-to-deploy-rails-apps-using-passenger-with-nginx-on-centos-6-5) and MySQL using [mina](https://github.com/mina-deploy/mina). In addition, the production server runs an instance of [Sidekiq](https://github.com/mperham/sidekiq) for background jobs, which consumes a queue stored in a local redis server. All configuration is done using environment variables which are stored in `config/local_env.yml`

####License

Copyright (c) 2014 Jon Faulkenberry

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

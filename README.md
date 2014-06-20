# polycom-directory-api
### A simple REST API to facilitate telephone directories on Polycom SIP phones.

## Description

- The purpose of this application is to build a simple REST API (using Sinatra) which reads/writes records
from a sql backend and presents the data as either an editable JSON object for the management front-end or as
a read-only XML document for a Polycom SoundPoint IP telephone set to consume.

- I doubt this project will be of any real interest to anyone but myself, however if you have any comments,
tips, tricks or best practices to offer, I'm all ears.

## Dependencies
* You will need to setup an rvm environment running ruby-2.0.0-p247.
  * You will also need to create a gemset called `polycom-directory-api`
    * note: make sure you remember to issue `rvm use ruby-2.0.0-p247@polycom-directory-api --create` from the command line.
    * remember to create a .ruby-version and .ruby-gemset file:

      .ruby-version:
        `ruby-2.0.0-p247`

      .ruby-gemset:
        `polycom-directory-api`


## Setup
1. Clone the Repo: Run `git clone git@github.com:sqlbyme/polycom-directory-api.git`
2. Install the dependencies
3. Run `gem install bundler`
4. Run `bundle install`
5. Run `bundle exec rackup -s thin -p 8000`

## Tests
1. Run `RACK_ENV=test bundle exec rake spec`

## API Spec for Web based clients

##### Notes:

- This doc and APIs are a work in progress.  The APIs signatures and responses should not be considered final in any form.
See the section on versioning for details on currently supported versions.

- All calls will use HTTP endpoints.
- All requests are in text format and must include a valid URI string.
- All responses will be in either JSON or XML format.
- GET requests must include a valid telephone extension in order for a directory to be generated.

#### Summary of the HTTP Status Codes:

    200 - OK
    404 - Bad request - we return a custom message
    500 - Server Error

## API Features

#### Health Check

While working for Songbird I learned (from folks much wiser than I) that it really is a good idea
to include some type of health_check function within an application.  It offers users an easy way to
just check and see that your app is up and running.  Also, since my background is more on the Systems
Admin side I can tell you that it makes writing Nagios checks a whole lot nicer.

  Example:

    curl http://localhost:8000/health_check -v

  Valid Response:

    * Connected to localhost (127.0.0.1) port 8000 (#0)
    > GET /health_check HTTP/1.1
    > User-Agent: curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8x zlib/1.2.5
    > Host: localhost:8000
    > Accept: */*
    >
    < HTTP/1.1 200 OK
    < Content-Type: text/html;charset=utf-8
    < Content-Length: 15
    < X-XSS-Protection: 1; mode=block
    < X-Content-Type-Options: nosniff
    < X-Frame-Options: SAMEORIGIN
    < Connection: keep-alive
    < Server: thin 1.5.1 codename Straight Razor
    <
    * Connection #0 to host localhost left intact
    All Systems Go!* Closing connection #0

"All Systems Go!" means exactly that.  The health_check shows an API consumer that the service is online
and responding to requests correctly.

#### API Endpoints

  * Staging - http://

  * Production - http://

  * Development = http://localhost:8000/


## Branches

This repo consists of one branch, currently it is:
  1. checkin

#### Pushing
To push to each app you'll need to do the following:

##### polycom-directory-api:
      git remote add origin git@github.com:sqlbyme/polycom-directory-api.git
      git push origin checkin

## License

This application is released under the MIT license:

* http://www.opensource.org/licenses/MIT

The MIT License (MIT)

Copyright (c) 2013 Michael Edwards - sqlby.me

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


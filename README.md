# Media Sessions:  Ruby - Server Sample

This repository contains a server-side sample application required to run an Android or iOS application that integrates with the TalkdeskSDK.

<a href="https://heroku.com/deploy?template=https://github.com/Talkdesk/mobile-sdk-ruby-server-sample">
  <img src="https://www.herokucdn.com/deploy/button.svg" alt="Deploy">
</a>

## Setting up the Server

### Prerequisites

- Have a Talkdesk Account  (need one? check [Get started](https://www.talkdesk.com/get-started/) for a demo or trial)
- Register an Application (see: [Using a Signed JWT](https://docs.talkdesk.com/docs/using-a-signed-jwt))

## Run locally 

#### Setup

If you wish to run the application on your own development machine:

```bash
gem install foreman
bundle install
copy env_sample .env
```

Then edit `.env` to match your account configuration, there are some adicional information on `app.json` regarding this variables. This `.env` file will provide the environments when running using `foreman`.

If you need to manage your ruby version you might want to use something like [rbenv](https://github.com/rbenv/rbenv).

#### Run the service

- Launch the service with [foreman](http://ddollar.github.io/foreman/), foreman will read `.env` for environment variables and run the `web:` entry in the [Procfile](https://devcenter.heroku.com/articles/procfile).

  ```bash
  foreman start
  ```

- You can then make a HTTP request (eg: using [curl](https://curl.haxx.se)) simulating a typical request from your application, here by the id `example-app-ios`.

  ```bash
  $ curl -iX POST http://localhost:5000/token/example-app-ios/ \
  		--user <user>:<password>
  
  HTTP/1.1 201 Created
  Content-Type: application/json
  Content-Length: 659
  Connection: keep-alive
  Server: thin
  
  {"auth_token":"ey.......dsabfbeek"}⏎
  ```

#### 


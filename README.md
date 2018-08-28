# Media Sessions:  Ruby - Server Sample

This repository contains a server-side sample application required to run an Android or iOS application that integrates with the TalkdeskSDK.

## Setting up the Server

### Prerequisites

- Have a Talkdesk Account  ([Get started](https://www.talkdesk.com/get-started/) by requesting a trial or demo)
- Request a Client Credentials for use with this service see [Authorization Code](https://docs.talkdesk.com/docs/authorization-code)

## Run locally 

### Bootstrap the Application

If you wish to run the application on your machine:

```bash
gem install foreman
bundle install
copy env_sample .env
```

Then edit `.env` to match your account configuration, there are some adicional information on `app.json` regarding this variables.

### Run

- Launch the service

  ```bash
  foreman start
  ```

- Request a new token

  ```bash
  $ curl -iX POST http://localhost:5000/token/example-app-ios/ \
  		--user user:<password>
  
  HTTP/1.1 201 Created
  Content-Type: application/json
  Content-Length: 659
  Connection: keep-alive
  Server: thin
  
  {"auth_token":"ey.......dsabfbeek"}⏎
  ```



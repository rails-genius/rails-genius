<p align="center">
  <img src="app/assets/images/rails-genius-logo.png"/>
</p>

A great way to start a fresh rails project from scratch

[Quick Start Guide here](docs/quick-start.md)

Comes preconfigured with 99% of the stuff you need, such as:
- staging + product environment set
- github CI
- renovate to keep dependencies updated
- run tests in parallel by default
- API ready:
  - json built with JB templates
  - OJ gem included for extra performance
  - authentication + Api Keys included
- Automatically N+1s fixed using [jit preloader](https://github.com/clio/jit_preloader)
- Bugsnag configured for production and staging 

### Some bundled and configured gems:
- Sidekiq - background jobs
- Tailwind - styling
- Matestack - write REACTIVE views with ruby instead of html
- dotenv - keep ENV variables in .env files
- anycable - high performance Action Cable Server
- jb - view engine for 

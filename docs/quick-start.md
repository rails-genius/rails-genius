# Rails Genius quick guide

Requirements:
- ruby 3.1
- libpq-dev (install with `sudo apt libpq-dev`)
- postgresql 12+
- redis

```bash
git clone https://github.com/rails-genius/rails-genius.git app

cd app
cp .env.development.local.example .env.development.local
cp .env.test.local.example .env.test.local

# make changes to .env.development.local and .env.test.local

bundle install --jobs 20

rake db:setup

# then finally start the server
bin/dev

# visit it at http://localhost:3000
```
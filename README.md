# Getting start

### Clone the repository

```bash
git clone https://github.com/rakhadkz/ruby-backend-rakhad.git
cd ruby-backend-rakhad
```

### Configure .env  file
Create .env file in the root and set your postgresql config into as shown on the template below 
```
DB_USER = admin
DB_PASSWORD = 123
DB_PORT = 5433
DB_NAME = postgres
```

### Initialize the database
```ruby
rails db:create db:migrate db:seed
#db:create creates the database
#db:migrate runs (single) migrations that have not run yet.
#db:seed (only) runs the db/seed.rb file
```
### Serve an app
```ruby
rails s
```

# Hotel Management System

Sample hotel management MVP.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

```bash
#!/bin/bash
ruby-2.4.2
Rails 5.1.7
```

### Installing

A step by step series that will tell you how to get a development env running

```bash
#!/bin/bash
$ cd hotel-management
$ bundle install
```

### Database Setup

- Create postgres user.

```sql
create user em_admin_user with password 'admin@123';
alter role em_admin_user with createdb Replication;
```

- Create database & table and run seeders.

```bash
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

- Creating dummy data for understanding the app & testing.

```bash
$ rake hotel_management:setup_dummy_data
```

- Reset Database.

```bash
$ rake hotel_management:reset_database
```

### Running Application

```bash
# App runs at http://localhost:3000/
# Admin panel at http://localhost:3000/admin
$ rails s
```

### Running Specs

```bash
$ bundle exec rspec
```

### Deployment

```bash
$ cap production deploy
```

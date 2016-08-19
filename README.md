== README

This README explain how to make to configure this aplication using Ruby On Rails

#### Install Required Components

```sh
Ruby, Ruby On Rails
Webserver (Nginx or Apache), app rake rails (Unicorn, Passenger or Puma) 
PostgeSQL, or MariaDB
```

#### Configuration

```sh
rake db:create
rake db:migrate 
restart Webserver (Nginx or Apache), app rake rails (Unicorn, Passenger or Puma) 
```


#### Database creation

configure the file database.yml and then execute the follows command lines

```sh
rake db:create
rake db:migrate
```


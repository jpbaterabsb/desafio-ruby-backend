# Ruby Backend Challenge

###### Joao Paulo Oliveria Santos (@jpbaterabsb) - https://www.linkedin.com/in/desenvolvedorjoaopaulo/

### Requirements

- docker-compose version 1.23
- internet connection to download containers

### How to run

```
-- Otherwise
  docker-compose build  ## to install depencies of containers
  docker-compose up ## to run containers
  (Win or linux) ctrl+c or (Mac) cmd+C ## to stop containers
```

It will build the docker containers and start the application. This could take a while :-)
(depends on )

After that, you can access main page of challenge on http://localhost:8080/.

### How to test

```
-- Otherwise
  docker-compose exec rails bundle exec rails t
```

### How to use

1. On 'Upload Arquivo', upload a bank fixed format file (CNAB) - get the "storage/CNAB.txt"

2. On 'Upload Arquivo', if you want test negative scenario you can use "storage/CNAB_BUG.txt", in this case, you will get all errors in files.

3. On 'lojas', now you can see all imported stores. Click on table register to see more data about fees.

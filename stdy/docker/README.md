# Docker first heavy day 


Pulls a new mongo image from dockerhub  
`docker pull mongo`

Pull a new alpine (4mb) linyx image from dockerhub
`docker pull alpine`

List pulled images 
`docker images`

Run a pulled image
`docker run -dit mongo:latest`

List running containers 
`docker ps`

Show detailed info for a container 
`docker inspect <id>`

Run an alpine container 
`docker run -dit alpine:latest`

Run a container and give it a name to better access it afterwards
`docker run -dit --name voi voichesapete:first`

Build a local Dockerfile based on the image voichesapete:first 
`docker build -r voichesapete:first .`

>
> ### Overall usage of Docker 101 Claudião Hackathon 
>

```
  474  brew install docker
  475  brew install docker-compose
  476  brew install docker-swarm
  477  doker
  478  docker
  479  clear
  480  cd tmp
  481  cd d/tmp/
  482  ls
  483  clear
  484  docker ls
  485  docker ps
  486  docker --version
  487  sudo docker ps
  488  tset
  489  docker -ps
  490  docker -ps
  491  docker ps
  492  sudo usermod -a -G docker msant
  493  getent
  494  docker-machine
  495  docker-machine start
  496  docker-machine env
  497  docker start
  498  docker env
  499  docker images
  500  ls
  501  tset
  502  cd ctnr/
  503  ls
  504  cd voichesapete/
  505  ls
  506  docker build -r voichesapete:first .
  507  docker build -t voichesapete:first .
  508  docker build -t voichesapete:first .
  509  docker stop voi
  510  docker build -t voichesapete:first .
  511  docker run -dit --name voi voichesapete:first
  512  docker ps
  513  docker -ps -a
  514  docker ps -a
  515  docker rm $(docker ps -a -q)
  516  docker run -dit --name voi voichesapete:first
  517  cd /f/bitt
  518  ls
  519  pwd
  520  docker stop $(docker ps -a -q)
  521  docker rm $(docker ps -a -q)
  522  docker build -t voichesapete:first .
  523  tset
  524  cd ctnr/
  525  cd voichesapete/
  526  ls
  527  docker build -t voichesapete:first .
  528  docker run -dit --name voi voichesapete:first
  529  docker stop $(docker ps -a -q)
  530  docker rm $(docker ps -a -q)
  531  docker build -t voichesapete:first .
  532  docker run -dit --name voi voichesapete:first -v /f/bitt:/f/bitt
  533  docker run -dit --name voi voichesapete:first -v /f/bitt:/f/bitt
  534  docker run -dit --name voi -v /f/bitt:/f/bitt voichesapete:first
  535  docker stop $(docker ps -a -q)
  536  docker rm $(docker ps -a -q)
  537  docker run -dit --name voi -v /f/bitt:/f/bitt voichesapete:first
  538  docker run -dit --name voi -v /f/bitt:/f/bitt voichesapete:first
  539  docker rm $(docker ps -a -q)
  540  docker stop $(docker ps -a -q)
  541  docker rm $(docker ps -a -q)
  542  docker rm $(docker ps -a -q)
  543  docker build -t voichesapete:first .
  544  docker run -dit --name voi voichesapete:first
  545  docker stop $(docker ps -a -q)
  546  docker rm $(docker ps -a -q)
  547  docker build -t voichesapete:first .
  548  docker run -dit --name voi voichesapete:first
  549  history
  550  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
  551  docker build -t voichesapete:first .
  552  docker run -dit --name voi voichesapete:first
```

## Docker Compose 
> the documentation concerning the `docker-compose` command has been moved to its own [readme.md like file](./docker-compose.md)


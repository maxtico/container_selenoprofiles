## General description
Here it is included the docker file which I used to build the selenoprofiles container and the selenoprofiles container itself. 
In case there is any problem with the information inside the docker, you will have to run the next command, so the container is created again:
```
sudo docker build -t sp .
```
Then this one
```
sudo docker run -p 8080:8080 -d sp
```

## Dockerfile
Inside the docker file, I'm installing miniconda, because selenoprofiles can only be installed using conda.

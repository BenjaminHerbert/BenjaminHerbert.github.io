# BenjaminHerbert.github.io

My personal homepage - http://herbert.cc

## Run locally with docker

### Create a docker image: 

    sudo docker build -t homepage .
    
### Run the page:

    sudo docker run --rm -v `pwd`:/content -p 4000:4000 -it homepage jekyll serve --watch

### Point your browser to:

http://localhost:4000
    

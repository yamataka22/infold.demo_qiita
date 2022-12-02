# docker volume create infold_demo_bundle

# docker build . -t infold_demo

docker run -it --rm -v $PWD:/demo -v infold_demo_bundle:/usr/local/bundle -v $PWD/../infold.plugin:/infold --net=host infold_demo2:latest /bin/bash

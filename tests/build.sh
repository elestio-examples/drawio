git clone https://github.com/jgraph/docker-drawio.git docker
rm -f ./docker/README.md
mv ./docker/image-export/Dockerfile ./Dockerfile


docker buildx build . --output type=docker,name=elestio4test/drawio:latest | docker load
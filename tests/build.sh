git clone https://github.com/jgraph/docker-drawio.git docker
rm -f ./docker/README.md
mv ./docker/main/Dockerfile ./Dockerfile
mv ./docker/main/docker-entrypoint.sh ./docker-entrypoint.sh
sed -i "s~EXPOSE 8000~EXPOSE 8080~g" ./Dockerfile


docker buildx build . --output type=docker,name=elestio4test/drawio:latest | docker load
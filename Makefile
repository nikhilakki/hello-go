build:
	docker build . -t hello-go:latest
up:
	docker run --rm -p 8080:8080 --name hello-go hello-go:latest

up-d:
	docker run -d --rm -p 8080:8080 --name hello-go hello-go:latest

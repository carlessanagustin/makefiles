d_build:
	docker build -t $(IMAGE) $(DOCKERFILE)

d_run:
	docker run --rm -d -p 4040:4040 -p 5050:5050 $(IMAGE)
	
d_interactive:
	docker run --rm -it -v $(MOUNT):/shared $(IMAGE) sh

d_cleanup: down
	docker network prune -f
	docker volume prune -f
	docker rmi $(IMAGE)

d_status:
	watch docker ps

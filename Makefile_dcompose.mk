comp_up:
	docker-compose up -d

comp_down:
	docker-compose down

comp_restart: down up

comp_logs:
	docker-compose logs -f
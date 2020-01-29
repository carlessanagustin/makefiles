comp_up:
	docker-compose up -d

comp_down:
	docker-compose down

comp_restart: comp_down comp_up

comp_logs:
	docker-compose logs -f

comp_exec:
	docker-compose exec $(DC_SVC) bash
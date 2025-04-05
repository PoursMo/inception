NAME=inception

all: $(NAME)

$(NAME):
	sudo mkdir -p /home/aloubry/data/wp_files
	sudo mkdir -p /home/aloubry/data/wp_database
	sudo docker-compose -f ./srcs/docker-compose.yml up

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	sudo rm -rf /home/aloubry/data
	sudo docker volume rm -f srcs_wp_database
	sudo docker volume rm -f srcs_wp_files
	sudo docker system prune -af

re: fclean all
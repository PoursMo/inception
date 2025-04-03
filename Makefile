NAME=inception

all: $(NAME)

$(NAME): 
	sudo docker-compose -f ./srcs/docker-compose.yml up

clean:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	sudo docker system prune -af

re: fclean all
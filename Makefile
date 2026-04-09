# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/21 14:56:37 by tle-pape          #+#    #+#              #
#    Updated: 2024/11/16 09:32:08 by tle-pape         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCEF = 	src/ft_printf.c src/ft_r_print_hex.c src/ft_r_putnbr.c  \
		src/ft_r_putptr.c src/ft_r_putstr.c src/ft_r_unsigned_dec.c \
		src/ft_checkformat.c

OBJS = ${SOURCEF:.c=.o}

NAME = libftprintf.a

all: ${NAME}

${NAME}: ${OBJS}
	cd ./libft && make
	cp ./libft/libft.a .
	mv libft.a ${NAME}
	ar -rcs ${NAME} ${OBJS}
	
clean:
	cd ./libft && make fclean
	rm -f ${OBJS} ${OBJS_BONUS}

fclean: clean
	cd ./libft && make clean
	rm -f ${NAME}

re: fclean all
	cd ./libft && make re

%.o: %.c
	gcc -Wall -Wextra -Werror -c $< -I include -o $@

.PHONY : all clean fclean re

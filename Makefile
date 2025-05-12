NAME = libasm.a

SRCS = ft_strlen.s \
       ft_strcpy.s \
       ft_strcmp.s \
       ft_write.s \
       ft_read.s \
       ft_strdup.s

OBJS = $(SRCS:.s=.o)

TEST_SRCS = main.c
TEST_OBJS = $(TEST_SRCS:.c=.o)
TEST_NAME = testMe

%.o: %.s
	nasm -f elf64 $< -o $@

%o: %.c
	gcc -c $< -o $@

$(NAME): $(OBJS) Makefile
	ar rcs $(NAME) $(OBJS)

all: $(NAME)

$(TEST_NAME): $(NAME) $(TEST_OBJS)
	gcc $(TEST_OBJS) $(NAME) -o $(TEST_NAME)

clean:
	rm -f $(NAME)

fclean: clean
	rm -f $(OBJS)
	rm -f $(TEST_NAME)
	rm -f $(TEST_OBJS)

re: fclean all

.PHONY: all test clean fclean re

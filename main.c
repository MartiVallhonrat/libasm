# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include <errno.h>

extern size_t	ft_strlen(const char *);
extern char	*ft_strcpy(char *dest, const char *src);
extern int	ft_strcmp(const char *s1, const char *s2);
extern ssize_t	ft_write(int fd, const void *buf, size_t count);
extern ssize_t	ft_read(int fd, void *buf, size_t count);
extern char*	ft_strdup(const char *s);

int	main(void)
{
	char	*test = "Hello World!";
	
	printf("strlen: %ld\n", strlen(test));
	printf("ft_strlen: %ld\n", ft_strlen(test));
	printf("\n");
	
	char	*new_test = malloc(strlen(test) + 1);
	char	*new_test2 = malloc(strlen(test) + 1);
	printf("strcpy: %s\n", strcpy(new_test, test));
	printf("ft_strcpy: %s\n", ft_strcpy(new_test2, test));
	printf("\n");	
	
	printf("strcmp: %d\n", strcmp(new_test, test));
	printf("ft_strcmp: %d\n", ft_strcmp(new_test, test));
	printf("\n");	
	free(new_test);
	free(new_test2);
	
	int test_fd = open("helloworld.txt", O_CREAT | O_RDWR);
	printf("write: %ld\n", write(test_fd, test, strlen(test)));
	printf("ft_write: %ld\n", ft_write(test_fd, test, strlen(test)));
	printf("\n");		
	close(test_fd);
	
	test_fd = open("helloworld.txt", O_RDWR);
	new_test = malloc(strlen(test) + 1);
	bzero(new_test, strlen(test) + 1);
	printf("read: %ld --> %s\n", read(test_fd, new_test, strlen(test)), new_test);
	printf("ft_read: %ld --> %s\n", ft_read(test_fd, new_test, strlen(test)), new_test);
	printf("\n");	
	free(new_test);
	close(test_fd);

	printf("ogstr: %s\n", test);
	printf("strdup: %s\n", strdup(test));
	printf("ft_strdup: %s\n", ft_strdup(test));
	printf("\n");

	return (0);
}

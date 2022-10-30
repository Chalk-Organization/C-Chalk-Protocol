#include "include/vector.h"
#include <stdio.h>
#include <stdlib.h>

int main() {
	t_vector vector = new_vector();
	vector.push(&vector, (void *)"Hello");
	void *tmp = vector.pop(&vector);
	printf("%s\n", (char *)tmp);
	for (int i = 0; i < 10; i++) {
		char *tmp = calloc(3, sizeof(char));
		sprintf(tmp, "%d", i);
		vector.push(&vector, (void *)(char *)tmp);
	}
	void const *tmp1 = vector.get(&vector, 3);
	printf("%s\n", (char *)tmp1);
	return 0;
}

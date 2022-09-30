#include "include/vector.h"
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>

void
vector_push (t_vector *self, void *value)
{

}

t_vector 
new_vector () 
{
	t_vector vector;
	vector.size = sizeof(void *);
	vector.data = malloc(vector.size);
	if (vector.data == NULL)
	{
		perror("Failed to Allocate `vector`.");
	}
	vector.len = 0;

	vector.push = vector_push;
	vector.get = vector_get;
	vector.pop = vector_pop;

	return vector;
}

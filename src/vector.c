#include "include/vector.h"
#include <stdlib.h>

t_vector 
new_vector () 
{
	t_vector vector;
	vector.data = malloc(0);
	vector.len = 0;

	return vector;
}
#pragma once
#include <stddef.h>

typedef struct 
vector
{
	void *data;
	size_t len;
}
t_vector;

t_vector 
new_vector ();
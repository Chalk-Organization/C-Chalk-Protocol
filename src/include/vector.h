#pragma once
#include <stddef.h>

typedef struct 
vector
{
	void **data;
	size_t size;
	size_t len;

	void (*push) (struct vector *self, void *value);
	void const* (*get) (struct vector *const self, size_t index);
	void * (*pop) (struct vector *self);
}
t_vector;

void
vector_push (t_vector *self, void *value);

void const*
vector_get (t_vector *const self, size_t index);

void *
vector_pop (t_vector *self);

t_vector 
new_vector ();

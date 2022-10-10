#include "include/vector.h"
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

void vector_push(t_vector *self, void *value) {
	// checks if it needs to reallocate
	// because it will segfault if don't realloc
	if (self->len >= (self->size / sizeof(void *))) {
		self->size *= 2;
		self->data = realloc(self->data, self->size);
	}
	self->data[self->len++] = value;
}

void *vector_pop(t_vector *self) { return self->data[--self->len]; }

void const *vector_get(t_vector *const self, size_t index) {
	return self->data[index];
}

t_vector new_vector() {
	t_vector vector;
	vector.size = sizeof(void *);
	vector.data = malloc(vector.size);
	if (vector.data == NULL) {
		perror("Failed to Allocate `vector`.");
	}
	vector.len = 0;

	vector.push = vector_push;
	vector.get = vector_get;
	vector.pop = vector_pop;

	return vector;
}

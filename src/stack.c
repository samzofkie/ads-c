#include "stack.h"

struct Stack init_stack() {
  struct Stack s;
  s.size = STACK_SIZE;
  s.top = 0;
  return s;
}

int stack_empty(struct Stack s) {
  return (s.top == 0); 
}

int push(struct Stack s, int x) {
  if (s.top == s.size)
    return 0;
  else {
    s.array[++s.top] = x;
    return 1;
  }
}

int pop(struct Stack s) {
  if (stack_empty(s))
    return 0; // Or otherwise signal an error
  else
    return s.array[s.top--];
}
#include <stdio.h>
#include "./ads.h"

void report_stack_size(struct Stack s) {
  if (stack_empty(s)) {
    printf("The stack is empty.\n");
  } else {
    printf("The stack isn't empty. In fact, it has %d elements.\n", s.size);
  }
}

int main() {
  struct Stack s = init_stack();
  report_stack_size(s);
  push(s, 0);
  report_stack_size(s);
  
  return 0;
}

//stack.o: src/stack.c include/stack.h
//  $(CC) -Iinclude $(CFLAGS) -c src/stack.c
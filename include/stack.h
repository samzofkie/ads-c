#define STACK_SIZE 5000

struct Stack {
  int size, top;
  int array[STACK_SIZE];
};

struct Stack init_stack();
int stack_empty(struct Stack s);
int push(struct Stack s, int x);
int pop(struct Stack s);
#include <stdio.h>
#include <glib.h>
#include "../ads.h"

typedef struct {
  struct Stack s;
} StackFixture;

static void stack_fixture_setup(
  StackFixture *fixture, 
  gconstpointer user_data
) {
  fixture->s = init_stack();
}

static void test_stack_test1(StackFixture *fixture, gconstpointer user_data) {
  //printf("here %d\n", fixture->s.size);
  g_assert_true(fixture->s.size == STACK_SIZE);
}

int main(int argc, char *argv[]) {
  g_test_init(&argc, &argv, NULL);

  g_test_add(
    "/Stack/test1", 
    StackFixture, 
    NULL,
    stack_fixture_setup,
    test_stack_test1,
    NULL
  );


  return g_test_run ();
}
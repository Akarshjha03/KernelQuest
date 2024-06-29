#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  pid_t pid = fork();

  if (pid < 0) {
    // Error handling for fork failure
    perror("fork");
    exit(1);
  } else if (pid == 0) {
    // Child process code
    printf("This is the child process (PID: %d)\n", getpid());
  } else {
    // Parent process code
    printf("This is the parent process (PID: %d), child PID: %d\n", getpid(), pid);
  }

  return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  pid_t pid1, pid2;

  // Create the first child process
  pid1 = fork();

  if (pid1 < 0) {
    perror("fork");
    exit(1);
  } else if (pid1 == 0) {
    // First child process code
    printf("This is the first child process (PID: %d)\n", getpid());
  } else {
    // Parent process code after creating first child
    printf("This is the parent process (PID: %d), first child PID: %d\n", getpid(), pid1);

    // Create the second child process
    pid2 = fork();

    if (pid2 < 0) {
      perror("fork");
      exit(1);
    } else if (pid2 == 0) {
      // Second child process code
      printf("This is the second child process (PID: %d)\n", getpid());
    } else {
      // Parent process code after creating second child
      printf("This is the parent process again (PID: %d), second child PID: %d\n", getpid(), pid2);
    }
  }

  // Wait for child processes to finish (optional)
  // uncomment the following lines if you want the parent to wait
  // wait(NULL);  // Wait for any child process to finish
  // waitpid(pid1, NULL, 0);  // Wait for specific child (pid1) to finish

  return 0;
}


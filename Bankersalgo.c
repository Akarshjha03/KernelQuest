#include <stdio.h>

#define MAX_PROCESS 10
#define MAX_RESOURCE 5

int main() {
  int n, m; // Number of processes and resources

  printf("Enter the number of processes: ");
  scanf("%d", &n);

  printf("Enter the number of resources: ");
  scanf("%d", &m);

  // Allocation matrix (represents resources currently allocated to each process)
  int allocation[MAX_PROCESS][MAX_RESOURCE];

  // Max matrix (represents maximum resource needs for each process)
  int max[MAX_PROCESS][MAX_RESOURCE];

  // Available vector (represents available resources in the system)
  int available[MAX_RESOURCE];

  // Read allocation matrix
  printf("Enter the allocation matrix:\n");
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      scanf("%d", &allocation[i][j]);
    }
  }

  // Read max matrix
  printf("Enter the max matrix:\n");
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      scanf("%d", &max[i][j]);
    }
  }

  // Read available vector
  printf("Enter the available resources:\n");
  for (int i = 0; i < m; i++) {
    scanf("%d", &available[i]);
  }

  int need[MAX_PROCESS][MAX_RESOURCE]; // Need matrix (calculated)

  // Calculate Need matrix
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      need[i][j] = max[i][j] - allocation[i][j];
    }
  }

  int safe_state = 1; // Flag to indicate safe state

  // Check for safe state using Banker's Algorithm
  for (int i = 0; i < n; i++) {
    int found = 0;
    for (int j = 0; j < m; j++) {
      if (need[i][j] <= available[j]) {
        found++;
      }
    }
    if (found == m) {
      // Process can finish using available resources
      printf("Process %d can finish using available resources.\n", i + 1);
      for (int j = 0; j < m; j++) {
        available[j] += allocation[i][j]; // Add released resources to available pool
      }
    } else {
      safe_state = 0; // No safe state found
      break;
    }
  }

  if (safe_state) {
    printf("The system is in a safe state.\n");
  } else {
    printf("The system is in an unsafe state (deadlock possible).\n");
  }

  return 0;
}


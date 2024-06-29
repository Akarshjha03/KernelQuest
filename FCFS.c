#include <stdio.h>

struct process {
  int pid; // Process ID
  int burst_time; // Burst time of the process
  int waiting_time; // Waiting time of the process (initialized to 0)
  int turnaround_time; // Turnaround time of the process (initialized to 0)
};

void find_waiting_time(struct process processes[], int n) {
  processes[0].waiting_time = 0; // Waiting time for the first process is 0
  for (int i = 1; i < n; i++) {
    processes[i].waiting_time = processes[i - 1].burst_time + processes[i - 1].waiting_time;
  }
}

void find_turnaround_time(struct process processes[], int n) {
  for (int i = 0; i < n; i++) {
    processes[i].turnaround_time = processes[i].burst_time + processes[i].waiting_time;
  }
}

void find_avg_time(struct process processes[], int n) {
  float total_waiting_time = 0, total_turnaround_time = 0;
  for (int i = 0; i < n; i++) {
    total_waiting_time += processes[i].waiting_time;
    total_turnaround_time += processes[i].turnaround_time;
  }

  float avg_waiting_time = total_waiting_time / n;
  float avg_turnaround_time = total_turnaround_time / n;

  printf("Average Waiting Time = %.2f\n", avg_waiting_time);
  printf("Average Turnaround Time = %.2f\n", avg_turnaround_time);
}

void print_gantt_chart(struct process processes[], int n) {
  printf("Gantt Chart:\n");
  int start_time = 0;
  for (int i = 0; i < n; i++) {
    printf("| P%d | ", processes[i].pid);
    start_time += processes[i].burst_time;
  }
  printf("\n");
  int prev_end = 0;
  for (int i = 0; i < n; i++) {
    printf("%d ", prev_end);
    prev_end += processes[i].burst_time;
  }
  printf("%d\n", prev_end);
}

int main() {
  int n;
  printf("Enter the number of processes: ");
  scanf("%d", &n);

  struct process processes[n];
  for (int i = 0; i < n; i++) {
    processes[i].pid = i + 1;
    printf("Enter burst time for process %d: ", i + 1);
    scanf("%d", &processes[i].burst_time);
    processes[i].waiting_time = 0; // Initialize waiting time
    processes[i].turnaround_time = 0; // Initialize turnaround time
  }

  find_waiting_time(processes, n);
  find_turnaround_time(processes, n);

  printf("Process ID\tBurst Time\tWaiting Time\tTurnaround Time\n");
  for (int i = 0; i < n; i++) {
    printf("%d\t\t%d\t\t%d\t\t%d\n", processes[i].pid, processes[i].burst_time,
           processes[i].waiting_time, processes[i].turnaround_time);
  }

  find_avg_time(processes, n);

  print_gantt_chart(processes, n);

  return 0;
}


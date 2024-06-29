#include <stdio.h>

struct process {
  int pid; // Process ID
  int burst_time; // Burst time of the process
  int arrival_time; // Arrival time of the process (optional for non-preemptive RR)
  int remaining_time; // Remaining burst time of the process
};

void find_waiting_time(struct process processes[], int n, int time_quantum) {
  int current_time = 0;
  int completed = 0;

  while (completed != n) {
    for (int i = 0; i < n; i++) {
      if (processes[i].arrival_time <= current_time && processes[i].remaining_time > 0) {
        processes[i].remaining_time -= time_quantum;
        current_time += time_quantum;

        if (processes[i].remaining_time <= 0) {
          completed++;
          processes[i].waiting_time = current_time - processes[i].burst_time - processes[i].arrival_time;
        }
      }
    }
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

void print_gantt_chart(struct process processes[], int n, int time_quantum) {
  printf("Gantt Chart:\n");
  int current_time = 0, prev_pid = -1;
  for (int i = 0; processes[i].remaining_time > 0; i++) {
    int process_executed = (processes[i].remaining_time > time_quantum) ? time_quantum : processes[i].remaining_time;
    if (prev_pid != processes[i].pid) {
      printf("| P%d | ", processes[i].pid);
    }
    current_time += process_executed;
    processes[i].remaining_time -= process_executed;
    prev_pid = processes[i].pid;
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
    processes[i].remaining_time = processes[i].burst_time; // Initialize remaining time
    // Uncomment the following line and modify the prompt if you want to consider arrival times
    //printf("Enter arrival time for process %d (optional, 0 for non-preemptive): ", i + 1);
    //scanf("%d", &processes[i].arrival_time);
  }

  int time_quantum;
  printf("Enter the time quantum: ");
  scanf("%d", &time_quantum);

  find_waiting_time(processes, n, time_quantum);
  find_turnaround_time(processes, n);

  printf("Process ID\tBurst Time\tWaiting Time


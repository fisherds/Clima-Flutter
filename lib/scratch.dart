import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  // Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);
  // String result = 'task 2 data';
  // print('Task 2 complete');
  String result = "";

  Duration threeSeconds = Duration(seconds: 3);
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data' + task2Data;
  print('Task 3 complete');
}

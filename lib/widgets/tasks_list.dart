import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task-data.dart';
import 'package:flutter_todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //! Implement the Consumer Widget to substitude the Provider.of
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                //! Here is the anonymous callback function from the task_list.dart ended up after 175 :)
                checkboxCallback: (checkboxState) {
                  print('Callback run');
                  taskData.updateTask(task);
                },
                onLongPressCallback: () {
                  taskData.deleteTask(task);
                });
          },
        );
      },
    );
  }
}

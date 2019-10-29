import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
//! these widget stays a stateful widget.

  final List<Task> tasks;

  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          //! Here is the anonymous callback function from the task_list.dart ended up after 175 :)
          checkboxCallback: (checkboxState) {
            print('Callback run');
            setState(
              () {
                widget.tasks[index].toggleDone();
              },
            );
          },
        );
      },
    );
  }
}

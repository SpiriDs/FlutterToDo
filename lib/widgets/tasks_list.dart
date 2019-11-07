import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task-data.dart';
import 'package:flutter_todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          taskTitle: Provider.of<TaskData>(context).tasks[index].name,
          isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
          //! Here is the anonymous callback function from the task_list.dart ended up after 175 :)
          checkboxCallback: (checkboxState) {
            print('Callback run');
            /* setState(
              () {
                widget.tasks[index].toggleDone();
              },
            ); */
          },
        );
      },
    );
  }
}

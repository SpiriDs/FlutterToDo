import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  //! checkBoxCallback getting an anonymous CallBackFunction without a name
  // void checkBoxCallback(bool checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Task',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      //! checkBoxCallback getting an anonymous CallBackFunction at toogleCheckboxState
      trailing: TaskCheckBox(
          checkboxState: isChecked,
          toogleCheckboxState: (bool checkBoxState) {
            setState(() {
              isChecked = checkBoxState;
            });
          }),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final Function toogleCheckboxState;

  TaskCheckBox({this.checkboxState, this.toogleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: toogleCheckboxState,
    );
  }
}

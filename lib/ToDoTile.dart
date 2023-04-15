import 'package:flutter/material.dart';

class toDoTile extends StatelessWidget {
  const toDoTile({
    super.key,
    required this.task,
    required this.isDone,
    required this.onChanged,
  });

  final void Function(bool?)? onChanged;
  final String task;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Checkbox(
              value: isDone,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              task,
              style: isDone
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : TextStyle(decoration: TextDecoration.none),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

import 'package:agenda/classes/cores_pink.dart';
import 'package:flutter/material.dart';
import 'package:agenda/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onComplete,
  });

  final Todo todo;
  final Function(Todo) onDelete;
  final Function(Todo) onComplete;
  //final bool isCompleted;

  @override
  // ignore: library_private_types_in_public_api
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              label: 'Ok',
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.green,
              icon: Icons.check_circle,
              onPressed: (context) {
                setState(() {
                  widget.todo.completed = true;
                  //todoRepository.saveTodoList(this);
                });
              },
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              label: 'Deletar',
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (context) {
                widget.onDelete(widget.todo);
              },
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.todo.completed
                ? Color.fromARGB(255, 139, 243, 162)
                : Cores.pink,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yy').format(widget.todo.dateTime),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                widget.todo.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

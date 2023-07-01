import 'package:agenda/classes/cores_pink.dart';
import 'package:flutter/material.dart';
import 'package:agenda/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(
      {super.key,
      required this.todo,
      required this.onDelete,
      required this.onComplete,
      this.cor = Cores.pink});

  final Todo todo;
  final Function(Todo) onDelete;
  final Function(Todo) onComplete;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return /* Slidable(
      actionPane: const SlidableBehindActionPane(),
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {},
        ) */
        //flutter_slidable 3.0.0
        Padding(
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
              //foregroundColor: Colors.white,
              icon: Icons.check_circle,
              onPressed: (context) {
                onComplete(todo);
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
              //foregroundColor: Colors.white,
              icon: Icons.delete,
              onPressed: (context) {
                onDelete(todo);
              },
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cor,
          ),
          //color: Cores.pinkClear,
          padding: const EdgeInsets.all(16),
          child: Column(
            //tomar cuidado com com esse crossAxis para q ele ocupe
            //sempre o maior espaço disponível
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yy').format(todo.dateTime),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                todo.title,
                style: TextStyle(
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

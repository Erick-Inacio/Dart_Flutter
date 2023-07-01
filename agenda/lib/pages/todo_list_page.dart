import 'package:agenda/classes/cores_pink.dart';
import 'package:agenda/repositories/todo_repository.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_list_item.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];

  Todo? deletedTodo;
  int? deletedTodoPos;
  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold é um widget padrão para iniciar uma tela
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Cores.pink,
                          ),
                        ),
                        errorText: errorText,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(
                              color: Colors.red,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Cores.pink,
                          ),
                        ),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Digite sua tarefa...',
                        hintStyle: TextStyle(
                          color: Cores.pink,
                        ),
                        labelStyle: TextStyle(
                          color: Cores.pinkAccent,
                        ),
                      ),
                      style: TextStyle(
                        color: Cores.pink,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = todoController.text;

                      if (text.isEmpty) {
                        setState(() {
                          errorText = 'O título não pode ser vazio';
                        });
                        return;
                      }

                      setState(() {
                        Todo newTodo = Todo(
                          title: text,
                          dateTime: DateTime.now(),
                        );
                        todos.add(newTodo);
                        errorText = null;
                      });
                      todoController.clear();
                      todoRepository.saveTodoList(todos);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.pinkAccent,
                      fixedSize: Size.square(65),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Cores.pink,
                        fontSize: 40,
                      ),
                      /* Icon(
                        Icons.add,
                        size: 30,
                      ) */
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: [
                    for (Todo todo in todos)
                      TodoListItem(
                        todo: todo,
                        onDelete: onDelete,
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Você possui 0 tarefas pendentes',
                      style: TextStyle(
                        color: Cores.pinkAccent,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: showDeleteTodosConfirmationDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cores.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Limpar Tudo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.all(20),
        content: Text(
          'A Tarefa "${todo.title}" foi removida com sucesso!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Cores.pinkClear,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Cores.pinkAccent,
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
            todoRepository.saveTodoList(todos);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo?'),
        content: Text('Você deseja apagar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Cores.pink,
            ),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text("Limpar Tudo"),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
    todoRepository.saveTodoList(todos);
  }
}

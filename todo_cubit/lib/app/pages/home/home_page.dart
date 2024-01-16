import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/app/pages/home/cubit/todo_cubit.dart';
import 'package:todo_cubit/app/pages/home/cubit/todo_state.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage({
    super.key,
    required this.title,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TodoCubit cubit;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<TodoCubit>(context);
    cubit.stream.listen((state) {
      if (state is ErrorTodoState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).secondaryHeaderColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state is InitialTodoState) {
                return const Center(
                  child: Text('Nenhuma tarefa foi adicionada ainda.'),
                );
              } else if (state is LoadingTodoState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedTodoState) {
                return _buildTodoList(state.todos);
              } else {
                return _buildTodoList(cubit.todos);
              }
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.03),
                    offset: const Offset(0, -5),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Digite um nome',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          cubit.addTodo(todo: _nameController.text);
                          _nameController.clear();
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoList(List<String> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Center(
              child: Text(todos[index][0]),
            ),
          ),
          title: Text(todos[index]),
          trailing: IconButton(
            onPressed: () {
              cubit.removeTodo(index: index);
            },
            icon: Icon(Icons.delete),
          ),
        );
      },
    );
  }
}

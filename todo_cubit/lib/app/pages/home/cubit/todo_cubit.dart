import 'package:bloc/bloc.dart';
import 'package:todo_cubit/app/pages/home/cubit/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final List<String> _todos = [];
  List<String> get todos => _todos;

  TodoCubit() : super(InitialTodoState());

  Future<void> addTodo({required String todo}) async {
    emit(LoadingTodoState());

    await Future.delayed(Duration(seconds: 1));

    if (_todos.contains(todo)) {
      emit(ErrorTodoState('Você já adicionou esta tarefa'));
    } else {
      _todos.add(todo);
      emit(LoadedTodoState(_todos));
    }
  }

  Future<void> removeTodo({required int index}) async {
    emit(LoadingTodoState());

    await Future.delayed(Duration(seconds: 1));

    _todos.removeAt(index);

    emit(LoadedTodoState(_todos));
  }

}

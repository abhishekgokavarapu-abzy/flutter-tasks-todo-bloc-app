import 'package:equatable/equatable.dart';
import 'package:tasks_to_do/models/task.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    task.isDone == false
        ? {
            pendingTasks = List.from(state.pendingTasks)..remove(task),
            completedTasks = List.from(state.completedTasks)
              ..insert(0, task.copyWith(isDone: () => true))
          }
        : {
            completedTasks = List.from(state.completedTasks)..remove(task),
            pendingTasks = List.from(state.pendingTasks)
              ..insert(0, task.copyWith(isDone: () => false))
          };

    emit(TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favouriteTasks: state.favouriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favouriteTasks: state.favouriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favouriteTasks: List.from(state.favouriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: () => true))));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}

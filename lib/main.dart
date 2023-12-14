import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_to_do/blocs/app_bloc_observer.dart';
import 'package:tasks_to_do/screens/tab_screen.dart';
import 'package:tasks_to_do/blocs/bloc_exports.dart';
import 'package:tasks_to_do/services/app_router.dart';
import 'package:tasks_to_do/services/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBloc.storage = storage;
  Bloc.observer = AppBlocObserver();
  runApp(TasksApp(
    appRouter: AppRouter(),
  ));
}

class TasksApp extends StatelessWidget {
  const TasksApp({required this.appRouter, super.key});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Tasks App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TabScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

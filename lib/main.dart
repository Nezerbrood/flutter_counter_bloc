import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/bloc_counter_bloc.dart';
import 'package:flutter_counter/system_bloc.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var counterBloc = CounterBloc(counter: 0);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => counterBloc
          ),
          BlocProvider(
              create: (context)=>SystemBloc(counterBloc))
      ],
        child: HomePage(),

      )
    );
  }
}


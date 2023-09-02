import 'package:client/feature/clearSight/presentation/blocs/bloc/photo_bloc.dart';
import 'package:flutter/material.dart';
import "./feature/clearSight/presentation/screens/home.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc()..add(Form1Event()),
      child: MaterialApp(
        title: 'Flutter Demso',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF51E6EB)),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

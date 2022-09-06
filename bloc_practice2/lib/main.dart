import 'package:bloc_practice2/bloc/expensetracker_bloc.dart';
import 'package:bloc_practice2/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: ((context) => ExpenseTrackerBloc()),
    child: MaterialApp(home: Home()),
    );
  }
}

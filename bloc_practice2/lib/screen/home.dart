import 'package:bloc_practice2/bloc/expensetracker_bloc.dart';
import 'package:bloc_practice2/model/data_model.dart';
import 'package:bloc_practice2/screen/addtoscreen.dart';
import 'package:bloc_practice2/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseTrackerBloc, ExpenseTrackerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: Center(
            child: ListView.builder(
              itemBuilder: (context, index) {
                DataModel dataModel = state.data[index];
                return Item(
                  leading: dataModel.date,
                  title: dataModel.title,
                  subtitle: dataModel.descrip,
                  trailing: dataModel.amount.toString(),
                );
              },
              itemCount: state.data.length,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => AddToScreen()),
                ),
              );
            }),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

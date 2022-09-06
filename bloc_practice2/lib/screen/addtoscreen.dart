import 'package:bloc_practice2/bloc/expensetracker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddToScreen extends StatelessWidget {
  AddToScreen({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descripController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseTrackerBloc, ExpenseTrackerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add To Screen"),
          ),
          body: Center(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                ),
                TextField(
                  controller: descripController,
                ),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                ),
                GestureDetector(
                  onTap: () async {
                    await pickdate(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.blue,
                    child: Center(
                      child: Text("${state.date}"),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ExpenseTrackerBloc>().add(
                          OnUpdateList(
                              titleController.text,
                              descripController.text,
                              int.parse(amountController.text),
                              state.date),
                        );
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickdate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMM, yyyy').format(pickedDate);
      context.read<ExpenseTrackerBloc>().add(OnUpdateDate(formattedDate));
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Error"),
          actions: [
            TextButton(
              onPressed: (() => Navigator.pop(context)),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}

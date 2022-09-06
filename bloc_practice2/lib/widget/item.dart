import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/expensetracker_bloc.dart';

class Item extends StatelessWidget {
  final String leading;
  final String title;
  final String subtitle;
  final String trailing;

  const Item({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseTrackerBloc, ExpenseTrackerState>(
      builder: (context, state) {
        return ListTile(
          leading: Text(leading),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Text(trailing),
        );
      },
    );
  }
}

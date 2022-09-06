part of 'expensetracker_bloc.dart';

class ExpenseTrackerState {
  final String title;
  final String descrip;
  final int amount;
  final String date;
  final List<DataModel> data;

  ExpenseTrackerState({
    required this.data,
    required this.title,
    required this.descrip,
    required this.amount,
    required this.date,

  });

  factory ExpenseTrackerState.initial() {
    return ExpenseTrackerState(
      data: [],
      amount: 0,
      descrip: '',
      title: '',
      date: '',
    );
  }

  ExpenseTrackerState copyWith({
    String? title,
    String? descrip,
    int? amount,
    String? date,
    List<DataModel>? data,
  }) {
    return ExpenseTrackerState(
      title: title ?? this.title,
      descrip: descrip ?? this.descrip,
      amount: amount ?? this.amount,
      data: data ?? this.data,
      date: date ?? this.date,
    );
  }
}

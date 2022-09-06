part of 'expensetracker_bloc.dart';

abstract class ExpenseTrackerEvent {}
class OnUpdateList extends ExpenseTrackerEvent {
  final String title;
  final String descrip;
  final int amount;
  final String date;

  OnUpdateList(
    this.title,
    this.descrip,
    this.amount,
    this.date,
  );
}
class OnUpdateDate extends ExpenseTrackerEvent {
  final String date;
  OnUpdateDate(this.date);
}
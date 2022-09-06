import 'package:bloc/bloc.dart';
import 'package:bloc_practice2/model/data_model.dart';
part 'expensetracker_event.dart';
part 'expensetracker_state.dart';

class ExpenseTrackerBloc
    extends Bloc<ExpenseTrackerEvent, ExpenseTrackerState> {
  ExpenseTrackerBloc() : super(ExpenseTrackerState.initial()) {
    on<OnUpdateList>((event, emit) {
      List<DataModel> abc = state.data;
      abc.add(DataModel(
          title: event.title,
          descrip: event.descrip,
          amount: event.amount,
          date: event.date));
      emit(state.copyWith(data: abc));
      emit(state.copyWith(title: '', descrip: '', date: '', amount: 0));
    });

    on<OnUpdateDate>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
  }
}

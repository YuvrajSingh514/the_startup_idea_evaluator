import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ideas_list_event.dart';
part 'ideas_list_state.dart';

class IdeasListBloc extends Bloc<IdeasListEvent, IdeasListState> {
  IdeasListBloc() : super(IdeasListInitial()) {
    on<IdeasListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

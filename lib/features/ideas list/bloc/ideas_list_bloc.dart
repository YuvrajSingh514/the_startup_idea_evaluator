// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_model.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_service.dart';

part 'ideas_list_event.dart';
part 'ideas_list_state.dart';

class IdeasListBloc extends Bloc<IdeasListEvent, IdeasListState> {
  final AddStartupService addStartupService = AddStartupService.instance;
  IdeasListBloc() : super(IdeasListInitial()) {
    on<LoadStartup>(_onLoadStartup);
   
  }
    Future<void> _onLoadStartup(
      LoadStartup event,
      Emitter<IdeasListState> emit,
    ) async {
      emit(IdeasListLoadingState());
      try {
        final ideas = await AddStartupService.instance.fetchStartups();
        emit(IdeasListLoadedState(ideas: ideas));
      } catch (e) {
        emit(IdeasListErrorState(message: 'Data not found'));
      }
    }

   
  }

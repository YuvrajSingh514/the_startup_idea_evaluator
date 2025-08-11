import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_model.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_service.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddInitial()) {
    on<AddStartup>(_onAddStartup);
  }
  Future<void> _onAddStartup(AddStartup event, Emitter<AddState> emit) async {
    int? ideaId = await AddStartupService.instance.insertStartup(event.idea);
    if (ideaId != null) {
      emit(AddLoadingState());
    }
     try {
        final ideas = await AddStartupService.instance.fetchStartups();
        emit(AddLoadedState(startupIdeas: ideas));
      } catch (e) {
        emit(AddErrorState(message: 'Data not found'));
      }
    }
    // final ideas = await AddStartupService.instance.fetchStartups();
    // emit(IdeasListLoadedState(ideas: ideas));
  }


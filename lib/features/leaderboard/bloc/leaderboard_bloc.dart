import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_model.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_service.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final AddStartupService addStartupService = AddStartupService.instance;
  LeaderboardBloc() : super(LeaderboardInitial()) {
    on<GetLeaderBoard>(_onGetLeaderBoard);
  }
  Future<void> _onGetLeaderBoard(
    GetLeaderBoard event,
    Emitter<LeaderboardState> emit,
  ) async {
    emit(LeaderBoardLoadingState());
    try {
      final startups = await addStartupService.fetchStartups();

      startups.sort((a, b) => b.rating.compareTo(a.rating));

      emit(LeaderBoardLoadedState(startups: startups));
    } catch (e) {
      emit(LeaderBoardErrorState(message: 'Data Not Found'));
    }
  }
}

part of 'leaderboard_bloc.dart';

@immutable
sealed class LeaderboardState {}

final class LeaderboardInitial extends LeaderboardState {}

final class LeaderBoardLoadingState extends LeaderboardState {}

final class LeaderBoardLoadedState extends LeaderboardState {
  final List<AddStartupModel> startups;

  LeaderBoardLoadedState({required this.startups});
}

final class LeaderBoardErrorState extends LeaderboardState {
  final String message;

  LeaderBoardErrorState({required this.message});
}

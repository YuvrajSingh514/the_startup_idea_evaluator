part of 'ideas_list_bloc.dart';

sealed class IdeasListState {}

final class IdeasListInitial extends IdeasListState {}

final class IdeasListLoadingState extends IdeasListState{}

final class IdeasListLoadedState extends IdeasListState{
  final List<AddStartupModel> ideas;

  IdeasListLoadedState({required this.ideas});

}

final class IdeasListErrorState extends IdeasListState{
   final String message;

  IdeasListErrorState({required this.message});

}




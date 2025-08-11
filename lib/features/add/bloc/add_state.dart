part of 'add_bloc.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}

final class AddLoadingState extends AddState{}

final class AddLoadedState extends AddState{
    final List<AddStartupModel> startupIdeas;

  AddLoadedState({required this.startupIdeas});

}

final class AddErrorState extends AddState{
     final String message;

  AddErrorState({required this.message});
}


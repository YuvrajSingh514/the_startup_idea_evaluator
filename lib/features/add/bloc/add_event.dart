part of 'add_bloc.dart';

sealed class AddEvent {}

class AddStartup extends AddEvent {
  final AddStartupModel idea;
  AddStartup(this.idea);

   @override
  List<Object?> get props => [idea];
}

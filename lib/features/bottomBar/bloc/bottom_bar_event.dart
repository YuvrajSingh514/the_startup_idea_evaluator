part of 'bottom_bar_bloc.dart';


sealed class BottomBarEvent {}

class ChangeBottomBarIndex extends BottomBarEvent {
  final int index;
  ChangeBottomBarIndex({required this.index});
}

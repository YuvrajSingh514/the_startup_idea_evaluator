part of 'bottom_bar_bloc.dart';

sealed class BottomBarState {}

final class BottomBarLoadedState extends BottomBarState {
  final int selectedIndex;

  BottomBarLoadedState({required this.selectedIndex});

}

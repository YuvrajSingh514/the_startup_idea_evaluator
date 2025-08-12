// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  int selectedIndex = 0;
  BottomBarBloc() : super(BottomBarLoadedState(selectedIndex: 0)) {
    on<ChangeBottomBarIndex>(onGetBottomBar);
  }

  onGetBottomBar(ChangeBottomBarIndex event, Emitter<BottomBarState> state) async {
    selectedIndex = event.index;
    emit(BottomBarLoadedState(selectedIndex: selectedIndex));
  }
}

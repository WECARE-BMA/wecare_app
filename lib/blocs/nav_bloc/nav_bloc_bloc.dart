import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bloc_event.dart';
part 'nav_bloc_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int currentIndex = 1;

  NavBloc() : super(HomePageLoaded()) {
    on<AppStarted>((event, emit) {
      ClickedPageButton(index: currentIndex);
    });

    on<ClickedPageButton>((event, emit) {
      currentIndex = event.index;

      emit(CurrentIndexChanged(currentIndex: this.currentIndex));
      emit(PageLoading());

      if (this.currentIndex == 2) {
        emit(ProfilePageLoaded());
      }
      if (this.currentIndex == 1) {
        emit(HomePageLoaded());
      }
      if (this.currentIndex == 0) {
        emit(HistoryPageLoaded());
      }
    });
  }
}

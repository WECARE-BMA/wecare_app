import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'icon_event.dart';
import 'icon_state.dart';

class IconBloc extends Bloc<IconEvent, IconState> {
  IconBloc()
      : super(IconState(
            icon1: Icons.bookmark_outline,
            icon2: Icons.notifications_none_outlined));

  @override
  Stream<IconState> mapEventToState(IconEvent event) async* {
    if (event is UpdateIcons) {
      yield IconState(icon1: event.icon1, icon2: event.icon2);
    }
  }
}

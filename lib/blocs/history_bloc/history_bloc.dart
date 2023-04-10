import 'dart:developer';

import 'package:bloc/bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final _apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  List cartItems = [];
  int index = 0;
  num price = 0;

  HistoryBloc() : super(HistoryInitialState()) {
    
    on<GetHistoryItems>((event, emit) async {
      final items = await _service.readItem();
      print(items);
      for (var item in items) {
        cartItems.add(Item.fromJson(item));
      }

      // emit(HistoryLoadingState());
      emit(HistorySuccessState(Item: cartItems));
    });

    on<AddHistoryItem>((event, emit) {
      emit(HistoryLoadingState());
      // cartItems.add(event.cartItem);
      _service.saveItem(event.cartItem);
      
      emit(HistorySuccessState(Item: cartItems));
      price = price + event.cartItem.price;
    });

    on<RemoveHistoryItem>((event, emit) {
      emit(HistoryLoadingState());
      cartItems.removeAt(event.index);
      _service.deleteItem(event.cartItem);
      emit(HistorySuccessState(Item: cartItems));
      price = price - event.cartItem.price;
    });
  }
}

import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {}

class GetHistoryItems extends HistoryEvent {
  GetHistoryItems();

  @override
  List<Object> get props => [];
}

class AddHistoryItem extends HistoryEvent {
  Item cartItem;

  AddHistoryItem({
    required this.cartItem
    });

  @override
  List<Object> get props => [];
}
class RemoveHistoryItem extends HistoryEvent {
  Item cartItem;
  int index;

  RemoveHistoryItem({
    required this.cartItem,
    required this.index
    });

  @override
  List<Object> get props => [];
}

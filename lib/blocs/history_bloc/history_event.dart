import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {}

class GetKidsHistory extends HistoryEvent {
  GetKidsHistory();

  @override
  List<Object> get props => [];
}

class AddKidHistory extends HistoryEvent {
  String kidList;

  AddKidHistory({
    required this.kidList
    });

  @override
  List<Object> get props => [];
}
class RemoveKidHistory extends HistoryEvent {
  String kidList;
  int index;

  RemoveKidHistory({
    required this.kidList,
    required this.index
    });

  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';

abstract class SavedEvent extends Equatable {}

class GetKidsSaved extends SavedEvent {
  GetKidsSaved();

  @override
  List<Object> get props => [];
}

class AddKidSaved extends SavedEvent {
  String kidList;

  AddKidSaved({
    required this.kidList
    });

  @override
  List<Object> get props => [];
}

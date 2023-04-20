import 'package:flutter/material.dart';

abstract class IconEvent {}

class UpdateIcons extends IconEvent {
  final IconData icon1;
  final IconData icon2;
  UpdateIcons({required this.icon1, required this.icon2});
}

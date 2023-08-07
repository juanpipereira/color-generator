import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'selected_color_controller.g.dart';

@riverpod
class SelectedColorController extends _$SelectedColorController {
  @override
  Color? build() {
    return null;
  }

  void select(Color? color) {
    state = color;
  }

  void unselect(Color color) => state == color ? state = null : null;
}

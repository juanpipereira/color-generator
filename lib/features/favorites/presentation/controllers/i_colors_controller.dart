import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IColorsController {
  Future<void> toggle({
    required Color color,
    required Ref ref,
  });

  Stream<List<Color>> getAllFavoriteColors({
    required Ref ref,
  });
}

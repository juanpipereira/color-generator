import 'dart:async';

import 'package:color_generator/features/auth/presentation/controllers/auth_state_controller.dart';
import 'package:color_generator/features/favorites/presentation/controllers/anonymous_favorite_colors.dart';
import 'package:color_generator/features/favorites/presentation/controllers/authenticated_favorite_colors.dart';
import 'package:color_generator/features/favorites/presentation/controllers/i_colors_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_colors_controller.g.dart';

@riverpod
class FavoriteColorsController extends _$FavoriteColorsController {
  IColorsController? _controller;
  StreamController<List<Color>> _stream = StreamController.broadcast();

  @override
  Stream<List<Color>> build() {
    ref.onDispose(() {
      _controller = null;
      _stream.close();
    });

    final user = ref.watch(authStateControllerProvider).value;

    setControllerByUser(user);

    if (!_stream.isClosed) {
      _stream.addStream(
        _getAllFavoriteColors(),
        cancelOnError: true,
      );
    }

    return _stream.stream;
  }

  set value(List<Color> colors) => state = AsyncData(colors);

  Stream<List<Color>> _getAllFavoriteColors() {
    return _controller?.getAllFavoriteColors(
          ref: ref,
        ) ??
        Stream.empty();
  }

  IColorsController _getLoggedInController() {
    return AuthenticatedFavoriteColorsController();
  }

  IColorsController _getNotLoggedInController() {
    return AnonymousFavoriteColors();
  }

  void setControllerByUser(User? user) {
    _controller =
        user != null ? _getLoggedInController() : _getNotLoggedInController();
  }

  Future<void> toggle(Color color) async {
    await _controller?.toggle(
      color: color,
      ref: ref,
    );
  }
}

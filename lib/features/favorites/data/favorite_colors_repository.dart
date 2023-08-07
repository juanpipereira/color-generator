import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:color_generator/features/favorites/domain/favorite_color.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_colors_repository.g.dart';

class FavoriteColorsRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<Iterable<FavoriteColor>> getAllFavoriteColors(
    String userId,
  ) {
    final controller = StreamController<Iterable<FavoriteColor>>.broadcast();
    _firestore
        .collection('favorite colors')
        .doc(userId)
        .collection('colors')
        .orderBy("id")
        .withConverter(
          fromFirestore: (document, _) =>
              FavoriteColor.fromJson(document.data()!),
          toFirestore: (FavoriteColor color, _) => color.toJson(),
        )
        .snapshots()
        .listen(
      (snapshot) {
        controller.add(
          snapshot.docs.map(
            (colorItem) => colorItem.data(),
          ),
        );
      },
    );

    return controller.stream;
  }

  Future<bool> addFavoriteColor({
    required FavoriteColor color,
    required int id,
    required String userId,
  }) async {
    try {
      await _firestore
          .collection('favorite colors')
          .doc(userId)
          .collection('colors')
          .doc(color.code)
          .set(
            color.toJson(id),
          );

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> removeFavoriteColor({
    required int id,
    required String userId,
  }) async {
    try {
      await _firestore
          .collection('favorite colors')
          .doc(userId)
          .collection('colors')
          .doc(id.toString())
          .delete();

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}

@riverpod
FavoriteColorsRepository favoriteColorsRepository(
        FavoriteColorsRepositoryRef ref) =>
    FavoriteColorsRepository();

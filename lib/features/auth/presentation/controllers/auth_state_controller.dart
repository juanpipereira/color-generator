import 'package:color_generator/features/auth/presentation/controllers/auth_instance_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_state_controller.g.dart';

@riverpod
class AuthStateController extends _$AuthStateController {
  @override
  Stream<User?> build() {
    return ref.read(authInstanceControllerProvider).authStateChanges();
  }
}

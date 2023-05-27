import 'dart:async';

import 'package:fitness_app/preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/models.dart';

typedef AsyncUser = AsyncValue<User?>;

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<User?> {
  AuthNotifier();
  static const _key = 'token';

  bool get isAuthenticated => state.valueOrNull != null;
  bool get isLoading => state.isLoading;

  @override
  FutureOr<User?> build() async {
    // I should return a user value or null if user doesn't exist
    // To return user, user token should be saved with shared_preferences
    // Then loading user data from 'API' by this token and return it
    ref.listenSelf((_, next) {
      final val = next.valueOrNull;
      print('email: ${val?.email}');
      print('name: ${val?.name}');
      print('token: ${val?.token}');
      if (val == null) {
        print('removed: $_key');
        ref.read(preferences).authRemove(_key);
        return;
      }
      print('seted: $_key with: ${val.token}');
      ref.read(preferences).authSet(_key, val.token);
    });

    try {
      final savedToken = ref.read(preferences).authGet(_key);
      if (savedToken == null) return null;

      final res = await _loginWithToken(savedToken);
      return res;
    } catch (error, stackTrace) {
      await ref.read(preferences).authRemove(_key);
      print(error);
      print(stackTrace);
      return null;
    }
  }

  Future<User?> _loginWithToken(String token) async {
    // TODO: remove delay
    await Future.delayed(const Duration(seconds: 1));
    // final logInAttempt = await Future(
    //   // zalupa
    //   () => true,
    //   //() async => await ref.read(preferences).authGet(_key) == null,
    //   // () => Random().nextBool(),
    // );

    const logInAttempt = true;

    if (logInAttempt) {
      // Returning data recieved by token
      return await Future.delayed(
        const Duration(seconds: 1),
        () => User(
          name: 'Name',
          email: 'some@email.com',
          token: 'secret-token',
        ),
      );
    }

    // If attempt fails, then what!?
    return null;
  }

  Future<void> logout() async {
    await ref.read(preferences).authRemove(_key);
    state = const AsyncUser.data(null);
  }

  Future<void> login(String email, String password) async {
    // Successful login attempt
    state = await AsyncUser.guard(() async {
      return Future.delayed(
        const Duration(seconds: 1),
        () => User(
          name: 'Name',
          email: 'some@email.com',
          token: 'secret-token',
        ),
      );
    });
  }
}

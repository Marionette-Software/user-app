import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart';

final userStateNotifierProvider =
    StateNotifierProvider<UserDataStateNotifier, GGetUpdateUserData_user>(
  (ref) => UserDataStateNotifier(),
);

class UserDataStateNotifier extends StateNotifier<GGetUpdateUserData_user> {
  UserDataStateNotifier()
      : super(
          GGetUpdateUserData_user(),
        );

  void updateUserData(GGetUpdateUserData_user user) {
    state = user;
  }
}

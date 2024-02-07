import 'package:ferry/typed_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/domain/referral_user/referral_user_state.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/get_ref_user.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

final refUserNotifierProvider =
    StateNotifierProvider<RefUserDataStateNotifier, ReferralUserState>(
  (ref) => RefUserDataStateNotifier(),
);

class RefUserDataStateNotifier extends StateNotifier<ReferralUserState> {
  RefUserDataStateNotifier()
      : super(
          ReferralUserState.initialData(),
        );

  void updateRefUserData(ReferralUserState refUser) {
    state = refUser;
  }
}

final refUserFutureProvider = FutureProvider.autoDispose
    .family<ReferralUserState, RefreshRequest>((ref, request) async {
  IUserService service = UserService();

  OperationResponse<GGetRefUserData, GGetRefUserVars> refUserResponse =
      await service.getRefUser();

  final refUser = ReferralUserState.fromJson(
    refUserResponse.data!.refUser!.toJson(),
  );

  ref.read(refUserNotifierProvider.notifier).updateRefUserData(refUser);

  return refUser;
});

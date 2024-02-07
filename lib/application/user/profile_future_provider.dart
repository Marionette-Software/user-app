import 'package:ferry/ferry.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/phone_state_provider.dart';
import 'package:user_app/application/kyc/send_document_state_provider.dart';
import 'package:user_app/application/two_fa/two_fa_state_provider.dart';
import 'package:user_app/application/user/user_state_notifier_provider.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/refresh/refresh_request.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.data.gql.dart';
import 'package:user_app/infrastructure/user/graphql/__generated__/user_get_request.var.gql.dart';
import 'package:user_app/infrastructure/user/user_service.dart';

final userGetUserFutureProvider = FutureProvider.autoDispose.family<
    OperationResponse<GGetUpdateUserData, GGetUpdateUserVars>, RefreshRequest>(
  (ref, data) async {
    IUserService service = UserService();

    OperationResponse<GGetUpdateUserData, GGetUpdateUserVars> userResponse =
        await service.getUserProfile();

    ref
        .read(userStateNotifierProvider.notifier)
        .updateUserData(userResponse.data!.user!);

    var userBox = Hive.box<UserConfigData>(Constants.userConfig);
    UserConfigData userData = userBox.getAt(0)!;
    var userConfigData = UserConfigData(
      userId: userResponse.data!.user!.id,
      token: userData.token,
      userName: userResponse.data!.user!.profiles!.isEmpty
          ? 'User'
          : '${userResponse.data!.user!.profiles!.first!.first_name!} ${userResponse.data!.user!.profiles!.first!.last_name!}',
    );
    userBox.putAt(0, userConfigData);

    ref.read(twoFaProvider.notifier).state =
        userResponse.data!.user!.enabled2fa!;

    String documentStatus = 'pending';
    for (var label in userResponse.data!.user!.labels!) {
      if (label!.key == 'profile') {
        documentStatus = label.value!;
      }
    }
    ref.read(sendDocumentProvider.notifier).state =
        userResponse.data!.user!.documents!.isNotEmpty &&
                documentStatus == 'pending'
            ? true
            : false;

    ref.read(phoneKYCProvider.notifier).state =
        userResponse.data!.user!.phone_verified!;

    return userResponse;
  },
);

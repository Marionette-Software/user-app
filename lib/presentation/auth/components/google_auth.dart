import 'package:easy_localization/easy_localization.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static _googleSignIn(String googleAuthClientId) {
    return GoogleSignIn(
      clientId: googleAuthClientId,
    );
  }
}

class GoogleAuthModel {
  GoogleAuthModel({
    required this.idToken,
    required this.email,
    required this.displayName,
    required this.id,
    this.photoUrl,
  });

  final String idToken;
  final String email;
  final String displayName;
  final String id;
  final String? photoUrl;
}

Future googleLogin(String googleAuthClientId) async {
  try {
    GoogleSignInAccount? googleSignInAccount =
        await GoogleSignInApi._googleSignIn(googleAuthClientId).signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    return GoogleAuthModel(
      id: googleSignInAccount.id,
      idToken: googleSignInAuthentication.idToken!,
      email: googleSignInAccount.email,
      displayName: googleSignInAccount.displayName!,
      photoUrl: googleSignInAccount.photoUrl,
    );
  } on Exception catch (_) {
    return tr('authorization.google_auth_does_not_work');
  } catch (error) {
    return tr('authorization.google_auth_does_not_work');
  }
}

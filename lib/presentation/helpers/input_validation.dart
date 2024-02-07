// ignore: avoid_classes_with_only_static_members
class InputValidation {
  static bool simpleEmailValidation(String eMail) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',)
        .hasMatch(eMail)) {
      return true;
    }
    return false;
  }

  static bool simplePasswordValidation(String password) {
    // Password must be more than 8 characters, include at least 1 number,
    // 1 uppercase letter and 1 special character.
    if (RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',)
        .hasMatch(password)) {
      return true;
    }
    return false;
  }

  static bool simplePhoneNumberValidation(String phoneNumber) {
    //Only US phone numbers
    if (RegExp(
            r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$',)
        .hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }

  static bool simpleFirstNameValidation(String name) {
    if (name.isEmpty) {
      return false;
    }
    return true;
  }

  static bool simpleLastNameValidation(String name) {
    if (name.isEmpty) {
      return false;
    }
    return true;
  }

  static bool simpleMiddleNameValidation(String name) {
    if (name.isNotEmpty && name.trim().isEmpty) {
      return false;
    }
    return true;
  }
}

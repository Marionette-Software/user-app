bool isPasswordValid({
  required String password,
  bool uppercase = true,
  bool lowercase = true,
  bool numbers = true,
  bool symbols = true,
  int length = 8,
}) {
  String pattern = "^";
  if (uppercase) pattern += "(?=.*?[A-Z])";
  if (lowercase) pattern += "(?=.*?[a-z])";
  if (numbers) pattern += "(?=.*?[0-9])";
  if (symbols) pattern += "(?=.*?[${RegExp.escape('!@#\$%^&*()_+-=[]{};\':"\\|,.<>/?')}])";
  pattern += ".{$length,}\$";

  RegExp passwordRegExp = RegExp(pattern);
  return !passwordRegExp.hasMatch(password);
}

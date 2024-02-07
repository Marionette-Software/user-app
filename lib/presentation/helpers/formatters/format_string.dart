String cutString(String str, int length) {
  if (str.length > length) {
    return '${str.substring(0, length)}...';
  } else {
    return str;
  }
}

String formatFirstLetterUppercase(String value) {
  return value.substring(0, 1).toUpperCase() + value.substring(1);
}

String addCharactersToString(
    String initialString, String character, int count) {
  StringBuffer buffer = StringBuffer(initialString);
  for (int i = 0; i < count; i++) {
    buffer.write(character);
  }
  return buffer.toString();
}

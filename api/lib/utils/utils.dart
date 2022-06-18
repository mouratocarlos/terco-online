class Utils {
  static String getNameConvetedClassToTableField(String text,
      [String textRemove = ""]) {
    if (textRemove.isNotEmpty) text = text.replaceAll(textRemove, "");

    String textReplaced = text.replaceAllMapped(RegExp("[A-Z]"), (match) {
      return "_${match.group(0)?.toLowerCase()}";
    });

    if (textReplaced.startsWith("_", 0)) {
      return textReplaced.substring(1, textReplaced.length);
    } else {
      return textReplaced.substring(0, textReplaced.length);
    }
  }
}

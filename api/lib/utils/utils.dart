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

  static String getNameTableFieldToConvetedClass(String text) {
    try {
      return text.replaceAllMapped(RegExp("(.*?)_([a-zA-Z])"), (match) {
        return match.group(1)! + match.group(2)!.toUpperCase();
      });
    } catch (_) {
      return text;
    }
  }
}

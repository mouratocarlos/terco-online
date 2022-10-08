import 'dart:mirrors';

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

  static Object? getAnnotation(DeclarationMirror declaration, Type annotation) {
    for (var instance in declaration.metadata) {
      if (instance.hasReflectee) {
        var reflectee = instance.reflectee;
        if (reflectee.runtimeType == annotation) {
          return reflectee;
        }
      }
    }

    return null;
  }

  static void setFieldsInList(
      Map<String, Map<String, dynamic>> row, Object object) {
    InstanceMirror myClassMirror = reflect(object);

    for (var obj in row.entries) {
      for (var m in obj.value.entries) {
        myClassMirror.setField(
            Symbol(Utils.getNameTableFieldToConvetedClass(m.key)), m.value);
      }
    }
  }

  static void setFieldInMapInsert(Map<String, dynamic> map,
      InstanceMirror myClassMirror, ClassMirror classMirror) {
    for (var m in classMirror.declarations.values) {
      if ((m is MethodMirror) && (m.isGetter)) {
        String field = MirrorSystem.getName(m.simpleName).replaceAll("=", "");

        final conteudo = <String, dynamic>{
          Utils.getNameConvetedClassToTableField(field, ""):
              myClassMirror.getField(Symbol(field)).reflectee,
        };

        map.addEntries(conteudo.entries);
      }
    }
  }

  static void setValuesInEntity(
      Map map, InstanceMirror myClassMirror, ClassMirror classMirror) {
    for (var m in classMirror.declarations.values) {
      if ((m is MethodMirror) && (m.isSetter)) {
        myClassMirror.setField(
            Symbol(MirrorSystem.getName(m.simpleName).replaceAll("=", "")),
            map[MirrorSystem.getName(m.simpleName).replaceAll("=", "")]);
      }
    }
  }
}

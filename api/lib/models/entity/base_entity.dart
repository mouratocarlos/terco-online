import 'dart:mirrors';

class BaseEntity {
  int? _id;

  BaseEntity(this._id);

  @override
  BaseEntity.b();

  int get id {
    return _id!;
  }

  set id(int id) {
    _id = id;
  }

  void _setFieldInMapJson(
      Map map, InstanceMirror myClassMirror, ClassMirror classMirror) {
    for (var m in classMirror.declarations.values) {
      if ((m is MethodMirror) && (m.isGetter)) {
        String field = MirrorSystem.getName(m.simpleName).replaceAll("=", "");
        final conteudo = <String, dynamic>{
          field: myClassMirror.getField(Symbol(field)).reflectee,
        };
        map.addEntries(conteudo.entries);
      }
    }
  }

  Map toJson() {
    InstanceMirror myClassMirror = reflect(this);
    ClassMirror myClassType = myClassMirror.type;
    ClassMirror? superClassMirror = myClassType.superclass;
    Map map = {};

    _setFieldInMapJson(map, myClassMirror, superClassMirror!);
    _setFieldInMapJson(map, myClassMirror, myClassType);

    return map;
  }
}

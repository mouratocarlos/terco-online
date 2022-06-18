import 'package:api/models/entity/base_entity.dart';

class OracaoEntity extends BaseEntity {
  String? _texto;

  OracaoEntity(
    int id,
    this._texto,
  ) : super(id);

  OracaoEntity.b() : super.b();

  String get texto {
    return _texto!;
  }

  set texto(String texto) {
    _texto = texto;
  }

  Map toJson() => {
        'id': id,
        'texto': _texto,
      };
}

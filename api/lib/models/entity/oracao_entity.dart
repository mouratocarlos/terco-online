import 'package:api/models/entity/base_entity.dart';

class OracaoEntity extends BaseEntity {
  String? texto;

  OracaoEntity(
    int id,
    this.texto,
  ) : super(id);

  Map toJson() => {
        'id': id,
        'texto': texto,
      };
}

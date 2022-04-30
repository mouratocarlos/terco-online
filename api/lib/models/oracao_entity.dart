import 'package:api/models/base_entity.dart';

class OracaoEntity extends BaseEntity {
  String texto;

  OracaoEntity(
    int id,
    this.texto,
  ) : super(id);
}

import 'package:api/models/entity/base_entity.dart';

class SantoEntity extends BaseEntity {
  String mencao;
  String resposta;
  bool isFavorito;

  SantoEntity(
    int id,
    this.mencao,
    this.resposta,
    this.isFavorito,
  ) : super(id);
}

import 'package:api/models/base_entity.dart';

class Santo extends BaseEntity {
  String mencao;
  String resposta;
  bool isFavorito;

  Santo(
    int id,
    this.mencao,
    this.resposta,
    this.isFavorito,
  ) : super(id);
}

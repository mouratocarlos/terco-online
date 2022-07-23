import 'package:api/models/entity/base_entity.dart';

class OracaoRezadaEntity extends BaseEntity {
  int? _idOracao;
  int? _quantidade;

  OracaoRezadaEntity(
    this._idOracao,
    this._quantidade,
  ) : super.b();

  int get idOracao {
    return _idOracao!;
  }

  set idOracao(int idOracao) {
    _idOracao = idOracao;
  }

  int get quantidade {
    return _quantidade!;
  }

  set quantidade(int quantidade) {
    _quantidade = quantidade;
  }
}

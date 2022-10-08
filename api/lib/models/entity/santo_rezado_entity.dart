import 'package:api/models/entity/base_entity.dart';

class SantoRezadoEntity extends BaseEntity {
  int? _idSanto;
  int? _quantidade;

  SantoRezadoEntity(
    this._idSanto,
    this._quantidade,
  ) : super.b();

  int get idSanto {
    return _idSanto!;
  }

  set idSanto(int idSanto) {
    _idSanto = idSanto;
  }

  int get quantidade {
    return _quantidade!;
  }

  set quantidade(int quantidade) {
    _quantidade = quantidade;
  }
}

import 'package:api/models/entity/base_entity.dart';

class MisteriosEntity extends BaseEntity {
  int? _idTerco;
  int? _idOracao;
  int? _ordem;
  String? _misterio;

  MisteriosEntity(
    int id,
    this._idTerco,
    this._idOracao,
    this._ordem,
    this._misterio,
  ) : super(id);

  MisteriosEntity.b() : super.b();

  int get idTerco {
    return _idTerco!;
  }

  set idTerco(int idTerco) {
    _idTerco = idTerco;
  }

  int get idOracao {
    return _idOracao!;
  }

  set idOracao(int idOracao) {
    _idOracao = idOracao;
  }

  int get ordem {
    return _ordem!;
  }

  set ordem(int ordem) {
    _ordem = ordem;
  }

  String get misterio {
    return _misterio!;
  }

  set misterio(String misterio) {
    _misterio = misterio;
  }
}

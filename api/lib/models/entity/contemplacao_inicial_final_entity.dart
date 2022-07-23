import 'package:api/models/entity/base_entity.dart';

class ContemplacaoInicialFinalEntity extends BaseEntity {
  int? _idTerco;
  int? _idOracao;
  int? _ordem;
  String? _tipo;

  ContemplacaoInicialFinalEntity(
    int id,
    this._idTerco,
    this._idOracao,
    this._ordem,
    this._tipo,
  ) : super(id);

  ContemplacaoInicialFinalEntity.b() : super.b();

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

  String get tipo {
    return _tipo!;
  }

  set tipo(String tipo) {
    _tipo = tipo;
  }
}

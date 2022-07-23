import 'package:api/models/entity/base_entity.dart';

class SantoTercoEntity extends BaseEntity {
  int? _idTerco;
  int? _idSanto;
  int? _ordem;

  SantoTercoEntity(
    int id,
    this._idTerco,
    this._idSanto,
    this._ordem,
  ) : super(id);

  SantoTercoEntity.b() : super.b();

  int get idTerco {
    return _idTerco!;
  }

  set idTerco(int idTerco) {
    _idTerco = idTerco;
  }

  int get idSanto {
    return _idSanto!;
  }

  set idSanto(int idSanto) {
    _idSanto = idSanto;
  }

  int get ordem {
    return _ordem!;
  }

  set ordem(int ordem) {
    _ordem = ordem;
  }
}

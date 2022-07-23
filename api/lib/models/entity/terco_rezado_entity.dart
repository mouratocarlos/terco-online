import 'package:api/models/entity/base_entity.dart';

class TercoRezadoEntity extends BaseEntity {
  int? _idTerco;
  int? _quantidadeCompleto;
  int? _quantidadeIncompleto;

  TercoRezadoEntity(
    this._idTerco,
    this._quantidadeCompleto,
    this._quantidadeIncompleto,
  ) : super.b();

  int get idTerco {
    return _idTerco!;
  }

  set idTerco(int idTerco) {
    _idTerco = idTerco;
  }

  int get quantidadeCompleto {
    return _quantidadeCompleto!;
  }

  set quantidadeCompleto(int quantidadeCompleto) {
    _quantidadeCompleto = quantidadeCompleto;
  }

  int get quantidadeIncompleto {
    return _quantidadeIncompleto!;
  }

  set quantidadeIncompleto(int quantidadeIncompleto) {
    _quantidadeIncompleto = quantidadeIncompleto;
  }
}

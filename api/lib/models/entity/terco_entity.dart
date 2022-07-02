import 'package:api/models/entity/base_entity.dart';

class TercoEntity extends BaseEntity {
  String? _descricao;
  int? _idOracaoBolinhaPaiNosso;
  int? _idOracaoBolinhaAveMaria;

  TercoEntity(
    int id,
    this._descricao,
    this._idOracaoBolinhaAveMaria,
    this._idOracaoBolinhaPaiNosso,
  ) : super(id);

  TercoEntity.b() : super.b();

  String get descricao {
    return _descricao!;
  }

  set descricao(String descricao) {
    _descricao = descricao;
  }

  int get idOracaoBolinhaPaiNosso {
    return _idOracaoBolinhaPaiNosso!;
  }

  set idOracaoBolinhaPaiNosso(int idOracaoBolinhaPaiNosso) {
    _idOracaoBolinhaPaiNosso = idOracaoBolinhaPaiNosso;
  }

  int get idOracaoBolinhaAveMaria {
    return _idOracaoBolinhaAveMaria!;
  }

  set idOracaoBolinhaAveMaria(int idOracaoBolinhaAveMaria) {
    _idOracaoBolinhaAveMaria = idOracaoBolinhaAveMaria;
  }
}

import 'package:api/config/annotations/column.dart';
import 'package:api/config/annotations/entity.dart';
import 'package:api/config/annotations/join_column.dart';
import 'package:api/config/annotations/join_table.dart';
import 'package:api/config/annotations/not_empty.dart';
import 'package:api/config/annotations/not_null.dart';
import 'package:api/config/annotations/table.dart';
import 'package:api/models/entity/base_entity.dart';

@Entity()
@Table(name: "terco")
class TercoEntity extends BaseEntity {
  @Column(name: "descricao", nullable: true, length: 255)
  @NotEmpty(message: "O campo descricao nao pode estar vazio")
  @NotNull(message: "O campo descricao nao pode estar nulo")
  String? _descricao;

  @Column(name: "id_oracao_bolinha_pai_nosso", nullable: true)
  @NotNull()
  @JoinTable(name: "oracao", joinColumns: {JoinColumn(name: "id")})
  int? _idOracaoBolinhaPaiNosso;

  @Column(name: "id_oracao_bolinha_ave_maria", nullable: true)
  @JoinTable(name: "oracao", joinColumns: {JoinColumn(name: "id")})
  @NotNull()
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

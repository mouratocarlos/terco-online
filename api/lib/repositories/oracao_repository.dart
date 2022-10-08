import 'package:api/models/dto/oracao_dto.dart';
import 'package:api/models/entity/oracao_entity.dart';
import 'package:api/repositories/base_repository.dart';

class OracaoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = OracaoEntity.b();
  }

  @override
  void instanceDto() {
    dto = OracaoDto.b();
  }

  @override
  String sqlFind() {
    return "select " +
        "          ORA.id " +
        "        , ORA.texto " +
        "          from oracao ORA " +
        resultFilterSql() +
        "   order by " +
        "         ORA.id ";
  }

  @override
  String aliasTable() {
    return 'ORA';
  }
}

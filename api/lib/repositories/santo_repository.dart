import 'package:api/models/dto/santo_dto.dart';
import 'package:api/models/entity/santo_entity.dart';
import 'package:api/repositories/base_repository.dart';

class SantoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = SantoEntity.b();
  }

  @override
  void instanceDto() {
    dto = SantoDto.b();
  }

  @override
  String sqlFind() {
    return "select " +
        "          SAN.id " +
        "        , SAN.mencao " +
        "        , SAN.resposta " +
        "        , SAN.is_favorito " +
        "          from santo SAN " +
        resultFilterSql() +
        "   order by " +
        "         SAN.id ";
  }

  @override
  String aliasTable() {
    return 'SAN';
  }
}

import 'package:api/models/dto/misterios_dto.dart';
import 'package:api/models/entity/misterios_entity.dart';
import 'package:api/repositories/base_repository.dart';

class MisteriosRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = MisteriosEntity.b();
  }

  @override
  void instanceDto() {
    dto = MisteriosDto.b();
  }

  @override
  String sqlFind() {
    return "select " +
        "          MIS.id " +
        "        , TER.descricao as NOME_TERCO " +
        "        , ORA.texto     as ORACAO " +
        "        , MIS.ordem " +
        "        , MIS.misterio " +
        "          from misterios MIS " +
        "    inner join terco  TER on TER.id = MIS.id_terco " +
        "    inner join oracao ORA on ORA.id = MIS.id_oracao " +
        resultFilterSql() +
        "    order by " +
        "             MIS.id ";
  }

  @override
  String aliasTable() {
    return 'MIS';
  }
}

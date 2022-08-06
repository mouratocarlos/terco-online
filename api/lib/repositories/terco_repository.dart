import 'package:api/models/dto/terco_dto.dart';
import 'package:api/models/entity/terco_entity.dart';
import 'package:api/repositories/base_repository.dart';

class TercoRepository extends BaseRepository {
  @override
  void instanceEntity() {
    entity = TercoEntity.b();
  }

  @override
  void instanceDto() {
    dto = TercoDto.b();
  }

  @override
  String sqlFindAll() {
    return "select " +
        "          TER.id " +
        "        , TER.descricao as DESCRICAO_TERCO " +
        "        , ORA.texto as ORACAO_BOLINHA_AVE_MARIA " +
        "        , ORP.texto as ORACAO_BOLINHA_PAI_NOSSO " +
        "          from terco TER " +
        "    inner join oracao ORA on ORA.id = TER.id_oracao_bolinha_ave_maria " +
        "    inner join oracao ORP on ORP.id = TER.id_oracao_bolinha_pai_nosso " +
        "   order by " +
        "         TER.id ";
  }
}

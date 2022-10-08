import 'package:api/models/dto/base_dto.dart';

class OracaoDto extends BaseDto {
  String? _texto;

  OracaoDto(
    int id,
    this._texto,
  ) : super(id);

  OracaoDto.b() : super.b();

  String get texto {
    return _texto!;
  }

  set texto(String texto) {
    _texto = texto;
  }
}

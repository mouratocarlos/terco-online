import 'package:api/models/dto/base_dto.dart';

class MisteriosDto extends BaseDto {
  String? _nomeTerco;
  String? _oracao;
  int? _ordem;
  String? _misterio;

  MisteriosDto(
    int id,
    this._nomeTerco,
    this._oracao,
    this._ordem,
    this._misterio,
  ) : super(id);

  MisteriosDto.b() : super.b();

  String get nomeTerco {
    return _nomeTerco!;
  }

  set nomeTerco(String nomeTerco) {
    _nomeTerco = nomeTerco;
  }

  String get oracao {
    return _oracao!;
  }

  set oracao(String oracao) {
    _oracao = oracao;
  }

  int get ordem {
    return _ordem!;
  }

  set ordem(int ordem) {
    _ordem = ordem;
  }

  String get misterio {
    return _misterio!;
  }

  set misterio(String misterio) {
    _misterio = misterio;
  }
}

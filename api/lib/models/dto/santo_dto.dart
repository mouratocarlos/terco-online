import 'package:api/models/dto/base_dto.dart';

class SantoDto extends BaseDto {
  String? _mencao;
  String? _resposta;
  bool? _isFavorito;

  SantoDto(
    int id,
    this._mencao,
    this._resposta,
    this._isFavorito,
  ) : super(id);

  SantoDto.b() : super.b();

  String get mencao {
    return _mencao!;
  }

  set mencao(String mencao) {
    _mencao = mencao;
  }

  String get resposta {
    return _resposta!;
  }

  set resposta(String resposta) {
    _resposta = resposta;
  }

  bool get isFavorito {
    return _isFavorito!;
  }

  set isFavorito(bool isFavorito) {
    _isFavorito = isFavorito;
  }
}

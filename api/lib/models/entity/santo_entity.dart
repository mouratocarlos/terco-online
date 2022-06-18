import 'package:api/models/entity/base_entity.dart';

class SantoEntity extends BaseEntity {
  String? _mencao;
  String? _resposta;
  bool? _isFavorito;

  SantoEntity(
    int id,
    this._mencao,
    this._resposta,
    this._isFavorito,
  ) : super(id);

  SantoEntity.b() : super.b();

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

  Map toJson() => {
        'id': id,
        'mencao': _mencao,
        'resposta': _resposta,
        'isFavorito': _isFavorito,
      };
}

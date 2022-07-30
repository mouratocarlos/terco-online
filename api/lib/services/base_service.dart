import 'package:api/models/entity/base_entity.dart';
import 'package:api/repositories/base_repository.dart';

abstract class BaseService {
  late BaseRepository _repository;

  void instanceRepository();

  BaseService() {
    instanceRepository();
  }

  // ignore: unnecessary_getters_setters
  BaseRepository get repository {
    return _repository;
  }

  set repository(BaseRepository repository) {
    _repository = repository;
  }

  Future<BaseEntity> findById(int id) async {
    if (id > 0) {
      return await _repository.findById(id);
    } else {
      throw Exception(["ID não informado"]);
    }
  }

  Future<List> findAll() async {
    return await _repository.findAll();
  }

  Future<void> post(String json) async {
    await _repository.post(json);
  }

  Future<void> put(String json) async {
    await _repository.put(json);
  }

  Future<void> deleteById(int id) async {
    await _repository.deleteById(id);
  }
}

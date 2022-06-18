import 'package:api/models/entity/base_entity.dart';
import 'package:api/repositories/base_repository.dart';

abstract class BaseService {
  late BaseRepository _repository;

  void instanceRepository();

  BaseService() {
    instanceRepository();
  }

  set repository(BaseRepository repository) {
    _repository = repository;
  }

  // ignore: unnecessary_getters_setters
  BaseRepository get repository {
    return _repository;
  }

  Future<List> findAll() async {
    return await _repository.findAll();
  }

  Future<BaseEntity> findById(int id) async {
    return await _repository.findById(id);
  }

  void post(String obj);
}

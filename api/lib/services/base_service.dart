import 'package:api/repositories/base_repository.dart';

abstract class BaseService<T> {
  late BaseRepository _repository;

  void instanceRepository();

  BaseService() {
    instanceRepository();
  }

  set repository(BaseRepository repository) {
    _repository = repository;
  }

  BaseRepository get repository {
    return _repository;
  }

  Future<List> findAll() async {
    return await _repository.findAll();
  }

  Future<T> findById(int id) async {
    return await _repository.findById(id);
  }

  void post(String _obj);
}

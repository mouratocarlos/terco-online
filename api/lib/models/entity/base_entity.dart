class BaseEntity {
  int? _id;

  BaseEntity(this._id);

  @override
  BaseEntity.b();

  int get id {
    return _id!;
  }

  set id(int id) {
    _id = id;
  }
}

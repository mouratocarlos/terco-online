class BaseEntity {
  int id;

  BaseEntity(this.id);

  Map toJson() => {
        'id': id,
      };
}

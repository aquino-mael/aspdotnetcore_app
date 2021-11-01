abstract class BaseEntity {
  String? id;
  String? remoteId;
  DateTime? createdAt;
  DateTime? updatedAt;

  BaseEntity(this.id, this.createdAt, this.updatedAt);
}

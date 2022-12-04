class BaseModel<T> {
  StatusEnum status;
  String? message;
  T? data;

  BaseModel({required this.status, this.message, this.data});
}

enum StatusEnum {
  ok, error
}

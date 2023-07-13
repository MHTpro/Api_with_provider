class MainModel {
  final String? message;
  final String? status;

  MainModel({
    this.message,
    this.status,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      message: json["message"],
      status: json["status"],
    );
  }
}

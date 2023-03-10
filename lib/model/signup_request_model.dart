class SignupRequestModel {
  late String name;
  late String email;
  late String password;

  SignupRequestModel(
      {required this.name, required this.email, required this.password});

  SignupRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

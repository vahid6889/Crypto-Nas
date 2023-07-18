import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.success,
    super.errorCode,
    super.message,
    super.data,
  });

  factory UserModel.fromJson(dynamic json) {
    Data? data;
    dynamic errorCode;
    if (json['error_code'] != []) {
      errorCode = json['error_code'];
    } else {
      errorCode = [];
    }
    data = json['data'] != null ? Data.fromJson(json['data']) : null;

    return UserModel(
      success: json['success'],
      errorCode: errorCode,
      message: json['message'],
      data: data,
    );
  }
}

class Data {
  Data({
    User? user,
    String? token,
  }) {
    _user = user;
    _token = token;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }
}

class User {
  User({
    String? userName,
    String? email,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    _userName = userName;
    _email = email;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  User.fromJson(dynamic json) {
    _userName = json['user_name'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _userName;
  String? _email;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get userName => _userName;
  String? get email => _email;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = _userName;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}

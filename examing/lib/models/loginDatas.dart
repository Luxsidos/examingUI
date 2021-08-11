import 'dart:typed_data';

class LoginDatas {
  Uint8List? picture;

  LoginDatas(this.picture);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['picture'] = this.picture;
    return map;
  }

  LoginDatas.fromJson(Map<String, dynamic> map)
      : this.picture = map['picture'];
}

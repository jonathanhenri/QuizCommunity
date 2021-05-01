import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String photoUrl;
  final int score;


  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, photoUrl: $photoUrl, score: $score}';
  }

  const UserModel({
    this.id = 0,
    required this.name,
    required this.photoUrl,
    required this.score,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      photoUrl: map['photoUrl'] as String,
      score: map['score'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'photoUrl': this.photoUrl,
      'score': this.score,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  static String getNameTable(){
    return ' USER ';
  }
}

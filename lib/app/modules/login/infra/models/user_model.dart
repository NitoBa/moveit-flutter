import 'package:moveitflutter/app/modules/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String id,
    String name,
    String email,
    String photoUrl,
    int challengeCompleteds,
    int level,
    int currentExperience,
  }) : super(
          id: id,
          name: name,
          email: email,
          photoUrl: photoUrl,
          challengeCompleteds: challengeCompleteds,
          level: level,
          currentExperience: currentExperience,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      level: json['level'],
      photoUrl: json['photo_url'],
      currentExperience: json['current_experience'],
      challengeCompleteds: json['challenges_completed'],
    );
  }
}

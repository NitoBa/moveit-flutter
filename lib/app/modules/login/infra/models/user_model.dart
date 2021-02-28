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

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['level'] = level;
    data['photo_url'] = photoUrl;
    data['current_experience'] = currentExperience;
    data['challenges_completed'] = challengeCompleteds;
    return data;
  }
}

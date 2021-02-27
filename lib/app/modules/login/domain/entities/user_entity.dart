class UserEntity {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final int challengeCompleteds;
  final int level;
  final int currentExperience;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.challengeCompleteds,
    this.level,
    this.currentExperience,
  });
}

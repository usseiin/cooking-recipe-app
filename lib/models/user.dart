class User {
  User(
    this.fullname,
    this.username,
    this.password,
    this.bodyWeight,
    this.height,
  );

  final String fullname, username, password;
  final double recipesLearnt = 0, bodyWeight, height;
}

var user = User("Diana Rose", "Rose", "password", 63, 1.7);

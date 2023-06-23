class User {
  //
  late String id;
  late String email;
  late String password;

  //constructor
  User();
  User.login(this.email, this.password);
  User.full(this.id, this.email, this.password);
}
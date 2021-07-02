class LocalUser {
  late String uid;
  late String phone;
  late String name;
  late String gender;

  LocalUser.fromJson(json) {
    this.gender = json['gender'];
    this.uid = json['uid'];
    this.name = json['name'];
    this.phone = json['phone'];
  }
}

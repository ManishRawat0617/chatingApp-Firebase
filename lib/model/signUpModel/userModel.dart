class UserModel {
  String? uid;
  String email;
  String firstName;
  String lastName;
  String userName;
  String phoneNumber;

  UserModel({
    this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
  });
// convert a userModel object to a  map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'phoneNumber': phoneNumber,
    };
  }

// create a userModel object from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstname'],
        lastName: map['lastName'],
        userName: map['userName'],
        phoneNumber: map['phoneNumber']);
  }
}

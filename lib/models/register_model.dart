class RegisterModel {
  String email;
  String username;
  String password;
  Name name;
  Address address;
  String phone;

  RegisterModel({
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });
}

class Address {
  String city;
  String street;
  int number;

  Address({
    required this.city,
    required this.street,
    required this.number,
  });
}

class Name {
  String firstname;
  String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });
}

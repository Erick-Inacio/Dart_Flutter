class Address {
  late String cep;
  late String country;
  late String state;
  late String city;
  late String street;

  Address(
      {required this.cep,
      required this.country,
      required this.state,
      required this.city,
      required this.street});

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'country': country,
      'state': state,
      'city': city,
      'street': street
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      cep: map['cep'],
      country: map['country'],
      state: map['state'],
      city: map['city'],
      street: map['street'],
    );
  }
}

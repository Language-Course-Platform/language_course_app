class Address {
  int? id;
  String? country;
  int? zipCode;
  String? state;
  String? address;

  Address({
    this.id,
    this.country,
    this.state,
    this.address,
    this.zipCode,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}

class Crud {
  final int? id;
  final String name;
  final String email;
  final String age;
  const Crud(
      {required this.name, required this.email, this.id, required this.age});

  factory Crud.fromJson(Map<String, dynamic> json) => Crud(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'email': email, 'age': age};
}

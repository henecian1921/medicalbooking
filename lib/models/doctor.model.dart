class Doctor {
  final int doctorId;
  final String image;
  final String name;
  final String? gender;
  final String? degree;
  final int experience;
  final String? description;
  final String? departmentId;

  const Doctor({
    required this.doctorId,
    required this.image,
    required this.name,
    this.gender,
    required this.degree,
    required this.experience,
    required this.description,
    this.departmentId,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
        return Doctor(
      doctorId: json['id'],
      name: json['name'],
      experience: json['experience'],
      image: json['image'],
      description: json['description'],
      degree: json['degree'],
    );
  }
}



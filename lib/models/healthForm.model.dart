class HealthForm {
  final int id;
  final String namePatient;
  final String email;
  final String phoneNumber;
  final String shiftId;
  final Map<String, dynamic> shift;
  final String reason;
  final String cccd;
  final String bhyt;


  HealthForm({
    required this.id,
    required this.namePatient,
    required this.email,
    required this.phoneNumber,
    required this.shiftId,
    required this.shift,
    required this.reason,
    required this.cccd,
    required this.bhyt,
  });

  factory HealthForm.fromJson(Map<String, dynamic> json) {
    return HealthForm(
      id: json['id'],
      namePatient: json['namePatient'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      cccd: json['cccd'],
      bhyt: json['bhyt'],
      shiftId: json['shiftId'] ?? "null",
      shift: json['shift'] ?? "null",
      reason: json['reason'],
    );
  }
}

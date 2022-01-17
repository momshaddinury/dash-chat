class ProfileModel {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? imageUrl;

  const ProfileModel({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.imageUrl,
  });
}

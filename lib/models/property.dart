class Property {
  final int id;
  final String title;
  final String description;
  final String location;
  final double price;
  final int ownerId;
  final String type;
  final String size;
  final String ownerName;
  final String state;
  final String city;
  final String area;
  final String address;
  final String contact;
  final String? imageUrl;
  final String? videoUrl;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.ownerId,
    required this.type,
    required this.size,
    required this.ownerName,
    required this.state,
    required this.city,
    required this.area,
    required this.address,
    required this.contact,
    this.imageUrl,
    this.videoUrl,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      price: json['price'].toDouble(),
      ownerId: json['ownerId'],
      type: json['type'],
      size: json['size'],
      ownerName: json['ownerName'],
      state: json['state'],
      city: json['city'],
      area: json['area'],
      address: json['address'],
      contact: json['contact'],
      imageUrl: json['imageUrl'],
      videoUrl: json['videoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'type': type,
      'size': size,
      'ownerName': ownerName,
      'state': state,
      'city': city,
      'area': area,
      'address': address,
      'contact': contact,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
    };
  }
}
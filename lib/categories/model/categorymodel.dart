class CategoryDetails {
  final String id;
  final String name;
  final String quantity;
  final  String farmerId;
  final String image;

  CategoryDetails(
      {required this.id, 
      required this.name, 
      required this.quantity, 
      required this.farmerId, 
      required this.image});

 factory CategoryDetails.fromJson(Map<String, dynamic> json) {
  return CategoryDetails(
    id:json['id'],
    name:json['name'],
    quantity:json['quantity'],
    farmerId:json['farmer_id'],
    image:json['image'],
  );
  }
}
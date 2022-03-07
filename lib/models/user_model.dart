class UserModel
{
  late String name   ;
  late String id ;
  late String image ;
  late String email  ;
  UserModel({required this.name,required this.image,required this.email,required this.id}) ;
  UserModel.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    id = json['id'];
    image = json['image'];
    email = json['email'];
  }
  Map <String,dynamic>toMap()
  {
    return {
      'name':name,
      'id':id,
      'image':image,
      'email':email,
    } ;
  }
}
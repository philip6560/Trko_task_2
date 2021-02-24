class Categories{

  String id;
  String name;

  Categories({this.id, this.name});

  Categories.fromMap(Map<String, dynamic> map){
    id = map['_id'];
    name = map['name'];
  }


}
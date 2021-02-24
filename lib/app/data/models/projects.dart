class UserProjects{
  int status_code;
  String id;
  String title;
  String description;
  String category_id;


  UserProjects({this.status_code, this.id, this.title, this.description, this.category_id});

  UserProjects.fromListMap (Map<String, dynamic> map){
    status_code = map['status_code'];
    id = map['_id'];
    title = map['title'];
    description = map['description'];
    category_id = map['category_id'];
  }

}
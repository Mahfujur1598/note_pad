class NoteModel{
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  NoteModel({
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt
});

  factory NoteModel.fromJson(Map<String, dynamic> json){
    return NoteModel(
      title: json['title'],
      description: json['description'],
      createdAt: json['createAt'],
      updatedAt: json['updateAt']

    );

  }


Map<String, dynamic> toJson (){
  return{
    'title' : title,
    'description' : description,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
  };
}


}
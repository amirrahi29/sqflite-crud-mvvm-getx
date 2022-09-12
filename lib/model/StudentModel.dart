class StudentModel{

  int? id;
  String? name;

  StudentModel({this.id,this.name});

  factory StudentModel.fromMap(Map<dynamic,dynamic> json){
    return StudentModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'name':name,
    };
  }

}
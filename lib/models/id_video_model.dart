
class IdVideoModel{
  String idvideo;
  IdVideoModel({
    required this.idvideo
  });

  factory IdVideoModel.fromMap(Map<String,dynamic> json){
    return IdVideoModel(
      idvideo: json['idvideo'],
    );
  }
}
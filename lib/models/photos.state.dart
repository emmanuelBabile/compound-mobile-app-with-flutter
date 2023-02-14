class Photos{
  String name;
  String url;

  Photos({required this.name, required this.url});
  //------------------------------------------
  factory Photos.fromJson(Map<String, dynamic> json){
    return Photos(url: json['urls']['thumb'], name: json['user']['name']);
  }
}
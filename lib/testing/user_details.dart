

class UserDetails{

  String? _name;

  UserDetails(){
    _name = "Kumar";
  }

  String? get name => _name;

  void setName(String? name){
    _name = name;
  }


  void eraseName(){
    _name = null;
  }


}
import 'dart:convert';

class Cast {

  List<Actor> actores = new List();

  Cast.fromJsonList(List<dynamic>json){
    if (json==null) {
      return;
    }
    json.forEach((item){
      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
    });
  }
  
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String,dynamic>json){
    castId      =json['castId'];
    character   =json['character'];
    creditId    =json['credit_id'];
    gender      =json['gender'];
    id          =json['id'];
    name        =json['name'];
    order       =json['order'];
    profilePath =json['profile_path'];
  }

  getFoto(){
    if(profilePath==null){
      return 'https://marcelloreal.com/public/system/eXfkOOiYH-uoddxClSi52viuasTF1mJ8olZ0u-tOtfFqK66gZCc90Ly_Uoc0VmR1eULwQ0uGf2JhPt4yPTts8A/themes/base/assets/images/avatar-1.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}



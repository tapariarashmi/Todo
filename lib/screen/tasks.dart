class Tasks{

  String name;
  int isDone;
  int id;
  Tasks({this.name,this.isDone=0});
  Tasks.withId(this.id,this.name,this.isDone);
  //Tasks({this.name,this.isDone=false});
  //Tasks.withId(this.id,this.name,this.isDone);

  void toggleIsDone(){
    if(isDone==1)
    isDone=0;
    else
    isDone = 1;
  }

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();

    if(id!=null){
      map['id'] = id;
    }

    map['name'] = name;
    map['isDOne'] = isDone;
    return map;

  }

  Tasks.fromMapObject(Map<String,dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.isDone = map['isDone'];
  }

}
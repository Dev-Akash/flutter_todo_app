class Todos {
  String title;
  String desc;
  bool isPinned;

  Todos(this.title, this.desc, this.isPinned);

  getTitle() {
    return this.title;
  }

  getDesc() {
    return this.desc;
  }

  setTitle(String title){
    this.title = title;
  }

  setDesc(String desc){
    this.desc = desc;
  }

  setPinned(bool state){
    this.isPinned = state;
  }

  Map<String, dynamic> toJson() => {
    'title': this.title,
    'desc': this.desc,
    'isPinned': this.isPinned,
  };

  Todos.fromJson(Map<String, dynamic> json):
        this.title = json['title'],
        this.desc = json['desc'],
        this.isPinned = json['isPinned'];

  @override
  String toString() {
    return "[" + title + "," + desc + "," + isPinned.toString() +"]";
  }
}

class Word {
  String id;
  String text;
  String translation;
  Word(this.text, this.translation);
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "text": text,
      "translation": translation
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
  Word.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    text = map['text'];
    translation = map['translation'];
  }
}
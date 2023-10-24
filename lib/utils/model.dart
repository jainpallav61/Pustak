class Model {
  String title;
  String author;
  String rating;
  String description;
  String image;
  String pagecount;
  String preview;



  Model({this.title = '', this.author = '', this.rating = '~', this.description = '', this.image = '',this.pagecount = '-' , this.preview = '-'  });

   Model.fromMap(Map<dynamic, dynamic> res)
      : title = res['title'],
        author = res['author'],
        rating = res['rating'],
        description = res['description'],
        image = res['image'],
        pagecount = res['pagecount'],
        preview = res['preview'];

  Map<String, Object?> toMap() {
    return {'title': title, 'author': author, 'rating': rating , 'description' : description, 'image' : image , 'pagecount' : pagecount , 'preview' : preview};
  }
}

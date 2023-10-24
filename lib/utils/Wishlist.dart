// ignore_for_file: file_names
import 'package:hive/hive.dart';
part 'Wishlist.g.dart';

@HiveType(typeId: 0)
class Wishlist {

  @HiveField(0)
  late final int id;

  @HiveField(1)
  String title = '';
  
  @HiveField(2)
  String image = '';

  Wishlist({
    required this.id,
    required this.title,
    required this.image,
  });

  Wishlist.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        title = res['title'],
        image = res['image'];

  Map<String, Object?> toMap() {
    return {'id': id, 'title': title, 'image': image};
  }
}

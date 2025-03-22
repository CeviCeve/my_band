import 'package:isar/isar.dart';
import 'package:my_band/data/dto_pattern/models/web/user_model.dart';
import 'package:path_provider/path_provider.dart';

class UserRepository {
  late Isar isar;

  Future<void> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([UserSchema], directory: dir.path);
  }

  Future<void> addPerson(User user) async {
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }
}

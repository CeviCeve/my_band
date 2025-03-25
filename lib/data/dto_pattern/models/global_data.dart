import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';

class GlobalData {
  static User user = User(
    name: "имя",
    password: "yghuji",
    userCode: "",
    email: 'emma.watson@example.com',
    groups: [
      Group(
        name: 'SuperMegaDemons',
        style: 'power-metal',
        creatorId: 'emma.watson@example.com',
        about: 'Cool band!',
        users: ['emma.watson@example.com'],
        icon: 'assets/my_band.png',
      ),
      Group(
        name: 'SuperMegaDemons',
        style: 'power-metal',
        creatorId: 'other.user@example.com',
        about: 'Another cool band!',
        users: ['other.user@example.com', 'emma.watson@example.com'],
        icon: 'assets/my_band.png',
      ),
    ],
  );
}

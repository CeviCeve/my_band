import 'package:my_band/data/dto_pattern/models/local/group_model.dart';
import 'package:my_band/data/dto_pattern/models/local/user_model.dart';

class GlobalData {
  static User user = User(
    name: "Nikita",
    surname: "Pytliak",
    email: "nikitapytliak@gmail.com",
    password: "password",
    userCode: "userCode",
    groups: [
      Group(
        name: "Metallika",
        creatorId: "nikitapytliak@gmail.com",
        about: "coool",
        users: ["test@mail.by"],
      ),
    ],
  );
}

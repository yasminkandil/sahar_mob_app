import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahar_mob_app/models/user_model.dart';
import 'package:sahar_mob_app/services/user_services.dart';


final usersProvider = FutureProvider((ref) async {
  UserService userService = UserService();
  return await userService.getUsers();
});

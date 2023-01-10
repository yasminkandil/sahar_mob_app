import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahar_mob_app/models/user_model.dart';

class UserService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    QuerySnapshot snapshot = await _usersCollectionReference.get();
    snapshot.docs.forEach((document) {
      UserModel user = UserModel(
        firstname: document.data().toString().contains('firstname')
            ? document.get('firstname')
            : '',
        lastname: document.data().toString().contains('lastname')
            ? document.get('lastname')
            : '',
        email: document.data().toString().contains('email')
            ? document.get('email')
            : '',
        address: document.data().toString().contains('address')
            ? document.get('address')
            : '',
        mobile: document.data().toString().contains('mobile')
            ? document.get('mobile')
            : '',
        image: document.data().toString().contains('image')
            ? document.get('image')
            : '',
      );
      users.add(user);
    });

    return users;
  }
}

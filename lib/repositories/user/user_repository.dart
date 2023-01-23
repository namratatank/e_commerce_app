import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/repositories/user/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel userModel) async {
    await _firebaseFirestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toDocument());
  }

  @override
  Stream<UserModel> getUser(String userId) {
    print('Getting userdata from cloud firestore');
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => UserModel.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    return _firebaseFirestore
        .collection('users')
        .doc(userModel.id)
        .update(userModel.toDocument())
        .then((value) => print('user document updated'));
  }
}

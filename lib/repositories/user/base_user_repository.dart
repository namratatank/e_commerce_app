import '../../models/user_model.dart';

abstract class BaseUserRepository{
  Stream<UserModel> getUser(String userId);
  Future<void> createUser(UserModel userModel);
  Future<void> updateUser(UserModel userModel);
}
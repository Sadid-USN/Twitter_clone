import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/constants/appwrite_constants.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/models/user_model.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI(db: ref.watch(appwriteDatabaseProvider));
});

abstract class IUsrAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUsrAPI {
  final Databases _db;
  UserAPI({required Databases db}) : _db = db;
  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      _db.createDocument(
        databaseId: AppWriteConstants.dataBaseId,
        collectionId: AppWriteConstants.userCollection,
        documentId: ID.unique(),
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(e.message ?? "Some unexpected error accurred", st),
      );
    } catch (e, st) {
       return left(
        Failure(e.toString(), st),
      );
    }
  }
}

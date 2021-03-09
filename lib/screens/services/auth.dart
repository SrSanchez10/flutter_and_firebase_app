import 'package:firebase_app/screens/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFireBaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFireBaseUser);
        //.map((FirebaseUser user) => _userFromFireBaseUser(user)); Es lo mismo que arriba
  }

  //sign in anonymous
  Future signInAnon() async {
    try{
      AuthResult result =  await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }

  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }

  }

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}
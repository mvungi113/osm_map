import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService {
  // Instances of FirebaseAuth and FirebaseFirestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Get the FCM token
      String? fcmToken = await FirebaseMessaging.instance.getToken();

      // Update the FCM token in Firestore
      await _firestore.collection("Users").doc(userCredential.user!.uid).update({
        'fcmToken': fcmToken,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the FCM token
      String? fcmToken = await FirebaseMessaging.instance.getToken();

      // Save user information to Firestore
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'fcmToken': fcmToken,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // Set up FCM token listener to handle token refresh
  void setupFCMTokenListener() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      if (getCurrentUser() != null) {
        await _firestore.collection("Users").doc(getCurrentUser()!.uid).update({
          'fcmToken': newToken,
        });
      }
    });
  }
}

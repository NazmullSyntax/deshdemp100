import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Use the singleton instance instead of the removed unnamed constructor
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  // 1. Sign In with Email
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'An error occurred during sign in.');
    }
  }

  // 2. Sign Up with Email
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'An error occurred during sign up.');
    }
  }

  // 3. Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Failed to send reset email.');
    }
  }

  // 4. Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      // Initialization is mandatory in v7.0.0+ before authenticating
      await _googleSignIn.initialize();

      // authenticate() throws exceptions if it fails (like user cancellation). 
      // It no longer returns a nullable object, so we declare it as non-nullable.
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      // authentication is now synchronous in v7.0.0+ (removed 'await')
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      
      // Explicitly request authorization scopes to get the accessToken
      // Removed the unnecessary null-aware operator '?.'
      final authorizedUser = await googleUser.authorizationClient.authorizeScopes(['email', 'profile']);

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authorizedUser.accessToken, // Removed '?.', guaranteed non-null
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  // 5. Facebook Sign In
  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.tokenString,
        );
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      } else {
        throw Exception(result.message ?? 'Facebook login failed.');
      }
    } catch (e) {
      throw Exception('Failed to sign in with Facebook: $e');
    }
  }

  // 6. Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
  }
}
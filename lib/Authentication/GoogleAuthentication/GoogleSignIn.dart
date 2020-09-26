// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// String name;
// String email;
// String imageUrl;
// final FirebaseAuth auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();
// Future<FirebaseUser> googlesignIn() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication gsa =
//       await googleSignInAccount.authentication;

//   FirebaseUser user;
//   user = await auth.signInWithGoogle(
//       accessToken: gsa.accessToken, idToken: gsa.idToken);

//   // final AuthCredential credential = GoogleAuthProvider.getCredential(
//   //   idToken: gsa.idToken,
//   //   accessToken: gsa.accessToken,
//   // );

//   // final AuthResult authResult = await auth.signInWithCredential(credential);
//   // final FirebaseUser firebaseUser = authResult.user;
//   // name = firebaseUser.displayName;
//   // email = firebaseUser.email;
//   // imageUrl = firebaseUser.photoUrl;
//   // final FirebaseUser currentUser = await auth.currentUser();
//   // assert(firebaseUser.uid == currentUser.uid);
//   // return firebaseUser;

//   //Previous

//   // final AuthResult authResult = await auth.signInWithCredential(credential);

//   // new code
//   // final FirebaseUser authResult =
//   //     (await auth.signInWithCredential(credential)).user;
//   // final UserCredential authResult =
//   //     await auth.signInWithCredential(credential);

//   final FirebaseUser firebaseUser = authResult;

//   name = firebaseUser.displayName;
//   email = firebaseUser.email;
//   imageUrl = firebaseUser.photoUrl;

//   final FirebaseUser currentUser = await auth.currentUser;
//   assert(firebaseUser.uid == currentUser.uid);
//   return firebaseUser;
//   // final FirebaseUser currentUser = await auth.currentUser();
//   // assert(firebaseUser.uid == currentUser.uid);
//   // return firebaseUser;var user = firebase.auth().currentUser;
// }

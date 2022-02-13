// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_button/sign_button.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// TextEditingController textEditingControllerEmail = TextEditingController();
// TextEditingController textEditingControllerPassword = TextEditingController();
//
// final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/miejsce3.png',
//               fit: BoxFit.cover,
//               color: Colors.black12,
//               colorBlendMode: BlendMode.darken,
//             ),
//           ),
//           // Positioned(
//           //   top: 30.0,
//           //   left: 20.0,
//           //   child: IconButton(
//           //     onPressed: () {},
//           //     icon: Icon(
//           //       Icons.arrow_back_ios,
//           //       color: Colors.white,
//           //     ),
//           //   ),
//           // ),
//           Positioned.fill(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Text(
//                       'Miło Cię widzieć! ',
//                       style: TextStyle(
//                           fontFamily: 'Tourney',
//                           color: Colors.white,
//                           fontSize: 36.0,
//                           fontWeight: FontWeight.w900),
//                     ),
//                     SizedBox(
//                       height: 15.0,
//                     ),
//                     Text(
//                       'Zaloguj się',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22.0,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
//                       decoration: BoxDecoration(color: Colors.black54),
//                       child: TextField(
//                         controller: textEditingControllerEmail,
//                         style: TextStyle(fontSize: 20, color: Colors.grey),
//                         decoration: InputDecoration(
//                           hintText: 'Email',
//                           icon: Icon(
//                             Icons.mail_outline,
//                             color: Colors.grey,
//                           ),
//                           hintStyle:
//                           TextStyle(fontSize: 20, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
//                       decoration: BoxDecoration(color: Colors.black54),
//                       child: TextField(
//                         controller: textEditingControllerPassword,
//                         obscureText: true,
//                         style: TextStyle(fontSize: 20, color: Colors.grey),
//                         decoration: InputDecoration(
//                             hintText: 'Hasło',
//                             icon: Icon(
//                               Icons.vpn_key,
//                               color: Colors.grey,
//                             ),
//                             hintStyle:
//                             TextStyle(fontSize: 20, color: Colors.grey)),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//                     Align(
//                         alignment: Alignment.centerRight,
//                         child: MaterialButton(
//                           elevation: 6,
//                           color: Color(0xFF32A0E0),
//                           onPressed: () {
//                             signInWithEmailAndPassword();
//                           },
//                           child: Text('login'),
//                         )),
//                     SizedBox(
//                       height: 225.0,
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: SignInButton(
//                           buttonType: ButtonType.google,
//                           buttonSize:
//                           ButtonSize.large, // small(default), medium, large
//                           onPressed: () {
//                             signInWithGoogle();
//                             print('click');
//                           }),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: SignInButton(
//                           btnTextColor: Colors.white,
//                           buttonType: ButtonType.facebook,
//                           buttonSize:
//                           ButtonSize.large, // small(default), medium, large
//                           onPressed: () {
//                             logoutEmail();
//                             print('wylogowales');
//                           }),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// signInWithEmailAndPassword() async {
//   User? registerUser = (await firebaseAuth.signInWithEmailAndPassword(
//       email: textEditingControllerEmail.text,
//       password: textEditingControllerPassword.text))
//       .user;
//
//   textEditingControllerEmail.clear();
//   textEditingControllerPassword.clear();
//
//   print(registerUser!.email);
// }
//
// signInWithGoogle() async {
//   // Open a pop up to choose with google user use to sign in
//   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//   // googleUser store some account but now I need some user authentication service
//   final GoogleSignInAuthentication googleAuth =
//   await googleUser!.authentication;
//   // After authentication user must sign in permission(credential) to share his public data with
//   // application. Now credential method communicate with google server based on user
//   // idToken and accessToken.(so firebase acting like a broker<GoogleAuthProvider> between google and our application to fetch and store user data in our firebase database  )
//   final AuthCredential credential = await GoogleAuthProvider.credential(
//       idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
//
//   // Final step - use  credential to know with user already sign in to our own database with is provider with firebase.
//   final User? user = (await firebaseAuth.signInWithCredential(credential)).user;
//   print(user!.email);
//   print(user.displayName);
// }
//
// logoutEmail() async {
//   FirebaseAuth.instance.signOut();
// }
//
// logout() async {
//   await googleSignIn.disconnect();
//   FirebaseAuth.instance.signOut();
// }
//
// class AnimatedButton extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _StateAnimatedButton();
//   }
// }
//
// class _StateAnimatedButton extends State<AnimatedButton> {
//   bool _clicked = false;
//   double _opacity = 1.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         InkWell(
//           onTap: () {
//             setState(() {
//               signInWithEmailAndPassword();
//               _clicked = !_clicked;
//               _opacity = _opacity == 1.0 ? 0.0 : 1.0;
//             });
//           },
//           child: AnimatedContainer(
//             width: _clicked ? 55 : 150,
//             height: 55,
//             curve: Curves.fastOutSlowIn,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(_clicked ? 70.0 : 30.0),
//               color: Color(0xFF32A0E0),
//             ),
//             duration: Duration(milliseconds: 700),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 AnimatedOpacity(
//                   duration: Duration(seconds: 1),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         size: 30,
//                         color: Color(0xFF934878),
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         color: Color(0xFF934878),
//                       ),
//                     ],
//                   ),
//                   opacity: _opacity,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               _clicked = !_clicked;
//               _opacity = _opacity == 1.0 ? 0.0 : 1.0;
//             });
//           },
//           child: AnimatedContainer(
//             width: _clicked ? 55 : 200,
//             height: 55,
//             curve: Curves.fastOutSlowIn,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(_clicked ? 70.0 : 30.0),
//             ),
//             duration: Duration(milliseconds: 700),
//             child: AnimatedOpacity(
//               duration: Duration(milliseconds: 700),
//               child: Padding(
//                 child: CircularProgressIndicator(
//                     backgroundColor: Colors.blueAccent,
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                         _clicked ? Colors.pinkAccent : Colors.blueAccent)),
//                 padding: EdgeInsets.all(1),
//               ),
//               opacity: _opacity == 0.0 ? 1.0 : 0.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

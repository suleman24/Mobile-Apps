import 'package:firebase_auth/firebase_auth.dart';

Future<User?> signup(email,password) async{
  FirebaseAuth auth = FirebaseAuth.instance;

  final user =
  await auth.createUserWithEmailAndPassword(email: email, password: password);

  if(user!=null)
    {
      return user.user;
    }

}



import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<Map<String,dynamic>> register(String email, String password) async {
    Map<String,dynamic> status = {'status': false};
    try {
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      status['status'] = true;
    } catch(e){}
    return status;
  }

  logout(){
    FirebaseAuth.instance.signOut();
  }

  Future<Map<String,dynamic>> login(String email,String password) async{
   Map<String,dynamic> result = {"status": false};
   try{
     UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     result["status"] = true;
   } catch(e){}
   return result;
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TesteDadosFirebaseUser {
  TesteDadosFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TesteDadosFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TesteDadosFirebaseUser> testeDadosFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TesteDadosFirebaseUser>(
            (user) => currentUser = TesteDadosFirebaseUser(user));

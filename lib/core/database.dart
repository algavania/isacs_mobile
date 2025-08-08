import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  static final realtimeDb = FirebaseDatabase.instance;
  static final firestore = FirebaseFirestore.instance;
}

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final CollectionReference collection = firebaseFirestore.collection('Event');

class FirebaseCrud {
  /// used for insert data into firebase database
  static Future<Response> addEvent({
    required String name,
    required String date,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "event_name": name,
      "date": date,
    };

    await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Successfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  /// used for update data into firebase database
  static Future<Response> updateEvent({
    required String name,
    required String date,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "event_name": name,
      "date": date,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Successfully updated Event";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  /// used for read data from firebase database
  static Stream<QuerySnapshot> readEvent(String date) {
    CollectionReference notesItemCollection = collection;

    return notesItemCollection
        .where('date',
            isGreaterThanOrEqualTo: date,
            isLessThan: date.substring(0, date.length - 1) +
                String.fromCharCode(date.codeUnitAt(date.length - 1) + 1))
        .snapshots();
  }

  /// used for delete data from firebase database
  static Future<Response> deleteEvent({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Successfully Deleted Event";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}

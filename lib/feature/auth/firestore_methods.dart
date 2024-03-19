import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  // Future<String> uploadPost(
  //   String description,
  //   Uint8List file,
  //   String uid,
  //   String username,
  //   String profileImage,
  // ) async {
  //   String res = 'some error occured';

  //   try {
  //     String photoUrl =
  //         await StorageMethods().uploadImageToStorage('posts', file, true);
  //     String postId = const Uuid().v1();
  //     Post post = Post(
  //       postUrl: photoUrl,
  //       profileImage: profileImage,
  //       datePublished: DateTime.now(),
  //       postId: postId,
  //       username: username,
  //       description: description,
  //       uid: uid,
  //       likes: [],
  //     );

  //     _firestore.collection('posts').doc(postId).set(post.toJson());
  //     res = 'success';
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> postComment(
      {required String postId,
      required String text,
      required String name,
      required String profilePicture}) async {
    String commentId = const Uuid().v1();
    try {
      if (text.isNotEmpty) {
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePicture': profilePicture,
          'name': name,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
      } else {
        print('text is empty');
      }
    } catch (err) {
      print(' the error could be this ${err.toString()}');
    }
  }

  //
}

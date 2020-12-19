import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'chewie_list_item.dart';
import 'database.dart';

class Pics extends StatefulWidget {
  final String choiceOfExercise;
  final String workoutId;
  Pics(this.choiceOfExercise, this.workoutId);
  @override
  _PicsState createState() => _PicsState();
}

class _PicsState extends State<Pics> {
  String imageUrl;
  String videoUrl;
  VideoPlayerController videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
    loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.95),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            (imageUrl != null)
                ? Image.network(imageUrl)
                : Placeholder(
                    fallbackHeight: 0,
                    fallbackWidth: 0,
                  ),
            //Upload workout image
            (imageUrl == null)
                ? Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 20,
                      right: 20,
                    ),
                    child: ButtonTheme(
                      height: 60,
                      minWidth: 200,
                      child: FlatButton(
                        color: Colors.orange[500],
                        textColor: Colors.white,
                        onPressed: () => uploadImage(),
                        child: Text(
                          "Upload workout image",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : Placeholder(
                    fallbackHeight: 0,
                    fallbackWidth: 0,
                  ),

            //Delete image
            (imageUrl != null)
                ? Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      left: 20,
                      right: 20,
                    ),
                    child: ButtonTheme(
                      height: 40,
                      minWidth: 200,
                      child: FlatButton(
                        color: Colors.orange[500],
                        textColor: Colors.white,
                        onPressed: () => deleteImage(),
                        child: Text(
                          "Delete image",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : Placeholder(
                    fallbackHeight: 0,
                    fallbackWidth: 0,
                  ),
            (videoUrl != null)
                ? ChewieListItem(
                    videoPlayerController: VideoPlayerController.network(
                      videoUrl,
                    ),
                    looping: true,
                  )
                : Placeholder(
                    fallbackHeight: 0,
                    fallbackWidth: 0,
                  ),
            //Upload workout video
            (videoUrl == null)
                ? Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      top: 8,
                      left: 20,
                      right: 20,
                    ),
                    child: ButtonTheme(
                      height: 60,
                      minWidth: 200,
                      child: FlatButton(
                        color: Colors.orange[500],
                        textColor: Colors.white,
                        onPressed: () => uploadVideo(),
                        child: Text(
                          "Upload workout video",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : Placeholder(
                    fallbackHeight: 0,
                    fallbackWidth: 0,
                  ),
            //Delete video
            (videoUrl != null)
                ? Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      left: 20,
                      right: 20,
                    ),
                    child: ButtonTheme(
                      height: 40,
                      minWidth: 200,
                      child: FlatButton(
                        color: Colors.orange[500],
                        textColor: Colors.white,
                        onPressed: () => deleteVideo(),
                        child: Text(
                          "Delete video",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : Placeholder(
                    fallbackHeight: 0,
                    fallbackWidth: 0,
                  ),
            new Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text(
                "For better experience choose videos with 9/16 aspect ratio, and not landscape mode",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadImage() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to firebase
        var snapshot = await _storage
            .ref()
            .child(uid +
                "/" +
                widget.choiceOfExercise +
                "/" +
                widget.workoutId +
                "/" +
                "image")
            .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print("No path received");
      }
    } else {
      print("Grant permissions and try again :(");
    }
  }

  loadImage() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    if (FirebaseStorage.instance.ref().child(uid +
            "/" +
            widget.choiceOfExercise +
            "/" +
            widget.workoutId +
            "/" +
            "image") !=
        null) {
      final ref = FirebaseStorage.instance.ref().child(uid +
          "/" +
          widget.choiceOfExercise +
          "/" +
          widget.workoutId +
          "/" +
          "image");
      var url = await ref.getDownloadURL();
      setState(() {
        imageUrl = url;
      });
    } else {
      print("No path received");
    }
  }

  deleteImage() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    if (FirebaseStorage.instance.ref().child(uid +
            "/" +
            widget.choiceOfExercise +
            "/" +
            widget.workoutId +
            "/" +
            "image") !=
        null) {
      FirebaseStorage.instance
          .ref()
          .child(uid +
              "/" +
              widget.choiceOfExercise +
              "/" +
              widget.workoutId +
              "/" +
              "image")
          .delete()
          .then((_) => print('Successfully deleted item'));
      setState(() {});
    } else {
      print("No path received");
    }
  }

  uploadVideo() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select image
      image = await _picker.getVideo(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to firebase
        var snapshot = await _storage
            .ref()
            .child(uid +
                "/" +
                widget.choiceOfExercise +
                "/" +
                widget.workoutId +
                "/" +
                "video")
            .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          videoUrl = downloadUrl;
        });
      } else {
        print("No path received");
      }
    } else {
      print("Grant permissions and try again :(");
    }
  }

  loadVideo() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    if (FirebaseStorage.instance.ref().child(uid +
            "/" +
            widget.choiceOfExercise +
            "/" +
            widget.workoutId +
            "-1") !=
        null) {
      final ref = FirebaseStorage.instance.ref().child(uid +
          "/" +
          widget.choiceOfExercise +
          "/" +
          widget.workoutId +
          "/" +
          "video");
      var url = await ref.getDownloadURL();
      setState(() {
        videoUrl = url;
      });
    } else {
      print("No path received");
    }
  }

  deleteVideo() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    if (FirebaseStorage.instance.ref().child(uid +
            "/" +
            widget.choiceOfExercise +
            "/" +
            widget.workoutId +
            "-1" +
            "/" +
            "video") !=
        null) {
      FirebaseStorage.instance
          .ref()
          .child(uid +
              "/" +
              widget.choiceOfExercise +
              "/" +
              widget.workoutId +
              "-1" +
              "/" +
              "video")
          .delete()
          .then((_) => print('Successfully deleted item'));
      setState(() {});
    } else {
      print("No path received");
    }
  }
}

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../Constants/constant.dart';
import 'AdminProfileLoadingIndicatorWidget.dart';

class AdminProfilePictureWidget extends StatefulWidget {
  var userData;

  AdminProfilePictureWidget({super.key, required this.userData});

  @override
  State<AdminProfilePictureWidget> createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<AdminProfilePictureWidget> {
  String imageUrl = '';
  ImagePicker imagePicker = ImagePicker();
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  XFile? file;
  Reference referenceRoot = FirebaseStorage.instance.ref();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        if (state is ProfileEditLoading) {
          isLoading = true;
          CircularProgressIndicator();
        } else if (state is ProfileEditSuccess) {
          isLoading = false;
        } else if (state is ProfileEditFailure) {
          isLoading = false;
          Text('Something went wrong, Try again');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
            width: 150,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kprimaryColor,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Container(
                            width: 50,
                            height: 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProfilePictureInteractive(
                                              imageUrl: widget
                                                  .userData['Profile Picture']
                                                  .toString()),
                                    ));
                              },
                              child: CachedNetworkImage(
                                height: 200,
                                width: 300,
                                fit: BoxFit.cover,
                                imageUrl: widget.userData['Profile Picture']
                                    .toString(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                                placeholder: (context, url) =>
                                    AdminProfileLoadingIndicatorWidget(),
                                alignment: Alignment(0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: ClipOval(
                      child: Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          color: kSecondryBackgroundColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kprimaryColor,
                            width: 2,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            file = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (file == null) return;
                            Reference referenceDirImage =
                                referenceRoot.child('profilePictures');
                            Reference referenceImageToUpload =
                                referenceDirImage.child(uniqueFileName);
                            try {
                              await referenceImageToUpload
                                  .putFile(File(file!.path));
                              imageUrl =
                                  await referenceImageToUpload.getDownloadURL();
                              BlocProvider.of<ProfileEditCubit>(context)
                                  .editPicture(picture: imageUrl);
                            } catch (e) {}
                          },
                          child: Padding(
                            padding: EdgeInsets.all(7),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.asset(
                                'assets/images/draw.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

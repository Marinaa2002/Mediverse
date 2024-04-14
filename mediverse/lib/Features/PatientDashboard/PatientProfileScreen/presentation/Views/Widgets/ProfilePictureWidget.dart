import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileLoadingIndicatorWidget.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfilePictureInteractive.dart';

import '../../../../../../Constants/constant.dart';
import '../../../../MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultPictureInteractive.dart';

class ProfilePictureWidget extends StatelessWidget {
  var userData;

  final now_date = DateFormat('d - M - yyyy ').format(DateTime.now());
  String imageUrl = '';
  //ScrollController scrollController;
  ImagePicker imagePicker = ImagePicker();
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  XFile? file;
  Reference referenceRoot = FirebaseStorage.instance.ref();

  final currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference details =
  FirebaseFirestore.instance.collection('info_Patients');

  ProfilePictureWidget({
    super.key, required this.userData
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                                    ProfilePictureInteractive(imageUrl: userData['Profile Picture'].toString()),
                              ));
                        },
                        child: CachedNetworkImage(
                          height: 200,
                          width: 300,
                          fit: BoxFit.cover,
                          imageUrl: userData['Profile Picture'].toString(), //? Icons.person.toString() : userData['Profile Picture'],
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.person, size: 50,),
                          placeholder: (context, url) =>
                              ProfileLoadingIndicatorWidget(),
                          alignment: Alignment(0, 0),
                        ),
                      ),

                      // Image.network(
                      //   userData['Profile Picture'] == null ? Icons.person.toString() : userData['Profile Picture'],
                      //   fit: BoxFit.cover,
                      // ),
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
                    onTap: ()
                      async{
                        file = await imagePicker.pickImage(source: ImageSource.gallery);
                        if (file == null ) return;
                        Reference referenceDirImage = referenceRoot.child('profilePictures');
                        Reference referenceImageToUpload = referenceDirImage.child(uniqueFileName);
                        try{
                          await referenceImageToUpload.putFile(File(file!.path));
                          imageUrl = await referenceImageToUpload.getDownloadURL();
                          userData['Profile Picture'] = imageUrl;
                          //animateToBottom();
                          //BlocProvider.of<LabResultCubit>(context).sendLabModel(now_date: now_date, imageUrl: imageUrl);
                          await details.doc(currentUser!.uid).update({
                            'Profile Picture': userData['Profile Picture'],
                          });
                        }catch(e){

                        }
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
    );
  }
}

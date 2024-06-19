import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import '../../../Constants/Themes.dart';

class ChatHead extends StatelessWidget {
  const ChatHead({
    Key? key,
    required this.patient_id,
    required this.doctor_id,
    required this.chatterRole,
    required this.isPhoto,
    required this.lattestSender,
    required this.latestMsg,
    required this.isRead,
    required Text latestMsgWidget,
  }) : super(key: key);

  final String doctor_id;
  final String patient_id;
  final bool isPhoto;
  final String lattestSender;
  final String? latestMsg;
  final bool isRead;

  final String chatterRole;

  @override
  Widget build(BuildContext context) {
    return chatterRole == "DoctorProfile"
        ? StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection(chatterRole)
                .doc(doctor_id)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SpinKitSpinningCircle(
                  color: kprimaryColor,
                  size: 50,
                )); // Show a loading indicator while waiting for data
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } //
              if (!snapshot.hasData) {
                return Center(
                  child: Text('No Doctor available'),
                ); // Show a loading indicator while waiting for data
              }
              PatientProfileModel profileModel = PatientProfileModel.fromJson(
                  snapshot.data!.data()); //5aif a3ml edit bs hwa doctor
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/DoctorChat', arguments: {
                          'patient_id': patient_id,
                          'doctor_id': doctor_id,
                          'NowRole': "Patient"
                        });
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CachedNetworkImage(
                          imageUrl: profileModel.profilePicture,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        profileModel.name,
                        style: Themes.bodyLarge,
                      ),
                      subtitle: isPhoto &&
                              latestMsg != null &&
                              lattestSender == "Doctor"
                          ? Row(
                              children: [
                                Icon(Icons.camera_alt),
                                Text(" "),
                                Text(
                                  latestMsg!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          : isPhoto &&
                                  latestMsg != null &&
                                  lattestSender == "Patient"
                              ? Row(
                                  children: [
                                    Text("You: "),
                                    Icon(
                                      Icons.camera_alt,
                                      size: 20,
                                    ),
                                    Text(" "),
                                    Text(
                                      latestMsg!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )
                              : !isPhoto &&
                                      latestMsg != null &&
                                      lattestSender == "Patient"
                                  ? Row(
                                      children: [
                                        Text("You: "),
                                        Expanded(
                                          child: Text(
                                            latestMsg!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  : !isPhoto &&
                                          latestMsg != null &&
                                          lattestSender == "Doctor"
                                      ? Expanded(
                                          child: Text(
                                            latestMsg!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      : isPhoto &&
                                              latestMsg == null &&
                                              lattestSender == "Doctor"
                                          ? Icon(Icons.camera_alt)
                                          : isPhoto &&
                                                  latestMsg == null &&
                                                  lattestSender == "Patient"
                                              ? Row(
                                                  children: [
                                                    Text("You: "),
                                                    Icon(Icons.camera_alt),
                                                  ],
                                                )
                                              : Text(""),
                      trailing: !isRead && lattestSender == "Doctor"
                          ? Icon(
                              Icons.mark_chat_unread,
                              color: kprimaryColor,
                              size: 24,
                            )
                          : Icon(
                              Icons.mark_chat_unread,
                              color: Colors.grey,
                              size: 24,
                            ),
                    ),
                  ),

                  Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300]), // Add Divider
                ],
              );
            })
        : StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection(chatterRole)
                .doc(patient_id)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SpinKitSpinningCircle(
                  color: kprimaryColor,
                  size: 50,
                )); // Show a loading indicator while waiting for data
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } //
              if (!snapshot.hasData) {
                return Center(
                  child: Text('No Doctor available'),
                ); // Show a loading indicator while waiting for data
              }
              PatientProfileModel profileModel = PatientProfileModel.fromJson(
                  snapshot.data!.data()); //5aif a3ml edit bs hwa doctor
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/DoctorChat', arguments: {
                          'patient_id': patient_id,
                          'doctor_id': doctor_id,
                          'NowRole': "Doctor"
                        });
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CachedNetworkImage(
                          imageUrl: profileModel.profilePicture,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      subtitle: isPhoto &&
                              latestMsg != null &&
                              lattestSender == "Doctor"
                          ? Row(
                              children: [
                                Text("You: "),
                                Icon(Icons.camera_alt),
                                Text(" "),
                                Expanded(
                                  child: Text(
                                    latestMsg!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          : isPhoto &&
                                  latestMsg != null &&
                                  lattestSender == "Patient"
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 20,
                                    ),
                                    Text(" "),
                                    Expanded(
                                      child: Text(
                                        latestMsg!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                )
                              : !isPhoto &&
                                      latestMsg != null &&
                                      lattestSender == "Patient"
                                  ? Text(
                                      latestMsg!,
                                      maxLines: 1,
                                    )
                                  : !isPhoto &&
                                          latestMsg != null &&
                                          lattestSender == "Doctor"
                                      ? Row(
                                          children: [
                                            Text("You: "),
                                            Expanded(
                                              child: Text(
                                                latestMsg!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        )
                                      : isPhoto &&
                                              latestMsg == null &&
                                              lattestSender == "Doctor"
                                          ? Row(
                                              children: [
                                                Text("You: "),
                                                Icon(Icons.camera_alt),
                                              ],
                                            )
                                          : isPhoto &&
                                                  latestMsg == null &&
                                                  lattestSender == "Patient"
                                              ? Icon(Icons.camera_alt)
                                              : Text(""),
                      title: Text(
                        profileModel.name,
                        style: Themes.bodyLarge,
                      ),
                      trailing: !isRead && lattestSender == "Patient"
                          ? Icon(
                              Icons.mark_chat_unread,
                              color: kprimaryColor,
                              size: 24,
                            )
                          : Icon(
                              Icons.mark_chat_unread,
                              color: Colors.grey,
                              size: 24,
                            ),
                    ),
                  ),

                  Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300]), // Add Divider
                ],
              );
            });
  }
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:mediverse/Constants/constant.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
// import '../../../Constants/Themes.dart';

// class ChatHead extends StatelessWidget {
//   const ChatHead({
//     Key? key,
//     required this.patient_id,
//     required this.doctor_id,
//     required this.chatterRole,
//     required this.isPhoto,
//     required this.lattestSender,
//     required this.latestMsg,
//     required this.isRead,
//     required this.latestMsgWidget, // Add this line
//   }) : super(key: key);

//   final String doctor_id;
//   final String patient_id;
//   final bool isPhoto;
//   final String lattestSender;
//   final String? latestMsg;
//   final bool isRead;
//   final String chatterRole;
//   final Widget latestMsgWidget; // Add this line

//   @override
//   Widget build(BuildContext context) {
//     return chatterRole == "DoctorProfile"
//         ? StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection(chatterRole)
//             .doc(doctor_id)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//                 child: SpinKitSpinningCircle(
//                   color: kprimaryColor,
//                   size: 50,
//                 )); // Show a loading indicator while waiting for data
//           }
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (!snapshot.hasData) {
//             return Center(
//               child: Text('No Doctor available'),
//             );
//           }
//           PatientProfileModel profileModel = PatientProfileModel.fromJson(
//               snapshot.data!.data() as Map<String, dynamic>);
//           return Column(
//             children: [
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
//                 child: ListTile(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/DoctorChat', arguments: {
//                       'patient_id': patient_id,
//                       'doctor_id': doctor_id,
//                       'NowRole': "Patient"
//                     });
//                   },
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(40),
//                     child: CachedNetworkImage(
//                       imageUrl: profileModel.profilePicture,
//                       width: 60,
//                       height: 60,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: Text(
//                     profileModel.name,
//                     style: Themes.bodyLarge,
//                   ),
//                   subtitle: latestMsgWidget, // Use latestMsgWidget here
//                   trailing: !isRead && lattestSender == "Doctor"
//                       ? Icon(
//                     Icons.mark_chat_unread,
//                     color: kprimaryColor,
//                     size: 24,
//                   )
//                       : Icon(
//                     Icons.mark_chat_unread,
//                     color: Colors.grey,
//                     size: 24,
//                   ),
//                 ),
//               ),
//               Divider(
//                   height: 1,
//                   thickness: 1,
//                   color: Colors.grey[300]), // Add Divider
//             ],
//           );
//         })
//         : StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection(chatterRole)
//             .doc(patient_id)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//                 child: SpinKitSpinningCircle(
//                   color: kprimaryColor,
//                   size: 50,
//                 )); // Show a loading indicator while waiting for data
//           }
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           if (!snapshot.hasData) {
//             return Center(
//               child: Text('No Doctor available'),
//             );
//           }
//           PatientProfileModel profileModel = PatientProfileModel.fromJson(
//               snapshot.data!.data() as Map<String, dynamic>);
//           return Column(
//             children: [
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
//                 child: ListTile(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/DoctorChat', arguments: {
//                       'patient_id': patient_id,
//                       'doctor_id': doctor_id,
//                       'NowRole': "Doctor"
//                     });
//                   },
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(40),
//                     child: CachedNetworkImage(
//                       imageUrl: profileModel.profilePicture,
//                       width: 60,
//                       height: 60,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: Text(
//                     profileModel.name,
//                     style: Themes.bodyLarge,
//                   ),
//                   subtitle: latestMsgWidget, // Use latestMsgWidget here
//                   trailing: !isRead && lattestSender == "Patient"
//                       ? Icon(
//                     Icons.mark_chat_unread,
//                     color: kprimaryColor,
//                     size: 24,
//                   )
//                       : Icon(
//                     Icons.mark_chat_unread,
//                     color: Colors.grey,
//                     size: 24,
//                   ),
//                 ),
//               ),
//               Divider(
//                   height: 1,
//                   thickness: 1,
//                   color: Colors.grey[300]), // Add Divider
//             ],
//           );
//         });
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediverse/Constants/Themes.dart';
// import 'package:mediverse/Constants/constant.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Manager/profile_edit_cubit/profile_edit_cubit.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileInfoWidget.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileLoadingIndicatorWidget.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileSettingsWidget.dart';
// import 'Widgets/ProfilePictureWidget.dart';
//
// class PatientProfileScreen extends StatelessWidget {
//   final currentUser = FirebaseAuth.instance.currentUser;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   List<PatientProfileModel> profileModelList = [];
//   PatientProfileModel? patientProfileModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: kprimaryColor,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.chevron_left,
//             color: kSecondryBackgroundColor,
//             size: 24,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           'My Profile',
//           style: Themes.headlineMedium.copyWith(
//             color: backgroundColor,
//             fontSize: 22,
//           ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 2,
//       ),
//       body: BlocBuilder<ProfileEditCubit, ProfileEditState>(
//         builder: (context, state) {
//           if(state is ProfileEditSuccess){
//             profileModelList = state.profileModelList;
//             return Align(
//               alignment: const AlignmentDirectional(0, 0),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                         children: [
//                           //Text('Helloooooooo', style: TextStyle(fontSize: 55),),
//                           // ProfilePictureWidget(patientProfileModel: profileModelList.,
//                           // ),
//                           Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 4),
//                             child: Text(
//                               patientProfileModel!.name,
//                               //profileModelList[index].name  ,
//                               textAlign: TextAlign.center,
//                               style: Themes.headlineSmall.copyWith(
//                                 fontFamily: 'Outfit',
//                                 color: kprimaryTextColor,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             patientProfileModel!.email,
//                             //profileModelList[index].email,
//                             style: Themes.titleSmall.copyWith(
//                                 fontFamily: 'Outfit',
//                                 color: kprimaryTextColor,
//                                 fontSize: 20
//                             ),
//                           ),
//                           const ProfileInfoWidget(),
//                           ProfileSettingsWidget(patientProfileModel: profileModelList[index],),
//                         ]
//                     );
//
//             );
//           } else if (state is ProfileEditFailure) {
//             return ProfileLoadingIndicatorWidget();
//             //return LabResultErrorWidget(errMessage: state.errMessage);
//           } else {
//             return ProfileLoadingIndicatorWidget();
//           }
//         },
//       ),
//     );
//   }
// }





















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediverse/Constants/Themes.dart';
// import 'package:mediverse/Constants/constant.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Manager/profile_edit_cubit/profile_edit_cubit.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileInfoWidget.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileLoadingIndicatorWidget.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileSettingsWidget.dart';
//
// import '../../../Widgets/PictureProfileWidget.dart';
// import 'Widgets/ProfilePictureWidget.dart';
//
// class PatientProfileScreen extends StatelessWidget {
//   final currentUser = FirebaseAuth.instance.currentUser;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   List<PatientProfileModel> profileModelList = [];
//   PatientProfileModel? patientProfileModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: kprimaryColor,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.chevron_left,
//             color: kSecondryBackgroundColor,
//             size: 24,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           'My Profile',
//           style: Themes.headlineMedium.copyWith(
//             color: backgroundColor,
//             fontSize: 22,
//           ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 2,
//       ),
//       body: BlocBuilder<ProfileEditCubit, ProfileEditState>(
//         builder: (context, state) {
//           if(state is ProfileEditSuccess){
//             profileModelList = state.profileModelList;
//
//             // String namee = '';
//             // for (var profilemodel in profileModelList) {
//             //   namee = profilemodel.name.toString();
//             // }
//
//             return Align(
//               alignment: const AlignmentDirectional(0, 0),
//               // child: Expanded(child: ListView.builder(
//               //   itemCount: profileModelList.length,
//               //     itemBuilder: (context, index){
//                     child: Column(
//                       children: [
//                         //Text('Helloooooooo', style: TextStyle(fontSize: 55),),
//                         // !!!!!!!!!!!!!!!!!!!! ProfilePictureWidget(patientProfileModel: profileModelList[index],
//                         // !!!!!!!!!!!!!!!!!!!!),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 4),
//                           child: Text(
//                             //namee,
//                             //profileModelList!.name ,
//                             patientProfileModel!.name,
//                             textAlign: TextAlign.center,
//                             style: Themes.headlineSmall.copyWith(
//                               fontFamily: 'Outfit',
//                               color: kprimaryTextColor,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           patientProfileModel!.email,
//                           //profileModelList[index].email,
//                           style: Themes.titleSmall.copyWith(
//                               fontFamily: 'Outfit',
//                               color: kprimaryTextColor,
//                               fontSize: 20
//                           ),
//                         ),
//                         const ProfileInfoWidget(),
//                         ProfileSettingsWidget(patientProfileModel: patientProfileModel!)//profileModelList[index],),
//                       ]
//                     )
//                   //}
//               //)),
//             );
//           } else if (state is ProfileEditFailure) {
//             return Text('Try again');
//             //return LabResultErrorWidget(errMessage: state.errMessage);
//           } else {
//             return ProfileLoadingIndicatorWidget();
//           }
//         },
//       ),
//     );
//   }
// }








import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileInfoWidget.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileLoadingIndicatorWidget.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileSettingsWidget.dart';

import '../../../Widgets/PictureProfileWidget.dart';
import 'Widgets/ProfilePictureWidget.dart';

class PatientProfileScreen extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // PatientProfileModel patientProfileModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'My Profile',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("info_Patients").doc(currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final userData = snapshot.data!.data() as Map <String, dynamic>;
            return Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ProfilePictureWidget(userData: userData),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 4),
                    child: Text(
                      userData['Name'],
                      textAlign: TextAlign.center,
                      style: Themes.headlineSmall.copyWith(
                        fontFamily: 'Outfit',
                        color: kprimaryTextColor,
                      ),
                    ),
                  ),
                  Text(
                    userData['Email'],
                    style: Themes.titleSmall.copyWith(
                      fontFamily: 'Outfit',
                      color: kprimaryTextColor,
                      fontSize: 20
                    ),
                  ),
                  const ProfileInfoWidget(),
                  //ProfileSettingsWidget(patientProfileModel: patientProfileModel!)
                  ProfileSettingsWidget(userData: userData,),
                ],
              ),
            );
          } else {
            return ProfileLoadingIndicatorWidget();
          }
        },
      ),
    );
  }
}
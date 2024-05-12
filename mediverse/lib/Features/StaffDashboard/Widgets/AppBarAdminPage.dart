import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/FetechAdminInfoCubit.dart/fetech_admin_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/NetworkImage.dart';

class AppBarAdminPage extends StatelessWidget {
  const AppBarAdminPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetechAdminInfoCubit, FetechAdminInfoState>(
      builder: (context, state) {
        if (state is FetechAdminInfoSuccess) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
                child: Container(
                  width: 53,
                  height: 53,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CachedNetworkImageLarge(
                        imageUrl: state.admin.imageUrl,
                        sizeOfPlaceHolder: 50,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Center vertically
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      state.admin.name,
                      style:
                          const TextStyle(fontSize: 14, color: kThirdTextColor),
                    ),
                    Text(
                      state.admin.email,
                      style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 14,
                        color: kThirdTextColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              GestureDetector(
                  child: Icon(color: Colors.white,Icons.logout),
                onTap: (){
                  AwesomeDialog(context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    //title: 'Error',
                    title: 'Are you sure you want to Logout?',
                  titleTextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                  btnOkOnPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                    btnCancelOnPress: () {
                      //Navigator.pop(context);
                    },
                  ).show();
                },
              ),
            ],
          );
        } else if (state is FetechAdminInfoLoading) {
          // Handle loading state
          return const Center(
            child: CircularProgressIndicator(), // Show loading indicator
          );
        } else if (state is FetechAdminInfoFailure) {
          // Handle failure state
          return const Center(
            child: Text(
                'Failed to fetch admin information'), // Show failure message
          );
        }
        return const Center();
      },
    );
  }
}

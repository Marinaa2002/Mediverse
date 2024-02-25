import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/ScreensBackUp/DoctorDashboard/widgets/InfoRow.dart';

class ViewHistory extends StatelessWidget {
  const ViewHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Medical History',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/Human.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(14, 20, 8, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Janny Wilson',
                              textAlign: TextAlign.start,
                              style: Themes.bodyMedium,
                            ),
                            Text(
                              'Age : 53',
                              textAlign: TextAlign.start,
                              style: Themes.titleSmall,
                            ),
                            Text(
                              'jannyWilson.gmail.com',
                              textAlign: TextAlign.start,
                              style: Themes.titleSmall.copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  child: Text(
                    'Medical History:',
                    style: Themes.bodyMedium
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ),
              const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InfoRow(),
                    InfoRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

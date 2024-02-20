import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/PatientDashboard/Widgets/BlogCard.dart';

class MedicalBlogsTab extends StatelessWidget {
  MedicalBlogsTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                              child: Container(
                                width: 320,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color:
                                      Color(0x33000000),
                                      offset: Offset(0, 2),
                                      spreadRadius: 3,
                                    )
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  border: Border.all(
                                    color: kprimaryColor,
                                  ),
                                ),
                                alignment:
                                AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration:
                                    InputDecoration(
                                      hintText: 'Search ',
                                      enabledBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          color: kprimaryColor,
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      focusedBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          color: kprimaryColor,
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      errorBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      focusedErrorBorder:
                                      UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius
                                            .circular(8),
                                      ),
                                      contentPadding:
                                      EdgeInsetsDirectional
                                          .fromSTEB(
                                          8, 0, 8, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional
                                  .fromSTEB(0, 15, 0, 0),
                              child: Card(
                                clipBehavior: Clip
                                    .antiAliasWithSaveLayer,
                                color: Color(0xFFF1F4F8),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      40),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF57636C),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              BlogCardDoc(title: 'How Much Coffee Is Too\nMuch Coffee?', DrName: 'Dr. Salem Ahmed'),
              BlogCardDoc(title: 'Food Allergies and \nAnaphylactic Shocks', DrName: 'Dr. Waheed Amr'),
              BlogCardDoc(title: 'What to do with a diabetes patient?', DrName: 'Dr. Hoda Raouf'),
            ],
          ),
        ),
      ),
    );
  }
}
              // ListView(
              //   padding: EdgeInsets.zero,
              //   shrinkWrap: true,
              //   scrollDirection: Axis.vertical,
              //   children: [
              //     SingleChildScrollView(
              //       child: Column(
              //         children: [
              //           Row(
              //             children: [
              //               Padding(
              //                 padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
              //                 child: Container(
              //                   width: 320,
              //                   height: 40,
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     boxShadow: [
              //                       BoxShadow(
              //                         blurRadius: 4,
              //                         color:
              //                         Color(0x33000000),
              //                         offset: Offset(0, 2),
              //                         spreadRadius: 3,
              //                       )
              //                     ],
              //                     borderRadius:
              //                     BorderRadius.circular(20),
              //                     border: Border.all(
              //                       color: kprimaryColor,
              //                     ),
              //                   ),
              //                   alignment:
              //                   AlignmentDirectional(0, 0),
              //                   child: Padding(
              //                     padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              //                     child: TextFormField(
              //                       obscureText: false,
              //                       decoration:
              //                       InputDecoration(
              //                         hintText: 'Search ',
              //                         enabledBorder:
              //                         UnderlineInputBorder(
              //                           borderSide:
              //                           BorderSide(
              //                             color: kprimaryColor,
              //                             width: 2,
              //                           ),
              //                           borderRadius:
              //                           BorderRadius
              //                               .circular(8),
              //                         ),
              //                         focusedBorder:
              //                         UnderlineInputBorder(
              //                           borderSide:
              //                           BorderSide(
              //                             color: kprimaryColor,
              //                             width: 2,
              //                           ),
              //                           borderRadius:
              //                           BorderRadius
              //                               .circular(8),
              //                         ),
              //                         errorBorder:
              //                         UnderlineInputBorder(
              //                           borderSide:
              //                           BorderSide(
              //                             width: 2,
              //                           ),
              //                           borderRadius:
              //                           BorderRadius
              //                               .circular(8),
              //                         ),
              //                         focusedErrorBorder:
              //                         UnderlineInputBorder(
              //                           borderSide:
              //                           BorderSide(
              //                             width: 2,
              //                           ),
              //                           borderRadius:
              //                           BorderRadius
              //                               .circular(8),
              //                         ),
              //                         contentPadding:
              //                         EdgeInsetsDirectional
              //                             .fromSTEB(
              //                             8, 0, 8, 0),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: EdgeInsetsDirectional
              //                     .fromSTEB(0, 15, 0, 0),
              //                 child: Card(
              //                   clipBehavior: Clip
              //                       .antiAliasWithSaveLayer,
              //                   color: Color(0xFFF1F4F8),
              //                   elevation: 1,
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius:
              //                     BorderRadius.circular(
              //                         40),
              //                   ),
              //                   child: Padding(
              //                     padding: EdgeInsets.all(4),
              //                     child: Icon(
              //                       Icons.search,
              //                       color: Color(0xFF57636C),
              //                       size: 24,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           // Generated code for this reviewRow Widget...
              //           Row(
              //             mainAxisSize: MainAxisSize.max,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Padding(
              //                 padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              //                 child: Container(
              //                   width: MediaQuery.sizeOf(context).width * 0.96,
              //                   decoration: BoxDecoration(
              //                     color: kSecondryBackgroundColor,
              //                     boxShadow: [
              //                       BoxShadow(
              //                         blurRadius: 4,
              //                         color: Color(0x33000000),
              //                         offset: Offset(0, 2),
              //                       )
              //                     ],
              //                     borderRadius: BorderRadius.circular(12),
              //                   ),
              //                   child: Padding(
              //                     padding: EdgeInsets.all(2),
              //                     child: SingleChildScrollView(
              //                       child: Column(
              //                         mainAxisSize: MainAxisSize.max,
              //                         children: [
              //                           Padding(
              //                             padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
              //                             child: Row(
              //                               mainAxisSize: MainAxisSize.max,
              //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Column(
              //                                   mainAxisSize: MainAxisSize.max,
              //                                   crossAxisAlignment: CrossAxisAlignment.start,
              //                                   children: [
              //                                     Text(
              //                                       'How Much Coffee Is Too\nMuch Coffee?',
              //                                       textAlign: TextAlign.start,
              //                                       style: Themes.titleLarge,
              //                                     ),
              //                                     Align(
              //                                       alignment: AlignmentDirectional(0, 0),
              //                                       child: Padding(
              //                                         padding:
              //                                         EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
              //                                         child: Text(
              //                                           'By: Dr. Salem Hassan',
              //                                           style: Themes.bodyMedium.copyWith(
              //                                             fontFamily: 'Readex Pro',
              //                                             fontWeight: FontWeight.normal,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ],
              //                                 ),
              //                                 Card(
              //                                   clipBehavior: Clip.antiAliasWithSaveLayer,
              //                                   color: kprimaryColor,
              //                                   shape: RoundedRectangleBorder(
              //                                     borderRadius: BorderRadius.circular(40),
              //                                   ),
              //                                   child: Padding(
              //                                     padding: EdgeInsets.all(2),
              //                                     child: Container(
              //                                       width: 50,
              //                                       height: 50,
              //                                       clipBehavior: Clip.antiAlias,
              //                                       decoration: BoxDecoration(
              //                                         shape: BoxShape.circle,
              //                                       ),
              //                                       child: Image.asset(
              //                                         'assets/images/Human.png',
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                           Padding(
              //                             padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
              //                             child: Row(
              //                               mainAxisSize: MainAxisSize.max,
              //                               children: [
              //                                 Expanded(
              //                                   child: Text(
              //                                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              //                                     style: Themes.labelMedium.copyWith(
              //                                       fontFamily: 'Readex Pro',
              //                                       fontSize: 14,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                           Align(
              //                             alignment: AlignmentDirectional(0, 0),
              //                             child: Padding(
              //                               padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 12),
              //                               child: Row(
              //                                 mainAxisSize: MainAxisSize.max,
              //                                 mainAxisAlignment: MainAxisAlignment.center,
              //                                 children: [
              //                                   Icon(
              //                                     Icons.star_rate_rounded,
              //                                     color: Colors.yellow,
              //                                     size: 24,
              //                                   ),
              //                                   Padding(
              //                                     padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              //                                     child: Text(
              //                                       '4.7',
              //                                       style: Themes.labelMedium,
              //                                     ),
              //                                   ),
              //                                   Padding(
              //                                     padding:
              //                                     EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              //                                     child: IconButton(
              //                                       borderColor: kprimaryColor,
              //                                       borderRadius: 30,
              //                                       borderWidth: 2,
              //                                       buttonSize: 44,
              //                                       fillColor: kSecondaryTextColor,
              //                                       icon: Icon(
              //                                         Icons.ios_share,
              //                                         color: kSecondryBackgroundColor,
              //                                         size: 22,
              //                                       ),
              //                                       onPressed: () {
              //                                         print('IconButton pressed ...');
              //                                       },
              //                                     ),
              //                                   ),
              //                                   Align(
              //                                     alignment: AlignmentDirectional(-1, 0),
              //                                     child: Padding(
              //                                       padding:
              //                                       EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              //                                       child: IconButton(
              //                                         borderColor:
              //                                         FlutterFlowTheme.of(context).accent3,
              //                                         borderRadius: 30,
              //                                         borderWidth: 2,
              //                                         buttonSize: 44,
              //                                         fillColor: FlutterFlowTheme.of(context).accent3,
              //                                         icon: Icon(
              //                                           Icons.favorite_border,
              //                                           color: FlutterFlowTheme.of(context).tertiary,
              //                                           size: 22,
              //                                         ),
              //                                         onPressed: () {
              //                                           print('IconButton pressed ...');
              //                                         },
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
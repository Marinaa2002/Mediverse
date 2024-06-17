// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediverse/Constants/Themes.dart';
// import 'package:mediverse/Constants/constant.dart';
// import 'package:mediverse/Core/utils/Globals.dart';
// import 'package:mediverse/Features/DoctorDashboard/BookingDoctor/presentation/Managers/cubit/doc_bookings_cubit.dart';
//
// class SearchBarDoctor extends StatelessWidget {
//   static final _textController = TextEditingController();
//
//   const SearchBarDoctor({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     //empty textformfield on entering screen
//     _textController.text = '';
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         vertical: 8,
//       ),
//       child: Expanded(
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
//               child: Center(
//                 child: Container(
//                   width: MediaQuery.sizeOf(context).width * 0.7,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: kSecondryBackgroundColor,
//                     boxShadow: const [
//                       BoxShadow(
//                         blurRadius: 4,
//                         color: Color(0x33000000),
//                         offset: Offset(0, 2),
//                         spreadRadius: 3,
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(
//                       color: kprimaryColor,
//                     ),
//                   ),
//                   alignment: const AlignmentDirectional(0, 0),
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
//                     child: TextFormField(
//                       controller: _textController,
//                       style: Themes.bodyMedium.copyWith(fontSize: 15),
//                       cursorHeight: 20,
//                       autofocus: false,
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         hintText: 'Search ',
//                         hintStyle: Themes.labelMedium,
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         errorBorder: InputBorder.none,
//                         focusedErrorBorder: InputBorder.none,
//                         contentPadding:
//                             const EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
//               child: InkWell(
//                 onTap: () {
//                   final DocBookingsSuccess bookingsState = context
//                       .read<DocBookingsCubit>()
//                       .state as DocBookingsSuccess;
//                   BlocProvider.of<DocBookingsCubit>(context)
//                       .searchDocPrevBookings(bookingsState.bookings,
//                           bookingsState.names, _textController.text);
//                 },
//                 child: Card(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   color: const Color(0xFFF1F4F8),
//                   elevation: 1,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(60),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.all(4),
//                     child: Icon(
//                       Icons.search,
//                       color: Color(0xFF57636C),
//                       size: 35,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
//               child: InkWell(
//                 onTap: () {
//                   BlocProvider.of<DocBookingsCubit>(context)
//                       .getDocPrevBookings(globalcurrentUserId);
//                 },
//                 child: Card(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   color: const Color(0xFFF1F4F8),
//                   elevation: 1,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(60),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.all(4),
//                     child: Icon(
//                       Icons.close_rounded,
//                       color: Color(0xFF57636C),
//                       size: 35,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/BookingDoctor/presentation/Managers/cubit/doc_bookings_cubit.dart';

class SearchBarDoctor extends StatelessWidget {
  static final _textController = TextEditingController();

  const SearchBarDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    // Empty textformfield on entering screen
    _textController.text = '';

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: _textController,
                    onChanged: (value) {
                      context.read<DocBookingsCubit>().searchDocPrevBookings(
                          (context.read<DocBookingsCubit>().state as DocBookingsSuccess).bookings,
                          (context.read<DocBookingsCubit>().state as DocBookingsSuccess).names,
                          value
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kprimaryColor,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _textController.clear();
                          context.read<DocBookingsCubit>().getDocPrevBookings(globalcurrentUserId);
                        },
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

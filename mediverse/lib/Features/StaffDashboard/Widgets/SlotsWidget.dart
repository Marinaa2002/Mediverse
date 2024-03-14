import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/Errors/ErrorMsgs.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Manager/SlotsCubit/SlotsCubit.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Manager/SlotsCubit/SlotsStates.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/EachSlotWidget.dart';

class SlotsWidget extends StatelessWidget {
  SlotsWidget({
    super.key,
  });
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SlotsReterivalCubit>(context).getSlots();
    return BlocBuilder<SlotsReterivalCubit, SlotsState>(
      builder: (context, state) {
        if (state is SlotsStateSuccess) {
          return SizedBox(
            height: 400,
            child: ListView.builder(
              controller: scrollController,
              itemCount: state.slots.length,
              itemBuilder: (context, index) {
                return SlotWidget(
                  slot: state.slots[index],
                );
              },
            ),
          );
        } else if (state is SlotsStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SlotsStateFailure) {
          return const Center();
        } else {
          return const Center(
            child: Text("No Slots made this month"),
          );
        }
      },
    );
  }
}

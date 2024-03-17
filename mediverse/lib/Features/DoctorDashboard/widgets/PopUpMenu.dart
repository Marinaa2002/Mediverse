import 'package:flutter/material.dart';

class PopUpWindow extends StatelessWidget {
  const PopUpWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      onSelected: (value) {
        print(value);
      },
      itemBuilder: (BuildContext contesxt) {
        return [
          const PopupMenuItem(
            value: "Media, links, and docs",
            child: Text("Media, links, and docs"),
          ),

          //N5li mslan al option da l patient ma2fol w al doc mafto7 m3rfsh lsa 5alih for now
          const PopupMenuItem(
            value: "Mute Notification",
            child: Text("Mute Notification"),
          ),
        ];
      },
    );
  }
}

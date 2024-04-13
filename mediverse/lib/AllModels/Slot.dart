class Slot {
  final String? time;

  Slot({
    this.time,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      time: json.keys.first,
    );
  }
}

import 'package:console_bars/console_bars.dart';

void main(List<String> args) async {
  // A bar that looks like
  //
  // Loading : ████████████████████████████████████████.................... 673/1000 67.3% [ 0:00:13.28 / 0:00:06.45 ]
  //
  final p = FillingBar(
      desc: "Loading", total: 500, time: true, percentage: true, scale: 0.2 , width:77);
  for (var i = 0; i < 200; i++) {
    p.increment();
    await Future.delayed(Duration(milliseconds: 10));
  }

  // Change the description and total mid-way
  await Future.delayed(Duration(seconds: 2));
  p.total = 250;
  p.desc = "Processing";
  await Future.delayed(Duration(seconds: 2));

  for (var i = 0; i < 50; i++) {
    p.increment();
    await Future.delayed(Duration(milliseconds: 5));
  }

  print("\nDone");
}
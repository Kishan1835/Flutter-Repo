import 'package:dice_app/dice_roller.dart';
import 'package:flutter/material.dart';
// Importing from the styled_text file
//that contains StyledText class
// import 'package:dice_app/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignemnt = Alignment.bottomRight;

// Option 2 to add color as useing color keyword (Color).
class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.colors1,
    this.colors2, {
    super.key,
  });

  final Color colors1;
  final Color colors2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors1, colors2],
          begin: startAlignment,
          end: endAlignemnt,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}

// Option 1 to add color as in form of list
// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});

//   final List<Color> colors;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignemnt,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('Hello World!'),
//       ),
//     );
//   }
// }

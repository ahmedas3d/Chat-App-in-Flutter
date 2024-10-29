import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
  });
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
//  ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         fixedSize: const Size(420, 45),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.indigoAccent,
//       ),
//       onPressed: () {},
//       child: Text(
//         buttonText,
//         style: const TextStyle(
//           fontSize: 20,
//         ),
//       ),
//     );
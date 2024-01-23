// /*
//  burda ana ekrandakı textfieldleri  ovallestirp grı grek verdık

// */
// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;

//   const CustomTextField(
//       {super.key, required this.hintText, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//           //ovallestırme ıslemı yaptık
//           border: Border.all(),
//           borderRadius: BorderRadius.circular(10)),
//       child: TextField(
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey.shade700.withOpacity(0.8),
//             hintText: hintText,
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
//         controller: controller,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
//ovallestırme ıslemı yaptık
          border: Border.all(),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        textInputAction: textInputAction,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade700.withOpacity(0.8),
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        controller: controller,
      ),
    );
  }
}

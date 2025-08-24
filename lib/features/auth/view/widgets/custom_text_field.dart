// // lib/features/auth/presentation/widgets/custom_text_field.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   final String label;
//   final String hint;
//   final TextEditingController controller;
//   final bool isPassword;
//   final String? Function(String?)? validator;
//   final TextInputType keyboardType;
//   final IconData? prefixIcon;
//
//   const CustomTextField({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.controller,
//     this.isPassword = false,
//     this.validator,
//     this.keyboardType = TextInputType.text,
//     this.prefixIcon,
//   });
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       validator: widget.validator,
//       keyboardType: widget.keyboardType,
//       obscureText: widget.isPassword ? _obscureText : false,
//       decoration: InputDecoration(
//         labelText: widget.label,
//         hintText: widget.hint,
//         prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
//         suffixIcon: widget.isPassword
//             ? IconButton(
//                 icon: Icon(
//                   _obscureText ? Icons.visibility_off : Icons.visibility,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _obscureText = !_obscureText;
//                   });
//                 },
//               )
//             : null,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }
// }

// import 'package:country_list_picker_example/controller/input_provider.dart';
// import 'package:country_list_picker_example/controller/picker_provider.dart';
// import 'package:country_list_picker_example/widget/color_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'list_tile.dart';

// class PickerProperties extends StatelessWidget {
//   const PickerProperties({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<PickerProvider, InputProvider>(
//       builder: (context, picker, input, child) {
//         return Column(
//           children: [
//             XListTile(
//                 titleAsString: 'Picker Border',
//                 // subtitle: Text("isShowTextField = ${provider.isShowTextField}"),
//                 toggle: Switch(
//                     value: picker.pickerBorder,
//                     onChanged: (bool value) {
//                       if (input.inputBorder == true && value == true) input.inputBorder = false;
//                       picker.pickerBorder = value;
//                     })),
//             XListTile(
//                 titleAsString: 'Input Border',
//                 // subtitle: Text("isShowTextField = ${provider.isShowTextField}"),
//                 toggle: Switch(
//                     value: input.inputBorder,
//                     onChanged: (bool value) {
//                       if (picker.pickerBorder == true && value == true) picker.pickerBorder = false;
//                       input.inputBorder = value;
//                     })),
//             // Color
//             XListTile(
//               titleAsString: "Text Color",
//               subtitleASWidge: Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: XColorPickerDialog(
//                     value: picker.pickerTextColor,
//                     onColorChanged: (Color color) => picker.pickerTextColor = color),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

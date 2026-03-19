// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class TypoPage extends StatelessWidget {
//   final TypoController controller = Get.put(TypoController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Typo Correction'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               onChanged: (text) {
//                 controller.inputText.value = text;
//               },
//               decoration: InputDecoration(labelText: 'Enter Text'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 controller.checkAndCorrectTypos();
//               },
//               child: Text('Check Typos'),
//             ),
//             Text('Corrected Text: ${controller.correctedText}'),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/typoController.dart';

class TextScreen extends StatelessWidget {
  final TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Typos Correction Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Enable Typos Correction: '),
                Obx(
                      () => Switch(
                    value: textController.typosEnabled.value,
                    onChanged: textController.toggleTyposCorrection,
                  ),
                ),
              ],
            ),
            TextField(
              onChanged: textController.updateText,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 16),
            Obx(() => Text(
              'Text: ${textController.text}',
              style: TextStyle(fontSize: 16),
            )),
          ],
        ),
      ),
    );
  }
}

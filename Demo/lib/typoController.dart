// import 'package:get/get.dart';
//
// class TypoController extends GetxController {
//   final HunspellService hunspellService = HunspellService();
//
//   RxString inputText = ''.obs;
//   RxString correctedText = ''.obs;
//
//   void checkAndCorrectTypos() {
//     if (inputText.isNotEmpty) {
//       correctedText.value = hunspellService.hunspell.correct(inputText.value);
//     } else {
//       correctedText.value = '';
//     }
//   }
//
//   @override
//   void onClose() {
//     hunspellService.dispose();
//     super.onClose();
//   }
// }


import 'package:get/get.dart';
import 'package:spell_check_on_client/spell_check_on_client.dart';

class TextController extends GetxController {
  final RxBool typosEnabled = false.obs;
  final RxString text = ''.obs;

  final SpellCheckClient spellCheckClient = SpellCheckClient(languages: ['en_US'],);

  void toggleTyposCorrection() {
    typosEnabled.value = !typosEnabled.value;
  }

  Future<void> updateText(String newText) async {
    text.value = newText;
    if (typosEnabled.value) {
      final correctedText = await spellCheckClient.correctText(text.value);
      text.value = correctedText;
    }
  }
}

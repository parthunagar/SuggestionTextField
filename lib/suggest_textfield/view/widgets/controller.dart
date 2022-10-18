part of suggestion_textfield;

///
/// initialize with your custom regex patterns or Strings and styles
/// The [RichTextController] is used to display text that uses various different styles.
/// The displayed text is described using a tree of [TextSpan] objects,
/// each of which has its own associated style that is used for that subtree.
///
///
class CustomController extends TextEditingController {

  String? suggestText= "";
  CustomController({String? text,this.suggestText});

  bool isBack(String current, String last) {
    return current.length < last.length;
  }


  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    List<TextSpan> children = [];
    // debugPrint('text : $text');
    children.add(TextSpan(text: text, style: const TextStyle(color: Colors.black)));
    children.add(TextSpan(text: suggestText, style: TextStyle(color: Colors.grey[500])));
    // debugPrint('text : $text');
    return TextSpan(style: style, children: children);
  }
}
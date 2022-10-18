part of suggestion_textfield;

///
/// [RichTextWidget] defines the text on [DictionaryTextField]
/// also apply the style on particular text
/// example, if type A then suggest the Apple keyword on list.
/// then type character and suggestion character are match they knows as [title]. ex: A
/// And all character are knows as [hint]. ex: pple
/// also [title] applicable to [titleFontSize], [titleColor], [titleFontFamily].
/// and [hint] applicable to [hintFontSize], [hintColor], [hintFontFamily].
class RichTextWidget extends StatelessWidget {
  String? title, hint;
  double? titleFontSize, hintFontSize;
  Color? titleColor, hintColor;
  String? titleFontFamily, hintFontFamily;

  RichTextWidget({
    Key? key,
    required this.title,
    required this.titleFontSize,
    required this.titleColor,
    required this.titleFontFamily,
    required this.hint,
    required this.hintFontSize,
    required this.hintColor,
    required this.hintFontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title!,
            style: TextStyle(
              fontSize: titleFontSize,
              color: titleColor ?? Colors.black,
              fontFamily: titleFontFamily,
            ),
          ),
          TextSpan(
            text: hint,
            style: TextStyle(
              fontSize: hintFontSize,
              color: hintColor ?? Colors.grey[400],
              fontFamily: hintFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

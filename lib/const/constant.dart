part of suggestion_textfield;

class Const {

  ///
  /// All word binding for applications based on the this [Function].
  /// get the dictionary data using [DatabaseHelper] class.
  ///


  ///
  /// This [Function] work same as if and else [Function] and call return [type].
  /// it's check the [boolean] value if true the return [valid] otherwise [invalid].
  ///
  static Type ifelse<Type>(
      bool condition, {
        required Type valid,
        required Type invalid,
      }) {
    return condition ? valid : invalid;
  }


}
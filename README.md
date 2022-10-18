<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.
This package has all the features of a flutter text field, as well as word suggestions and a list of words that are connected to the character you are now typing.

## Features

- customize field
- customize and apply decoration suggestion list
- show list of word in suggestion list related to typing.
- show enable or disable list
- support multiple platform like Android,IOS,Windows,macOS,Linux,

## Getting started

You should ensure that you add the router as a dependency in your flutter project.

```yaml
dependencies:
 suggestion_textfield: ^0.0.1
```
You should then run `flutter packages upgrade` or update your packages in IntelliJ.

## Example Project and Usage

Include short and useful examples for package users.Add longer examples
to `/example` folder.

```dart
   ///
   ///
   /// 
    DictionaryTextField(
        onTap: () {
            print('onTap');
        },
        onChangeValue: (val) {
            print('onchangeValCustom : $onchangeValCustom');
        },
        maxElementsToDisplay: 50,
        showSuggestionList: true,
    ),
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.

## Author
This Suggestion Textfield plugin for Flutter is developed by [@parthunaagr](https://github.com/parthunagar). You can contact us at [parthunagar9@gmail.com](mailto:parthunagar9@gmail.com)

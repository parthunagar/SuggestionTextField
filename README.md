
## Description

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

## Author

This Suggestion Textfield plugin for Flutter is developed by [@parthunaagr](https://github.com/parthunagar) , [@partvasoya59](https://github.com/partvasoya59). 
You can contact us at [parthunagar9@gmail.com](mailto:parthunagar9@gmail.com), [parthvasoya1000@gmail.com](mailto:parthvasoya1000@gmail.com)

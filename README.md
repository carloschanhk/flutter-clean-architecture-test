# clean_architecture_test

This project is created to test how to implement better architecture in flutter.

MVVM can be implemented in flutter with the help of getX package: https://pub.dev/packages/get

- Using `GetXController` as `ViewModel` and bind it to the View's lifecycle with `Bindings`
- variable with `.obs` can be easily observed like `LiveData` in Android using `Obx` widget or `GetX`

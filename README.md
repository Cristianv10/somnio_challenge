# SOMNIO

This is a Flutter project that follows the principles of **Domain-Driven Design (DDD)** and has been specifically developed for Android. Below is key information about the project structure, necessary commands, versioning details, and helpful resources.

## Version Information

- **Flutter**: 3.22.3
- **Channel**: stable
- **Dart**: 3.4.4

This project uses the Flutter SDK version specified above. Ensure you have the same or compatible version installed to avoid any issues.

## Domain-Driven Design (DDD)

The DDD approach is utilized in this project to structure the code around the application's domain. Key features of this implementation include:

- **Domain Layer**: Contains business logic and entities that represent the domain model.
- **Application Layer**: Manages application logic and orchestrates interactions between different layers.
- **Infrastructure Layer**: Includes data persistence implementations and interactions with external services.

This separation allows the code to be more maintainable, scalable, and easier to understand, facilitating future modifications and improvements.

## Presentation Layer

The presentation layer is responsible for the user interface and user experience of the application. It includes:

- **Widgets**: Flutter widgets that represent the UI components.
- **State Management**: Manages the state of the application, often using patterns like BLoC (Business Logic Component).

By structuring the presentation layer effectively, the application becomes easier to test, maintain, and extend.

## Special Commands

To ensure that your project is set up correctly, it's important to run the following commands in order:

```bash
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

# My Flutter App

Welcome to My Flutter App! This guide will help you set up and run the application on your local machine.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting API Key](#getting-api-key)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before you begin, ensure you have met the following requirements:

1. **Flutter SDK**: Install the Flutter SDK from the [official Flutter website](https://flutter.dev/docs/get-started/install).
2. **Git**: Ensure you have Git installed. You can download it from [here](https://git-scm.com/downloads).
3. **IDE**: An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with Flutter and Dart plugins installed.

## Getting API Key

To run this app, you'll need an API key from Spoonacular. Follow these steps to get your API key:

1. **Sign up/Login**: Go to the [Spoonacular website](https://spoonacular.com/food-api/) and sign up for an account or log in if you already have one.

2. **Get API Key**: Once logged in, navigate to the API section and generate an API key. Make sure to note down this API key as you'll need it to authenticate requests in the app.

## Installation

Follow these steps to get the project up and running:

1. **Clone the repository**:

    ```sh
    git clone https://github.com/hamezksm/foodapp.git
    ```

2. **Navigate to the project directory**:

    ```sh
    cd foodapp
    ```

3. **Install dependencies**:

    ```sh
    flutter pub get
    ```

## Running the App

After installing the dependencies and obtaining the API key, follow these steps to run the app:

1. **Set API key**: Open the project in your favorite code editor and locate the file where the API key needs to be set. This could be in a configuration file or directly in the code.

2. **Connect a device**:
    - Connect a physical device via USB, or
    - Start an emulator (Android Emulator, iOS Simulator).

3. **Run the app**:

    ```sh
    flutter run
    ```

    This command will compile the app and install it on the connected device or emulator.

## Troubleshooting

Here are some common issues you might encounter and how to resolve them:

1. **Flutter command not found**:
    - Ensure that the Flutter SDK path is added to your system's PATH environment variable.

2. **Dependencies not found**:
    - Run `flutter pub get` to fetch all dependencies.

3. **Emulator issues**:
    - Make sure your emulator is properly set up and running. For Android, use the AVD Manager in Android Studio.

4. **Permission denied (publickey)**:
    - If you encounter this issue while cloning the repository, ensure your SSH keys are correctly configured with GitHub or use HTTPS to clone the repo:

      ```sh
      git clone https://github.com/hamezksm/foodapp.git
      ```

5. **Code signing issues (iOS)**:
    - For iOS, you may need to configure code signing in Xcode. Open the project in Xcode and navigate to the `Signing & Capabilities` tab.

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

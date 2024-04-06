import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/features/home/presentation/components/base_block.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class NoteScreen extends StatelessWidget {
  static const routeName = '/note';

  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Const.config.MAX_LANDSCAPE_WIDTH.toDouble(),
            ),
            child: BaseBlock(
              child: SelectionArea(
                child: Markdown(
                  styleSheet: context.markdownStyleSheet,
                  shrinkWrap: true,
                  data: '''
# The Easiest Way to Use Environments in Flutter [published]

## Introduction

Flutter is a popular choice for building mobile apps, and one key part of app development is managing different settings for various environments like development and production.

The **`dotenv`** library makes this easy in Flutter. It lets you handle important settings securely without hardcoding them into your app. This article will show you how easy it is to use **`dotenv`** to manage your app's settings, keeping your code clean and your data safe.

## Understanding Environment Variables

Before diving into the **`dotenv`** library, it's important to understand what environment variables are and their role in Flutter app development. Here's a simple explanation:

1. **What Are Environment Variables?**
Environment variables are key-value pairs used to store configuration data that can change between different environments. This data might include API keys, database URLs, or other sensitive information that you don't want to hardcode into your app's source code.
2. **Why Use Environment Variables in Flutter?**
Using environment variables in Flutter is crucial for several reasons:
    - **Security:** Keeps sensitive data like API keys out of your source code, reducing the risk of exposing them.
    - **Flexibility:** Allows you to change settings easily without modifying the code, especially useful when moving your app between development, testing, and production environments.
    - **Maintainability:** Makes your code cleaner and easier to maintain, as configuration changes can be made without code alterations.
3. **Common Use Cases:**
In Flutter apps, environment variables are often used for:
    - Storing API endpoints and keys.
    - Configuring app behaviour for different environments (development, staging, production).
    - Managing feature flags or toggle settings.

## Getting Started with *dotenv*

Setting up **`dotenv`** in your Flutter project is straightforward. Here's how to do it:

1. **Install the `dotenv` Package:**
First, add **`dotenv`** to your project. Open your **`pubspec.yaml`** file and add the following line under **`dependencies`**:
    
    ```yaml
    flutter_dotenv: ^5.1.0
    ```
    
    Then, run **`flutter pub get`** in your terminal to install the package.
    
2. Add the `.env` file to your assets bundle in `pubspec.yaml`. **Ensure that the path corresponds to the location of the .env file!**
    
    ```yaml
    assets:
      - .env
    ```
    
3. **Create Your `.env` File:**
Create a new file named **`.env`** in the root of your Flutter project. This is where you'll store your environment variables. For example:
    
    ```makefile
    API_KEY=your_api_key_here
    ```
    
4. **Configuring `.gitignore`:**
To keep your sensitive data safe, make sure your **`.env`** file is not tracked by version control. Add **`.env`** to your **`.gitignore`** file.
    
    ```jsx
    *.env
    ```
    
5. **Loading Environment Variables:**
At the start of your app, typically in the **`main.dart`** file, you need to load these variables. Import the **`dotenv`** package and use **`DotEnv().load()`** like this:
    
    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_dotenv/flutter_dotenv.dart';
    
    Future main() async {
      await dotenv.load(fileName: ".env");
      runApp(MyApp());
    }
    
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Env Example',
          home: MyHomePage(),
        );
      }
    }
    
    ```
    

## Using `dotenv` in a Flutter App

Now that you've set up the **`dotenv`** library in your Flutter project, let's see how to use it effectively. Here are the steps to access and utilize your environment variables:

1. **Accessing Environment Variables:**
After loading the variables using **`dotenv.load()`**, you can access them anywhere in your app. Use **`dotenv.env`** to get the values. For example, to access the API key, you would write:
    
    ```dart
    String apiKey = dotenv.env['API_KEY'] ?? 'default_value';
    ```
    
    This line retrieves the value of **`API_KEY`** from your **`.env`** file, or uses a default value if it's not set.
    
2. **Using Variables in Your App:**
You can use these variables in various parts of your app. For instance, you might use the API key in a service class to make network requests:
    
    ```dart
    class ApiService {
      final String apiKey;
    
      ApiService() : apiKey = dotenv.env['API_KEY'] ?? 'default_key';
    
      Future fetchData() {
        // Use apiKey in your network request
      }
    }
    ```
    
    This ensures that your sensitive data, like the API key, is not hard-coded into your app.
    
    For using Environment-Specific Files, you can create multiple **`.env`** files like **`.env.dev`**, **`.env.staging`**, and **`.env.prod`.** You can load the appropriate file based on the environment:
    
    ```dart
    Future main() async {
      await dotenv.load(fileName: Environment.getEnvFileName());
      runApp(MyApp());
    }
    
    class Environment {
      static String getEnvFileName() {
        // Logic to determine which .env file to load
      }
    }
    ```
    
3. **Best Practices:**
    - Always provide a default value when accessing environment variables to avoid null errors.
    - Keep your **`.env`** file simple and only store values that change between environments.
    - Do not store large amounts of data in the **`.env`** file; it is meant for configuration values.

This approach helps keep your configurations organized and easily switchable.

By following these steps, you can seamlessly integrate environment variables into your Flutter app using the **`dotenv`** library. This approach enhances the security and flexibility of your app, making it easier to manage different configurations for various environments.

## Alternatives to `dotenv`

While **`dotenv`** is an excellent tool for managing environment variables in Flutter, it's worth exploring other options available. This section highlights some alternatives and compares their features:

1. **Flutter Config:**
Flutter Config is another popular package for managing configuration data. It allows you to define variables in a **`.env`** file and access them in Dart code. It's similar to **`dotenv`** but may have differences in setup and usage.
2. **Manual Configuration:**
You can manually manage environment variables by creating a Dart file with different profiles for each environment. For example, you could have **`config_dev.dart`**, **`config_prod.dart`**, etc. This method gives you full control but requires more manual management.
3. **Secure Storage:**
For storing sensitive data like API keys, consider using packages like **`flutter_secure_storage`**, which stores data securely in the device's keychain or Keystore. This is more secure than plain text files but is typically used for runtime data rather than build-time configuration.
4. **Build-Time Environment Variables:**
You can also set environment variables at build time using Flutter build commands. This approach is useful for CI/CD pipelines but might be less flexible for local development.
5. **Custom Solutions:**
Depending on your project's complexity, you might opt for a custom solution that combines multiple methods. For instance, using **`dotenv`** for development and a secure storage solution for production.

Each of these alternatives has its pros and cons. When choosing the right approach, consider factors like ease of use, security requirements, and the nature of the data being stored. Ultimately, the best choice depends on the specific needs and context of your Flutter project.

## Conclusion

In this article, we've explored how the **`dotenv`** library simplifies managing environment variables in Flutter applications. From setting up and accessing variables to employing advanced techniques and considering alternatives, **`dotenv`** offers a streamlined and secure approach to handling app configurations. Whether you're dealing with API keys, different deployment environments, or sensitive data, **`dotenv`** enhances the flexibility and maintainability of your Flutter projects. 

Remember, the key to effective app development is not just in the code you write but also in how you manage your app's configuration and environment-specific settings. **`dotenv`** is a tool that makes this aspect of development easier, helping you focus more on creating great app features.
''',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

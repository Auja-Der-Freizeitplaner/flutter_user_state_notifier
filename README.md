# Flutter User State Notifier
This package provides functionality to display info, error and loading notifications.
It is designed to work from within the ui state management while avoid forwarding the `BuildContext`.

## Features

The package comes with the following feature set:

- Info Popup Handling
    - Custom Caption
    - Custom Description
    - Additional `onConfirm` custom functionality
- Error Popup Handling
    - Custom Caption
    - Custom Description
    - Additional `onConfirm` custom functionality
- Loading Popup Handling
    - Custom Caption
    - Custom Description
- Loading Full Screen Handling
    - Custom Caption
    - Custom Description

## Getting started

Open the `pubspec.yaml` and add the following snippet as `dependency`:
```yaml
dependency:
    flutter_user_state_notifier: ^1.0.0
```

## Usage

1. Add the `UserStateProvider` to the root of your WidgetTree
```dart
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

void main(){
    runApp(
        UserStateProvider(
            onGenerateGenericLoadingCaption: (context) => "Loading",
            onGenerateGenericLoadingDescription: (context) => "Please wait...",
            onGenerateGenericErrorCaption: (context) => "Error",
            onGenerateGenericErrorDescription: (context) => "Something went wrong",
            onGenerateGenericButtonLabel: (context) => "Okay",
            child:App(),
        ),
    );
}
```

2. Wrap each screen with the `UserStateListener`

```dart
Widget build(BuildContext context){
    return UserStateListener(
        child: Scaffold(
            //...
            ),
    );
}
```

3. Call user state service functions to update the state

```dart
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

Future<void> _onTap() async {
    final notifier = context.userStateService;
    notifier.setLoading();
    try{
        await someTask();
        notifier.reset();
    }catch(_){
        notifier.setError();
    }
}
```

## Additional information
### Custom Info/Error/Loading Reasons
#### Inherit from InfoReason

```dart
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class CustomInfo extends InfoReason{
    CustomInfo({super.onConfirm});

    @override
    String getCaption(BuildContext context){
        return "Info";
    }

    @override
    String getDescription(BuildContext context){
        return "This is an info message";
    }

    @override
    String getButtonLabel(BuildContext context){
        return "Okay";
    }
}
```

**API:**
- `String getCaption(BuildContext context)`:
Evaluates caption which is being used in the InfoPopup
- `String getDescription(BuildContext context)`:
Evaluates description which is being used in the InfoPopup
- _(optional)_ `String getButtonLabel(BuildContext context)`:
Evaluates button label which is being used in the InfoPopup
- _(optional)_ `VoidCallback? onConfirm`:
Overwrites "only pop" behavior
_Important: When being used you need to pop the dialog by yourself._

#### Inherit from ErrorReason

```dart
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class CustomError extends ErrorReason{
    CustomError({super.onConfirm});
    
    @override
    String getCaption(BuildContext context){
        return "Error";
    }

    @override
    String getDescription(BuildContext context){
        return "This is an error message";
    }

    @override
    String getButtonLabel(BuildContext context){
        return "Okay";
    }
}
```


**API:**
- _(optional)_ `String getCaption(BuildContext context)`:
Evaluates caption which is being used in the ErrorPopup
- _(optional)_ `String getDescription(BuildContext context)`:
Evaluates description which is being used in the ErrorPopup
- _(optional)_ `String getButtonLabel(BuildContext context)`:
Evaluates button label which is being used in the ErrorPopup
- _(optional)_ `VoidCallback? onConfirm`:
Overwrites "only pop" behavior
_Important: When being used you need to pop the dialog by yourself._


#### Inherit from LoadingReason

```dart
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class CustomLoading extends LoadingReason{
    @override
    bool get isFullScreen => false;

    @override
    String getCaption(BuildContext context){
        return "Loading";
    }

    @override
    String getDescription(BuildContext context){
        return "This is a loading message";
    }
}
```

**API:**
- `String getCaption(BuildContext context)`:
Evaluates caption which is being used in the LoadingPopup
- `String getDescription(BuildContext context)`:
Evaluates description which is being used in the LoadingPopup
- `bool get isFullScreen`:
Defines whether the loading ui component should be displayed as popup or full screen

### Parameterize Custom Reasons
After creating a custom reason you can easily extend the class with additional arguments and utilize them in the methods which generate the user messages.

**Eg. Failed to create user error**
```dart
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class FailedToCreateUserError extends ErrorReason{
    FailedToCreateUserError(this.userName, {super.onConfirm});
    
    final String userName;
    
    @override
    String getDescription(BuildContext context){
        return "Failed to create User $userName";
    }

    @override
    String getButtonLabel(BuildContext context){
        return "Retry";
    }
}
```

### Customize UI Components
The `UserStateProvider` widget provides different arguments to customize your user notification ui components.
If not provided, the User will get native material or cupertino popups providing the given information.

**API:**
-  _(optional)_ `Widget Function(LoadingReason reason)? onBuildLoadingScreen`:
Defines the full screen layout when the user state is set to loading
-  _(optional)_ `Widget Function(LoadingReason reason)? onBuildLoadingPopup`:
Defines the popup layout when the user state is set to loading
-  _(optional)_ `Widget Function(InfoReason reason, VoidCallback  onConfirm)? onBuildInfoPopup`:
Defines the popup layout which occurs when the user state is set to info
-  _(optional)_ `Widget Function(ErrorReason reason, VoidCallback onConfirm)? onBuildErrorPopup`:
Defines the popup layout which occurs when the user state is set to error

>**Hint:**
Use the `.new` Constructor method to provide more clean code.
Therefore you need to ensure that the constructor provides the same argument build up as the according function does.
See the Example below where a `CustomErrorPopup` builds up on the `onBuildErrorPopup` property

```dart
//eg. main.dart
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

void main(){
    runApp(
        UserStateProvider(
            // This works because onBuildErrorPopup has the same properties as CustomErrorPopup
            onBuildErrorPopup: CustomErrorPopup.new,
            // ...
            child: App(),
        ),
    );
}

//custom_error_popup.dart
import 'package:flutter/material.dart';
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

class CustomErrorPopup extends StatelessWidget{
    CustomErrorPopup(this.reason, this.onConfirm);
    
    final ErrorReason reason;
    final VoidCallback onConfirm; 
    //...
}
```

### Extend Reasons to provide Icons
If you decide your User Notification Interface should also provide a variety of icons. (Eg. User Created Success Info should provide another icon than User Deleted Success Info)
You could extend the Different Reason Classes (InfoReason, ErrorReason, LoadingReason) with your own custom interface.
Than you just need to provide the `onBuildErrorPopup`function in the `UserStateProvider` and either ensure only `CustomErrorReasons` will be used or have a fallback in your implementation if the error was a "Non `CustomErrorReasons`" (recommended!)

```dart
import 'package:flutter_user_state_notifier/flutter_user_state_notifier.dart';

abstract class CustomErrorReason extends ErrorReason{
    CustomErrorReason({super.onConfirm});

    String get imageAsset;
}

class LoginFailed extends CustomErrorReason{
    LoginFailed({super.onConfirm});

    @override
    String getCaption(BuildContext context){
        return "Oops";
    }

    @override
    String getDescription(BuildContext context){
        return "Please check your credentials and try again";
    }

    @override
    String getButtonLabel(BuildContext context){
        return "Okay";
    }

    @override
    String get imageAsset => "assets/lottie/login_failed.json";
}
```
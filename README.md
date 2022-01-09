<h1 align="center"> Valorant Guide </h1>

<p align="center">
  <a href="https://opensource.org/licenses/Apache-2.0"><img alt="License" src="https://img.shields.io/badge/License-Apache%202.0-blue.svg"/></a>
  <a href="https://twitter.com/flutterist"><img alt="API" src="https://img.shields.io/twitter/follow/flutterist?style=social"/></a>
</p>

<p align="center">
  Design
</p>

![Design](https://github.com/durannumit/valorant-guide/blob/main/screenshots/design.jpeg)
<p align="center">
  Design by: <a href="https://dribbble.com/shots/14073476-Valorant-Agents">Malik Abimanyu</a>
</p>

<p align="center">
  App
</p>

![App](https://github.com/durannumit/valorant-guide/blob/main/screenshots/app.png)


<p align="center">
Valorant Guide app is a small demo application to demonstrate Flutter application tech-stacks with a MobX and Provider. It's still under development and open for PR.
</p>

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Database](https://github.com/tekartik/sembast.dart)
* [MobX](https://github.com/mobxjs/mobx.dart) (to connect the reactive data of your application with the UI)
* [Provider](https://github.com/rrousselGit/provider) (State Management)
* [Encryption](https://github.com/xxtea/xxtea-dart)
* [Json Serialization](https://github.com/dart-lang/json_serializable)
* [Dependency Injection](https://github.com/fluttercommunity/get_it)
* [cached_network_image](https://pub.dev/packages/cached_network_image)

### Architecture
I used  [MobX and Provider Boilerplate Library](https://github.com/zubairehman/flutter-boilerplate-project). The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- constants/
|- data/
|- stores/
|- ui/
|- utils/
|- widgets/
|- main.dart
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `api endpoints`, `preferences` and `strings`.
2- data - Contains the data layer of your project, includes directories for local, network and shared pref/cache.
3- stores - Contains store(s) for state-management of your application, to connect the reactive data of your application with the UI. 
4- ui — Contains all the ui of your project, contains sub directory for each screen.
5- util — Contains the utilities/common functions of your application.
6- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
7- routes.dart — This file contains all the routes for your application.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- app_theme.dart
|- dimens.dart
|- endpoints.dart
|- preferences.dart
|- strings.dart
```

### Open API
Valorant Agents uses the [Valorant-api](https://dash.valorant-api.com/) for required data.
Valorant-api provides an extensive API containing data of most in-game items, assets and more!

### Tasks
- [ ] Make HomePage items background color dynamic

- [ ] Get more data from API and add more pages

- [ ] Localization

- [ ] Widget Testing

### License
```xml
Copyright 2022 by Umit Duran

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
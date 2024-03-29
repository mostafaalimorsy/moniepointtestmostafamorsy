# Mainpoint Task

### Table of contents

- [Application structure](#project-structure)
- [Figma design ](#figma-design)
- [APK ](#APK)

### Dripel design

https://dribbble.com/shots/23780608-Real-Estate-App

### APK

[https://dribbble.com/shots/23780608-Real-Estate-App](https://github.com/mostafaalimorsy/moniepointtestmostafamorsy/actions/runs/8476520379)

### Application structure

your application structure should look like this:

```
├── Android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── iOS                             - It contains files required to run the application on an iOS platform.
├── lib                             - The most important folder in the application, used to write most of the Dart code.
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── routes                  - It contains all routes
    │   ├── style                   - It contains the static style class file
    │   └── utils                   - It contains common files and utilities of the application
    │        └──widgets             - It contains all custom widget classes
    ├── Features                    - It contains widgets on the screens
    ├── Service                     - It contains all the helper classes of the application
    └── config
         └── app_export             - It contains commonly used file imports
```

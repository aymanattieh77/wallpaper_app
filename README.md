# wallpaper_app

Task Project

## Description
Wallpapers App 
 - Home Screen Contains Random Wallpapers To Explore.
 - Search Screen Search and Explore Wallpapers.
 - Favourite Screen Contains Favourite Wallpapers.
 - Wallpaper Detail Screen Contains selected Wallpapers filled Screen.
   
## Pexels API used for wallpapers data

## Features
  - Explore Random Wallpapers.
  - Add Wallpapers to your Favourites Group.
  - Search and explore Wallpapers.
  - Download wallpapers.



## Architecture and Code Organization

### Clean Architecture  With Provider State Management

#### Folder Structure

- App
     - Core (contains routes, service locator (DI) and functions).
     - App Theme.
     - Constants ( contains App colors and constants).
     - app (Material App).
- Data
    - Data Source (Remote, Local)
    - Erros (Failure and Exceptions).
    - Models and Mappers.
    - Network (contains dio factory and network info).
    - Repository Implementation.
- Domain
    - Entities.
    - Repository Interfaces.
    - Usecases
- Presentation
    - Screens (Contain All UI Screens and  Own Widgets).
    - Widgets.
    - Controllrs (Contain Providers).

## App Screens

![wallpaper_screens](https://github.com/aymanattieh77/wallpaper_app/assets/87063387/ad75fcb6-d6c2-4757-865d-251012b33810)


## Packages

 - provider: ^6.0.5
 - dio: ^5.3.2
 - sqflite: ^2.3.0
 - equatable: ^2.0.5
 - get_it: ^7.6.0
 - retrofit: ^4.0.1
 - dartz: ^0.10.1
 - internet_connection_checker: ^1.0.0+1
 - path: ^1.8.3
 - cached_network_image: ^3.2.3
 - fluttertoast: ^8.2.2
 - path_provider: ^2.1.0
 - flutter_phoenix: ^1.1.1

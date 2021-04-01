# Overview
Template to make a custom _MS Windows_ installer with uninstaller and start menu shortcuts for your own **OF_App**'s using **NSIS** from **Nullsoft**.

## Screenshots
* Installation Process:  

![image](/readme_images/Capture1.JPG?raw=true "image")
![image](/readme_images/Capture2.JPG?raw=true "image")
![image](/readme_images/Capture3.JPG?raw=true "image")
![image](/readme_images/Capture4.JPG?raw=true "image")

* Example Structure Files:  

![image](/readme_images/Capture_Example.JPG?raw=true "image")

## Usage
1. Download and install **NSIS**.
2. Clone this repo somewhere and copy it into your **OF_APP/bin/** project(s). 
3. Check that this folder contains:  
_the **OF_App.exe**, all the required OF **.dll**'s, and your **/data/** folder._
5. Look into **/resources/** folders to replace your images, start and finish banners, and icon as desired.
6. Customize and execute the **/resources/SCRIPT_Icon.bat** script to set the icon to your **.exe** file.
7. Customize the **OF_APP__01.nsi** script:  
_Set your app name!, enable or disable pages, image splashes, sound playing, license, data files to copy, finish page links...etc._
7. Double-click or run the **OF_APP__01.nsi** script with **NSIS**.
8. Your installer **OF_App_Setup.exe** will be created there, next to the **.nsi** script.

## Dependencies
* [NSIS](https://nsis.sourceforge.io/Main_Page)  

## Tested systems
- **Windows10** / **VS2017** / **OF ~0.11**

## Thanks
[@stubbulon5](https://forum.openframeworks.cc/t/deploying-and-creating-installers-for-windows-and-macos/36887/4)  
https://github.com/AnonymerNiklasistanonym/NsiWindowsInstallerExamples  

## Author
Template by **@moebiusSurfing**  
*(ManuMolina). 2021.*

## License
*MIT License.*

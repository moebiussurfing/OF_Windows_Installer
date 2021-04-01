# Overview
Make a custom _MS Windows_ installer with uninstaller and start menu shorcuts for your own **OF_App**'s using **NSIS** from **Nullsoft**.

## Screenshots
* Installation Process:  

![image](/readme_images/Capture1.JPG?raw=true "image")
![image](/readme_images/Capture2.JPG?raw=true "image")
![image](/readme_images/Capture3.JPG?raw=true "image")
![image](/readme_images/Capture4.JPG?raw=true "image")+

* Example Structure Files:  

![image](/readme_images/Capture_Example.JPG?raw=true "image")

## Usage
- Download and install **NSIS**.
- Clone this repo into somewhere and copy it into your **OF_APP/bin/** project(s). 
- The container folder must have the **OF_App.exe**, all the OF **.dll**'s, and your **/data/** folder.
- Look into **/resources/** folders to replace your images, start and finish banners, and icon as desired.
- Customize and execute the **/resources/SCRIPT_Icon.bat** script to set the icon to your exe.
- Customize the **OF_APP__01.nsi** script.
- Run the **OF_APP__01.nsi** script with **NSIS**.
- Your installer **OF_App_Setup.exe** will be created.

## Dependencies
* [NSIS](https://nsis.sourceforge.io/Main_Page)  

## Tested systems
- **Windows10** / **VS2017** / **OF ~0.11**

## Thanks
[@stubbulon5](https://forum.openframeworks.cc/t/deploying-and-creating-installers-for-windows-and-macos/36887/4)  
https://github.com/AnonymerNiklasistanonym/NsiWindowsInstallerExamples  

## Author
Addon by **@moebiusSurfing**  
*(ManuMolina). 2021.*

## License
*MIT License.*
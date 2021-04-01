# Overview
Template to make a custom _MS Windows_ installer with uninstaller and start menu shortcuts for your own **OF_App**'s using **NSIS** from **Nullsoft**.

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
- Clone this repo somewhere and copy it into your **OF_APP/bin/** project(s). 
- Check that this folder contains: the **OF_App.exe**, all the required OF **.dll**'s, and your **/data/** folder.
- Look into **/resources/** folders to replace your images, start and finish banners, and icon as desired.
- Customize and execute the **/resources/SCRIPT_Icon.bat** script to set the icon to your **.exe** file.
- Customize the **OF_APP__01.nsi** script: enable or disable pages, image splashes, sound playing, data files to copy...etc.
- Double-click or run the **OF_APP__01.nsi** script with **NSIS**.
- Your installer **OF_App_Setup.exe** will be created there, next to the **.nsi** script.

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
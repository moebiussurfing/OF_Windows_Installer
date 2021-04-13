# Overview
Template to make a custom _MS Windows_ installer with uninstaller and start menu shortcuts for your own **OF_App**'s using **NSIS** from **Nullsoft**.

## Screenshots
* Installation Process:  

![image](/docs/readme_images/Capture1.JPG?raw=true "image")
![image](/docs/readme_images/Capture2.JPG?raw=true "image")
![image](/docs/readme_images/Capture3.JPG?raw=true "image")
![image](/docs/readme_images/Capture4.JPG?raw=true "image")

## Usage
1. Download and install [**NSIS**](https://nsis.sourceforge.io/Main_Page) .
2. Clone this repo somewhere and copy the folder into your **OF_APP/bin/** project(s). 
3. Check that this folder contains:  
    * The (copied / renamed) **OF_App.exe**.
    * All the required OF **.dll**'s.
    * Your **/data/** folder.
5. Look into **OF_Windows_Installer/resources/** folders to replace your images, start and finish banners, and icon as desired.

7. Customize the **SCRIPT_OF_APP.nsi** script:  
   * Set your .exe app name, app title, and developer name. 
   * Enable or disable pages.
   * Slideshow intro with faded BMP images. Start / Finish image splashes.
   * Sound playing during splash intro.
   * Your license file.
   * Set data files to copy.
   * Finish page links.

7. Double click *SCRIPT_DEPLOY.bat*. This script has two steps:  
    * Set the icon to your **.exe** file. (Using **rcedit-x64.exe**)  
    * Run the **SCRIPT_OF_APP.nsi** script with **NSIS**.

8. Your installer **OF_App_Setup.exe** will be created there, next to the **.bat** / **.nsi** scripts.

## Example
   * (Optional) Run the pre-made installer **\OF_Windows_Installer\example\bin\SCRIPT\guiExample_Setup.exe**.
   * Delete **guiExample_Setup.exe** and deploy the installer by your self.
   * Double click **SCRIPT_DEPLOY.bat** using *Windows Explorer*:  
     **\OF_Windows_Installer\example\bin\SCRIPT\SCRIPT_DEPLOY.bat**
   * Run the generated **\OF_Windows_Installer\example\bin\SCRIPT\guiExample_Setup.exe** and install the app into your system.  
   * That's it!

## Dependencies
* Required to run the script: [NSIS](https://nsis.sourceforge.io/Main_Page)  
* Required to run an **OF_App** in other machines:  
[Microsoft Visual C++ Redistributable for Visual Studio 2015, 2017 and 2019](https://support.microsoft.com/en-us/topic/the-latest-supported-visual-c-downloads-2647da03-1eea-4433-9aff-95f26a218cc0)  
( Usually [x64: vc_redist.x64.exe](https://aka.ms/vs/16/release/vc_redist.x64.exe) )
 
## Tested systems
- **Windows10** / **VS2017** / **OF ~0.11**

## Thanks
[OF-Forum topic from @stubbulon5](https://forum.openframeworks.cc/t/deploying-and-creating-installers-for-windows-and-macos/36887/4)  
[NSIS Modern UI Scripts](https://github.com/AnonymerNiklasistanonym/NsiWindowsInstallerExamples)  

## Useful Links
[Modern UI README](https://nsis.sourceforge.io/Docs/Modern%20UI%202/Readme.html)  
[NSIS Wiki](https://en.wikipedia.org/wiki/Nullsoft_Scriptable_Install_System)  
[NSIS GitHub](https://github.com/kichik/nsis)  
[PNG to ICO Converter](https://icoconvert.com/)  
[Environtment constants](https://stackoverflow.com/questions/9087538/is-programfiles-a-constant-declared-in-nsis-or-is-it-the-environment-variable-r/44380394#44380394)  

## NOTE
* To hide the black console window of your **OF_App**, you can add this line to the file **main.cpp**, before and out of **main(){ }** function:  
```#pragma comment(linker, "/SUBSYSTEM:windows /ENTRY:mainCRTStartup")``` 

## Author
Template by **@moebiusSurfing**  
*(ManuMolina). 2021.*

## License
*MIT License.*

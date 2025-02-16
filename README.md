# Disclaimer
**Use the script with caution! I cannot guarantee that this script will work for you without breaking anything! Follow the steps provided below and go over the code to make sure it will not break anything for you!**

The script was not tested with a lot of browsers so far.

Browsers that **can be used**
* Chrome
* Brave

Browsers that **cannot be used**
* Edge

Feel free to reach out to help me expand this list. As development goes on, I might make it compatible for more browsers. 

# Description

## Background

This AutoHotKey script exists because of the wish to simplify and speed up the process of getting ready to develop a chrome extension. I felt the need to automate the process of opening the browser, it's extension page and finding a suitable page to test the extension on, together with the project directory opened in Visual Studio Code (VSCode) to make it easier to get ready to work.

## Features

These features are always executed in this exact order and can currently not be turned off without breaking the proper functionality of the script

* Closing all open windows
* Opening your browser of choice
  * Opening the extensions page
  * Opening a predefined website to test your extension on
* Opening VSCode with your project directory opened in it

# Installation

## Prerequisites

You need to have [AutoHotKey v2](https://www.autohotkey.com/) and I suggest getting the AHK compiler, which can be downloaded directly inside AutoHotKey, after installing it, by clicking on "Compile". This will allow you to create an executable (.exe) of the script.

## Steps

To use the script, follow these steps:

* Download the .ahk file
* Open the .ahk file in your editor of choice (e.g. VSCode)
* Change the following lines (located in lines 7-11) to fit your needs

``` autohotkey
browser := "chrome.exe" ; the browser you want to use (e.g. "chrome.exe", "brave.exe" etc.)
testingPage := "https://www.example.com" ; the website you want to open to test your extension on

pathToVSCode := "C:\Your\Path\To\VSCode\Code.exe" ; The full path to your VSCode installation
pathToProject := "C:\Your\Path\To\Project\Directory" ; The full path to your project directory (to open it in VSCode)
```
* Edit the following if-statement (located in lines 39-40) to fit your needs
  * **This step is extremely important to make sure no windows/applications are closed that may not be closed. Proceed with caution here!**

``` autohotkey
if (title != "Program Manager" && title != "Start" && title != "Settings" && title != "Taskbar" &&
 title != "" && title != "Desktop" && title != "Microsoft Store")
```

* Open the AutoHotKey Dash
* Click "Compile"
* For "Source (script file)", click on "Browse" and choose the changed .ahk file
* For "Destination (.exe file)", choose the directory where you want the .exe file to be stored and give it a name
* Click "Convert"

After following these steps, you will have turned the .ahk file into an executable. Whenever you execute it now, a small dialog will appear. After clicking "OK" inside it, the script will be executed and you will be ready to develop your chrome extension.

# Final words

This script is a very simple and rudimentary implementation. It was a nice opportunity for me to get started with AutoHotKey, which I never used before. 

This script has a very specific use and so far it is only intended for my personal use but I thought that some people might find this fitting for their needs. If that is the case, I will continue to develop this small script beyond my personal needs to make it suit other people better as well. But the main purpose of it will always stay small: Prepare development of a Chrome extension. I doubt it will go beyond that but feel free to open Issues or contact me when the script I provide is just not entirely filling your needs. Thank you very much!

; ################################################################################
; I CANNOT GUARANTEE THAT THIS SCRIPT WILL WORK FOR YOU WITHOUT BREAKING ANYTHING!
; USE WITH CAUTION!
; ################################################################################

; Define *YOUR* important variables
browser := "chrome.exe" ; the browser you want to use (e.g. "chrome.exe", "brave.exe" etc.)
testingPage := "https://www.example.com" ; the website you want to open to test your extension on

pathToVSCode := "C:\Your\Path\To\VSCode\Code.exe" ; The full path to your VSCode installation
pathToProject := "C:\Your\Path\To\Project\Directory" ; The full path to your project directory (to open it in VSCode)

; If the paths contain spaces, they will be enclosed in quotation marks to not throw an error
if (InStr(pathToVSCode, ' ')) {
    pathToVSCode := '"' pathToVSCode '"'
}
if (InStr(pathToProject, ' ')) {
    pathToProject := '"' pathToProject '"'
}

; Close all open windows/folders except critical systems
; You can comment this out if you don't want to close all windows, but the script does not properly work then as of now
openWindows := WinGetList() ; List of all open windows

result := MsgBox("Close all windows except the ones you want to keep open!`n`nSAVE ANY OPEN WORK FIRST TO NOT LOSE IT!", ,
    "OKCancel")
if (result == "Cancel") {
    ExitApp
}

for windowId in openWindows {
    if WinExist(windowId) {
        title := Trim(WinGetTitle(windowId))
        ; Only close the windows that are not critical for the system / you want to keep open by defining them in the if-statement
        ; #####################################################################################################################
        ; THIS LIST MIGHT BE INCOMPLETE AND YOU MIGHT WANT TO ADD MORE CRITICAL SYSTEMS. I CANNOT GUARANTEE THAT THIS SCRIPT WILL WORK FOR YOU WITHOUT BREAKING ANYTHING!
        ; USE WITH CAUTION!
        ; #####################################################################################################################
        if (title != "Program Manager" && title != "Start" && title != "Settings" && title != "Taskbar" && title !=
            "" && title != "Desktop" && title != "Microsoft Store") {
            WinKill windowId
        }
    }
}

; Open browser
Run browser

; Wait until the browser window is open
if (WinWait(, , 5)) {
    Sleep 1000 ; required to make the next commands work
    ; [Alt+F, E, Enter, Enter] to open extensions-window in browser
    Send '!f+e+{Enter 2}'

    ; Open the testing page
    Run browser ' ' testingPage
    WinMaximize('A')

    ; Open Visual Studio Code with the specified project directory
    Run pathToVSCode ' ' pathToProject

    ; Wait until the VSCode window is open
    if (WinWait(, , 5)) {
        Sleep 1000 ; required to make the next command work
        WinMaximize('A')
    } else {
        MsgBox "VSCode failed to load in time"
    }
} else {
    MsgBox "Browser failed to load in time"
}

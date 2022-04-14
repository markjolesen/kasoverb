; CC0 1.0 Universal --- Public Domain
;
; To the extent possible under law, Dante University Foundation and
; Contributors has waived all copyright and related or neighboring
; rights to this file (kasoberb64.iss). This work is published from:
; United States.
;
; Full text of this license can be found in '${KASOVERB_HOME}/licenses/CC-CC0'
; or visit 'https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt' or
; send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
; ---------------------------------------------------------------------------

; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "KasoVerb"
#define MyAppVersion "2022.04.13"
#define MyAppURL "http://kasoverb.org"
#define MyAppExeName "kv3.exe"
#define MyAppTopDir "..\.."

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3122AD5A-A588-4737-A1AD-F689B1A27AA7}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile={#MyAppTopDir}\package\copying
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=C:\TEMP
OutputBaseFilename={#MyAppName}_{#MyAppVersion}_Winx64_Setup
SetupIconFile=kasoverb.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#MyAppTopDir}\build\kv3\build\src\app\kv3.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\build\src\tools\kv3tocsv\kv3tocsv.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\build\src\tools\csvtokv3\csvtokv3.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\eng.inf"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\eng.ita"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\eng.kv3"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\eng.spa"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\ita.eng"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\ita.inf"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\ita.kv3"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\ita.spa"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\spa.eng"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\spa.inf"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\spa.ita"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppTopDir}\build\kv3\database\spa.kv3"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

; Professional Inno Setup Script for Riyan Revit Tools
[Setup]
AppName=Riyan Revit Tools
AppVersion=1.0.1
AppPublisher=Udarie & Chalana
DefaultDirName={userappdata}\pyRevit\Extensions\Riyan.extension
DefaultGroupName=Riyan Revit Tools
UninstallDisplayIcon={app}\Riyan.tab\About.panel\About.pushbutton\icon.png
Compression=lzma2
SolidCompression=yes
OutputDir=..
OutputBaseFilename=RiyanSetup_v1.0.1
SetupIconFile=Riyan.tab\About.panel\About.pushbutton\icon.png
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=lowest

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Copy all extension files except the installer itself and git metadata
Source: "../*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs; \
    Excludes: ".git\*,.gitignore,.gemini\*,Installer\*,*.md"

[Icons]
Name: "{group}\Uninstall Riyan Revit Tools"; Filename: "{uninstallexe}"

[Run]
; Optional: Reload pyRevit if the CLI is in the path
Filename: "pyrevit"; Parameters: "reload"; Flags: runhidden nowait skipifsilent; StatusMsg: "Reloading pyRevit..."

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;
  // Ensure the extension directory is clean before installing
  if DirExists(ExpandConstant('{app}')) then
  begin
    DelTree(ExpandConstant('{app}'), True, True, True);
  end;
end;

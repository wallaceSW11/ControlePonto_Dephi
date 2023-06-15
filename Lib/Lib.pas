unit Lib;

interface

uses
  winapi.windows;

function SistemaOperacionalWindowsSete(): Boolean;

implementation

function SistemaOperacionalWindowsSete(): Boolean;
var
  VersionInfo: TOSVersionInfo;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);

  Result := ((VersionInfo.dwMajorVersion = 6) and (VersionInfo.dwMinorVersion = 1));
end;

end.

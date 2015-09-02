program librestaff;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, FormMain, FuncData, Classes, DataModule, DefaultTranslator,
  datetimectrls, FormPreferences, FrameClose, FormSearch;

{$R *.res}

begin
  Application.Title:='LibreStaff';
  RequireDerivedFormResource:= True;
  Application.Initialize;
  Application.CreateForm(TDataMod, DataMod);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.


program FluxFloppyManager;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainForm, AboutDialog, OptionsDialog, OperationsDialog, CommonConsts;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Flux Floppy Manager';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmAbout, FrmAbout);
  Application.CreateForm(TFrmOptions, FrmOptions);
  Application.CreateForm(TFrmOperations, FrmOperations);
  Application.Run;
end.


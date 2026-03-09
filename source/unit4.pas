{
-------------------------------------------------------------------
Flux Floppy Editor
v5.xx
-------------------------------------------------------------------
A Microsoft(r) Windows(r) and Linux GUI for Greseaweazle Host Tools
FREEWARE / OpenSource
License: GNU General Public License v2.0

(c) 2026 NistuneDev
Web: https://github.com/nistunedev/FluxFloppyEditor
This is a fork based on "FluxMyFluffyFloppy"

(c) 2021-2026 FrankieTheFluff
Web: https://github.com/FrankieTheFluff/FluxMyFluffyFloppy
Mail: fluxmyfluffyfloppy@mail.de
-------------------------------------------------------------------
Uses code from the following projects:
UnTerminal 1.0 by Tito Hinostroza 02/10/2020
https://github.com/t-edson/UnTerminal
-------------------------------------------------------------------
}
unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ExtCtrls, LConvEncoding, UnTerminal, TermVT, CommonConsts;

type

  { TfrmGW }

  TfrmGW = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    pnSides: TPanel;
    Panel2: TPanel;
    StrGrid_s0: TStringGrid;
    StrGrid_s1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure procAddLine(HeightScr: integer);
    procedure procInitScreen(const grilla: TtsGrid; fIni, fFin: integer);
    procedure procRefreshLine(const grilla: TtsGrid; fIni, HeightScr: integer);
    procedure procRefreshLines(const grilla: TtsGrid; fIni, fFin,HeightScr: integer);
    procedure StrGrid_Fill(aLine : String);
    procedure SplitCommandLine(const CmdLine: string; out ExecPath, Params: string);
  private

  public

  end;

var
  frmGW: TfrmGW;
  proc: TConsoleProc;
implementation
uses
  unit1;

{$R *.lfm}

{ TfrmGW }

procedure TfrmGW.Button1Click(Sender: TObject);
begin
  frmGW.Close;
end;

procedure TfrmGW.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
 proc.Close;
 proc.Destroy;
end;

// Resolve issues with larger DPI screen
procedure TfrmGW.FormCreate(Sender: TObject);
begin
{$IFDEF WINDOWS}
{$ELSE}
//  DisableAutoSizing;
//  PixelsPerInch := 96;
//  EnableAutoSizing;
{$ENDIF}
end;

procedure TfrmGW.FormShow(Sender: TObject);
var
  ExecPath, Params: string;
begin
  if INI.ReadBool('FluxMyFluffyFloppy', 'CodepageCMD', false) then
    aLine := ConvertEncoding(aLine, 'utf8', GetConsoleTextEncoding);

  proc := TConsoleProc.Create(nil);
  proc.OnInitScreen    := @procInitScreen;
  proc.OnRefreshLine   := @procRefreshLine;
  proc.OnRefreshLines  := @procRefreshLines;
  proc.OnAddLine       := @procAddLine;

  Memo1.Lines.Clear;
  StrGrid_s0.Clean;
  StrGrid_s1.Clean;

  {$IFDEF WINDOWS}
    // Windows keeps original behavior
    proc.Open('CMD', '');
    proc.SendLn(aLine);
  {$ELSE}
    // Linux: split exec + params correctly
    SplitCommandLine(aLine, ExecPath, Params);
    proc.Open(ExecPath, Params);
  {$ENDIF}
end;



procedure TfrmGW.SplitCommandLine(const CmdLine: string; out ExecPath, Params: string);
var
  s: string;
  p: Integer;
begin
  s := Trim(CmdLine);

  if (s <> '') and (s[1] = '"') then
  begin
    // quoted executable
    p := Pos('"', s, 2);
    if p = 0 then
      raise Exception.Create('Malformed command line');

    ExecPath := Copy(s, 2, p - 2);        // strip quotes ONLY here
    Params   := Trim(Copy(s, p + 1, MaxInt)); // params untouched
  end
  else
  begin
    // unquoted executable
    p := Pos(' ', s);
    if p > 0 then
    begin
      ExecPath := Copy(s, 1, p - 1);
      Params   := Trim(Copy(s, p + 1, MaxInt));
    end
    else
    begin
      ExecPath := s;
      Params   := '';
    end;
  end;
end;


procedure TfrmGW.procAddLine(HeightScr: integer);
begin
  Memo1.Lines.Add('');
end;

procedure TfrmGW.procInitScreen(const grilla: TtsGrid; fIni, fFin: integer);
var
  i: Integer;
begin
  for i:=fIni to fFin do Memo1.Lines.Add(grilla[i]);
end;

procedure TfrmGW.procRefreshLine(const grilla: TtsGrid; fIni, HeightScr: integer);
var
  yvt: Integer;
begin
  yvt := Memo1.Lines.Count-HeightScr-1;
  Memo1.Lines[yvt+fIni] := grilla[fIni];
  StrGrid_Fill(grilla[fIni]);
end;

procedure TfrmGW.procRefreshLines(const grilla: TtsGrid; fIni, fFin,
  HeightScr: integer);
var
  yvt: Integer;
  f: Integer;
begin
  yvt := Memo1.Lines.Count-HeightScr-1;  //Calculate equivalent row to start of VT100 screen
  for f:=fIni to fFin do
   begin
     Memo1.Lines[yvt+ f] := grilla[f];
     StrGrid_Fill(grilla[f]);
   end;
end;

procedure TfrmGW.StrGrid_Fill(aLine : String);
Var
 track, side, prob, x : Integer;
 s : String;
begin
 track := 0;
 side := -1;
 prob := 0;
 s := '-';

 if frmGW.Caption = 'Greaseweazle - Read' then
  begin
   pnSides.Visible:=true;
   s := 'R';
   x := pos('.',aLine);               //(bspw.   „T1.0“ x = 3)
   if Copy(aLine,1,1) = 'T' then
    begin
     x := pos('.',aLine);             //(bspw.   „T1.0“ x = 3)
     case x of
     3:
        begin
          track := StrToInt(Copy(aLine,2,1));
          side := StrToInt(Copy(aLine,4,1));
          prob := Pos('Giving up',aLine);
        end;
     4:
        begin
          track := StrToInt(Copy(aLine,2,2));
          side := StrToInt(Copy(aLine,5,1));
          prob := Pos('Giving up',aLine);
        end;
     else
       exit;
     end;
   end;
  end;  // Read

 if frmGW.Caption = 'Greaseweazle - Write' then
  begin
   pnSides.Visible:=true;
   s := 'W';
   x := pos('.',aLine);
   if Copy(aLine,1,1) = 'T' then
    begin
     x := pos('.',aLine);
     case x of
     3:
        begin
          track := StrToInt(Copy(aLine,2,1));
          side := StrToInt(Copy(aLine,4,1));
          prob := Pos('Giving up',aLine);
        end;
     4:
        begin
          track := StrToInt(Copy(aLine,2,2));
          side := StrToInt(Copy(aLine,5,1));
          prob := Pos('Giving up',aLine);
        end;
     else
       exit;
     end;
   end;
  end;  // Write

 for x := 0 to 8 do
  begin
   StrGrid_s0.cells[0, x+1] := IntToStr(x);
   StrGrid_s1.cells[0, x+1] := IntToStr(x);
  end;

 if prob <> 0 then s := '-';     // flux "giving up..."
 if side = 0 then
    begin
      if (track >= 0) and (track < 10) then StrGrid_s0.cells[track+1, 1] := s;
      if (track >= 10) and (track < 20) then StrGrid_s0.cells[track-9, 2] := s;
      if (track >= 20) and (track < 30) then StrGrid_s0.cells[track-19, 3] := s;
      if (track >= 30) and (track < 40) then StrGrid_s0.cells[track-29, 4] := s;
      if (track >= 40) and (track < 50) then StrGrid_s0.cells[track-39, 5] := s;
      if (track >= 50) and (track < 60) then StrGrid_s0.cells[track-49, 6] := s;
      if (track >= 60) and (track < 70) then StrGrid_s0.cells[track-59, 7] := s;
      if (track >= 70) and (track < 80) then StrGrid_s0.cells[track-69, 8] := s;
      if (track >= 80) and (track < 90) then StrGrid_s0.cells[track-79, 9] := s;
    end;
 if side = 1 then
    begin
      if (track >= 0) and (track < 10) then StrGrid_s1.cells[track+1, 1] := s;
      if (track >= 10) and (track < 20) then StrGrid_s1.cells[track-9, 2] := s;
      if (track >= 20) and (track < 30) then StrGrid_s1.cells[track-19, 3] := s;
      if (track >= 30) and (track < 40) then StrGrid_s1.cells[track-29, 4] := s;
      if (track >= 40) and (track < 50) then StrGrid_s1.cells[track-39, 5] := s;
      if (track >= 50) and (track < 60) then StrGrid_s1.cells[track-49, 6] := s;
      if (track >= 60) and (track < 70) then StrGrid_s1.cells[track-59, 7] := s;
      if (track >= 70) and (track < 80) then StrGrid_s1.cells[track-69, 8] := s;
      if (track >= 80) and (track < 90) then StrGrid_s1.cells[track-79, 9] := s;
    end;
end;

end.


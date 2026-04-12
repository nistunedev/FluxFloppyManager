{
-------------------------------------------------------------------
Flux Floppy Manager
v5.xx
-------------------------------------------------------------------
A Microsoft(r) Windows(r) and Linux GUI for Greseaweazle Host Tools
FREEWARE / OpenSource
License: GNU General Public License v2.0

(c) 2026 NistuneDev
Web: https://github.com/nistunedev/FluxFloppyManager
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
unit AboutDialog;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, LCLIntf, CommonConsts;

type

  { TFrmAbout }

  TFrmAbout = class(TForm)
    btOK: TButton;
    GroupBox1: TGroupBox;
    Img: TImage;
    Label2: TLabel;
    lblGW: TLabel;
    lblAbout: TLabel;
    lblAboutCopy: TLabel;
    lblAboutCopy1: TLabel;
    lblAboutEmail: TLabel;
    lblAboutGithub: TLabel;
    lblAboutLicense: TLabel;
    lblAboutUnTerminal: TLabel;
    lblAboutURLGW: TLabel;
    lblAboutVer: TLabel;
    lblContains: TLabel;
    lblDisclaimer1: TLabel;
    lblDisclaimer2: TLabel;
    lblDivider1: TLabel;
    lblDivider2: TLabel;
    lblDivider3: TLabel;
    lblDownload: TLabel;
    lblEmail: TLabel;
    lblLicense: TLabel;
    lblUnTerminal: TLabel;
    procedure btOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblAboutEmailClick(Sender: TObject);
    procedure lblAboutGithubClick(Sender: TObject);
    procedure lblAboutLicenseClick(Sender: TObject);
    procedure lblAboutUnTerminalClick(Sender: TObject);
    procedure lblAboutURLGWClick(Sender: TObject);
  private

  public

  end;

var
  FrmAbout: TFrmAbout;

implementation
uses
  MainForm;

{$R *.lfm}

{ TFrmAbout }

procedure TFrmAbout.lblAboutEmailClick(Sender: TObject);
begin
 OpenURL('mailto:nistunedev@gmail.com?subject=Flo&body=');
end;

procedure TFrmAbout.btOKClick(Sender: TObject);
begin
  close;
end;


procedure TFrmAbout.FormShow(Sender: TObject);
begin
   lblAboutVer.Caption :=  sAppVersion + ' - ' + sAppDate;
   lblGW.Caption := AboutGW;
end;

procedure TFrmAbout.lblAboutGithubClick(Sender: TObject);
begin
  OpenURL('https://github.com/nistundev/FluxFloppyManager');
end;

procedure TFrmAbout.lblAboutLicenseClick(Sender: TObject);
begin
  OpenURL('https://www.gnu.org/licenses/old-licenses/gpl-2.0.html');
end;

procedure TFrmAbout.lblAboutUnTerminalClick(Sender: TObject);
begin
  OpenURL('https://github.com/t-edson/UnTerminal');
end;

procedure TFrmAbout.lblAboutURLGWClick(Sender: TObject);
begin
  OpenURL('https://github.com/keirf/Greaseweazle');
end;

end.


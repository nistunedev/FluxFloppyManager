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
unit OptionsDialog;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, EditBtn, CommonConsts;

type

  { TFrmOptions }

  TFrmOptions = class(TForm)
    Cancel: TButton;
    cbSaveGWDevCom: TCheckBox;
    cbSaveGWDrive: TCheckBox;
    cbCodepageCMD: TCheckBox;
    edHXCFile: TFileNameEdit;
    edSamdiskFile: TFileNameEdit;
    folderTemplates: TDirectoryEdit;
    fileDiskdefs: TDirectoryEdit;
    gbLocations: TGroupBox;
    gbStart: TGroupBox;
    GroupBox1: TGroupBox;
    lblHXC: TLabel;
    lblDiskdefs: TLabel;
    lblSamdisk: TLabel;
    lblTemplates: TLabel;
    OK: TButton;
    procedure CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKClick(Sender: TObject);
  private

  public

  end;

var
  FrmOptions: TFrmOptions;

implementation
uses
  MainForm;

{$R *.lfm}

{ TFrmOptions }

procedure TFrmOptions.CancelClick(Sender: TObject);
begin
  close;
end;

procedure TFrmOptions.FormShow(Sender: TObject);
begin
 cbSaveGWDevCom.Checked := INI.ReadBool(FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, false);
 cbSaveGWDrive.Checked := INI.ReadBool(FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, false);
 cbCodepageCMD.Checked := INI.ReadBool(FLUX_INI_NAME, INI_CODE_PAGE_CMD, true);
 fileDiskdefs.Text := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_DISKDEFS, '');
 folderTemplates.Directory := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
 edSamdiskFile.Text := INI.ReadString(FLUX_INI_NAME, SAMDISK_APP_NAME, '');
 edHXCFile.Text := INI.ReadString(FLUX_INI_NAME, HXC_APP_NAME, '');
end;

procedure TFrmOptions.OKClick(Sender: TObject);
begin
 INI.WriteBool(FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, cbSaveGWDevCom.Checked);
 INI.WriteBool(FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, cbSaveGWDrive.Checked);
 INI.WriteBool(FLUX_INI_NAME, INI_CODE_PAGE_CMD, cbCodepageCMD.Checked);
 INI.WriteString(FLUX_INI_NAME, INI_FOLDER_DISKDEFS, fileDiskdefs.Text);
 INI.WriteString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, folderTemplates.Directory);
 INI.WriteString(FLUX_INI_NAME, SAMDISK_APP_NAME, edSamdiskFile.Text);
 INI.WriteString(FLUX_INI_NAME, HXC_APP_NAME, edHXCFile.Text);
 INI.UpdateFile;
 if fileDiskdefs.Text <> '' then
  begin
   FrmMain.Refresh_Diskdefs_DropDown;
  end;
 FrmMain.Refresh_Templates_Read_DropDown;
 FrmMain.Refresh_Templates_Write_DropDown;
 FrmMain.btReadTplNew.Click;
 FrmMain.btWriteTplNew.Click;
 FrmMain.CMD_Generate;
 close;
end;

end.


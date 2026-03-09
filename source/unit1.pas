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
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  ComCtrls, DBGrids, StdCtrls, DBCtrls, Menus, EditBtn, Spin, ExtCtrls,
  IniFiles, Process, FileUtil, LazFileUtils, CommonConsts
{$IFDEF WINDOWS}
  , Registry, LCLIntf
{$ENDIF};

type

  { TForm1 }

  TForm1 = class(TForm)
    btConvClear: TButton;
    btConvExplorer: TButton;
    btGo: TButton;
    btGWBandwidth: TButton;
    btGWCMDDir: TButton;
    btGWInfo: TButton;
    btGWRefreshUSB: TButton;
    btGWReset: TButton;
    btReadDestExplore: TButton;
    btReadDiskReset: TButton;
    btReadTplDel: TButton;
    btReadTplNew: TButton;
    btReadTplSave: TButton;
    btSetDelaysDefault: TButton;
    btSetDelaysInfo: TButton;
    BtWriteTplDel: TButton;
    BtWriteTplNew: TButton;
    BtWriteTplSave: TButton;
    cbConvAdjustSpeed: TComboBox;
    cbConvDigits: TSpinEdit;
    cbConvDisk1: TSpinEdit;
    cbConvDisk2: TSpinEdit;
    cbConvDiskdefs: TComboBox;
    cbConvFileFormat: TComboBox;
    cbConvFormat: TComboBox;
    cbConvFormatOption: TComboBox;
    cbConvFormatOptionHFEEnc: TComboBox;
    cbConvFormatOptionHFEInt: TComboBox;
    cbConvFormatOptionHFEVer: TComboBox;
    cbConvIncrement: TCheckBox;
    cbConvIndexMarks: TComboBox;
    cbConvNoOverwrite: TCheckBox;
    cbConvOutTracksetCyls: TComboBox;
    cbConvOutTracksetFlippy: TComboBox;
    cbConvOutTracksetHeads: TComboBox;
    cbConvOutTracksetHSwap: TCheckBox;
    cbConvOutTracksetSteps: TComboBox;
    cbConvPLL: TComboBox;
    cbConvTplFlippyReverse: TCheckBox;
    cbConvTracksetCyls: TComboBox;
    cbConvTracksetFlippy: TComboBox;
    cbConvTracksetHeads: TComboBox;
    cbConvTracksetHSwap: TCheckBox;
    cbConvTracksetSteps: TComboBox;
    cbGWDevCOM: TComboBox;
    cbGWDrive: TComboBox;
    cbGWHW: TComboBox;
    cbReadFormat: TComboBox;
    cbReadFormatOption: TComboBox;
    cbReadFormatOptionHFEEnc: TComboBox;
    cbReadFormatOptionHFEInt: TComboBox;
    cbReadFormatOptionHFEVer: TComboBox;
    cbReadIncremental: TCheckBox;
    cbReadNoOverwrite: TCheckBox;
    cbReadPreview: TEdit;
    cbReadTplAdjustSpeed: TComboBox;
    cbReadTplCyls: TComboBox;
    cbReadTplDD: TComboBox;
    cbReadTplFakeIndex: TComboBox;
    cbReadTplFlippy: TComboBox;
    cbReadTplFlippyReverse: TCheckBox;
    cbReadTplFormat: TComboBox;
    cbReadTplFormatSrc: TComboBox;
    cbReadTplHardSec: TCheckBox;
    cbReadTplHeads: TComboBox;
    cbReadTplHSwap: TCheckBox;
    cbReadTplLogBoth: TCheckBox;
    cbReadTplLogOutput: TCheckBox;
    cbReadTplLogParam: TCheckBox;
    cbReadTplName: TComboBox;
    cbReadTplPLL: TComboBox;
    cbReadTplRaw: TCheckBox;
    cbReadTplRetries: TComboBox;
    cbReadTplRevs: TComboBox;
    cbReadTplSeekRetries: TComboBox;
    cbReadTplSteps: TComboBox;
    cbSetDelayAutoOff: TSpinEdit;
    cbSetDelayIndexMask: TSpinEdit;
    cbSetDelayMotor: TSpinEdit;
    cbSetDelayPostWrite: TSpinEdit;
    cbSetDelayPreWrite: TSpinEdit;
    cbSetDelaySelect: TSpinEdit;
    cbSetDelaySettle: TSpinEdit;
    cbSetDelayStep: TSpinEdit;
    cbSetFirmwareBootloader: TCheckBox;
    cbSetGlobalActionsBacktrace: TCheckBox;
    cbSetGlobalActionsTime: TCheckBox;
    cbSetPINLevel: TComboBox;
    cbSetPINNumber: TSpinEdit;
    cbSrcAsDesDir: TCheckBox;
    cbSrcAsDesFile: TCheckBox;
    cbToolsCleanCyl: TSpinEdit;
    cbToolsCleanLinger: TComboBox;
    cbToolsCleanPasses: TComboBox;
    cbToolsEraseCyl: TComboBox;
    cbToolsEraseFakeIndex: TComboBox;
    cbToolsEraseFlippy: TComboBox;
    cbToolsEraseHeads: TComboBox;
    cbToolsEraseHSwap: TCheckBox;
    cbToolsEraseRevs: TComboBox;
    cbToolsEraseSteps: TComboBox;
    cbToolsRPMNumbIter: TSpinEdit;
    cbToolsSeekMotorOn: TCheckBox;
    cbToolsSeekTrack: TSpinEdit;
    cbToolsSeekTrackForce: TCheckBox;
    cbWriteTplCyls: TComboBox;
    cbWriteTplDensel: TComboBox;
    cbWriteTplEraseEmpty: TCheckBox;
    cbWriteTplFakeIndex: TComboBox;
    cbWriteTplFlippy: TComboBox;
    cbWriteTplFlippyReverse: TCheckBox;
    cbWriteTplFormat: TComboBox;
    cbWriteTplFormatSrc: TComboBox;
    cbWriteTplHardSec: TCheckBox;
    cbWriteTplHeads: TComboBox;
    cbWriteTplHSwap: TCheckBox;
    cbWriteTplName: TComboBox;
    cbWriteTplNoVerify: TCheckBox;
    cbWriteTplPrecomp: TComboBox;
    cbWriteTplPreErase: TCheckBox;
    cbWriteTplRetries: TComboBox;
    cbWriteTplSteps: TComboBox;
    cbWriteTplTplTP43Pin2: TCheckBox;
    edConvDirDest: TDirectoryEdit;
    edConvDiskOf: TEdit;
    edConvFilename: TEdit;
    edConvFilenamePreview: TEdit;
    edConvFileSource: TFileNameEdit;
    EdGWCmd: TMemo;
    EdGWFile: TFileNameEdit;
    edReadDigits: TSpinEdit;
    edReadDirDest: TDirectoryEdit;
    edReadDisk1: TSpinEdit;
    edReadDisk2: TSpinEdit;
    edReadDiskOf: TEdit;
    EdReadFilename: TEdit;
    edReadTplDesc: TEdit;
    edToolsFW: TFileNameEdit;
    edToolsFWTag: TEdit;
    edWriteFileName: TFileNameEdit;
    edWriteTplDesc: TEdit;
    gbCmd: TGroupBox;
    gbConvArg: TGroupBox;
    gbConvDest: TGroupBox;
    gbConvSrc: TGroupBox;
    gbReadArg: TGroupBox;
    gbReadDest: TGroupBox;
    gbReadTpl: TGroupBox;
    gbWriteArg: TGroupBox;
    gbWriteTpl: TGroupBox;
    grbToolsOptions: TGroupBox;
    grpFW: TGroupBox;
    grpGW: TGroupBox;
    grpPIN: TGroupBox;
    grpSetDelays: TGroupBox;
    grpToolsClean: TGroupBox;
    grpToolsErase: TGroupBox;
    grpToolsRPM: TGroupBox;
    grpToolsSeek: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblConvDestFormatExtEnc: TLabel;
    lblConvDestFormatExtInt: TLabel;
    lblConvDestFormatExtVer: TLabel;
    lblConvertAdjustSpeed: TLabel;
    lblConvertDestfile: TLabel;
    lblConvertFormat: TLabel;
    lblConvertOutTrackset: TLabel;
    lblConvertPLL: TLabel;
    lblConvertSourcefile: TLabel;
    lblConvertTrackset: TLabel;
    lblConvIndexMarks: TLabel;
    lblConvOutTracksetCyls: TLabel;
    lblConvOutTracksetFlippy: TLabel;
    lblConvOutTracksetHeads: TLabel;
    lblConvOutTracksetHSwap: TLabel;
    lblConvOutTracksetSteps: TLabel;
    lblConvTplFlippyReverse: TLabel;
    lblConvTracksetCyls: TLabel;
    lblConvTracksetFlippy: TLabel;
    lblConvTracksetHeads: TLabel;
    lblConvTracksetHSwap: TLabel;
    lblConvTracksetSteps: TLabel;
    lblGW: TLabel;
    lblGWDevice: TLabel;
    lblGWDrive: TLabel;
    lblGWHW: TLabel;
    lblReadDestDigits: TLabel;
    lblReadDestDir: TLabel;
    lblReadDestDiskNr: TLabel;
    lblReadDestFile: TLabel;
    lblReadDestFormatExt: TLabel;
    lblReadDestFormatExtOpt: TLabel;
    lblReadDestFormatExtOpt1: TLabel;
    lblReadDestFormatExtOpt2: TLabel;
    lblReadDestFormatExtOpt3: TLabel;
    lblReadDestPreview: TLabel;
    lblReadTplAdjustSpeed: TLabel;
    lblReadDescr: TLabel;
    lblReadTpl: TLabel;
    lblReadTplCyls: TLabel;
    lblReadTplDD: TLabel;
    lblReadTplFakeIndex: TLabel;
    lblReadTplFlippy: TLabel;
    lblReadTplFlippyReverse: TLabel;
    lblReadTplFormat: TLabel;
    lblReadTplHardSec: TLabel;
    lblReadTplHeads: TLabel;
    lblReadTplHSwap: TLabel;
    lblReadTplPLL: TLabel;
    lblReadTplRaw: TLabel;
    lblReadTplRetries: TLabel;
    lblReadTplRevs: TLabel;
    lblReadTplSeekRetries: TLabel;
    lblReadTplSteps: TLabel;
    lblSetDelayAutoOff: TLabel;
    lblSetDelayIndexMask: TLabel;
    lblSetDelayMotor: TLabel;
    lblSetDelayPostWrite: TLabel;
    lblSetDelayPreWrite: TLabel;
    lblSetDelaySelect: TLabel;
    lblSetDelaySettle: TLabel;
    lblSetDelayStep: TLabel;
    lblSetFirmwareHint: TLabel;
    lblSetPINNumber: TLabel;
    lblToolsCleanCyl: TLabel;
    lblToolsCleanLinger: TLabel;
    lblToolsCleanPasses: TLabel;
    lblToolsEraseCyl: TLabel;
    lblToolsEraseFakeIndex: TLabel;
    lblToolsEraseFlippy: TLabel;
    lblToolsEraseHeads: TLabel;
    lblToolsEraseHFreq: TCheckBox;
    lblToolsEraseHSwap: TLabel;
    lblToolsEraseRevs: TLabel;
    lblToolsEraseSteps: TLabel;
    lblToolsRPMNumbIter: TLabel;
    lblToolsSeek: TLabel;
    lblWriteDescription: TLabel;
    lblWriteFile: TLabel;
    lblWriteTemplate: TLabel;
    lblWriteTplCyls: TLabel;
    lblWriteTplDD: TLabel;
    lblWriteTplEraseEmpty: TLabel;
    lblWriteTplFakeIndex: TLabel;
    lblWriteTplFlippy: TLabel;
    lblWriteTplFlippyReverse: TLabel;
    lblWriteTplFormat: TLabel;
    lblWriteTplHardSec: TLabel;
    lblWriteTplHeads: TLabel;
    lblWriteTplHSwap: TLabel;
    lblWriteTplNoVerify: TLabel;
    lblWriteTplPrecomp: TLabel;
    lblWriteTplPreErase: TLabel;
    lblWriteTplRetries: TLabel;
    lblWriteTplSteps: TLabel;
    lblWriteTplTP43Pin2: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    mnuFile: TMenuItem;
    mnuView: TMenuItem;
    mnuOptions: TMenuItem;
    mnuHelp: TMenuItem;
    mnuClose: TMenuItem;
    mnuAbout: TMenuItem;
    mnuGitHub: TMenuItem;
    mnuArguments: TMenuItem;
    mnuFMFF: TMenuItem;
    mnuGWDownload: TMenuItem;
    mnuWebsite: TMenuItem;
    mnuGWGettingStarted: TMenuItem;
    opSetFWFile: TRadioButton;
    opSetFWOnline: TRadioButton;
    opSetFWTag: TRadioButton;
    Panel1: TPanel;
    pnConvSource: TPanel;
    pnConvFormatSpec: TPanel;
    pnReadDest: TPanel;
    pnReadFormatSpec: TPanel;
    pnTplRead: TPanel;
    Panel3: TPanel;
    pcActions: TPageControl;
    pnConvAllArg: TPanel;
    pnGW: TPanel;
    pnMain: TPanel;
    pnReadAllArg: TPanel;
    pnToolsFWSelect: TPanel;
    pnWriteAllArg: TPanel;
    pnWriteFormSpec: TPanel;
    pnWriteSourceFile: TPanel;
    pnWriteTpl: TPanel;
    rbGetPIN: TRadioButton;
    rbSetDelays: TCheckBox;
    rbSetFirmware: TCheckBox;
    rbSetGetPIN: TCheckBox;
    rbSetPIN: TRadioButton;
    rbToolsClean: TCheckBox;
    rbToolsErase: TCheckBox;
    rbToolsRPM: TCheckBox;
    rbToolsSeek: TCheckBox;
    sbConv: TScrollBox;
    sbRead: TScrollBox;
    sbWrite: TScrollBox;
    Separator1: TMenuItem;
    pnCmd: TPanel;
    tbConv: TTabSheet;
    tbRead: TTabSheet;
    tbSettings: TTabSheet;
    tbTools: TTabSheet;
    tbWrite: TTabSheet;
    procedure btConvClearClick(Sender: TObject);
    procedure btConvExplorerClick(Sender: TObject);
    procedure btGoClick(Sender: TObject);
    procedure btGWBandwidthClick(Sender: TObject);
    procedure btGWCMDDirClick(Sender: TObject);
    procedure btGWInfoClick(Sender: TObject);
    procedure btGWResetClick(Sender: TObject);
    procedure btReadDestExploreClick(Sender: TObject);
    procedure btReadDiskResetClick(Sender: TObject);
    procedure btReadTplDelClick(Sender: TObject);
    procedure btReadTplNewClick(Sender: TObject);
    procedure btReadTplSaveClick(Sender: TObject);
    procedure btSetDelaysDefaultClick(Sender: TObject);
    procedure btSetDelaysInfoClick(Sender: TObject);
    procedure BtWriteTplDelClick(Sender: TObject);
    procedure BtWriteTplNewClick(Sender: TObject);
    procedure BtWriteTplSaveClick(Sender: TObject);
    procedure btGWRefreshUSBClick(Sender: TObject);
    procedure cbConvTplFlippyReverseClick(Sender: TObject);
    procedure cbConvAdjustSpeedChange(Sender: TObject);
    procedure cbConvDigitsChange(Sender: TObject);
    procedure cbConvDisk1Change(Sender: TObject);
    procedure cbConvDisk2Change(Sender: TObject);
    procedure cbConvDiskdefsChange(Sender: TObject);
    procedure cbConvFormatOptionChange(Sender: TObject);
    procedure cbConvIndexMarksChange(Sender: TObject);
    procedure cbGWHWChange(Sender: TObject);
    procedure cbReadTplDDChange(Sender: TObject);
    procedure cbReadTplFlippyReverseClick(Sender: TObject);
    procedure cbReadTplHardSecClick(Sender: TObject);
    procedure cbReadTplSeekRetries1Change(Sender: TObject);
    procedure cbSetDelayAutoOffChange(Sender: TObject);
    procedure cbSetDelayIndexMaskChange(Sender: TObject);
    procedure cbSetDelayMotorChange(Sender: TObject);
    procedure cbSetDelayPostWriteChange(Sender: TObject);
    procedure cbSetDelayPreWriteChange(Sender: TObject);
    procedure cbSetDelaySelectChange(Sender: TObject);
    procedure cbSetDelaySettleChange(Sender: TObject);
    procedure cbSetDelayStepChange(Sender: TObject);
    procedure cbSetFirmwareBootloaderClick(Sender: TObject);
    procedure cbSetPINLevelChange(Sender: TObject);
    procedure cbSetPINNumberChange(Sender: TObject);
    procedure cbSrcAsDesDirChange(Sender: TObject);
    procedure cbSrcAsDesFileChange(Sender: TObject);
    procedure cbToolsCleanCylChange(Sender: TObject);
    procedure cbToolsCleanLingerChange(Sender: TObject);
    procedure cbToolsCleanPassesChange(Sender: TObject);
    procedure cbToolsCleanPassesEnter(Sender: TObject);
    procedure cbToolsEraseCylChange(Sender: TObject);
    procedure cbToolsEraseFakeIndexChange(Sender: TObject);
    procedure cbToolsEraseFlippyChange(Sender: TObject);
    procedure cbToolsEraseHeadsChange(Sender: TObject);
    procedure cbToolsEraseHSwapClick(Sender: TObject);
    procedure cbToolsEraseRevsChange(Sender: TObject);
    procedure cbToolsEraseStepsChange(Sender: TObject);
    procedure cbToolsRPMNumbIterChange(Sender: TObject);
    procedure cbToolsRPMNumbIterEnter(Sender: TObject);
    procedure cbToolsSeekMotorOnClick(Sender: TObject);
    procedure cbToolsSeekTrackChange(Sender: TObject);
    procedure cbToolsSeekTrackEnter(Sender: TObject);
    procedure cbToolsSeekTrackForceClick(Sender: TObject);
    procedure cbWriteTplDenselChange(Sender: TObject);
    procedure cbWriteTplFlippyReverseClick(Sender: TObject);
    procedure cbWriteTplHardSecChange(Sender: TObject);
    procedure cbWriteTplPreEraseChange(Sender: TObject);
    procedure cbWriteTplTplTP43Pin2Change(Sender: TObject);
    procedure edConvDiskOfChange(Sender: TObject);
    procedure cbConvFileFormatChange(Sender: TObject);
    procedure cbConvFormatChange(Sender: TObject);
    procedure cbConvIncrementClick(Sender: TObject);
    procedure cbConvNoOverwriteClick(Sender: TObject);
    procedure cbConvOutTracksetCylsChange(Sender: TObject);
    procedure cbConvOutTracksetFlippyChange(Sender: TObject);
    procedure cbConvOutTracksetHeadsChange(Sender: TObject);
    procedure cbConvOutTracksetHSwapClick(Sender: TObject);
    procedure cbConvOutTracksetStepsChange(Sender: TObject);
    procedure cbConvPLLChange(Sender: TObject);
    procedure cbConvTracksetCylsChange(Sender: TObject);
    procedure cbConvTracksetFlippyChange(Sender: TObject);
    procedure cbConvTracksetHeadsChange(Sender: TObject);
    procedure cbConvTracksetHSwapClick(Sender: TObject);
    procedure cbConvTracksetStepsChange(Sender: TObject);
    procedure cbGWDevCOMChange(Sender: TObject);
    procedure cbGWDriveChange(Sender: TObject);
    procedure cbReadNoOverwriteClick(Sender: TObject);
    procedure cbReadPreviewChange(Sender: TObject);
    procedure cbReadTplAdjustSpeedChange(Sender: TObject);
    procedure cbReadTplCylsChange(Sender: TObject);
    procedure cbReadTplFakeIndexChange(Sender: TObject);
    procedure cbReadTplFlippyChange(Sender: TObject);
    procedure cbReadTplFormatChange(Sender: TObject);
    procedure cbReadTplFormatSrcChange(Sender: TObject);
    procedure cbReadTplHeadsChange(Sender: TObject);
    procedure cbReadTplHSwapChange(Sender: TObject);
    procedure cbReadTplNameChange(Sender: TObject);
    procedure cbReadTplNameSelect(Sender: TObject);
    procedure cbReadTplPLLChange(Sender: TObject);
    procedure cbReadTplRawClick(Sender: TObject);
    procedure cbReadTplRetriesChange(Sender: TObject);
    procedure cbReadTplRevsChange(Sender: TObject);
    procedure cbReadTplSeekRetriesChange(Sender: TObject);
    procedure cbReadTplStepsChange(Sender: TObject);
    procedure cbReadTplLogParamClick(Sender: TObject);
    procedure cbReadTplLogOutputClick(Sender: TObject);
    procedure cbSetGlobalActionsBacktraceChange(Sender: TObject);
    procedure cbSetGlobalActionsTimeChange(Sender: TObject);
    procedure cbWriteTplCylsChange(Sender: TObject);
    procedure cbWriteTplEraseEmptyChange(Sender: TObject);
    procedure cbWriteTplFakeIndexChange(Sender: TObject);
    procedure cbWriteTplFlippyChange(Sender: TObject);
    procedure cbWriteTplFormatChange(Sender: TObject);
    procedure cbWriteTplFormatSrcChange(Sender: TObject);
    procedure cbWriteTplHeadsChange(Sender: TObject);
    procedure cbWriteTplHSwapChange(Sender: TObject);
    procedure cbWriteTplNameChange(Sender: TObject);
    procedure cbWriteTplNameSelect(Sender: TObject);
    procedure cbWriteTplNoVerifyChange(Sender: TObject);
    procedure cbWriteTplPrecompChange(Sender: TObject);
    procedure cbWriteTplRetriesChange(Sender: TObject);
    procedure cbWriteTplStepsChange(Sender: TObject);
    procedure edConvDirDestChange(Sender: TObject);
    procedure edConvFilenameChange(Sender: TObject);
    procedure edConvFileSourceAcceptFileName(Sender: TObject; var Value: String);
    procedure edConvFileSourceChange(Sender: TObject);
    procedure EdGWFileChange(Sender: TObject);
    procedure edReadDigitsChange(Sender: TObject);
    procedure edReadDirDestChange(Sender: TObject);
    procedure edReadDisk1Change(Sender: TObject);
    procedure edReadDisk2Change(Sender: TObject);
    procedure edReadDiskOfChange(Sender: TObject);
    procedure cbReadFormatOptionChange(Sender: TObject);
    procedure EdReadFilenameChange(Sender: TObject);
    procedure cbReadFormatChange(Sender: TObject);
    procedure edToolsFWChange(Sender: TObject);
    procedure edToolsFWTagChange(Sender: TObject);
    procedure edWriteFileNameAcceptFileName(Sender: TObject; var Value: String);
    procedure edWriteFileNameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Create_Filename;
    procedure CMD_Generate;
{$IFDEF WINDOWS}
    procedure Get_DeviceCOM;
{$ELSE}
    procedure Get_DeviceCOMLinux;
{$ENDIF}
    procedure Get_FormatSpecs_Read;
    procedure Get_FormatSpecs_Write;
    procedure Get_FormatSpecs_Conv;
    procedure lblToolsEraseHFreqClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuHelpClick(Sender: TObject);
    procedure mnuOptionsClick(Sender: TObject);
    procedure mnuArgumentsClick(Sender: TObject);
    procedure mnuFMFFClick(Sender: TObject);
    procedure mnuGWDownloadClick(Sender: TObject);
    procedure mnuGWGettingStartedClick(Sender: TObject);
    procedure mnuWebsiteClick(Sender: TObject);
    procedure mnuCloseClick(Sender: TObject);
    procedure opSetFWFileClick(Sender: TObject);
    procedure opSetFWOnlineClick(Sender: TObject);
    procedure opSetFWTagClick(Sender: TObject);
    procedure pcActionsChange(Sender: TObject);
    procedure rbGetPINClick(Sender: TObject);
    procedure rbSetDelaysClick(Sender: TObject);
    procedure rbSetFirmwareClick(Sender: TObject);
    procedure rbSetGetPINClick(Sender: TObject);
    procedure rbSetPINClick(Sender: TObject);
    procedure rbToolsCleanClick(Sender: TObject);
    procedure rbToolsEraseClick(Sender: TObject);
    procedure rbToolsRPMClick(Sender: TObject);
    procedure rbToolsSeekClick(Sender: TObject);
    procedure Refresh_Diskdefs_DropDown;
    procedure Refresh_Templates_Read_DropDown;
    procedure Refresh_Templates_Read;
    procedure Refresh_ReadFormSpec;
    procedure Refresh_Templates_Write_DropDown;
    procedure Refresh_Templates_Write;
    procedure Refresh_WriteFormSpec;
    procedure Set_View;

    procedure performModalCmdAction(const command: string);

    procedure performCmdAction(const cmd: string;
                               const param: string;
                               const specifyDevice: boolean;
                               const specifyDrive: boolean);

//    procedure LaunchURL(const URL: string);
  private
    FInClick: Boolean;
  public

  end;

procedure CmdDir(AGW: string; AParam: string);
function DirCheck(const dir:string; add_if_length_is_zero:boolean=false):string;
function ExtractFileName_WithoutExt(const AFilename: string): string;
function Trackset(aCommand: string;aCyl: string; aHeads: string; aSteps: string; aHSwap: boolean; aFlippy: string):string;
function SelectFile(title, defaultDir, Filter: String): String;

var
  Form1: TForm1;
  INI: TIniFile;
  FormatSpecs_Read, FormatSpecs_ReadDiskDefs: TStringList;
  FormatSpecs_Write, FormatSpecs_WriteDiskDefs: TStringList;
  FormatSpecs_Conv, FormatSpecs_ConvDiskDefs: TStringList;
  FormatDest_Ext : TStringList;
  sAppName, sAppPath, sAppVersion, sAppDate, AboutGW, sAppVersion_ReadTmpl, sAppVersion_WriteTmpl : String;
  dd : String; // Diskdefs.cfg
  aLine : String; // GreaseWeazle (frmGW)

implementation
uses
 unit2, unit3, unit4;

{$R *.lfm}

{ TForm1 }

function DirCheck(const dir:string; add_if_length_is_zero:boolean=false): String;
  begin

    if length(dir)=0 then begin
      if add_if_length_is_zero then
        result:=PATH_SPECIFIER
      else
        result:='';
      exit;
    end;
    if dir[length(dir)]=PATH_SPECIFIER then
      result:=dir
    else
      result:=dir+PATH_SPECIFIER;
  end;

function ExtractFileName_WithoutExt(const AFilename: string): string;
const
  AllowDirectorySeparators: set of char = ['\', '/'];
var
  p: integer;
begin
  Result := AFilename;
  p := length(Result);
  while (p > 0) do
  begin
    case Result[p] of
      PathDelim: exit;
       {$ifdef windows}
      '/': if ('/' in AllowDirectorySeparators) then
          exit;
       {$endif}
      '.': exit(copy(Result, 1, p - 1));
    end;
    Dec(p);
  end;
end;

function Trackset(aCommand: string; aCyl: string; aHeads: string; aSteps: string; aHSwap: boolean; aFlippy: string):string;
var
  cmd : string;
begin
  cmd := '';
  cmd := cmd + aCommand;
  cmd := cmd + 'c=' + aCyl;
  if aHeads <> '' then
    cmd := cmd + ':h=' + aHeads;
  if aSteps <> '' then
    cmd := cmd + ':step=' + aSteps;
  if aHSwap = true then
    cmd := cmd + ':hswap';
  if aFlippy <> '' then
    cmd := cmd + ':' + aFlippy;
  result := cmd;
end;

function SelectFile(title, defaultDir, Filter: String): String;
var openDialog: TOpenDialog;
begin
  openDialog:=TOpenDialog.create(form1);
  openDialog.title:=title;
  openDialog.initialDir:=defaultDir;
  openDialog.Filter:=Filter;
  if (openDialog.Execute) then
    Result:=openDialog.filename
  else
    Result:='';
  openDialog.Free;
end;

{$IFNDEF WINDOWS}
procedure TForm1.Get_DeviceCOMLinux;
var
  SearchRec: TSearchRec;
begin
  cbGWDevCOM.Items.Clear;

  // Look for common USB/serial devices
  if FindFirst('/dev/ttyUSB*', faAnyFile, SearchRec) = 0 then
  begin
    repeat
      cbGWDevCOM.Items.Add('/dev/' + SearchRec.Name);
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;

  // Also include ACM devices (Arduino, some adapters)
  if FindFirst('/dev/ttyACM*', faAnyFile, SearchRec) = 0 then
  begin
    repeat
      cbGWDevCOM.Items.Add('/dev/' + SearchRec.Name);
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;

  // Clear selection
  cbGWDevCOM.Text := '';
  cbGWDrive.Text := '';
end;
{$ENDIF}

{$IFDEF WINDOWS}
procedure TForm1.Get_DeviceCOM;
var
  reg: TRegistry;
  r: integer;

begin
  Reg := TRegistry.Create;
  cbGWDevCOM.Items.Clear;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
    begin
      Reg.GetValueNames(cbGWDevCOM.Items);
      for r := 0 to cbGWDevCOM.Items.Count - 1 do
       cbGWDevCOM.Items[r] := Reg.ReadString(cbGWDevCOM.Items[r]);
    end;
    cbGWDevCOM.Text := '';
    cbGWDrive.Text := '';
  finally
   Reg.Free;
  end;
end;
{$ENDIF}

procedure TForm1.FormShow(Sender: TObject);
var
  gw :string;
begin
  sAppName := APP_NAME;
  sAppVersion := APP_VERSION;
  sAppDate := APP_DATE;
  sAppVersion_ReadTmpl := 'v4.00';
  sAppVersion_WriteTmpl := 'v4.00';
  AboutGW := 'Requires "Greaseweazle v1.22+" (and optional "' + GW_DISKDEF_FOLDER + '_.cfg")';
  Form1.Caption := sAppName + sAppVersion;

  sAppPath := Dircheck(ExtractFilePath(ParamStr(0)));
  if DirectoryExists(sAppPath + GW_DISKDEF_FOLDER) = false then CreateDir(sAppPath + GW_DISKDEF_FOLDER);
  if DirectoryExists(sAppPath + GW_TEMPLATE_FOLDER) = false then CreateDir(sAppPath + GW_TEMPLATE_FOLDER);
  if DirectoryExists(sAppPath + GW_APP_FILE) = false then CreateDir(sAppPath + GW_APP_FILE);

  // No INI
  if FileExists(sAppPath + GW_INI_FILE) = False then
    try
     INI := TINIFile.Create(sAppPath + GW_INI_FILE);
     INI.WriteString(FLUX_INI_NAME, INI_VERSION, sAppVersion);
     INI.WriteInteger(FLUX_INI_NAME, INI_VERSION_INI, INI_VERSION_DEFAULT);
     INI.WriteInteger(FLUX_INI_NAME, INI_HEIGHT, INITIAL_HEIGHT);
     INI.WriteInteger(FLUX_INI_NAME, INI_WIDTH, INITIAL_WIDTH);
     INI.WriteBool(FLUX_INI_NAME, INI_SHOWARG, true);
     INI.WriteString(FLUX_INI_NAME, INI_GW, '');
     INI.WriteBool(FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, true);
     INI.WriteString(FLUX_INI_NAME, INI_SAVE_DEVICE, '');
     INI.WriteBool(FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, true);
     INI.WriteString(FLUX_INI_NAME, INI_SAVE_DRIVE, '');
     INI.WriteBool(FLUX_INI_NAME, INI_CODE_PAGE_CMD, true);
     INI.WriteString(FLUX_INI_NAME, INI_FOLDER_DISKDEFS, sAppPath + GW_DISKDEF_FOLDER + PATH_SPECIFIER);
     INI.WriteString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, sAppPath + GW_TEMPLATE_FOLDER + PATH_SPECIFIER);
     INI.WriteString(FLUX_INI_NAME, INI_FOLDER_READ_DEST, AppendPathDelim(GetUserDir + GW_DOCUMENTS_FOLDER));
     INI.WriteString(FLUX_INI_NAME, INI_FOLDER_WRITE_SRC, AppendPathDelim(GetUserDir + GW_DOCUMENTS_FOLDER));
     INI.WriteString(FLUX_INI_NAME, INI_FOLDER_CONVERT_SRC, sAppPath);
     INI.WriteString(FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST, sAppPath);
     INI.WriteBool(FLUX_INI_NAME, INI_TIME, cbSetGlobalActionsTime.Checked);
     INI.WriteBool(FLUX_INI_NAME, INI_BACKTRACE, cbSetGlobalActionsBacktrace.Checked);
    finally
     ; // end if
    end;


  INI := TINIFile.Create(sAppPath + GW_INI_FILE);
  If INI.ReadInteger(FLUX_INI_NAME, INI_VERSION_INI, 00) < INI_VERSION_DEFAULT then
   begin
    INI.WriteInteger(FLUX_INI_NAME, INI_VERSION_INI, INI_VERSION_DEFAULT);
    INI.WriteBool(FLUX_INI_NAME, INI_CODE_PAGE_CMD, true);
   end;
  If INI.ReadString(FLUX_INI_NAME, INI_FOLDER_DISKDEFS,'') = '' then
    begin
     INI.WriteString(FLUX_INI_NAME, INI_FOLDER_DISKDEFS, sAppPath + GW_DISKDEF_FOLDER + PATH_SPECIFIER);
    end;
  EdGWFile.Text := INI.ReadString(FLUX_INI_NAME, GW_APP_NAME,'');
  mnuArguments.Checked := INI.ReadBool(FLUX_INI_NAME, INI_SHOWARG, true);
  edReadDirDest.Directory := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_READ_DEST,'');
  edWriteFilename.InitialDir := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_WRITE_SRC,'');
  edConvFileSource.InitialDir := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_CONVERT_SRC,'');
  edConvDirDest.Directory := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');

  // Form size height/width
  Form1.Height := INI.ReadInteger(FLUX_INI_NAME, INI_HEIGHT, INITIAL_HEIGHT);
  Form1.Width := INI.ReadInteger(FLUX_INI_NAME, INI_WIDTH, INITIAL_WIDTH);
  Set_View;
  // Center
  Form1.Top:=(( Screen.Height-Height)div 2);
  Form1.Left:=((Screen.Width-Width)div 2);

  // Where is gw.exe ?
  gw := INI.ReadString(FLUX_INI_NAME, GW_APP_NAME, '');
  If gw <> '' then
    begin
     if FileExists(gw) = true then
      begin
       edGWfile.Text := gw;
      end;
     if FileExists(gw) = False then
      begin
       edGWfile.Text := Selectfile('Select Greaseweazle (' + GW_APP + ')',sAppPath, GW_EXECUTABLE);
       if edGWfile.Text <> '' then
        begin
         INI.WriteString(FLUX_INI_NAME, GW_APP_NAME, edGWfile.Text);
        end;
      end;
    end;
  If gw = '' then
    begin
     if FileExists(sAppPath + GW_APP) = true then
      begin
       edGWfile.Text := sAppPath + GW_APP;
       INI.WriteString(FLUX_INI_NAME, GW_APP_NAME, sAppPath + GW_EXECUTABLE);
      end;
     if FileExists(sAppPath + GW_EXECUTABLE) = False then
      begin
       edGWfile.Text := Selectfile('Select Greaseweazle (' + GW_APP + ')',sAppPath, GW_EXECUTABLE);
       if edGWfile.Text <> '' then
        begin
         INI.WriteString(FLUX_INI_NAME, GW_APP_NAME, edGWfile.Text);
        end;
      end;
    end;

  // Get possible Greaseweazle Device/COM ports

{$IFDEF WINDOWS}
    Get_DeviceCOM;
{$ELSE}
    Get_DeviceCOMLinux;
  {$ENDIF}

  If INI.ReadBool(FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, false) = true then
   begin
    cbGWDevCOM.Text := INI.ReadString(FLUX_INI_NAME, INI_SAVE_DEVICE, '');
   end;
  If INI.ReadBool(FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, false) = true then
   begin
    cbGWDrive.Text := INI.ReadString(FLUX_INI_NAME, INI_SAVE_DRIVE, '');
   end;
  cbGWHW.Text := INI.ReadString(FLUX_INI_NAME, INI_ACTIONS_GW_HW, INI_GW);

  // Where are diskdefs_.cfg located?
  Refresh_Diskdefs_DropDown;

  // Create StringLists Read/Conv Destination fileextension
  // TODO: Read these from a configuration file
  FormatDest_Ext := TStringList.Create;
  FormatDest_Ext.Add('');
  FormatDest_Ext.Add('A2R (Applesauce)');
  FormatDest_Ext.Add('ADF (AmigaDOS)');
  FormatDest_Ext.Add('ADS (Acorn)');
  FormatDest_Ext.Add('ADM (Acorn)');
  FormatDest_Ext.Add('ADL (Acorn)');
  FormatDest_Ext.Add('CTR (CT Raw)');
  FormatDest_Ext.Add('D1M (CMD FD2000 DD)');
  FormatDest_Ext.Add('D2M (CMD FD2000 HD)');
  FormatDest_Ext.Add('D4M (CMD FD4000 ED)');
  FormatDest_Ext.Add('D64 (Commodore 1541)');
  FormatDest_Ext.Add('D71 (Commodore 1571)');
  FormatDest_Ext.Add('D81 (Commodore 1581)');
  FormatDest_Ext.Add('D88 (D88)');
  FormatDest_Ext.Add('DCP (DCP)');
  FormatDest_Ext.Add('DIM (DIM)');
  FormatDest_Ext.Add('DMK (TRS80 Tandy Dragon MSX)');
  FormatDest_Ext.Add('DO (Apple II)');
  FormatDest_Ext.Add('DSD (Acorn)');
  FormatDest_Ext.Add('DSK (DSK)');
  FormatDest_Ext.Add('EDSK (EDSK, use: format=ibm.scan)');
  FormatDest_Ext.Add('FD (FD)');
  FormatDest_Ext.Add('FDI (FDI)');
  FormatDest_Ext.Add('HDM (HDM)');
  FormatDest_Ext.Add('HFE (HxC Floppy Emulator)');
  FormatDest_Ext.Add('IMA (Disk Image)');
  FormatDest_Ext.Add('IMG (Disk Image)');
  FormatDest_Ext.Add('IMD (ImageDisk)');
  FormatDest_Ext.Add('IPF (IPF)');
  FormatDest_Ext.Add('MGT (Disciple/+D)');
  FormatDest_Ext.Add('MSA (Atari ST)');
  FormatDest_Ext.Add('NFD (T98-Next)');    // v1.19 read only
  FormatDest_Ext.Add('NSI (NS DOS Northstar)');
  FormatDest_Ext.Add('PO (Apple II)');
  FormatDest_Ext.Add('RAW (KryoFlux)');
  FormatDest_Ext.Add('SF7 (SEGA)');
  FormatDest_Ext.Add('SCP (SuperCardPro)');
  FormatDest_Ext.Add('SSD (Acorn)');
  FormatDest_Ext.Add('ST (Atari ST)');
  FormatDest_Ext.Add('TD0 (Teledisk)');
  FormatDest_Ext.Add('XDF (XDF)');

  EdGWFile.Filter := 'gw.exe|*.exe|gw';
  EdWriteFileName.Filter := 'Floppy-Images (*.*)|*.a2r;*.adf;*.adm;*.adl;*.ads;*.ctr;*.d1m;*.d2m;*.d4m;*.d64;*.d71;*.d81;*.d88;*.dcp;*.dim;*.dmk;*.do;*.dsd;*.dsk;*.edsk;*.fd;*.fdi;*hdm;*hfe;*.img;*.ima;*.imd;*.ipf;*.msa;*.nsi;*.po;*.raw;*.scp;*.sf7;*.ssd;*.st;*.td0;*.xdf|Applesauce (a2r)|*.a2r|Acorn (adl)|*.adl|Acorn (adm)|*.adm|Acorn (ads)|*.ads|Acorn (dsd)|*.dsd|Acorn (ssd)|*.ssd|AmigaDOS (adf)|*.adf|Apple II (do)|*.do||Apple II (po)|*.po|Atari ST (msa)|*.msa|Atari ST (st)|*.st|Commodore 1541 (d64)|*.d64|Commodore 1571 (d71)|*.d71|Commodore 1581 (d81)|*.d81|CT Raw (ctr)|*.ctr|Disciple (mgt)|*.mgt|DSK (dsk)|*.dsk|EDSK (edsk)|*.edsk|Floppy image (ima)|*.ima|Floppy image (img)|*.img|HDM (hdm)|*.hdm|HFE (HxC Floppy Emulator) (hfe)|*.hfe|ImageDisk image (imd)|*.imd|IPF (ipf)|*.ipf|Kryoflux (raw)|*.raw|NS DOS Northstar (nsi)|*.nis|SEGA (sf7)|*.sf7|SuperCardPro (scp)|*.scp';
  edConvFileSource.Filter := 'Floppy-Images (*.*)|*.a2r;*.adf;*.adm;*.adl;*.ads;*.ctr;*.d1m;*.d2m;*.d4m;*.d64;*.d71;*.d81;*.d88;*.dcp;*.dim;*.dmk;*.do;*.dsd;*.dsk;*.edsk;*.fd;*.fdi;*hdm;*hfe;*.img;*.ima;*.imd;*.ipf;*.msa;*.nsi;*.po;*.raw;*.scp;*.sf7;*.ssd;*.st;*.td0;*.xdf|Applesauce (a2r)|*.a2r|Acorn (adl)|*.adl|Acorn (adm)|*.adm|Acorn (ads)|*.ads|Acorn (dsd)|*.dsd|Acorn (ssd)|*.ssd|AmigaDOS (adf)|*.adf|Apple II (do)|*.do||Apple II (po)|*.po|Atari ST (msa)|*.msa|Atari ST (st)|*.st|Commodore 1541 (d64)|*.d64|Commodore 1571 (d71)|*.d71|Commodore 1581 (d81)|*.d81|CT Raw (ctr)|*.ctr|Disciple (mgt)|*.mgt|DSK (dsk)|*.dsk|EDSK (edsk)|*.edsk|Floppy image (ima)|*.ima|Floppy image (img)|*.img|HDM (hdm)|*.hdm|HFE (HxC Floppy Emulator) (hfe)|*.hfe|ImageDisk image (imd)|*.imd|IPF (ipf)|*.ipf|Kryoflux (raw)|*.raw|NS DOS Northstar (nsi)|*.nis|SEGA (sf7)|*.sf7|SuperCardPro (scp)|*.scp';

  // Create StringList Read Diskdefs
  // TODO: Read these from a configuration file
  FormatSpecs_Read := TStringList.Create;
  FormatSpecs_Read.Add('');
  FormatSpecs_Read.Add('acorn.adfs.160');
  FormatSpecs_Read.Add('acorn.adfs.1600');
  FormatSpecs_Read.Add('acorn.adfs.320');
  FormatSpecs_Read.Add('acorn.adfs.640');
  FormatSpecs_Read.Add('acorn.adfs.800');
  FormatSpecs_Read.Add('acorn.dfs.ds');
  FormatSpecs_Read.Add('acorn.dfs.ds80');
  FormatSpecs_Read.Add('acorn.dfs.ss');
  FormatSpecs_Read.Add('acorn.dfs.ss80');
  FormatSpecs_Read.Add('akai.1600');
  FormatSpecs_Read.Add('akai.800');
  FormatSpecs_Read.Add('amiga.amigados');
  FormatSpecs_Read.Add('amiga.amigados_hd');
  FormatSpecs_Read.Add('apple2.appledos.140');
  FormatSpecs_Read.Add('apple2.nofs.140');
  FormatSpecs_Read.Add('apple2.prodos.140');
  FormatSpecs_Read.Add('atari.130');
  FormatSpecs_Read.Add('atari.90');
  FormatSpecs_Read.Add('atarist.360');
  FormatSpecs_Read.Add('atarist.400');
  FormatSpecs_Read.Add('atarist.440');
  FormatSpecs_Read.Add('atarist.720');
  FormatSpecs_Read.Add('atarist.800');
  FormatSpecs_Read.Add('atarist.880');
  FormatSpecs_Read.Add('coco.decb');
  FormatSpecs_Read.Add('coco.decb.40t');
  FormatSpecs_Read.Add('coco.os9.40ds');
  FormatSpecs_Read.Add('coco.os9.40ss');
  FormatSpecs_Read.Add('coco.os9.80ds');
  FormatSpecs_Read.Add('coco.os9.80ss');
  FormatSpecs_Read.Add('commodore.1541');
  FormatSpecs_Read.Add('commodore.1571');
  FormatSpecs_Read.Add('commodore.1581');
  FormatSpecs_Read.Add('commodore.fd2000.dd');
  FormatSpecs_Read.Add('commodore.fd2000.hd');
  FormatSpecs_Read.Add('commodore.fd4000.ed');
  FormatSpecs_Read.Add('datageneral.2f');
  FormatSpecs_Read.Add('dec.rx01');
  FormatSpecs_Read.Add('dec.rx02');
  FormatSpecs_Read.Add('dragon.40ds');
  FormatSpecs_Read.Add('dragon.40ss');
  FormatSpecs_Read.Add('dragon.80ds');
  FormatSpecs_Read.Add('dragon.80ss');
  FormatSpecs_Read.Add('eagle.dsqd.800');
  FormatSpecs_Read.Add('eagle.ssqd.400');
  FormatSpecs_Read.Add('ensoniq.1600');
  FormatSpecs_Read.Add('ensoniq.800');
  FormatSpecs_Read.Add('ensoniq.mirage');
  FormatSpecs_Read.Add('epson.qx10.320');
  FormatSpecs_Read.Add('epson.qx10.396');
  FormatSpecs_Read.Add('epson.qx10.399');
  FormatSpecs_Read.Add('epson.qx10.400');
  FormatSpecs_Read.Add('epson.qx10.booter');
  FormatSpecs_Read.Add('epson.qx10.logo');
  FormatSpecs_Read.Add('gem.1600');
  FormatSpecs_Read.Add('hp.mmfm.9885');
  FormatSpecs_Read.Add('hp.mmfm.9895');
  FormatSpecs_Read.Add('ibm.1200');
  FormatSpecs_Read.Add('ibm.1440');
  FormatSpecs_Read.Add('ibm.160');
  FormatSpecs_Read.Add('ibm.1680');
  FormatSpecs_Read.Add('ibm.180');
  FormatSpecs_Read.Add('ibm.2880');
  FormatSpecs_Read.Add('ibm.320');
  FormatSpecs_Read.Add('ibm.360');
  FormatSpecs_Read.Add('ibm.720');
  FormatSpecs_Read.Add('ibm.800');
  FormatSpecs_Read.Add('ibm.dmf');
  FormatSpecs_Read.Add('ibm.scan');
  FormatSpecs_Read.Add('kaypro.dsdd.40');
  FormatSpecs_Read.Add('kaypro.dsdd.80');
  FormatSpecs_Read.Add('kaypro.ssdd.40');
  FormatSpecs_Read.Add('luxor.1000.abcnet');
  FormatSpecs_Read.Add('luxor.1000.data');
  FormatSpecs_Read.Add('luxor.1000.program');
  FormatSpecs_Read.Add('luxor.160');
  FormatSpecs_Read.Add('luxor.320');
  FormatSpecs_Read.Add('luxor.640');
  FormatSpecs_Read.Add('luxor.80');
  FormatSpecs_Read.Add('mac.400');
  FormatSpecs_Read.Add('mac.800');
  FormatSpecs_Read.Add('micropolis.100tpi.ds');
  FormatSpecs_Read.Add('micropolis.100tpi.ds.275');
  FormatSpecs_Read.Add('micropolis.100tpi.ss');
  FormatSpecs_Read.Add('micropolis.100tpi.ss.275');
  FormatSpecs_Read.Add('micropolis.48tpi.ds');
  FormatSpecs_Read.Add('micropolis.48tpi.ds.275');
  FormatSpecs_Read.Add('micropolis.48tpi.ss');
  FormatSpecs_Read.Add('micropolis.48tpi.ss.275');
  FormatSpecs_Read.Add('mm1.os9.80dshd_32');
  FormatSpecs_Read.Add('mm1.os9.80dshd_33');
  FormatSpecs_Read.Add('mm1.os9.80dshd_36');
  FormatSpecs_Read.Add('mm1.os9.80dshd_37');
  FormatSpecs_Read.Add('msx.1d');
  FormatSpecs_Read.Add('msx.1dd');
  FormatSpecs_Read.Add('msx.2d');
  FormatSpecs_Read.Add('msx.2dd');
  FormatSpecs_Read.Add('northstar.fm.ds');
  FormatSpecs_Read.Add('northstar.fm.ss');
  FormatSpecs_Read.Add('northstar.mfm.ds');
  FormatSpecs_Read.Add('northstar.mfm.ss');
  FormatSpecs_Read.Add('occ1.dd');
  FormatSpecs_Read.Add('occ1.sd');
  FormatSpecs_Read.Add('olivetti.m20');
  FormatSpecs_Read.Add('pc98.2d');
  FormatSpecs_Read.Add('pc98.2dd');
  FormatSpecs_Read.Add('pc98.2hd');
  FormatSpecs_Read.Add('pc98.2hs');
  FormatSpecs_Read.Add('pc98.n88basic.hd');
  FormatSpecs_Read.Add('raw.125');
  FormatSpecs_Read.Add('raw.250');
  FormatSpecs_Read.Add('raw.500');
  FormatSpecs_Read.Add('sci.prophet');
  FormatSpecs_Read.Add('sega.sf7000');
  FormatSpecs_Read.Add('thomson.1s160');
  FormatSpecs_Read.Add('thomson.1s320');
  FormatSpecs_Read.Add('thomson.1s80');
  FormatSpecs_Read.Add('thomson.2s160');
  FormatSpecs_Read.Add('thomson.2s320');
  FormatSpecs_Read.Add('tsc.flex.dsdd');
  FormatSpecs_Read.Add('tsc.flex.ssdd');
  FormatSpecs_Read.Add('xerox.860.dssd');
  FormatSpecs_Read.Add('xerox.860.ss');
  FormatSpecs_Read.Add('zx.3dos.ds80');
  FormatSpecs_Read.Add('zx.3dos.ss40');
  FormatSpecs_Read.Add('zx.d80.ds80');
  FormatSpecs_Read.Add('zx.fdd3000.ds80');
  FormatSpecs_Read.Add('zx.fdd3000.ss40');
  FormatSpecs_Read.Add('zx.kempston.ds80');
  FormatSpecs_Read.Add('zx.kempston.ss40');
  FormatSpecs_Read.Add('zx.opus.ds80');
  FormatSpecs_Read.Add('zx.opus.ss40');
  FormatSpecs_Read.Add('zx.plusd.ds80');
  FormatSpecs_Read.Add('zx.quorum.ds80');
  FormatSpecs_Read.Add('zx.rocky.ds80');
  FormatSpecs_Read.Add('zx.rocky.ss40');
  FormatSpecs_Read.Add('zx.trdos.ds80');
  FormatSpecs_Read.Add('zx.turbodrive.ds40');
  FormatSpecs_Read.Add('zx.turbodrive.ds80');
  FormatSpecs_Read.Add('zx.watford.ds80');
  FormatSpecs_Read.Add('zx.watford.ss40');


  // Create Stringlist Write Diskdefs
  // TODO: Read these from a configuration file
  FormatSpecs_Write := TStringList.Create;
  FormatSpecs_Write.Add('');
  FormatSpecs_Write.Add('acorn.adfs.160');
  FormatSpecs_Write.Add('acorn.adfs.1600');
  FormatSpecs_Write.Add('acorn.adfs.320');
  FormatSpecs_Write.Add('acorn.adfs.640');
  FormatSpecs_Write.Add('acorn.adfs.800');
  FormatSpecs_Write.Add('acorn.dfs.ds');
  FormatSpecs_Write.Add('acorn.dfs.ds80');
  FormatSpecs_Write.Add('acorn.dfs.ss');
  FormatSpecs_Write.Add('acorn.dfs.ss80');
  FormatSpecs_Write.Add('akai.1600');
  FormatSpecs_Write.Add('akai.800');
  FormatSpecs_Write.Add('amiga.amigados');
  FormatSpecs_Write.Add('amiga.amigados_hd');
  FormatSpecs_Write.Add('apple2.appledos.140');
  FormatSpecs_Write.Add('apple2.nofs.140');
  FormatSpecs_Write.Add('apple2.prodos.140');
  FormatSpecs_Write.Add('atari.130');
  FormatSpecs_Write.Add('atari.90');
  FormatSpecs_Write.Add('atarist.360');
  FormatSpecs_Write.Add('atarist.400');
  FormatSpecs_Write.Add('atarist.440');
  FormatSpecs_Write.Add('atarist.720');
  FormatSpecs_Write.Add('atarist.800');
  FormatSpecs_Write.Add('atarist.880');
  FormatSpecs_Write.Add('coco.decb');
  FormatSpecs_Write.Add('coco.decb.40t');
  FormatSpecs_Write.Add('coco.os9.40ds');
  FormatSpecs_Write.Add('coco.os9.40ss');
  FormatSpecs_Write.Add('coco.os9.80ds');
  FormatSpecs_Write.Add('coco.os9.80ss');
  FormatSpecs_Write.Add('commodore.1541');
  FormatSpecs_Write.Add('commodore.1571');
  FormatSpecs_Write.Add('commodore.1581');
  FormatSpecs_Write.Add('commodore.fd2000.dd');
  FormatSpecs_Write.Add('commodore.fd2000.hd');
  FormatSpecs_Write.Add('commodore.fd4000.ed');
  FormatSpecs_Write.Add('datageneral.2f');
  FormatSpecs_Write.Add('dec.rx01');
  FormatSpecs_Write.Add('dec.rx02');
  FormatSpecs_Write.Add('dragon.40ds');
  FormatSpecs_Write.Add('dragon.40ss');
  FormatSpecs_Write.Add('dragon.80ds');
  FormatSpecs_Write.Add('dragon.80ss');
  FormatSpecs_Write.Add('eagle.dsqd.800');
  FormatSpecs_Write.Add('eagle.ssqd.400');
  FormatSpecs_Write.Add('ensoniq.1600');
  FormatSpecs_Write.Add('ensoniq.800');
  FormatSpecs_Write.Add('ensoniq.mirage');
  FormatSpecs_Write.Add('epson.qx10.320');
  FormatSpecs_Write.Add('epson.qx10.396');
  FormatSpecs_Write.Add('epson.qx10.399');
  FormatSpecs_Write.Add('epson.qx10.400');
  FormatSpecs_Write.Add('epson.qx10.booter');
  FormatSpecs_Write.Add('epson.qx10.logo');
  FormatSpecs_Write.Add('gem.1600');
  FormatSpecs_Write.Add('hp.mmfm.9885');
  FormatSpecs_Write.Add('hp.mmfm.9895');
  FormatSpecs_Write.Add('ibm.1200');
  FormatSpecs_Write.Add('ibm.1440');
  FormatSpecs_Write.Add('ibm.160');
  FormatSpecs_Write.Add('ibm.1680');
  FormatSpecs_Write.Add('ibm.180');
  FormatSpecs_Write.Add('ibm.2880');
  FormatSpecs_Write.Add('ibm.320');
  FormatSpecs_Write.Add('ibm.360');
  FormatSpecs_Write.Add('ibm.720');
  FormatSpecs_Write.Add('ibm.800');
  FormatSpecs_Write.Add('ibm.dmf');
  FormatSpecs_Write.Add('ibm.scan');
  FormatSpecs_Write.Add('kaypro.dsdd.40');
  FormatSpecs_Write.Add('kaypro.dsdd.80');
  FormatSpecs_Write.Add('kaypro.ssdd.40');
  FormatSpecs_Write.Add('luxor.1000.abcnet');
  FormatSpecs_Write.Add('luxor.1000.data');
  FormatSpecs_Write.Add('luxor.1000.program');
  FormatSpecs_Write.Add('luxor.160');
  FormatSpecs_Write.Add('luxor.320');
  FormatSpecs_Write.Add('luxor.640');
  FormatSpecs_Write.Add('luxor.80');
  FormatSpecs_Write.Add('mac.400');
  FormatSpecs_Write.Add('mac.800');
  FormatSpecs_Write.Add('micropolis.100tpi.ds');
  FormatSpecs_Write.Add('micropolis.100tpi.ds.275');
  FormatSpecs_Write.Add('micropolis.100tpi.ss');
  FormatSpecs_Write.Add('micropolis.100tpi.ss.275');
  FormatSpecs_Write.Add('micropolis.48tpi.ds');
  FormatSpecs_Write.Add('micropolis.48tpi.ds.275');
  FormatSpecs_Write.Add('micropolis.48tpi.ss');
  FormatSpecs_Write.Add('micropolis.48tpi.ss.275');
  FormatSpecs_Write.Add('mm1.os9.80dshd_32');
  FormatSpecs_Write.Add('mm1.os9.80dshd_33');
  FormatSpecs_Write.Add('mm1.os9.80dshd_36');
  FormatSpecs_Write.Add('mm1.os9.80dshd_37');
  FormatSpecs_Write.Add('msx.1d');
  FormatSpecs_Write.Add('msx.1dd');
  FormatSpecs_Write.Add('msx.2d');
  FormatSpecs_Write.Add('msx.2dd');
  FormatSpecs_Write.Add('northstar.fm.ds');
  FormatSpecs_Write.Add('northstar.fm.ss');
  FormatSpecs_Write.Add('northstar.mfm.ds');
  FormatSpecs_Write.Add('northstar.mfm.ss');
  FormatSpecs_Write.Add('occ1.dd');
  FormatSpecs_Write.Add('occ1.sd');
  FormatSpecs_Write.Add('olivetti.m20');
  FormatSpecs_Write.Add('pc98.2d');
  FormatSpecs_Write.Add('pc98.2dd');
  FormatSpecs_Write.Add('pc98.2hd');
  FormatSpecs_Write.Add('pc98.2hs');
  FormatSpecs_Write.Add('pc98.n88basic.hd');
  FormatSpecs_Write.Add('raw.125');
  FormatSpecs_Write.Add('raw.250');
  FormatSpecs_Write.Add('raw.500');
  FormatSpecs_Write.Add('sci.prophet');
  FormatSpecs_Write.Add('sega.sf7000');
  FormatSpecs_Write.Add('thomson.1s160');
  FormatSpecs_Write.Add('thomson.1s320');
  FormatSpecs_Write.Add('thomson.1s80');
  FormatSpecs_Write.Add('thomson.2s160');
  FormatSpecs_Write.Add('thomson.2s320');
  FormatSpecs_Write.Add('tsc.flex.dsdd');
  FormatSpecs_Write.Add('tsc.flex.ssdd');
  FormatSpecs_Write.Add('xerox.860.dssd');
  FormatSpecs_Write.Add('xerox.860.ss');
  FormatSpecs_Write.Add('zx.3dos.ds80');
  FormatSpecs_Write.Add('zx.3dos.ss40');
  FormatSpecs_Write.Add('zx.d80.ds80');
  FormatSpecs_Write.Add('zx.fdd3000.ds80');
  FormatSpecs_Write.Add('zx.fdd3000.ss40');
  FormatSpecs_Write.Add('zx.kempston.ds80');
  FormatSpecs_Write.Add('zx.kempston.ss40');
  FormatSpecs_Write.Add('zx.opus.ds80');
  FormatSpecs_Write.Add('zx.opus.ss40');
  FormatSpecs_Write.Add('zx.plusd.ds80');
  FormatSpecs_Write.Add('zx.quorum.ds80');
  FormatSpecs_Write.Add('zx.rocky.ds80');
  FormatSpecs_Write.Add('zx.rocky.ss40');
  FormatSpecs_Write.Add('zx.trdos.ds80');
  FormatSpecs_Write.Add('zx.turbodrive.ds40');
  FormatSpecs_Write.Add('zx.turbodrive.ds80');
  FormatSpecs_Write.Add('zx.watford.ds80');
  FormatSpecs_Write.Add('zx.watford.ss40');

  // Create StringList Convert  Diskdefs
  // TODO: Read these from a configuration file
  FormatSpecs_Conv := TStringList.Create;
  FormatSpecs_Conv.Add('');
  FormatSpecs_Conv.Add('acorn.adfs.160');
  FormatSpecs_Conv.Add('acorn.adfs.1600');
  FormatSpecs_Conv.Add('acorn.adfs.320');
  FormatSpecs_Conv.Add('acorn.adfs.640');
  FormatSpecs_Conv.Add('acorn.adfs.800');
  FormatSpecs_Conv.Add('acorn.dfs.ds');
  FormatSpecs_Conv.Add('acorn.dfs.ds80');
  FormatSpecs_Conv.Add('acorn.dfs.ss');
  FormatSpecs_Conv.Add('acorn.dfs.ss80');
  FormatSpecs_Conv.Add('akai.1600');
  FormatSpecs_Conv.Add('akai.800');
  FormatSpecs_Conv.Add('amiga.amigados');
  FormatSpecs_Conv.Add('amiga.amigados_hd');
  FormatSpecs_Conv.Add('apple2.appledos.140');
  FormatSpecs_Conv.Add('apple2.nofs.140');
  FormatSpecs_Conv.Add('apple2.prodos.140');
  FormatSpecs_Conv.Add('atari.130');
  FormatSpecs_Conv.Add('atari.90');
  FormatSpecs_Conv.Add('atarist.360');
  FormatSpecs_Conv.Add('atarist.400');
  FormatSpecs_Conv.Add('atarist.440');
  FormatSpecs_Conv.Add('atarist.720');
  FormatSpecs_Conv.Add('atarist.800');
  FormatSpecs_Conv.Add('atarist.880');
  FormatSpecs_Conv.Add('coco.decb');
  FormatSpecs_Conv.Add('coco.decb.40t');
  FormatSpecs_Conv.Add('coco.os9.40ds');
  FormatSpecs_Conv.Add('coco.os9.40ss');
  FormatSpecs_Conv.Add('coco.os9.80ds');
  FormatSpecs_Conv.Add('coco.os9.80ss');
  FormatSpecs_Conv.Add('commodore.1541');
  FormatSpecs_Conv.Add('commodore.1571');
  FormatSpecs_Conv.Add('commodore.1581');
  FormatSpecs_Conv.Add('commodore.fd2000.dd');
  FormatSpecs_Conv.Add('commodore.fd2000.hd');
  FormatSpecs_Conv.Add('commodore.fd4000.ed');
  FormatSpecs_Conv.Add('datageneral.2f');
  FormatSpecs_Conv.Add('dec.rx01');
  FormatSpecs_Conv.Add('dec.rx02');
  FormatSpecs_Conv.Add('dragon.40ds');
  FormatSpecs_Conv.Add('dragon.40ss');
  FormatSpecs_Conv.Add('dragon.80ds');
  FormatSpecs_Conv.Add('dragon.80ss');
  FormatSpecs_Conv.Add('eagle.dsqd.800');
  FormatSpecs_Conv.Add('eagle.ssqd.400');
  FormatSpecs_Conv.Add('ensoniq.1600');
  FormatSpecs_Conv.Add('ensoniq.800');
  FormatSpecs_Conv.Add('ensoniq.mirage');
  FormatSpecs_Conv.Add('epson.qx10.320');
  FormatSpecs_Conv.Add('epson.qx10.396');
  FormatSpecs_Conv.Add('epson.qx10.399');
  FormatSpecs_Conv.Add('epson.qx10.400');
  FormatSpecs_Conv.Add('epson.qx10.booter');
  FormatSpecs_Conv.Add('epson.qx10.logo');
  FormatSpecs_Conv.Add('gem.1600');
  FormatSpecs_Conv.Add('hp.mmfm.9885');
  FormatSpecs_Conv.Add('hp.mmfm.9895');
  FormatSpecs_Conv.Add('ibm.1200');
  FormatSpecs_Conv.Add('ibm.1440');
  FormatSpecs_Conv.Add('ibm.160');
  FormatSpecs_Conv.Add('ibm.1680');
  FormatSpecs_Conv.Add('ibm.180');
  FormatSpecs_Conv.Add('ibm.2880');
  FormatSpecs_Conv.Add('ibm.320');
  FormatSpecs_Conv.Add('ibm.360');
  FormatSpecs_Conv.Add('ibm.720');
  FormatSpecs_Conv.Add('ibm.800');
  FormatSpecs_Conv.Add('ibm.dmf');
  FormatSpecs_Conv.Add('ibm.scan');
  FormatSpecs_Conv.Add('kaypro.dsdd.40');
  FormatSpecs_Conv.Add('kaypro.dsdd.80');
  FormatSpecs_Conv.Add('kaypro.ssdd.40');
  FormatSpecs_Conv.Add('luxor.1000.abcnet');
  FormatSpecs_Conv.Add('luxor.1000.data');
  FormatSpecs_Conv.Add('luxor.1000.program');
  FormatSpecs_Conv.Add('luxor.160');
  FormatSpecs_Conv.Add('luxor.320');
  FormatSpecs_Conv.Add('luxor.640');
  FormatSpecs_Conv.Add('luxor.80');
  FormatSpecs_Conv.Add('mac.400');
  FormatSpecs_Conv.Add('mac.800');
  FormatSpecs_Conv.Add('micropolis.100tpi.ds');
  FormatSpecs_Conv.Add('micropolis.100tpi.ds.275');
  FormatSpecs_Conv.Add('micropolis.100tpi.ss');
  FormatSpecs_Conv.Add('micropolis.100tpi.ss.275');
  FormatSpecs_Conv.Add('micropolis.48tpi.ds');
  FormatSpecs_Conv.Add('micropolis.48tpi.ds.275');
  FormatSpecs_Conv.Add('micropolis.48tpi.ss');
  FormatSpecs_Conv.Add('micropolis.48tpi.ss.275');
  FormatSpecs_Conv.Add('mm1.os9.80dshd_32');
  FormatSpecs_Conv.Add('mm1.os9.80dshd_33');
  FormatSpecs_Conv.Add('mm1.os9.80dshd_36');
  FormatSpecs_Conv.Add('mm1.os9.80dshd_37');
  FormatSpecs_Conv.Add('msx.1d');
  FormatSpecs_Conv.Add('msx.1dd');
  FormatSpecs_Conv.Add('msx.2d');
  FormatSpecs_Conv.Add('msx.2dd');
  FormatSpecs_Conv.Add('northstar.fm.ds');
  FormatSpecs_Conv.Add('northstar.fm.ss');
  FormatSpecs_Conv.Add('northstar.mfm.ds');
  FormatSpecs_Conv.Add('northstar.mfm.ss');
  FormatSpecs_Conv.Add('occ1.dd');
  FormatSpecs_Conv.Add('occ1.sd');
  FormatSpecs_Conv.Add('olivetti.m20');
  FormatSpecs_Conv.Add('pc98.2d');
  FormatSpecs_Conv.Add('pc98.2dd');
  FormatSpecs_Conv.Add('pc98.2hd');
  FormatSpecs_Conv.Add('pc98.2hs');
  FormatSpecs_Conv.Add('pc98.n88basic.hd');
  FormatSpecs_Conv.Add('raw.125');
  FormatSpecs_Conv.Add('raw.250');
  FormatSpecs_Conv.Add('raw.500');
  FormatSpecs_Conv.Add('sci.prophet');
  FormatSpecs_Conv.Add('sega.sf7000');
  FormatSpecs_Conv.Add('thomson.1s160');
  FormatSpecs_Conv.Add('thomson.1s320');
  FormatSpecs_Conv.Add('thomson.1s80');
  FormatSpecs_Conv.Add('thomson.2s160');
  FormatSpecs_Conv.Add('thomson.2s320');
  FormatSpecs_Conv.Add('tsc.flex.dsdd');
  FormatSpecs_Conv.Add('tsc.flex.ssdd');
  FormatSpecs_Conv.Add('xerox.860.dssd');
  FormatSpecs_Conv.Add('xerox.860.ss');
  FormatSpecs_Conv.Add('zx.3dos.ds80');
  FormatSpecs_Conv.Add('zx.3dos.ss40');
  FormatSpecs_Conv.Add('zx.d80.ds80');
  FormatSpecs_Conv.Add('zx.fdd3000.ds80');
  FormatSpecs_Conv.Add('zx.fdd3000.ss40');
  FormatSpecs_Conv.Add('zx.kempston.ds80');
  FormatSpecs_Conv.Add('zx.kempston.ss40');
  FormatSpecs_Conv.Add('zx.opus.ds80');
  FormatSpecs_Conv.Add('zx.opus.ss40');
  FormatSpecs_Conv.Add('zx.plusd.ds80');
  FormatSpecs_Conv.Add('zx.quorum.ds80');
  FormatSpecs_Conv.Add('zx.rocky.ds80');
  FormatSpecs_Conv.Add('zx.rocky.ss40');
  FormatSpecs_Conv.Add('zx.trdos.ds80');
  FormatSpecs_Conv.Add('zx.turbodrive.ds40');
  FormatSpecs_Conv.Add('zx.turbodrive.ds80');
  FormatSpecs_Conv.Add('zx.watford.ds80');
  FormatSpecs_Conv.Add('zx.watford.ss40');

  cbReadTplFormat.items.Text := FormatSpecs_Read.Text;
  cbReadFormat.Items.Text := FormatDest_Ext.Text;        // bspw. .msa
  cbWriteTplFormat.items.Text := FormatSpecs_Write.Text;
  cbConvFormat.items.Text := FormatSpecs_Conv.Text;
  cbConvFileFormat.Items.Text := FormatDest_Ext.Text;    // bspw. .msa
  Refresh_Templates_Read_DropDown;
  Refresh_Templates_Write_DropDown;
  btReadTplNew.Click;
  btWriteTplNew.Click;
  CMD_Generate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  rbToolsErase.Checked:=true;
  rbToolsSeek.Checked:=false;
  rbToolsRPM.Checked:=false;

  rbSetDelays.Checked:=true;
  rbSetGetPIN.Checked:=false;
  rbSetFirmware.Checked:=false;
  rbGetPIN.Checked:=true;

  rbToolsSeekClick(rbToolsSeek);
end;

// location diskdefs_.cfg - Refresh "format spec" dropdown
procedure TForm1.Refresh_Diskdefs_DropDown;
var
  Diskdefs : TStringList;
  i: integer;
  TmplFolder : String;
  INITmplFolder : TIniFile;
begin
  try
    INITmplFolder := TINIFile.Create(sAppPath + GW_INI_FILE);
    TmplFolder := INITmplFolder.ReadString(FLUX_INI_NAME, GW_DISKDEF_FOLDER, '');
    INITmplFolder.Free;
    cbReadTplFormatSrc.Items.Clear;
    cbReadTplFormatSrc.Items.Add('Internal');
    cbWriteTplFormatSrc.items.Clear;
    cbWriteTplFormatSrc.items.Add('Internal');
    cbConvDiskdefs.items.Clear;
    cbConvDiskdefs.items.Add('Internal');
    i := 0;
    Diskdefs := FindAllFiles(DirCheck(TmplFolder), '*.cfg', True);
    if Diskdefs.Count = 0 then
    begin
      Diskdefs.Free;
      exit;
    end;
    while i < Diskdefs.Count do
    begin
      cbReadTplFormatSrc.Items.Add(ExtractFilename(ExtractFileName_WithoutExt(Diskdefs.Strings[i])));
      cbWriteTplFormatSrc.Items.Add(ExtractFilename(ExtractFileName_WithoutExt(Diskdefs.Strings[i])));
      cbConvDiskdefs.Items.Add(ExtractFilename(ExtractFileName_WithoutExt(Diskdefs.Strings[i])));
      Inc(i);
    end;
    Diskdefs.Free;
    cbReadTplFormatSrc.ItemIndex:=0;
    cbWriteTplFormatSrc.ItemIndex:=0;
    cbConvDiskdefs.ItemIndex:=0;
  finally
  end;
end;

// btGoClick()

// This procedure does preliminary checks and brings up the GW modal window
// EdGWCMD.Lines.Text already contains the constructed command line
// Some parts of this sneakily add other parameters such as logging parameters
// which are not displayed on the command line

// In: EdGWCMD.Lines - Displayed GW command line
// Out: aLine - Final GW command line
// Out: Caption - GW Modal window title bar

procedure TForm1.btGoClick(Sender: TObject);
var
    LogDir, LogFilename : String;
    answer : integer;
begin
   LogDir := '';
   LogFilename := '';
   if edGWFile.Text = '' then
    begin
      answer := MessageDlg('Please define location of Greaseweazle (' + GW_APP + ')!',mtWarning, [mbOK], 0);
      if answer = mrOk then
       begin
        edGWFile.SetFocus;
        exit;
       end;
    end;

   if Fileexists(edGWFile.Text) = false then
    begin
     answer := MessageDlg(GW_APP_NAME + ' (' + GW_APP + ') not found!',mtWarning, [mbCancel], 0);
     if answer = mrCancel then
      begin
       edGWFile.SetFocus;
       exit;
      end;
    end;

   // Read  ######################################################################
   if pcActions.ActivePageIndex = GW_PROP_PAGE_READ then
     begin
       if edReadDirDest.Text = '' then
        begin
         answer := MessageDlg('Destination directory not defined!',mtWarning, [mbCancel], 0);
         if answer = mrCancel then
          begin
           edReadDirDest.SetFocus;
           exit;
          end;
        end;
       if edReadDirDest.Text <> '' then
        begin
         if Directoryexists(Dircheck(edReadDirDest.Text)) = false then
          begin
           answer := MessageDlg('Destination directory not found! Create directory?',mtWarning, [mbYes,mbCancel], 0);
           if answer = mrCancel then
             begin
              edReadDirDest.SetFocus;
              exit;
             end;
           if answer = mrYes then
             begin
             Forcedirectories(dircheck(edReadDirDest.Text));
             end;
          end;
        end;
       if edReadFilename.Text = '' then
        begin
         answer := MessageDlg('Destination filename is not defined!',mtWarning, [mbCancel], 0);
          if answer = mrCancel then
            begin
             edReadFilename.SetFocus;
             exit;
            end;
        end;

    if cbReadFormat.Text = '' then
      begin
        answer := MessageDlg('Destination format setting is missing!',mtWarning, [mbCancel], 0);
        if answer = mrCancel then
          begin
           cbReadFormat.SetFocus;
           exit;
          end;
      end;

   // RAW or not -format
   if (cbReadFormat.Text = 'IMA (Disk Image)') or (cbReadFormat.Text = 'IMG (Disk Image)') then
    begin
     if cbReadTplFormat.Text = '' then
      begin
      answer := MessageDlg('Sector image requires a disk format to be specified!',mtWarning, [mbCancel], 0);
      if answer = mrCancel then
       begin
        cbReadTplFormat.SetFocus;
        exit;
       end;
      end;
    end;

   // HFE bitrate
   if (cbReadFormat.Text = 'HFE (HxC Floppy Emulator)') then
    begin
     if cbReadFormatoption.Text = '' then
      begin
      answer := MessageDlg('HFE: Requires bitrate to be specified (eg. filename.hfe::bitrate=500)',mtWarning, [mbCancel], 0);
      if answer = mrCancel then
       begin
        cbReadFormatoption.SetFocus;
        exit;
       end;
      end;
    end;

   if FileExists(DirCheck(edReadDirDest.Text) + cbReadPreview.Text) then
     begin
       answer := MessageDlg('Destination file is already existing! Overwrite?',mtConfirmation, [mbYes,mbCancel], 0);
       if answer = mrCancel then exit;
     end;

   //Log parameter
   LogDir := DirCheck(edReadDirDest.Text);
   LogFilename := ExtractFileName_WithoutExt(cbReadPreview.Text) + '.txt';
   if cbReadTplLogParam.Checked = true then
     begin
     with TStringList.Create do
      try
       Add('Filename: ' + cbReadPreview.Text);
       Add(lblReadTplFormat.Caption + ' Source: ' + cbReadTplFormatSrc.Text);
       Add(lblReadTplFormat.Caption + ' Selected: ' + cbReadTplFormat.Text);
       Add(lblReadTplRevs.Caption + ' ' + cbReadTplRevs.Text);
       if cbReadTplRaw.Checked = True then Add(lblReadTplRaw.Caption + ' Yes');
       if cbReadTplRaw.Checked = False then Add(lblReadTplRaw.Caption + ' No');
       Add(lblReadTplFakeIndex.Caption + ' ' + cbReadTplFakeIndex.Text);
       Add(cbReadTplAdjustSpeed.Caption + ' ' + cbReadTplAdjustSpeed.Text);
       Add(lblReadTplRetries.Caption + ' ' + cbReadTplRetries.Text);
       Add(lblReadTplSeekRetries.Caption + ' ' + cbReadTplSeekRetries.Text);
       Add(lblReadTplCyls.Caption + ' ' + cbReadTplCyls.Text);
       Add(lblReadTplHeads.Caption + ' ' + cbReadTplHeads.Text);
       Add(lblReadTplSteps.Caption + ' ' + cbReadTplSteps.Text);
       if cbReadTplHSwap.Checked = True then Add(lblReadTplHSwap.Caption + ' Yes');
       if cbReadTplHSwap.Checked = False then Add(lblReadTplHSwap.Caption + ' No');
       Add(lblReadTplFlippy.Caption + ' ' + cbReadTplFlippy.Text);
       Add(lblReadTplPLL.Caption + ' ' + cbReadTplPLL.Text);
       Add(' ');
       SaveToFile(LogDir + LogFilename);
      finally
       Free;
      end;
     end;

     if cbReadTplLogOutput.Checked = false then
      begin
       aLine := EdGWCMD.Lines.Text;
       frmGW.Caption:= GW_APP_NAME + ' - Read';
       frmGW.showmodal;
      end;

     // Output with Log
     if cbReadTplLogOutput.Checked = true then
       begin
        if cbReadTplLogBoth.Checked = false then
         begin
          aLine := '' + EdGWCMD.Lines.Text + ' 2> "' + LogDir + LogFileName + '_output.txt"';
          frmGW.Caption:= GW_APP_NAME + ' - Read';
          frmGW.showmodal;
         end;
        if cbReadTplLogBoth.Checked = true then
         begin
          aLine := '' + EdGWCMD.Lines.Text + ' 2>> "' + LogDir + LogFilename + '"';
          frmGW.Caption:= GW_APP_NAME + ' - Read';
          frmGW.showmodal;
         end;
       end;

    If cbReadIncremental.Checked = true then
     begin
      if edReadDisk1.Value < edReadDisk2.Value then
       begin
        edReadDisk1.Value := edReadDisk1.Value +1;
        btGO.SetFocus;
       end;
     end;
  end;
  // read end

  // Write  ######################################################################
   if pcActions.ActivePageIndex = GW_PROP_PAGE_WRITE then
     begin
      if edWriteFilename.Text = '' then
       begin
        answer := MessageDlg('No source file selected!',mtWarning, [mbOK], 0);
        if answer = mrOk then exit;
       end;
      if fileexists(edWriteFilename.Text) = false then
       begin
        answer := MessageDlg('Source file not found!',mtWarning, [mbOK], 0);
        if answer = mrOk then exit;
       end;
      aLine := EdGWCMD.Lines.Text;
      frmGW.Caption:= GW_APP_NAME + ' - Write';
      frmGW.showmodal;
     end;

   // Convert ####################################################################
   if pcActions.ActivePageIndex = GW_PROP_PAGE_CONVERT then
    begin
     if edConvFileSource.Text = '' then
      begin
       answer := MessageDlg('No source file selected!',mtWarning, [mbOK], 0);
       if answer = mrOk then exit;
      end;
     if fileexists(edConvFileSource.Text) = false then
      begin
       answer := MessageDlg('Source file not found!',mtWarning, [mbOK], 0);
       if answer = mrOk then exit;
      end;
    if Directoryexists(Dircheck(edConvDirDest.Text)) = false then
      begin
       answer := MessageDlg('Destination directory not found! Create directory?',mtWarning, [mbYes,mbCancel], 0);
       if answer = mrCancel then
        begin
         edConvFileSource.SetFocus;
         exit;
        end;
       if answer = mrYes then
        begin
         Forcedirectories(dircheck(edConvDirDest.Text));
        end;
       end;

     if cbConvFileFormat.Text = '' then
      begin
       answer := MessageDlg('Destination fileformat settings incomplete!',mtWarning, [mbOK], 0);
       if answer = mrOk then exit;
      end;

     if edConvFilenamePreview.Text = '' then
      begin
       answer := MessageDlg('Destination filename settings incomplete!',mtWarning, [mbOK], 0);
       if answer = mrOk then exit;
      end;
     aLine := EdGWCMD.Lines.Text;
     frmGW.Caption:= GW_APP_NAME + ' - Convert';
     frmGW.showmodal;
    end;

   //Tools ####################################################################
   if pcActions.ActivePage.PageIndex = GW_PROP_PAGE_TOOLS then
     begin
      aLine := EdGWCMD.Lines.Text;
      frmGW.Caption:= GW_APP_NAME + ' - ' + btGo.Caption;
      frmGW.showmodal;
     end;

   //Settings ####################################################################
   if pcActions.ActivePage.PageIndex = GW_PROP_PAGE_SETTINGS then
     begin
      aLine := EdGWCMD.Lines.Text;
      frmGW.Caption:= GW_APP_NAME + ' - ' + btGo.Caption;
      frmGW.showmodal;
     end;
end;

procedure TForm1.btConvExplorerClick(Sender: TObject);
begin
{$IFDEF WINDOWS}
 SysUtils.ExecuteProcess('explorer.exe', '/n,'+edConvDirDest.text, []);
{$ELSE}
//TODO: Test
 SysUtils.ExecuteProcess('bash', edConvDirDest.text);
{$ENDIF}
end;

procedure TForm1.btConvClearClick(Sender: TObject);
begin
 edConvFilename.Text := '';
 cbConvDisk1.Value := 0;
 edConvDiskOf.Text := '_of_';
 cbConvDisk2.Value := 0;
 cbConvDigits.Value := 1;
 cbConvIncrement.Checked := false;
 cbConvNoOverwrite.Checked := false;
 cbConvFileFormat.Text:='';
 cbConvFormatOption.Text := '';
 cbConvFormatOptionHFEVer.Text := '';
 cbConvFormatOptionHFEInt.Text := '';
 cbConvFormatOptionHFEEnc.Text := '';
 cbConvFormat.Text := '';
 edConvFilenamePreview.Text:='';
 Create_Filename;

end;

procedure TForm1.btGWBandwidthClick(Sender: TObject);
begin
  performModalCmdAction('bandwidth');
end;

procedure TForm1.btGWCMDDirClick(Sender: TObject);
var
  Dir: string;
begin
  if FileExists(edGWFile.Text) then
  begin
    Dir := ExtractFileDir(edGWFile.Text);

    // Set working directory for future process runs
    SetCurrentDir(Dir);
{$IFDEF WINDOWS}
    CmdDir('/k "', 'cd ' + DirCheck(Dir) + '"');
{$ELSE}
    CmdDir('-c "', 'cd "' + DirCheck(ExtractFileDir(edGWFile.Text)) + '" ; exec bash"');
{$ENDIF}
    MessageDlg('Working directory set to:' + LineEnding + Dir,
      mtInformation, [mbOK], 0);
  end
  else
    MessageDlg('Directory not found!', mtWarning, [mbOK], 0);
end;

procedure TForm1.btGWInfoClick(Sender: TObject);
var
  answer : integer;
begin
  performModalCmdAction('info');
end;

procedure TForm1.btGWResetClick(Sender: TObject);
var
  answer : integer;
begin
  performModalCmdAction('reset');
end;

procedure TForm1.btReadDestExploreClick(Sender: TObject);
var
 answer : integer;
begin
  if edReadDirDest.Text <> '' then
  begin
  //TODO Cross platform
  //uses LCLIntf;
  //OpenDocument(edReadDirDest.Text);
{$IFDEF WINDOWS}
   SysUtils.ExecuteProcess('explorer.exe', '/n,'+edReadDirDest.Text, []);
{$ELSE}
  SysUtils.ExecuteProcess('xdg-open', edReadDirDest.Text, []);
{$ENDIF}
  end
  else
  begin
   answer := MessageDlg('Directory not found!',mtWarning, [mbOK], 0);
   if answer = mrOk then exit;
  end;

end;

procedure TForm1.btReadDiskResetClick(Sender: TObject);
begin
 edReadDisk1.Value := 0;
 edReadDiskOf.Text := '_of_';
 edReadDisk2.Value := 0;
 edReadDigits.Value := 1;
 cbReadIncremental.Checked := false;
 cbReadNoOverwrite.Checked := false;
 cbReadFormatOption.Text := '';
 cbReadFormat.Text := '';
 cbReadFormatOption.Text := '';
 cbReadFormatOptionHFEVer.Text:='';
 cbReadFormatOptionHFEInt.Text:='';
 cbReadFormatOptionHFEEnc.Text:='';
 edReadFilename.Text := '';
 cbReadPreview.Text:='';
end;

procedure TForm1.btReadTplDelClick(Sender: TObject);
var
  tmp : string;
  answer : Integer;
begin
  tmp := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  if DirectoryExists(tmp) = false then
   begin
    answer := MessageDlg('In options defined templates folder does not exist!' + chr(10) + 'Cannot delete the selected template!',mtWarning, [mbOK], 0);
    if answer = mrOk then exit;
   end;

  try
    if fileexists(Dircheck(tmp) + cbReadTplName.Text + GW_INI_READ_EXT) then
    begin
     answer := MessageDlg('Do you really want to delete the selected template?',mtConfirmation, [mbYes,mbCancel], 0);
     if answer = mrCancel then exit;
     if answer = mrYes then
     begin
      Deletefile(PChar(Dircheck(tmp) + cbReadTplName.Text + GW_INI_READ_EXT));
      Refresh_Templates_Read_DropDown;
     end;
    end;
  finally
  end;

end;

procedure TForm1.btReadTplNewClick(Sender: TObject);
begin
 cbReadTplName.Text := '';
 edReadTplDesc.Text := '';
 cbReadTplFormatSrc.ItemIndex:=0;
 cbReadTplFormat.Text :='';
 cbReadTplRevs.Text := '';
 cbReadTplRaw.Checked := false;
 cbReadTplFakeIndex.Text := '';
 cbReadTplHardSec.Checked := false;
 cbReadTplAdjustSpeed.Text := '';
 cbReadTplRetries.Text := '';
 cbReadTplSeekRetries.Text := '';
 btReadTplDel.Enabled := false;
 //
 cbReadTplCyls.Text := '';
 cbReadTplHeads.Text := '';
 cbReadTplSteps.Text := '';
 cbReadTplHSwap.Checked := false;
 cbReadTplFlippy.Text := '';
 cbReadTplFlippyReverse.Checked := false;
 cbReadTplPLL.Text := '';
 cbReadTplDD.Text := '';
 //
 cbReadTplLogParam.checked := false;
 cbReadTplLogOutput.checked := false;
 cbReadTplLogBoth.checked := false;
 Refresh_ReadFormSpec;
 CMD_Generate;
end;

procedure TForm1.btReadTplSaveClick(Sender: TObject);
var
 tmp : string;
 answer : Integer;
 INIRead: TIniFile;
begin
 if cbReadTplName.Text = '' then
 begin
   answer := MessageDlg('Please define a template name!',mtWarning, [mbOK], 0);
   if answer = mrOk then exit;
 end;





 tmp := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
 if tmp = '' then CreateDir(sAppPath + PATH_TEMPLATES + PATH_SPECIFIER);
 if DirectoryExists(tmp) = false then
  begin
   answer := MessageDlg('In options defined templates folder does not exist.' + chr(10) + 'Please redefine! Template is not saved.',mtWarning, [mbOK], 0);
   if answer = mrOk then exit;
  end;

  if cbReadTplName.Text <> '' then
   begin
    INIRead := TINIFile.Create(DirCheck(tmp) + cbReadTplName.Text + GW_INI_READ_EXT);
    try
      INIRead.DeleteKey(INI_SETTINGS,INI_TEMPLATE_LEGACY_RPM); // older than 2.00
      INIRead.WriteString(READ_TEMPLATE, INI_VERSION, sAppVersion_ReadTmpl);
      INIRead.WriteString(READ_TEMPLATE, INI_TEMPLATE_NAME, cbReadTplName.Text);
      //INIRead.WriteString(READ_TEMPLATE, 'Creator', '');
      INIRead.WriteString(READ_TEMPLATE, INI_TEMPLATE_DESC, edReadTplDesc.Text);
      INIRead.WriteString(INI_SETTINGS, INI_FOLDER_DISKDEFS, cbReadTplFormatSrc.Text);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, cbReadTplFormat.Text);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_REVS, cbReadTplRevs.Text);
      INIRead.WriteBool(INI_SETTINGS, INI_TEMPLATE_REVS, cbReadTplRaw.Checked);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_FAKE_INDEX, cbReadTplFakeIndex.Text);
      INIRead.WriteBool(INI_SETTINGS, INI_TEMPLATE_HARD_SECTORS, cbReadTplHardSec.Checked);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_ADJUST_SPEED,cbReadTplAdjustSpeed.Text);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_RETRIES, cbReadTplRetries.Text);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_SEEK_RETRIES, cbReadTplSeekRetries.Text);
      INIRead.WriteString(INI_SETTINGS,INI_TEMPLATE_PLL, cbReadTplPLL.Text);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_DD, cbReadTplDD.Text);

      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_CYLINDERS, cbReadTplCyls.Text);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_HEADS, cbReadTplHeads.Text);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_STEPS, cbReadTplSteps.Text);
      INIRead.WriteBool(INI_SETTINGS, INI_TEMPLATE_HSWAP, cbReadTplHSwap.Checked);
      INIRead.WriteString(INI_SETTINGS, INI_TEMPLATE_FLIPPY, cbReadTplFlippy.Text);
      INIRead.WriteBool(INI_SETTINGS, INI_TEMPLATE_FLIPPY_REV, cbReadTplFlippyReverse.Checked);

      INIRead.WriteBool(INI_SETTINGS, INI_TEMPLATE_LOG_PARAM, cbReadTplLogParam.Checked);
      INIRead.WriteBool(INI_SETTINGS, INI_TEMPLATE_LOG_OUTPUT, cbReadTplLogOutput.Checked);
      INIRead.WriteBool(INI_SETTINGS, INI_TEMPLATE_LOG_ONEFILE, cbReadTplLogBoth.Checked);

      INIRead.Free;

      tmp := cbReadTplName.Text;
      Refresh_Templates_Read_DropDown;
      cbReadTplName.Text := tmp;
      Refresh_Templates_Read;
    finally
    end;
  end;
end;

procedure TForm1.btSetDelaysDefaultClick(Sender: TObject);
begin
  cbSetDelaySelect.Text:= '10';
  cbSetDelayStep.Text:= '5000';
  cbSetDelaySettle.Text:= '15';
  cbSetDelayMotor.Text:= '750';
  cbSetDelayAutoOff.Text:= '10000';
  cbSetDelayPreWrite.Text:='100';
  cbSetDelayPostWrite.Text:='1000';
  cbSetDelayIndexMask.Text:='200';
end;

procedure TForm1.btSetDelaysInfoClick(Sender: TObject);
var
 answer : Integer;
begin
  if fileexists(edGWFile.Text) = true then
  begin
   performModalCmdAction('delays');
  end
  else
  begin
   answer := MessageDlg('Invalid filename or file (' + GW_APP + ') not found!',mtWarning, [mbOK], 0);
   if answer = mrOk then exit;
  end;
end;

procedure TForm1.BtWriteTplDelClick(Sender: TObject);
var
 tmp : string;
 answer : Integer;
begin
  tmp := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  if DirectoryExists(tmp) = false then
   begin
    answer := MessageDlg('In options defined templates folder does not exist!' + chr(10) + 'Cannot delete the selected template!',mtWarning, [mbOK], 0);
    if answer = mrOk then exit;
   end;
  try
    if fileexists(Dircheck(tmp) + cbWriteTplName.Text + GW_INI_WRITE_EXT) then
    begin
     answer := MessageDlg('Do you really want to delete the following template?',mtConfirmation, [mbYes,mbCancel], 0);
     if answer = mrCancel then exit;
     if answer = mrYes then
     begin
      Deletefile(PChar(Dircheck(tmp) + cbWriteTplName.Text + GW_INI_WRITE_EXT));
      Refresh_Templates_Write_DropDown;
     end;
    end;
  finally
  end;
end;

procedure TForm1.BtWriteTplNewClick(Sender: TObject);
begin
 cbWriteTplName.Text := '';
 edWriteTplDesc.Text := '';
 cbWriteTplFormatSrc.ItemIndex:=0;
 cbWriteTplFormat.Text := '';
 cbWriteTplEraseEmpty.Checked := false;
 cbWriteTplFakeIndex.Text := '';
 cbWriteTplHardSec.Checked := false;
 cbWriteTplNoVerify.Checked := false;
 cbWriteTplRetries.Text := '';
 cbWriteTplPrecomp.Text := '';
 cbWriteTplPreErase.Checked := false;
 cbWriteTplDensel.Text := '';
 cbWriteTplTplTP43Pin2.Checked:= false;
 btWriteTplDel.Enabled := false;
 //
 cbWriteTplCyls.Text := '';
 cbWriteTplHeads.Text := '';
 cbWriteTplSteps.Text := '';
 cbWriteTplHSwap.Checked := false;
 cbWriteTplFlippy.Text := '';
 cbWriteTplFlippyReverse.Checked := false;
 Refresh_WriteFormSpec;
 CMD_Generate;
end;

procedure TForm1.BtWriteTplSaveClick(Sender: TObject);
var
 tmp: string;
 IniWrite: TIniFile;
 answer : Integer;
begin
 if cbWriteTplName.Text = '' then
  begin
   answer := MessageDlg('Please define a template name!',mtInformation, [mbOK], 0);
   if answer = mrOk then exit;
  end;

 tmp := INI.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
 if tmp = '' then CreateDir(sAppPath + PATH_TEMPLATES + PATH_SPECIFIER);
 if DirectoryExists(tmp) = false then
  begin
   answer := MessageDlg('In options defined templates folder does not exist.' + chr(10) + 'Please redefine! Template is not saved.',mtWarning, [mbOK], 0);
   if answer = mrOk then exit;
  end;

 if cbWriteTplName.Text <> '' then
  begin
   IniWrite := TINIFile.Create(DirCheck(tmp) + cbWriteTplName.Text + GW_INI_WRITE_EXT);
   try
    IniWrite.DeleteKey(INI_SETTINGS,INI_TEMPLATE_LEGACY_RPM); // older than 2.00
    IniWrite.DeleteKey(INI_SETTINGS,INI_TEMPLATE_LEGACY_ERASE_EMPTY); // older than 2.00
    IniWrite.DeleteKey(INI_SETTINGS,INI_TEMPLATE_LEGACY_NO_VERIFY); // older than 2.00
    IniWrite.WriteString(WRITE_TEMPLATE, INI_VERSION, '3.00');
    IniWrite.WriteString(WRITE_TEMPLATE, INI_TEMPLATE_NAME, cbWriteTplName.Text);
    //IniWrite.WriteString(WRITE_TEMPLATE, 'Creator', '');
    IniWrite.WriteString(WRITE_TEMPLATE, INI_TEMPLATE_DESC, edWriteTplDesc.Text);
    IniWrite.WriteString(INI_SETTINGS, INI_FOLDER_DISKDEFS, cbWriteTplFormatSrc.Text);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, cbWriteTplFormat.Text);
    IniWrite.WriteBool(INI_SETTINGS, INI_TEMPLATE_ERASE_EMPTY, cbWriteTplEraseEmpty.Checked);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_FAKE_INDEX, cbWriteTplFakeIndex.Text);
    IniWrite.WriteBool(INI_SETTINGS, INI_TEMPLATE_HARD_SECTORS, cbWriteTplHardSec.Checked);
    IniWrite.WriteBool(INI_SETTINGS, INI_TEMPLATE_NO_VERIFY, cbWriteTplNoVerify.Checked);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_RETRIES, cbWriteTplRetries.Text);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_PRE_COMP, cbWriteTplPrecomp.Text);
    IniWrite.WriteBool(INI_SETTINGS, INI_TEMPLATE_PRE_ERASE, cbWriteTplPreErase.Checked);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_DD, cbWriteTplDensel.Text);
    IniWrite.WriteBool(INI_SETTINGS, INI_TEMPLATE_TP43_PIN2, cbWriteTplTplTP43Pin2.Checked);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_CYLINDERS, cbWriteTplCyls.Text);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_HEADS, cbWriteTplHeads.Text);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_STEPS, cbWriteTplSteps.Text);
    IniWrite.WriteBool(INI_SETTINGS, INI_TEMPLATE_HSWAP, cbWriteTplHSwap.Checked);
    IniWrite.WriteString(INI_SETTINGS, INI_TEMPLATE_FLIPPY, cbWriteTplFlippy.Text);
    IniWrite.WriteBool(INI_SETTINGS, INI_TEMPLATE_FLIPPY_REV, cbWriteTplFlippyReverse.Checked);

    IniWrite.Free;

    tmp := cbWriteTplName.Text;
    Refresh_Templates_Write_DropDown;
    cbWriteTplName.Text := tmp;
    Refresh_Templates_Write;
   finally
   end;
  end;
end;

procedure TForm1.btGWRefreshUSBClick(Sender: TObject);
begin
{$IFDEF WINDOWS}
 Get_DeviceCOM;
{$ELSE}
 Get_DeviceCOMLinux;
{$ENDIF}
end;

procedure TForm1.cbConvTplFlippyReverseClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.Refresh_Templates_Write_DropDown;
var
  Templates_Write: TStringList;
  i: integer;
  TmplFolder : String;
  INITmplFolder : TIniFile;
begin
  try
    INITmplFolder := TINIFile.Create(sAppPath + GW_INI_FILE);
    TmplFolder := INITmplFolder.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
    If TmplFolder = '' then exit;
    INITmplFolder.Free;

    cbWriteTplName.Items.Clear;
    i := 0;
    Templates_Write := FindAllFiles(DirCheck(TmplFolder), '*.iniw', True);
    if Templates_Write.Count = 0 then
    begin
      Templates_Write.Free;
      btWriteTplSave.Enabled:=false;
      btWriteTplDel.Enabled:=false;
      btWriteTplNew.Click;
      exit;
    end;

    while i < Templates_Write.Count do
    begin
      cbwriteTplName.Items.Add(
        ExtractFilename(ExtractFileName_WithoutExt(Templates_Write.Strings[i])));
      Inc(i);
    end;
    Templates_Write.Free;
    cbWriteTplName.ItemIndex := 0;
    Refresh_Templates_Write;
  finally
  end;
end;

procedure TForm1.Refresh_Templates_Write;
var
  iniRefreshWrite, INITmplFolder: TiniFile;
  TmplFolder: String;
begin
  //Read-Template
  INITmplFolder := TINIFile.Create(sAppPath + GW_INI_FILE);
  TmplFolder := INITmplFolder.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  If TmplFolder = '' then exit;
  INITmplFolder.Free;

  iniRefreshWrite := TINIFile.Create(DirCheck(TmplFolder) + cbWriteTplName.Text + GW_INI_WRITE_EXT);
  try
    //ver := iniRefreshRead.ReadString(WRITE_TEMPLATE,INI_VERSION,'');
    //name := iniRefreshRead.ReadString(WRITE_TEMPLATE, INI_TEMPLATE_NAME, '');
    //creator := iniRefreshRead.ReadString(WRITE_TEMPLATE, 'Creator', '');
    cbWriteTplFormatSrc.Text := iniRefreshWrite.ReadString(INI_SETTINGS, INI_FOLDER_DISKDEFS, 'Internal');
    Refresh_WriteFormSpec;
    cbWriteTplFormat.Text := iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, '');
    edWriteTplDesc.Text   := iniRefreshWrite.ReadString(WRITE_TEMPLATE, INI_TEMPLATE_DESC, '');
    cbWriteTplEraseEmpty.checked := iniRefreshWrite.ReadBool(INI_SETTINGS, INI_TEMPLATE_ERASE_EMPTY, false);
    cbWriteTplFakeIndex.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_FAKE_INDEX, '');
    cbWriteTplHardSec.checked := iniRefreshWrite.ReadBool(INI_SETTINGS, INI_TEMPLATE_HARD_SECTORS, false);
    cbWriteTplNoVerify.checked := iniRefreshWrite.ReadBool(INI_SETTINGS, INI_TEMPLATE_NO_VERIFY, false);
    cbWriteTplRetries.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_RETRIES, '');
    cbWriteTplPrecomp.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_PRE_COMP, '');
    cbWriteTplPreErase.Checked:= iniRefreshWrite.ReadBool(INI_SETTINGS, INI_TEMPLATE_PRE_ERASE, false);
    cbWriteTplDensel.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_DD, '');
    cbWriteTplTplTP43Pin2.Checked := IniRefreshWrite.ReadBool(INI_SETTINGS, INI_TEMPLATE_TP43_PIN2, false);

    cbWriteTplCyls.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_CYLINDERS, '');
    cbWriteTplHeads.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_HEADS, '');
    cbWriteTplSteps.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_STEPS, '');
    cbWriteTplHSwap.Checked:= iniRefreshWrite.ReadBool(INI_SETTINGS, INI_TEMPLATE_HSWAP, false);
    cbWriteTplFlippy.Text:= iniRefreshWrite.ReadString(INI_SETTINGS, INI_TEMPLATE_FLIPPY, '');
    cbWriteTplFlippyReverse.checked := iniRefreshWrite.ReadBool(INI_SETTINGS, INI_TEMPLATE_FLIPPY_REV, false);

    iniRefreshWrite.Free;
  finally
    CMD_Generate;
  end;
end;

procedure TForm1.Refresh_Templates_Read_DropDown;
var
  Templates_Read: TStringList;
  i: integer;
  TmplFolder : String;
  INITmplFolder : TIniFile;
begin
  try
    INITmplFolder := TINIFile.Create(sAppPath + GW_INI_FILE);
    TmplFolder := INITmplFolder.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
    If TmplFolder = '' then exit;
    INITmplFolder.Free;

    cbReadTplname.Items.Clear;
    i := 0;
    Templates_Read := FindAllFiles(DirCheck(TmplFolder), '*.inir', True);
    if Templates_Read.Count = 0 then
    begin
      Templates_Read.Free;
      btReadTplSave.Enabled:=false;
      btReadTplDel.Enabled:=false;
      btReadTplNew.Click;
      exit;
    end;

    while i < Templates_Read.Count do
    begin
      cbReadTplName.Items.Add(
        ExtractFilename(ExtractFileName_WithoutExt(Templates_Read.Strings[i])));
      Inc(i);
    end;
    Templates_Read.Free;
    cbReadTplName.ItemIndex := 0;
    Refresh_Templates_Read;
  finally
  end;
end;

procedure TForm1.Refresh_Templates_Read;
var
  iniRefreshRead, INITmplFolder: TiniFile;
  TmplFolder: String;
begin
  //Read-Template
  INITmplFolder := TINIFile.Create(sAppPath + GW_INI_FILE);
  TmplFolder := INITmplFolder.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  If TmplFolder = '' then exit;
  INITmplFolder.Free;

  iniRefreshRead := TINIFile.Create(DirCheck(TmplFolder) + cbReadTplName.Text + GW_INI_READ_EXT);
  try
    edReadTplDesc.Text := iniRefreshRead.ReadString(READ_TEMPLATE, INI_TEMPLATE_DESC, '');

    cbReadTplFormatSrc.Text        := iniRefreshRead.ReadString(INI_SETTINGS, INI_FOLDER_DISKDEFS, 'Internal');
    Refresh_ReadFormSpec;
    cbReadTplFormat.Text           := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, '');
    cbReadTplRevs.Text             := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_REVS, '');
    cbReadTplRaw.Checked           := iniRefreshRead.ReadBool(INI_SETTINGS, INI_TEMPLATE_REVS, false);
    cbReadTplFakeIndex.Text        := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FAKE_INDEX, '');
    cbReadTplHardSec.Checked       := iniRefreshRead.ReadBool(INI_SETTINGS, INI_TEMPLATE_HARD_SECTORS, false);
    cbReadTplAdjustSpeed.Text      := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_ADJUST_SPEED, '');
    cbReadTplRetries.Text          := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_RETRIES, '');
    cbReadTplSeekRetries.Text      := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_SEEK_RETRIES, '');
    cbReadTplPLL.Text              := iniRefreshRead.ReadString(INI_SETTINGS,INI_TEMPLATE_PLL, '');
    cbReadTplDD.Text               := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_DD, '');

    cbReadTplCyls.Text             := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_CYLINDERS, '');
    cbReadTplHeads.Text            := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_HEADS, '');
    cbReadTplSteps.Text            := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_STEPS, '');
    cbReadTplHSwap.Checked         := iniRefreshRead.ReadBool(INI_SETTINGS, INI_TEMPLATE_HSWAP, false);
    cbReadTplFlippy.Text           := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FLIPPY, '');
    cbReadTplFlippyReverse.Checked := iniRefreshRead.ReadBool(INI_SETTINGS, INI_TEMPLATE_FLIPPY_REV, false);

    cbReadTplLogParam.Checked      := iniRefreshRead.ReadBool(INI_SETTINGS, INI_TEMPLATE_LOG_PARAM, false);
    cbReadTplLogOutput.Checked     := iniRefreshRead.ReadBool(INI_SETTINGS, INI_TEMPLATE_LOG_OUTPUT, false);
    cbReadTplLogBoth.Checked       := iniRefreshRead.ReadBool(INI_SETTINGS, INI_TEMPLATE_LOG_ONEFILE, false);

    iniRefreshRead.Free;
  finally
    CMD_Generate;
  end;
end;

procedure TForm1.cbConvAdjustSpeedChange(Sender: TObject);
begin
  if cbConvAdjustSpeed.Focused then CMD_Generate;
end;

procedure TForm1.cbConvDigitsChange(Sender: TObject);
begin
  if cbConvDigits.Focused then  Create_Filename;
end;

procedure TForm1.cbConvDisk1Change(Sender: TObject);
begin
  if cbConvDisk1.Focused then  Create_Filename;
end;

procedure TForm1.cbConvDisk2Change(Sender: TObject);
begin
  if cbConvDisk2.Focused then  Create_Filename;
end;

procedure TForm1.cbConvDiskdefsChange(Sender: TObject);
begin
 if cbConvDiskdefs.Focused then
  begin
   if cbConvDiskdefs.Text = 'Internal' then
    begin
     cbConvFormat.Clear;
     cbConvFormat.items.Text := FormatSpecs_Conv.Text;
    end;
   if cbConvDiskdefs.Text <> 'Internal' then
    begin
     Get_FormatSpecs_Conv;
    end;
   CMD_Generate;
  end;
end;

procedure TForm1.cbConvFormatOptionChange(Sender: TObject);
begin
 Create_Filename;
end;

procedure TForm1.cbConvIndexMarksChange(Sender: TObject);
begin
 if cbConvIndexMarks.Focused then CMD_Generate;
end;

procedure TForm1.cbGWHWChange(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TForm1.cbReadTplDDChange(Sender: TObject);
begin
 if cbReadTplDD.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplFlippyReverseClick(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TForm1.cbReadTplHardSecClick(Sender: TObject);
begin
 if cbReadTplHardSec.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplSeekRetries1Change(Sender: TObject);
begin
 if cbReadTplPLL.Focused then CMD_Generate;
end;

procedure TForm1.cbSetDelayAutoOffChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetDelayIndexMaskChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetDelayMotorChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetDelayPostWriteChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetDelayPreWriteChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetDelaySelectChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetDelaySettleChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetDelayStepChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetFirmwareBootloaderClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetPINLevelChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetPINNumberChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSrcAsDesDirChange(Sender: TObject);
begin
 if cbSrcAsDesDir.Checked then edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
 if cbSrcAsDesDir.Checked = false then edConvDirDest.Directory :=INI.ReadString(FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');
end;

procedure TForm1.cbSrcAsDesFileChange(Sender: TObject);
begin
  if cbSrcAsDesFile.Checked then
   begin
   if edConvFileSource.Text <> '' then
    begin
     edConvFilename.text:= ExtractFileNameOnly(edConvFileSource.Text);
    end;
   end;
  if cbSrcAsDesFile.Checked = false then edConvFilename.text:= '';
  Create_Filename;
end;

procedure TForm1.cbToolsCleanCylChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsCleanLingerChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsCleanPassesChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsCleanPassesEnter(Sender: TObject);
begin
 cbToolsCleanPasses.SelectAll;
end;

procedure TForm1.cbToolsEraseCylChange(Sender: TObject);
begin
  if cbToolsEraseCyl.Text <> '' then
   begin
     lblToolsEraseHeads.Enabled := true;
     cbToolsEraseHeads.Enabled := true;
     lblToolsEraseSteps.Enabled := true;
     cbToolsEraseSteps.Enabled := true;
     lblToolsEraseHSwap.Enabled := true;
     cbToolsEraseHSwap.Enabled := true;
     lblToolsEraseFlippy.Enabled := true;
     cbToolsEraseFlippy.Enabled := true;
   end
   else
   begin
     lblToolsEraseHeads.Enabled := false;
     cbToolsEraseHeads.Enabled := false;
     lblToolsEraseSteps.Enabled := false;
     cbToolsEraseSteps.Enabled := false;
     lblToolsEraseHSwap.Enabled := false;
     cbToolsEraseHSwap.Enabled := false;
     lblToolsEraseFlippy.Enabled := false;
     cbToolsEraseFlippy.Enabled := false;
   end;
   if cbToolsEraseCyl.Focused then CMD_Generate;
end;

procedure TForm1.cbToolsEraseFakeIndexChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsEraseFlippyChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsEraseHeadsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsEraseHSwapClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsEraseRevsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsEraseStepsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsRPMNumbIterChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsRPMNumbIterEnter(Sender: TObject);
begin
 cbToolsRPMNumbIter.SelectAll;
end;

procedure TForm1.cbToolsSeekMotorOnClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsSeekTrackChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbToolsSeekTrackEnter(Sender: TObject);
begin
 cbToolsSeekTrack.SelectAll;
end;

procedure TForm1.cbToolsSeekTrackForceClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbWriteTplDenselChange(Sender: TObject);
begin
  if cbWriteTplDensel.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplFlippyReverseClick(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TForm1.cbWriteTplHardSecChange(Sender: TObject);
begin
  if cbWriteTplHardSec.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplPreEraseChange(Sender: TObject);
begin
  if cbWriteTplPreErase.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplTplTP43Pin2Change(Sender: TObject);
begin
 if cbWriteTplTplTP43Pin2.Focused then CMD_Generate;
end;

procedure TForm1.edConvDiskOfChange(Sender: TObject);
begin
  if edConvDiskOf.Focused then  Create_Filename;
end;

procedure TForm1.cbConvFileFormatChange(Sender: TObject);
begin
 cbConvFormatOption.ItemIndex := -1;
 cbConvFormatOption.Items.Clear;
 cbConvFormatOption.Enabled:= false;

 //TODO: Read these form an XML file
 if cbConvFileFormat.Text = 'SCP (SuperCardPro)' then
 begin
  cbConvFormatOption.Enabled:= true;
  cbConvFormatOption.Items.Clear;
  cbConvFormatOption.ItemIndex := -1;
  cbConvFormatOption.Items.Add('');
  cbConvFormatOption.Items.Add('::disktype=amiga');
  cbConvFormatOption.Items.Add('::disktype=amigahd');
  cbConvFormatOption.Items.Add('::disktype=c64');
  cbConvFormatOption.Items.Add('::disktype=amstrad-cpc');
  cbConvFormatOption.Items.Add('::disktype=apple-1m44');
  cbConvFormatOption.Items.Add('::disktype=apple-400k');
  cbConvFormatOption.Items.Add('::disktype=apple-800k');
  cbConvFormatOption.Items.Add('::disktype=appleii');
  cbConvFormatOption.Items.Add('::disktype=appleiipro');
  cbConvFormatOption.Items.Add('::disktype=atari800-dd');
  cbConvFormatOption.Items.Add('::disktype=atari800-ed ');
  cbConvFormatOption.Items.Add('::disktype=atari800-sd');
  cbConvFormatOption.Items.Add('::disktype=atarist-ds');
  cbConvFormatOption.Items.Add('::disktype=atarist-ss');
  cbConvFormatOption.Items.Add('::disktype=hdd-mfm');
  cbConvFormatOption.Items.Add('::disktype=hdd-rll');
  cbConvFormatOption.Items.Add('::disktype=ibmpc-1m2');
  cbConvFormatOption.Items.Add('::disktype=ibmpc-1m44');
  cbConvFormatOption.Items.Add('::disktype=ibmpc-360k');
  cbConvFormatOption.Items.Add('::disktype=ibmpc-720k');
  cbConvFormatOption.Items.Add('::disktype=other-1m2');
  cbConvFormatOption.Items.Add('::disktype=other-1m44');
  cbConvFormatOption.Items.Add('::disktype=other-320k');
  cbConvFormatOption.Items.Add('::disktype=other-720k');
  cbConvFormatOption.Items.Add('::disktype=roland-d20');
  cbConvFormatOption.Items.Add('::disktype=tape-gcr1');
  cbConvFormatOption.Items.Add('::disktype=tape-gcr2');
  cbConvFormatOption.Items.Add('::disktype=tape-mfm');
  cbConvFormatOption.Items.Add('::disktype=ti-99/4a');
  cbConvFormatOption.Items.Add('::disktype=trs80_dsdd');
  cbConvFormatOption.Items.Add('::disktype=trs80_dssd');
  cbConvFormatOption.Items.Add('::disktype=trs80_ssdd');
  cbConvFormatOption.Items.Add('::disktype=trs80_sssd');
  cbConvFormatOption.ItemIndex := 0;
 end;
 if cbConvFileFormat.Text = 'HFE (HxC Floppy Emulator)' then
 begin
  cbConvFormatOption.Enabled:= true;
  cbConvFormatOption.ItemIndex := -1;
  cbConvFormatOption.Items.Clear;
  cbConvFormatOption.Items.Add('');
  cbConvFormatOption.Items.Add('::bitrate=125');
  cbConvFormatOption.Items.Add('::bitrate=250');
  cbConvFormatOption.Items.Add('::bitrate=300');
  cbConvFormatOption.Items.Add('::bitrate=500');
  cbConvFormatOption.ItemIndex := 0;

  //HFEVersion
  cbConvFormatOptionHFEVer.ItemIndex := -1;
  cbConvFormatOptionHFEVer.Enabled:= true;

  //HLE InterfaceMode
  cbConvFormatOptionHFEInt.Items.Clear;
  cbConvFormatOptionHFEInt.ItemIndex := -1;
  cbConvFormatOptionHFEInt.Enabled:= true;
  cbConvFormatOptionHFEInt.Items.Add('');
  cbConvFormatOptionHFEInt.Items.Add('::interface=IBMPC_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=IBMPC_HD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=ATARIST_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=ATARIST_HD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=AMIGA_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=AMIGA_HD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=CPC_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=GENERIC_SHUGART_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=IBMPC_ED');
  cbConvFormatOptionHFEInt.Items.Add('::interface=MSX2_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=C64_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=EMU_SHUGART');
  cbConvFormatOptionHFEInt.Items.Add('::interface=S950_DD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=S950_HD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=S950_DD_HD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=IBMPC_DD_HD');
  cbConvFormatOptionHFEInt.Items.Add('::interface=QUICKDISK');
  cbConvFormatOptionHFEInt.Items.Add('::interface=UNKNOWN');
  cbConvFormatOptionHFEInt.ItemIndex := 0;

  //HLE EncodingType
  cbConvFormatOptionHFEEnc.Items.Clear;
  cbConvFormatOptionHFEEnc.ItemIndex := -1;
  cbConvFormatOptionHFEEnc.Enabled:= true;
  cbConvFormatOptionHFEEnc.Items.Add('');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=ISOIBM_MFM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=AMIGA_MFM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=ISOIBM_FM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=EMU_FM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=TYCOM_FM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=MEMBRAIN_MFM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_GCR1');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_GCR2');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_HDDD_A2_GCR1');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_HDDD_A2_GCR2');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=ARBURGDAT');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=ARBURGSYS');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=AED6200P_MFM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=NORTHSTAR_HS_MFM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=HEATHKIT_HS_FM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=DEC_RX02_M2FM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=APPLEMAC_GCR');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=QD_MO5');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=C64_GCR');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=VICTOR9K_GCR');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=MICRALN_HS_FM');
  cbConvFormatOptionHFEEnc.Items.Add('::encoding=UNKNOWN');
  cbConvFormatOptionHFEEnc.ItemIndex := 0;
 end;
 Create_Filename;
end;

procedure TForm1.cbConvFormatChange(Sender: TObject);
begin
 if cbConvFormat.Focused then
  begin
   CMD_Generate;
 end;
end;

procedure TForm1.cbConvIncrementClick(Sender: TObject);
begin
  if cbConvIncrement.Focused then CMD_Generate;
end;

procedure TForm1.cbConvNoOverwriteClick(Sender: TObject);
begin
  if cbConvNoOverwrite.Focused then CMD_Generate;
end;

procedure TForm1.cbConvOutTracksetCylsChange(Sender: TObject);
begin
 if cbConvOutTracksetCyls.Text <> '' then
 begin
   cbConvOutTracksetHeads.Enabled := true;
   cbConvOutTracksetSteps.Enabled := true;
   cbConvOutTracksetHSwap.Enabled := true;
   cbConvOutTracksetFlippy.Enabled := true;
   cbConvTplFlippyReverse.Enabled := true;
 end
 else
 begin
   cbConvOutTracksetHeads.Enabled := false;
   cbConvOutTracksetSteps.Enabled := false;
   cbConvOutTracksetHSwap.Enabled := false;
   cbConvOutTracksetFlippy.Enabled := false;
   cbConvTplFlippyReverse.Enabled := false;
 end;
 CMD_Generate;
end;

procedure TForm1.cbConvOutTracksetFlippyChange(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TForm1.cbConvOutTracksetHeadsChange(Sender: TObject);
begin
 if cbConvOutTracksetHeads.Focused then CMD_Generate;
end;

procedure TForm1.cbConvOutTracksetHSwapClick(Sender: TObject);
begin
   if cbConvOutTracksetHSwap.Focused then CMD_Generate;
end;

procedure TForm1.cbConvOutTracksetStepsChange(Sender: TObject);
begin
   if cbConvOutTracksetSteps.Focused then CMD_Generate;
end;

procedure TForm1.cbConvPLLChange(Sender: TObject);
begin
  if cbConvPLL.Focused then CMD_Generate;
end;

procedure TForm1.cbConvTracksetCylsChange(Sender: TObject);
begin
  if cbConvTracksetCyls.Text <> '' then
 begin
   cbConvTracksetHeads.Enabled := true;
   cbConvTracksetSteps.Enabled := true;
   cbConvTracksetHSwap.Enabled := true;
   cbConvTracksetFlippy.Enabled := true;
 end
 else
 begin
   cbConvTracksetHeads.Enabled := false;
   cbConvTracksetSteps.Enabled := false;
   cbConvTracksetHSwap.Enabled := false;
   cbConvTracksetFlippy.Enabled := false;
 end;
 if cbConvTracksetCyls.Focused then CMD_Generate;
end;

procedure TForm1.cbConvTracksetFlippyChange(Sender: TObject);
begin
   if cbConvTracksetFlippy.Focused then CMD_Generate;
end;

procedure TForm1.cbConvTracksetHeadsChange(Sender: TObject);
begin
   if cbConvTracksetHeads.Focused then CMD_Generate;
end;
procedure TForm1.cbConvTracksetHSwapClick(Sender: TObject);
begin
   if cbConvTracksetHSwap.Focused then CMD_Generate;
end;

procedure TForm1.cbConvTracksetStepsChange(Sender: TObject);
begin
   if cbConvTracksetSteps.Focused then CMD_Generate;
end;

procedure TForm1.cbGWDevCOMChange(Sender: TObject);
begin
   if cbGWDevCOM.Focused then CMD_Generate;
end;

procedure TForm1.cbGWDriveChange(Sender: TObject);
begin
   if cbGWDrive.Focused then CMD_Generate;
end;

procedure TForm1.cbReadNoOverwriteClick(Sender: TObject);
begin
   CMD_Generate;
end;

procedure TForm1.cbReadPreviewChange(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TForm1.cbReadTplAdjustSpeedChange(Sender: TObject);
begin
  if cbReadTplAdjustSpeed.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplCylsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbReadTplFakeIndexChange(Sender: TObject);
begin
  if cbReadTplFakeIndex.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplFlippyChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbReadTplFormatChange(Sender: TObject);
begin
  if cbReadTplFormat.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplFormatSrcChange(Sender: TObject);
begin
 Refresh_ReadFormSpec;
end;

procedure TForm1.Refresh_ReadFormSpec;
begin
  if cbReadTplFormatSrc.Text = 'Internal' then
   begin
    cbReadTplFormat.Clear;
    cbReadTplFormat.items.Text := FormatSpecs_Read.Text;
    cbReadTplFormat.ItemIndex:=0;
   end;
  if cbReadTplFormatSrc.Text <> 'Internal' then
   begin
    Get_FormatSpecs_Read;
   end;
  CMD_Generate;
end;

procedure TForm1.Get_FormatSpecs_Read;
var
  i, l : integer;
  tmp : string;
begin
  FormatSpecs_ReadDiskDefs := TStringList.Create;
  FormatSpecs_ReadDiskDefs.Clear;
  dd := DirCheck(INI.ReadString(FLUX_INI_NAME, GW_DISKDEF_FOLDER, '')) + cbReadTplFormatSrc.Text + GW_CONFIG_EXT;
  if fileexists(dd) then
   begin
    FormatSpecs_ReadDiskDefs.Add('');
    Memo1.Clear;
    Memo1.Lines.LoadFromFile(dd);
    for i := 0 to Memo1.Lines.Count - 1 do
     begin
      if Memo1.Lines[i].StartsWith('disk ') = true then
       begin
        tmp := TrimLeft(Memo1.Lines[i]);
        l := length(tmp);
        FormatSpecs_ReadDiskDefs.Add(TrimRight(RightStr(tmp,l-5)));
       end;
      end;
     cbReadTplFormat.Clear;
     cbReadTplFormat.items.Text := FormatSpecs_ReadDiskDefs.Text;
     cbReadTplFormat.ItemIndex:=0;
    end;
  if fileexists(dd) = false then
   begin
    cbReadTplFormat.Clear;
   end;
end;

procedure TForm1.Get_FormatSpecs_Write;
var
  i, l  : integer;
  tmp : string;
begin
  FormatSpecs_WriteDiskDefs := TStringList.Create;
  FormatSpecs_WriteDiskDefs.Clear;
  dd := DirCheck(INI.ReadString(FLUX_INI_NAME, GW_DISKDEF_FOLDER, '')) + cbWriteTplFormatSrc.Text + GW_CONFIG_EXT;
  if fileexists(dd) then
   begin
    FormatSpecs_WriteDiskDefs.Add('');
    Memo1.Clear;
    Memo1.Lines.LoadFromFile(dd);
    for i := 0 to Memo1.Lines.Count - 1 do
     begin
      if Memo1.Lines[i].StartsWith('disk ') = true then
       begin
        tmp := TrimLeft(Memo1.Lines[i]);
        l := length(tmp);
        FormatSpecs_WriteDiskDefs.Add(TrimRight(RightStr(tmp,l-5)));
       end;
      end;
     cbWriteTplFormat.Clear;
     cbWriteTplFormat.items.Text := FormatSpecs_WriteDiskDefs.Text;
     cbWriteTplFormat.ItemIndex:=0;
    end;
  if fileexists(dd) = false then
   begin
    cbWriteTplFormat.Clear;
   end;
end;

procedure TForm1.Get_FormatSpecs_Conv;
var
 i, l : integer;
 tmp : string;
begin
 FormatSpecs_ConvDiskDefs := TStringList.Create;
 FormatSpecs_ConvDiskDefs.Clear;
 dd := DirCheck(INI.ReadString(FLUX_INI_NAME, GW_DISKDEF_FOLDER, '')) + cbConvDiskdefs.Text + GW_CONFIG_EXT;
 if fileexists(dd) then
  begin
   FormatSpecs_ConvDiskDefs.Add('');
   Memo1.Clear;
   Memo1.Lines.LoadFromFile(dd);
   for i := 0 to Memo1.Lines.Count - 1 do
    begin
     if Memo1.Lines[i].StartsWith('disk ') = true then
      begin
       tmp := TrimLeft(Memo1.Lines[i]);
       l := length(tmp);
       FormatSpecs_ConvDiskDefs.Add(TrimRight(RightStr(tmp,l-5)));
      end;
     end;
   cbConvFormat.Clear;
   cbConvFormat.items.Text := FormatSpecs_ConvDiskDefs.Text;
   cbConvFormat.ItemIndex:=0;
  end;
 if fileexists(dd) = false then
  begin
   cbConvFormat.Clear;
  end;
end;

procedure TForm1.lblToolsEraseHFreqClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.mnuAboutClick(Sender: TObject);
begin
  FrmAbout.showmodal;
end;

procedure TForm1.mnuHelpClick(Sender: TObject);
begin

end;

procedure TForm1.mnuOptionsClick(Sender: TObject);
begin
  FrmOptions.showmodal;
end;

procedure TForm1.mnuArgumentsClick(Sender: TObject);
begin
  If mnuArguments.Checked = true then
   begin
    mnuArguments.Checked:=false;
    Set_View;
    CMD_Generate;
    exit;
   end;

  If mnuArguments.Checked = false then
   begin
    mnuArguments.Checked:=true;
    Set_View;
    CMD_Generate;
    exit;
   end;
end;

procedure TForm1.Set_View;
begin
 // Show all arguments

  If mnuArguments.Checked = true then
  begin

   // Read
   gbReadArg.Caption:= 'Arguments (All):';
   pnReadAllArg.Visible := true;

   // Write
   gbWriteArg.Caption:= 'Arguments (All):';
   pnWriteAllArg.Visible := true;

   //Conv
   gbConvArg.Caption:= 'Arguments (All):';
   pnConvAllArg.Visible := true;

   exit;
  end; // true

 If mnuArguments.Checked = False then
  begin

   // Read
   gbReadArg.Caption:= 'Arguments (Only "format spec"):';
   pnReadAllArg.Visible := false;

   // Write
   gbWriteArg.Caption:= 'Arguments (Only "format spec"):';
   pnWriteAllArg.Visible := false;

   //Conv
   gbConvArg.Caption:= 'Arguments (Only "format spec"):';
   pnConvAllArg.Visible := false;
   exit;
  end; // false

end;

procedure LaunchURL(const URL: string);
var
  Proc: TProcess;
begin
  {$IFDEF WINDOWS}
  OpenURL(URL);
  {$ELSE}
  if URL <> '' then
  begin
    Proc := TProcess.Create(nil);
    try
      Proc.Executable := 'xdg-open';
      Proc.Parameters.Add(URL);
      Proc.Options := [poNoConsole, poWaitOnExit];
      Proc.Execute;
    finally
      Proc.Free;
    end;
  end;
  {$ENDIF}
end;



procedure TForm1.mnuFMFFClick(Sender: TObject);
begin
  LaunchURL('https://github.com/nistunedev/FluxFloppyEditor');
end;

procedure TForm1.mnuGWDownloadClick(Sender: TObject);
begin
  LaunchURL('https://github.com/keirf/greaseweazle/wiki/Download-Host-Tools');
end;

procedure TForm1.mnuGWGettingStartedClick(Sender: TObject);
begin
 LaunchURL('https://github.com/keirf/greaseweazle/wiki/Getting-Started');
end;

procedure TForm1.mnuWebsiteClick(Sender: TObject);
begin
 LaunchURL('https://github.com/keirf/Greaseweazle');
end;

procedure TForm1.opSetFWFileClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.opSetFWOnlineClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.opSetFWTagClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.pcActionsChange(Sender: TObject);
begin
  Set_View;
  btGo.Default:=false;
  if pcActions.ActivePageIndex = GW_PROP_PAGE_READ then
   begin
    if cbReadTplName.Text <> '' then
    begin
     btReadTplSave.Enabled := true;
     btReadTplDel.Enabled := true;
    end;
    btGo.Caption:='Read';
    cbReadTplLogParam.Visible:=true;
    cbReadTplLogOutput.Visible:=true;
    cbReadTplLogBoth.Visible:=true;
   end;
  if pcActions.ActivePageIndex = GW_PROP_PAGE_WRITE then
   begin
    if cbWriteTplName.Text <> '' then
    begin
     btWriteTplSave.Enabled := true;
     btWriteTplDel.Enabled := true;
    end;
    btGo.Caption:='Write';
    cbReadTplLogParam.Visible:=false;
    cbReadTplLogOutput.Visible:=false;
    cbReadTplLogBoth.Visible:=false;
   end;
  if pcActions.ActivePageIndex = GW_PROP_PAGE_CONVERT then
   begin
    btGo.Caption:='Convert';
    pcActions.ActivePage.Height:=20;
    cbReadTplLogParam.Visible:=false;
    cbReadTplLogOutput.Visible:=false;
    cbReadTplLogBoth.Visible:=false;
   end;
  if pcActions.ActivePageIndex = GW_PROP_PAGE_TOOLS then
   begin
    if rbToolsErase.Checked then btGo.Caption:='Erase';
    if rbToolsSeek.Checked then btGo.Caption:='Seek';
    if rbToolsClean.Checked then btGo.Caption:='Clean';
    if rbToolsRPM.Checked then btGo.Caption:='RPM';
    cbReadTplLogParam.Visible:=false;
    cbReadTplLogOutput.Visible:=false;
    cbReadTplLogBoth.Visible:=false;
   end;
  if pcActions.ActivePageIndex = GW_PROP_PAGE_SETTINGS then
   begin
    if rbSetDelays.Checked then btGo.Caption:='Set delays';
    cbReadTplLogParam.Visible:=false;
    cbReadTplLogOutput.Visible:=false;
    cbReadTplLogBoth.Visible:=false;
    if rbSetGetPIN.Checked then
     begin
      if rbGetPIN.Checked then btGo.Caption:='Get PIN';
      if rbSetPIN.Checked then btGo.Caption:='Set PIN';
     end;
   end;
  CMD_Generate;
 end;

procedure TForm1.rbGetPINClick(Sender: TObject);
begin
   if rbGetPIN.Checked = true then BtGo.Caption:= 'Get PIN';
   if rbSetPIN.Checked = true then BtGo.Caption:= 'Set PIN';
   CMD_Generate;
end;

procedure TForm1.rbSetPINClick(Sender: TObject);
begin
  if rbGetPIN.Checked = true then BtGo.Caption:= 'Get PIN';
  if rbSetPIN.Checked = true then BtGo.Caption:= 'Set PIN';
  CMD_Generate;
end;

procedure TForm1.rbSetDelaysClick(Sender: TObject);
begin
   if FInClick then Exit;
   FInClick := true;

   rbSetDelays.Checked:=true;
   rbSetGetPIN.Checked:=false;
   rbSetFirmware.Checked:=false;
   FInClick := false;

   lblSetPINNumber.Enabled:=false;
   cbSetPINnumber.Enabled:=false;
   rbGetPin.Enabled:=false;
   rbSetPin.Enabled:=false;
   cbSetPINlevel.Enabled:=false;

   btSetDelaysInfo.Enabled:=true;
   btSetDelaysDefault.Enabled:=true;
   lblSetDelaySelect.Enabled:=true;
   lblSetDelayStep.Enabled:=true;
   lblSetDelayMotor.Enabled:=true;
   lblSetDelaySettle.Enabled:=true;
   lblSetDelayAutoOff.Enabled:=true;
   lblSetDelaySelect.Enabled:=true;
   cbSetDelaySelect.Enabled:=true;
   cbSetDelayStep.Enabled:=true;
   cbSetDelayMotor.Enabled:=true;
   cbSetDelaySettle.Enabled:=true;
   cbSetDelayAutoOff.Enabled:=true;

   lblSetFirmwareHint.Enabled:=false;
   opSetFWOnline.Enabled:=false;
   opSetFWFile.Enabled:=false;
   edToolsFW.Enabled:=false;
   opSetFWTag.Enabled:=false;
   edToolsFWTag.Enabled:=false;
   cbSetFirmwareBootloader.Enabled:=false;

   BtGo.Caption:= 'Set delays';
   CMD_Generate;
end;

procedure TForm1.rbSetFirmwareClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;

  rbSetFirmware.Enabled:=true;
  rbSetDelays.Checked:=false;
  rbSetGetPIN.Checked:=false;
  FInClick := false;

  lblSetPINNumber.Enabled:=false;
  cbSetPINnumber.Enabled:=false;
  rbGetPin.Enabled:=false;
  rbSetPin.Enabled:=false;
  cbSetPINlevel.Enabled:=false;

  btSetDelaysInfo.Enabled:=false;
  btSetDelaysDefault.Enabled:=false;
  lblSetDelaySelect.Enabled:=false;
  lblSetDelayStep.Enabled:=false;
  lblSetDelayMotor.Enabled:=false;
  lblSetDelaySettle.Enabled:=false;
  lblSetDelayAutoOff.Enabled:=false;
  lblSetDelaySelect.Enabled:=false;
  cbSetDelaySelect.Enabled:=false;
  cbSetDelayStep.Enabled:=false;
  cbSetDelayMotor.Enabled:=false;
  cbSetDelaySettle.Enabled:=false;
  cbSetDelayAutoOff.Enabled:=false;

  lblSetFirmwareHint.Enabled:=true;
  opSetFWOnline.Enabled:=true;
  opSetFWFile.Enabled:=true;
  edToolsFW.Enabled:=true;
  opSetFWTag.Enabled:=true;
  edToolsFWTag.Enabled:=true;
  cbSetFirmwareBootloader.Enabled:=true;

  BtGo.Caption:= 'Firmware';
  CMD_Generate;
end;

procedure TForm1.rbSetGetPINClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;

  rbSetGetPIN.Checked:=true;
  rbSetDelays.Checked:=false;
  rbSetFirmware.Checked:=false;
  rbSetGetPIN.Enabled:=true;

  FInClick := false;

  lblSetPINNumber.Enabled:=true;
  cbSetPINnumber.Enabled:=true;
  rbGetPin.Enabled:=true;
  rbSetPin.Enabled:=true;
  cbSetPINlevel.Enabled:=true;

  btSetDelaysInfo.Enabled:=false;
  btSetDelaysDefault.Enabled:=false;
  lblSetDelaySelect.Enabled:=false;
  lblSetDelayStep.Enabled:=false;
  lblSetDelayMotor.Enabled:=false;
  lblSetDelaySettle.Enabled:=false;
  lblSetDelayAutoOff.Enabled:=false;
  lblSetDelaySelect.Enabled:=false;
  cbSetDelaySelect.Enabled:=false;
  cbSetDelayStep.Enabled:=false;
  cbSetDelayMotor.Enabled:=false;
  cbSetDelaySettle.Enabled:=false;
  cbSetDelayAutoOff.Enabled:=false;

  lblSetFirmwareHint.Enabled:=false;
  opSetFWOnline.Enabled:=false;
  opSetFWFile.Enabled:=false;
  edToolsFW.Enabled:=false;
  opSetFWTag.Enabled:=false;
  edToolsFWTag.Enabled:=false;
  cbSetFirmwareBootloader.Enabled:=false;

  if rbGetPIN.Checked = true then BtGo.Caption:= 'Get PIN';
  if rbSetPIN.Checked = true then BtGo.Caption:= 'Set PIN';

  CMD_Generate;
end;

procedure TForm1.rbToolsCleanClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;

  rbToolsErase.Checked:=false;
  rbToolsSeek.Checked:=false;
  rbToolsRPM.Checked:=false;
  rbToolsClean.Checked:=true;
  FInClick := false;

  rbToolsClean.Enabled:=true;

  lblToolsEraseCyl.Enabled:=false;
  cbToolsEraseCyl.Enabled:=false;
  lblToolsEraseHeads.Enabled:=false;
  cbToolsEraseHeads.Enabled:=false;
  lblToolsEraseFakeIndex.Enabled:=false;
  cbToolsEraseFakeIndex.Enabled:=false;
  lblToolsEraseHFreq.Enabled:=false;

  lblToolsCleanCyl.Enabled:=true;
  cbToolsCleanCyl.Enabled:=true;
  lblToolsCleanLinger.Enabled:=true;
  cbToolsCleanLinger.Enabled:=true;
  lblToolsCleanPasses.Enabled:=true;
  cbToolsCleanPasses.Enabled:=true;

  lblToolsSeek.Enabled:=false;
  cbToolsSeekTrack.Enabled:=false;
  cbToolsSeekTrackForce.Enabled:=false;
  cbToolsSeekMotorOn.Enabled:=false;

  lblToolsRPMNumbIter.Enabled:=false;
  cbToolsRPMNumbIter.Enabled:=false;

  CMD_Generate;
end;

procedure TForm1.rbToolsEraseClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;

  rbToolsSeek.Checked:=false;
  rbToolsClean.Checked:=false;
  rbToolsRPM.Checked:=false;
  rbToolsErase.Checked:=true;
  FInClick := false;

  rbToolsErase.Enabled:=true;
  lblToolsEraseCyl.Enabled:=true;
  cbToolsEraseCyl.Enabled:=true;
  lblToolsEraseFakeIndex.Enabled:=true;
  cbToolsEraseFakeIndex.Enabled:=true;
  lblToolsEraseHFreq.Enabled:=true;

 if cbToolsEraseCyl.Text <> '' then
 begin
  lblToolsEraseHeads.Enabled:=true;
  cbToolsEraseHeads.Enabled:=true;
  lblToolsEraseSteps.Enabled:=true;
  cbToolsEraseSteps.Enabled:=true;
  lblToolsEraseHSwap.Enabled:=true;
  cbToolsEraseHSwap.Enabled:=true;
  lblToolsEraseFlippy.Enabled:=true;
  cbToolsEraseFlippy.Enabled:=true;
 end
 else
 begin
  lblToolsEraseHeads.Enabled:=false;
  cbToolsEraseHeads.Enabled:=false;
  lblToolsEraseSteps.Enabled:=false;
  cbToolsEraseSteps.Enabled:=false;
  lblToolsEraseHSwap.Enabled:=false;
  cbToolsEraseHSwap.Enabled:=false;
  lblToolsEraseFlippy.Enabled:=false;
  cbToolsEraseFlippy.Enabled:=false;
 end;

  lblToolsCleanCyl.Enabled:=false;
  cbToolsCleanCyl.Enabled:=false;
  lblToolsCleanLinger.Enabled:=false;
  cbToolsCleanLinger.Enabled:=false;
  lblToolsCleanPasses.Enabled:=false;
  cbToolsCleanPasses.Enabled:=false;

  lblToolsSeek.Enabled:=false;
  cbToolsSeekTrack.Enabled:=false;
  cbToolsSeekTrackForce.Enabled:=false;
  cbToolsSeekMotorOn.Enabled:=false;

  lblToolsRPMNumbIter.Enabled:=false;
  cbToolsRPMNumbIter.Enabled:=false;

  CMD_Generate;
end;

procedure TForm1.rbToolsRPMClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;

  rbToolsErase.Checked:=false;
  rbToolsSeek.Checked:=false;
  rbToolsClean.Checked:=false;
  rbToolsRPM.Checked:=true;
  FInClick := false;

  rbToolsRPM.Enabled:=true;

  lblToolsEraseCyl.Enabled:=false;
  cbToolsEraseCyl.Enabled:=false;
  lblToolsEraseHeads.Enabled:=false;
  cbToolsEraseHeads.Enabled:=false;
  lblToolsEraseSteps.Enabled:=false;
  cbToolsEraseSteps.Enabled:=false;
  lblToolsEraseHSwap.Enabled:=false;
  cbToolsEraseHSwap.Enabled:=false;
  lblToolsEraseFlippy.Enabled:=false;
  cbToolsEraseFlippy.Enabled:=false;
  lblToolsEraseFakeIndex.Enabled:=false;
  cbToolsEraseFakeIndex.Enabled:=false;
  lblToolsEraseHFreq.Enabled:=false;

  lblToolsCleanCyl.Enabled:=false;
  cbToolsCleanCyl.Enabled:=false;
  lblToolsCleanLinger.Enabled:=false;
  cbToolsCleanLinger.Enabled:=false;
  lblToolsCleanPasses.Enabled:=false;
  cbToolsCleanPasses.Enabled:=false;

  lblToolsSeek.Enabled:=false;
  cbToolsSeekTrack.Enabled:=false;
  cbToolsSeekTrackForce.Enabled:=false;
  cbToolsSeekMotorOn.Enabled:=false;

  lblToolsRPMNumbIter.Enabled:=true;
  cbToolsRPMNumbIter.Enabled:=true;

  CMD_Generate;
end;

procedure TForm1.rbToolsSeekClick(Sender: TObject);
begin

  if FInClick then Exit;
  FInClick := true;
  rbToolsErase.Checked:=false;
  rbToolsClean.Checked:=false;
  rbToolsRPM.Checked:=false;
  rbToolsSeek.Checked:=true;
  FInClick := false;

  lblToolsEraseCyl.Enabled:=false;
  cbToolsEraseCyl.Enabled:=false;
  lblToolsEraseHeads.Enabled:=false;
  cbToolsEraseHeads.Enabled:=false;
  lblToolsEraseSteps.Enabled:=false;
  cbToolsEraseSteps.Enabled:=false;
  lblToolsEraseHSwap.Enabled:=false;
  cbToolsEraseHSwap.Enabled:=false;
  lblToolsEraseFlippy.Enabled:=false;
  cbToolsEraseFlippy.Enabled:=false;
  lblToolsEraseFakeIndex.Enabled:=false;
  cbToolsEraseFakeIndex.Enabled:=false;
  lblToolsEraseHFreq.Enabled:=false;

  lblToolsCleanCyl.Enabled:=false;
  cbToolsCleanCyl.Enabled:=false;
  lblToolsCleanLinger.Enabled:=false;
  cbToolsCleanLinger.Enabled:=false;
  lblToolsCleanPasses.Enabled:=false;
  cbToolsCleanPasses.Enabled:=false;

  lblToolsSeek.Enabled:=true;
  cbToolsSeekTrack.Enabled:=true;
  cbToolsSeekTrackForce.Enabled:=true;
  cbToolsSeekMotorOn.Enabled:=true;

  lblToolsRPMNumbIter.Enabled:=false;
  cbToolsRPMNumbIter.Enabled:=false;

  CMD_Generate;
end;

procedure TForm1.cbReadTplHeadsChange(Sender: TObject);
begin
  if cbReadTplHeads.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplHSwapChange(Sender: TObject);
begin
  if cbReadTplHSwap.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplNameChange(Sender: TObject);
begin
  if cbReadTplName.Text = '' then
  begin
   btReadTplSave.Enabled := false;
   btReadTplDel.Enabled := false;
  end;
 if cbReadTplName.Text <> '' then
  begin
   btReadTplSave.Enabled := true;
   btReadTplDel.Enabled := true;
  end;
end;

procedure TForm1.cbReadTplNameSelect(Sender: TObject);
begin
 if cbReadTplName.Text = '' then
  begin
   btReadTplSave.Enabled := false;
   btReadTplDel.Enabled := false;
  end;
 if cbReadTplName.Text <> '' then
  begin
   btReadTplSave.Enabled := true;
   btReadTplDel.Enabled := true;
   Refresh_Templates_Read;
  end;
end;

procedure TForm1.cbReadTplPLLChange(Sender: TObject);
begin
  if cbReadTplPLL.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplRawClick(Sender: TObject);
begin
 if cbReadTplRaw.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplRetriesChange(Sender: TObject);
begin
  if cbReadTplRetries.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplRevsChange(Sender: TObject);
begin
  if cbReadTplRevs.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplSeekRetriesChange(Sender: TObject);
begin
  if cbReadTplSeekRetries.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplStepsChange(Sender: TObject);
begin
  if cbReadTplSteps.Focused then CMD_Generate;
end;

procedure TForm1.cbReadTplLogParamClick(Sender: TObject);
begin
 if cbReadTplLogParam.Checked = false then cbReadTplLogBoth.enabled := false;
 if cbReadTplLogParam.Checked = true then
   begin
    if cbReadTplLogOutput.Checked = true then cbReadTplLogBoth.enabled := true;
    if cbReadTplLogOutput.Checked = false then cbReadTplLogBoth.enabled := false;
   end;
end;

procedure TForm1.cbReadTplLogOutputClick(Sender: TObject);
begin
 if cbReadTplLogOutput.Checked = false then cbReadTplLogBoth.enabled := false;
 if cbReadTplLogOutput.Checked = true then
   begin
    if cbReadTplLogParam.Checked = true then cbReadTplLogBoth.enabled := true;
    if cbReadTplLogParam.Checked = false then cbReadTplLogBoth.enabled := false;
   end;
end;

procedure TForm1.cbSetGlobalActionsBacktraceChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbSetGlobalActionsTimeChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbWriteTplCylsChange(Sender: TObject);
begin
 if cbWriteTplCyls.Text <> '' then
  begin
    cbWriteTplHeads.Enabled := true;
    cbWriteTplSteps.Enabled := true;
    cbWriteTplHSwap.Enabled := true;
    cbWriteTplFlippy.Enabled := true;
    cbWriteTplFlippyReverse.Enabled := true;
  end
  else
  begin
    cbWriteTplHeads.Enabled := false;
    cbWriteTplSteps.Enabled := false;
    cbWriteTplHSwap.Enabled := false;
    cbWriteTplFlippy.Enabled := false;
    cbWriteTplFlippyReverse.Enabled := false;
  end;
  CMD_Generate;
end;

procedure TForm1.cbWriteTplEraseEmptyChange(Sender: TObject);
begin
   if cbWriteTplEraseEmpty.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplFakeIndexChange(Sender: TObject);
begin
   if cbWriteTplFakeIndex.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplFlippyChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.cbWriteTplFormatChange(Sender: TObject);
begin
   if cbWriteTplFormat.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplFormatSrcChange(Sender: TObject);
begin
 Refresh_WriteFormSpec;
end;

procedure TForm1.Refresh_WriteFormSpec;
begin
  if cbWriteTplFormatSrc.Text = 'Internal' then
   begin
    cbWriteTplFormat.Clear;
    cbWriteTplFormat.items.Text := FormatSpecs_Write.Text;
    cbWriteTplFormat.ItemIndex:=0;
   end;
  if cbWriteTplFormatSrc.Text <> 'Internal' then
   begin
    Get_FormatSpecs_Write;
   end;
   CMD_Generate;
end;

procedure TForm1.cbWriteTplHeadsChange(Sender: TObject);
begin
   if cbWriteTplHeads.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplHSwapChange(Sender: TObject);
begin
  if cbWriteTplHSwap.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplNameChange(Sender: TObject);
begin
  if cbWriteTplName.Text = '' then
  begin
   btWriteTplSave.Enabled := false;
   btWriteTplDel.Enabled := false;
  end;
 if cbWriteTplName.Text <> '' then
  begin
   btWriteTplSave.Enabled := true;
   btWriteTplDel.Enabled := true;
  end;
end;

procedure TForm1.cbWriteTplNameSelect(Sender: TObject);
begin
  if cbWriteTplName.Text = '' then
  begin
   btWriteTplSave.Enabled := false;
   btWriteTplDel.Enabled := false;
  end;
 if cbWriteTplName.Text <> '' then
  begin
   btWriteTplSave.Enabled := true;
   btWriteTplDel.Enabled := true;
   Refresh_Templates_Write;
  end;
end;

procedure TForm1.cbWriteTplNoVerifyChange(Sender: TObject);
begin
   if cbWriteTplNoVerify.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplPrecompChange(Sender: TObject);
begin
  if cbWriteTplPrecomp.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplRetriesChange(Sender: TObject);
begin
  if cbWriteTplRetries.Focused then CMD_Generate;
end;

procedure TForm1.cbWriteTplStepsChange(Sender: TObject);
begin
  if cbWriteTplSteps.Focused then CMD_Generate;
end;

procedure TForm1.edConvDirDestChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.edConvFilenameChange(Sender: TObject);
begin
 if edConvFilename.Focused then Create_Filename;
end;

procedure TForm1.edConvFileSourceAcceptFileName(Sender: TObject;
  var Value: String);
begin
  if cbSrcAsDesDir.Checked then edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
  if cbSrcAsDesDir.Checked = false then edConvDirDest.Directory :=INI.ReadString(FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');
  if cbSrcAsDesFile.Checked then edConvFilename.text:= ExtractFileNameOnly(edConvFileSource.Text);
  if cbSrcAsDesFile.Checked = false then edConvFilename.text:= '';
  if edConvFileSource.Text <> '' then
   begin
    edConvFileSource.InitialDir := ExtractFilePath(edConvFileSource.Text);
    Create_Filename;
    CMD_Generate;
   end;
end;

procedure TForm1.edConvFileSourceChange(Sender: TObject);
begin
 if cbSrcAsDesDir.Checked then edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
 if cbSrcAsDesDir.Checked = false then edConvDirDest.Directory :=INI.ReadString(FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');
 if cbSrcAsDesFile.Checked then edConvFilename.text:= ExtractFileNameOnly(edConvFileSource.Text);
 if cbSrcAsDesFile.Checked = false then edConvFilename.text:= '';
 if edConvFileSource.Text <> '' then
  begin
   edConvFileSource.InitialDir := ExtractFilePath(edConvFileSource.Text);
   Create_Filename;
   CMD_Generate;
  end;
end;

procedure TForm1.EdGWFileChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.edReadDigitsChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TForm1.edReadDirDestChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.edReadDisk1Change(Sender: TObject);
begin
  Create_Filename;
end;

procedure TForm1.edReadDisk2Change(Sender: TObject);
begin
  Create_Filename;
end;

procedure TForm1.edReadDiskOfChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TForm1.cbReadFormatOptionChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TForm1.EdReadFilenameChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TForm1.cbReadFormatChange(Sender: TObject);
begin
  cbReadFormatOption.Items.Clear;
  cbReadFormatOption.ItemIndex := -1;
  cbReadFormatOption.Enabled:= false;

  //TODO: read from XML file
  if cbReadFormat.Text = 'SCP (SuperCardPro)' then
  begin
   cbReadFormatOption.Items.Clear;
   cbReadFormatOption.ItemIndex := -1;
   cbReadFormatOption.Enabled:= true;
   cbReadFormatOption.Items.Add('');
   cbReadFormatOption.Items.Add('::disktype=amiga');
   cbReadFormatOption.Items.Add('::disktype=amigahd');
   cbReadFormatOption.Items.Add('::disktype=c64');
   cbReadFormatOption.Items.Add('::disktype=amstrad-cpc');
   cbReadFormatOption.Items.Add('::disktype=apple-1m44');
   cbReadFormatOption.Items.Add('::disktype=apple-400k');
   cbReadFormatOption.Items.Add('::disktype=apple-800k');
   cbReadFormatOption.Items.Add('::disktype=appleii');
   cbReadFormatOption.Items.Add('::disktype=appleiipro');
   cbReadFormatOption.Items.Add('::disktype=atari800-dd');
   cbReadFormatOption.Items.Add('::disktype=atari800-ed ');
   cbReadFormatOption.Items.Add('::disktype=atari800-sd');
   cbReadFormatOption.Items.Add('::disktype=atarist-ds');
   cbReadFormatOption.Items.Add('::disktype=atarist-ss');
   cbReadFormatOption.Items.Add('::disktype=hdd-mfm');
   cbReadFormatOption.Items.Add('::disktype=hdd-rll');
   cbReadFormatOption.Items.Add('::disktype=ibmpc-1m2');
   cbReadFormatOption.Items.Add('::disktype=ibmpc-1m44');
   cbReadFormatOption.Items.Add('::disktype=ibmpc-360k');
   cbReadFormatOption.Items.Add('::disktype=ibmpc-720k');
   cbReadFormatOption.Items.Add('::disktype=other-1m2');
   cbReadFormatOption.Items.Add('::disktype=other-1m44');
   cbReadFormatOption.Items.Add('::disktype=other-320k');
   cbReadFormatOption.Items.Add('::disktype=other-720k');
   cbReadFormatOption.Items.Add('::disktype=roland-d20');
   cbReadFormatOption.Items.Add('::disktype=tape-gcr1');
   cbReadFormatOption.Items.Add('::disktype=tape-gcr2');
   cbReadFormatOption.Items.Add('::disktype=tape-mfm');
   cbReadFormatOption.Items.Add('::disktype=ti-99/4a');
   cbReadFormatOption.Items.Add('::disktype=trs80_dsdd');
   cbReadFormatOption.Items.Add('::disktype=trs80_dssd');
   cbReadFormatOption.Items.Add('::disktype=trs80_ssdd');
   cbReadFormatOption.Items.Add('::disktype=trs80_sssd');
   cbReadFormatOption.ItemIndex := 0;
  end;

  if cbReadFormat.Text = 'HFE (HxC Floppy Emulator)' then
  begin
   cbReadFormatOption.Items.Clear;
   cbReadFormatOption.ItemIndex := -1;
   cbReadFormatOption.Enabled:= true;
   cbReadFormatOption.Items.Add('');
   cbReadFormatOption.Items.Add('::bitrate=125');
   cbReadFormatOption.Items.Add('::bitrate=250');
   cbReadFormatOption.Items.Add('::bitrate=300');
   cbReadFormatOption.Items.Add('::bitrate=500');
   cbReadFormatOption.ItemIndex := 0;

   //HFEVersion
   cbReadFormatOptionHFEVer.ItemIndex := -1;
   cbReadFormatOptionHFEVer.Enabled:= true;

   //HLE InterfaceMode
   cbReadFormatOptionHFEInt.Items.Clear;
   cbReadFormatOptionHFEInt.ItemIndex := -1;
   cbReadFormatOptionHFEInt.Enabled:= true;
   cbReadFormatOptionHFEInt.Items.Add('');
   cbReadFormatOptionHFEInt.Items.Add('::interface=IBMPC_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=IBMPC_HD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=ATARIST_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=ATARIST_HD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=AMIGA_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=AMIGA_HD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=CPC_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=GENERIC_SHUGART_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=IBMPC_ED');
   cbReadFormatOptionHFEInt.Items.Add('::interface=MSX2_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=C64_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=EMU_SHUGART');
   cbReadFormatOptionHFEInt.Items.Add('::interface=S950_DD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=S950_HD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=S950_DD_HD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=IBMPC_DD_HD');
   cbReadFormatOptionHFEInt.Items.Add('::interface=QUICKDISK');
   cbReadFormatOptionHFEInt.Items.Add('::interface=UNKNOWN');
   cbReadFormatOptionHFEInt.ItemIndex := 0;

   //HLE EncodingType
   cbReadFormatOptionHFEEnc.Items.Clear;
   cbReadFormatOptionHFEEnc.ItemIndex := -1;
   cbReadFormatOptionHFEEnc.Enabled:= true;
   cbReadFormatOptionHFEEnc.Items.Add('');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=ISOIBM_MFM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=AMIGA_MFM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=ISOIBM_FM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=EMU_FM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=TYCOM_FM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=MEMBRAIN_MFM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_GCR1');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_GCR2');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_HDDD_A2_GCR1');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=APPLEII_HDDD_A2_GCR2');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=ARBURGDAT');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=ARBURGSYS');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=AED6200P_MFM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=NORTHSTAR_HS_MFM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=HEATHKIT_HS_FM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=DEC_RX02_M2FM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=APPLEMAC_GCR');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=QD_MO5');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=C64_GCR');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=VICTOR9K_GCR');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=MICRALN_HS_FM');
   cbReadFormatOptionHFEEnc.Items.Add('::encoding=UNKNOWN');
   cbReadFormatOptionHFEEnc.ItemIndex := 0;
  end;

  Create_Filename;
end;

procedure TForm1.edToolsFWChange(Sender: TObject);
begin
 if edToolsFW.Focused then CMD_Generate;
end;

procedure TForm1.edToolsFWTagChange(Sender: TObject);
begin
 if edToolsFWTag.Focused then CMD_Generate;
end;

procedure TForm1.edWriteFileNameAcceptFileName(Sender: TObject;
  var Value: String);
begin
  CMD_Generate;
end;

procedure TForm1.edWriteFileNameChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
 INI := TINIFile.Create(sAppPath + GW_INI_FILE);
 INI.WriteInteger(FLUX_INI_NAME, INI_HEIGHT, Form1.Height);
 INI.WriteInteger(FLUX_INI_NAME, INI_WIDTH, Form1.Width);
 INI.WriteBool(FLUX_INI_NAME, INI_SHOWARG, mnuArguments.Checked);
 INI.WriteString(FLUX_INI_NAME, INI_GW, EdGWFile.Text);
 If INI.ReadBool(FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, false) = true then
  begin
   INI.WriteString(FLUX_INI_NAME, INI_SAVE_DEVICE, cbGWDevCOM.Text);
  end
 else INI.WriteString(FLUX_INI_NAME, INI_SAVE_DEVICE, '');
 If INI.ReadBool(FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, false) = true then
  begin
   INI.WriteString(FLUX_INI_NAME, INI_SAVE_DRIVE, cbGWDrive.Text);
  end
 else INI.WriteString(FLUX_INI_NAME, INI_SAVE_DRIVE, '');
 INI.WriteString(FLUX_INI_NAME, INI_ACTIONS_GW_HW, cbGWHW.Text);
 INI.WriteString(FLUX_INI_NAME, INI_FOLDER_READ_DEST, edReadDirDest.Directory);
 INI.WriteString(FLUX_INI_NAME, INI_FOLDER_WRITE_SRC,ExtractFilePath(edWriteFilename.Text));
 INI.WriteString(FLUX_INI_NAME, INI_FOLDER_CONVERT_SRC,ExtractFilePath(edConvFileSource.Text));
 INI.WriteString(FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,edConvDirDest.Directory);
 INI.WriteBool(FLUX_INI_NAME, INI_ACTIONS_TIME, cbSetGlobalActionsTime.Checked);
 INI.WriteBool(FLUX_INI_NAME, INI_ACTIONS_SHELL, false);
 INI.WriteBool(FLUX_INI_NAME, INI_ACTIONS_BACKTRACE, cbSetGlobalActionsBacktrace.Checked);
 INI.Free;
end;



procedure TForm1.FormResize(Sender: TObject);
const
  MinWidth = MIN_WIDTH;
  MinHeight = MIN_HEIGHT;
begin
   if Width < MinWidth then Width := MinWidth;
   if Height < MinHeight then Height := MinHeight;
end;

procedure TForm1.mnuCloseClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.Create_Filename;
var
  filenameRead, lBlOf, filenameConvert: string;
  disc1, disc2, digits : integer;
begin

  // Read
  if pcActions.ActivePageIndex = GW_PROP_PAGE_READ then
   begin
     if edReadFilename.Text = '' then
     begin
      btReadDiskReset.Enabled:=false;
      edReadDisk1.Enabled:=false;
      edReadDiskOf.Enabled:=false;
      edReadDisk2.Enabled:=false;
      edReadDigits.Enabled:=false;
      cbReadIncremental.Enabled:=false;
      cbReadNoOverwrite.Enabled := false;
      cbReadFormat.Enabled:=false;
      cbReadFormatOption.Enabled :=false;
      cbReadFormatOptionHFEVer.Enabled :=false;
      cbReadFormatOptionHFEInt.Enabled :=false;
      cbReadFormatOptionHFEEnc.Enabled :=false;
      cbReadPreview.Text:='';
      btGo.Default := false;
      exit;
     end;
     if edReadFilename.Text <> '' then
     begin
      btReadDiskReset.Enabled:=true;
      edReadDisk1.Enabled:=true;
      edReadDiskOf.Enabled:=true;
      edReadDisk2.Enabled:=true;
      edReadDigits.Enabled:=true;
      cbReadIncremental.Enabled:=true;
      cbReadNoOverwrite.Enabled:=true;
      cbReadFormat.Enabled:=true;
      cbReadPreview.Text:='';
      btGo.Default := true;
     end;

     filenameRead := edReadFilename.Text;
     disc1 := StrToInt(edReadDisk1.Text);
     disc2 := StrToInt(edReadDisk2.Text);
     digits := StrToInt(edReadDigits.Text);
     lblOf := edReadDiskOf.Text;

  // Disc1
  if disc1 > 0 then
  begin
    // Digits 1
    if digits = 1 then
      filenameRead := edReadFilename.Text + edReadDisk1.Text;
    // Digits 2
    if digits = 2 then
    begin
      if (disc1 < 10) then
        filenameRead := edReadFilename.Text + '0' + edReadDisk1.Text
      else
      if (disc1 > 9) then
        filenameRead := filenameRead + edReadDisk1.Text;
    end;
    // Digits 3
    if digits = 3 then
    begin
      if (disc1 < 10) then
        filenameRead := edReadFilename.Text + '00' + edReadDisk1.Text
      else
      if (disc1 > 9) and (disc1 < 100) then
        filenameRead := edReadFilename.Text + '0' + edReadDisk1.Text
      else
      if disc1 > 99 then
        filenameRead := edReadFilename.Text + edReadDisk1.Text;
    end;
    // Digits 4
    if digits = 4 then
    begin
      if (disc1 < 10) then
        filenameRead := edReadFilename.Text + '000' + edReadDisk1.Text
      else
      if (disc1 > 9) and (disc1 < 100) then
        filenameRead := edReadFilename.Text + '00' + edReadDisk1.Text
      else
      if (disc1 > 99) and (disc1 < 1000) then
        filenameRead := edReadFilename.Text + '0' + edReadDisk1.Text
      else
      if disc1 > 999 then
        filenameRead := edReadFilename.Text + edReadDisk1.Text;
    end;
    // Digits 5
    if digits = 5 then
    begin
      if (disc1 < 10) then
        filenameRead := edReadFilename.Text + '0000' + edReadDisk1.Text
      else
      if (disc1 > 9) and (disc1 < 100) then
        filenameRead := edReadFilename.Text + '000' + edReadDisk1.Text
      else
      if (disc1 > 99) and (disc1 < 1000) then
        filenameRead := edReadFilename.Text + '00' + edReadDisk1.Text
      else
      if (disc1 > 999) and (disc1 < 10000) then
        filenameRead := edReadFilename.Text + '0' + edReadDisk1.Text
      else
      if (disc1 > 9999) then
        filenameRead := edReadFilename.Text + edReadDisk1.Text;
    end;
  end;

  // Disc2
  if disc2 > 0 then
  begin
    // digits 1
    if digits = 1 then
      filenameRead := filenameRead + lblOf + edReadDisk2.Text;
    // digits 2
    if digits = 2 then
    begin
      if (disc2 < 10) then
        filenameRead := filenameRead + lblOf + '0' + edReadDisk2.Text
      else
      if (disc2 > 9) then
        filenameRead := filenameRead + lblOf + edReadDisk2.Text;
    end;

    // digits 3
    if digits = 3 then
    begin
      begin
        if (disc2 < 10) then
          filenameRead := filenameRead + lblOf + '00' + edReadDisk2.Text
        else
        if (disc2 > 9) and (disc2 < 100) then
          filenameRead := filenameRead + lblOf + '0' + edReadDisk2.Text
        else
        if (disc2 > 99) then
          filenameRead := filenameRead + lblOf + edReadDisk2.Text;
      end;
    end;

    // Digits 4
    if digits = 4 then
    begin
      if (disc2 < 10) then
        filenameRead := filenameRead + lblOf + '000' + edReadDisk2.Text
      else
      if (disc2 > 9) and (disc2 < 100) then
        filenameRead := filenameRead + lblOf + '00' + edReadDisk2.Text
      else
      if (disc2 > 99) and (disc2 < 1000) then
        filenameRead := filenameRead + lblOf + '0' + edReadDisk2.Text
      else
      if (disc2 > 999) then
        filenameRead := filenameRead + lblOf + edReadDisk2.Text;
    end;

    // Digits 5
    if digits = 5 then
    begin
      if (disc2 < 10) then
        filenameRead := filenameRead + lblOf + '0000' + edReadDisk2.Text
      else
      if (disc2 > 9) and (disc2 < 100) then
        filenameRead := filenameRead + lblOf + '000' + edReadDisk2.Text
      else
      if (disc2 > 99) and (disc2 < 1000) then
        filenameRead := filenameRead + lblOf + '00' + edReadDisk2.Text
      else
      if (disc2 > 999) and (disc2 < 10000) then
        filenameRead := filenameRead + lblOf + '0' + edReadDisk2.Text
      else
      if (disc2 > 9999) then
        filenameRead := filenameRead + lblOf + edReadDisk2.Text;
    end;
  end;

  // read file extension - FMFF 4.0
   cbReadFormatOptionHFEVer.Enabled :=false;
   cbReadFormatOptionHFEInt.Enabled :=false;
   cbReadFormatOptionHFEEnc.Enabled :=false;
   case trim(leftStr(cbReadFormat.Text,3)) of
    'EDS':
     cbReadPreview.Text := filenameRead + '.' + lowercase(trim(leftStr(cbReadFormat.Text,4)));
    'HFE':
      begin
       cbReadFormatOptionHFEVer.Enabled :=true;
       cbReadFormatOptionHFEInt.Enabled :=true;
       cbReadFormatOptionHFEEnc.Enabled :=true;
       cbReadPreview.Text := filenameRead + '.' + lowercase(leftStr(cbReadFormat.Text,3)) + cbReadFormatoption.Text + cbReadFormatoptionHFEVer.Text + cbReadFormatoptionHFEInt.Text + cbReadFormatoptionHFEEnc.Text;
      end;
    'SCP':
      cbReadPreview.Text := filenameRead + '.' + lowercase(leftStr(cbReadFormat.Text,3)) + cbReadFormatoption.Text;
    'RAW':
      cbReadPreview.Text := filenameRead + '00.0.' + lowercase(leftStr(cbReadFormat.Text,3));
    else
     if cbReadFormat.Text <> '' then cbReadPreview.Text := filenameRead + '.' + lowercase(trim(leftStr(cbReadFormat.Text,3)));
     if cbReadFormat.Text = '' then cbReadPreview.Text := filenameRead;
   end;
 end;

  // Convert ####################################################################
    if pcActions.ActivePageIndex = GW_PROP_PAGE_CONVERT then
     begin
       if edConvFilename.Text = '' then
       begin
        cbConvDisk1.Enabled:=false;
        edConvDiskOf.Enabled:=false;
        cbConvDisk2.Enabled:=false;
        cbConvDigits.Enabled:=false;
        cbConvIncrement.Enabled:=false;
        cbConvNoOverwrite.Enabled := false;
        btConvClear.Enabled:=false;
        cbConvFileFormat.Enabled:=false;
        cbConvFormatOption.Enabled:=false;
        cbConvFormatOptionHFEVer.Enabled :=false;
        cbConvFormatOptionHFEInt.Enabled :=false;
        cbConvFormatOptionHFEEnc.Enabled :=false;
        edConvFileNamePreview.Text:='';
        exit;
       end;
      if edConvFilename.Text <> '' then
       begin
        cbConvDisk1.Enabled:=true;
        edConvDiskOf.Enabled:=true;
        cbConvDisk2.Enabled:=true;
        cbConvDigits.Enabled:=true;
        cbConvIncrement.Enabled:=true;
        cbConvNoOverwrite.Enabled := true;
        btConvClear.Enabled:=true;
        cbConvFileFormat.Enabled:=true;
       end;

       filenameConvert := edConvFilename.Text;
       disc1 := cbConvDisk1.Value;
       disc2 := cbConvDisk2.Value;
       digits := cbConvDigits.Value;
       lblOf := edConvDiskOf.Text;
       // Disc1
       if disc1 > 0 then
       begin
       // Digits 1
       if digits = 1 then
         filenameConvert := edConvFilename.Text + cbConvDisk1.Text;
       // Digits 2
       if digits = 2 then
       begin
         if (disc1 < 10) then
           filenameconvert := edConvFilename.Text + '0' + cbConvDisk1.Text
         else
         if (disc1 > 9) then
           filenameconvert := filenameconvert + cbConvDisk1.Text;
       end;
       // Digits 3
       if digits = 3 then
       begin
         if (disc1 < 10) then
           filenameconvert := edConvFilename.Text + '00' + cbConvDisk1.Text
         else
         if (disc1 > 9) and (disc1 < 100) then
           filenameconvert := edConvFilename.Text + '0' + cbConvDisk1.Text
         else
         if disc1 > 99 then
           filenameconvert := edConvFilename.Text + cbConvDisk1.Text;
       end;
       // Digits 4
       if digits = 4 then
       begin
         if (disc1 < 10) then
           filenameconvert := edConvFilename.Text + '000' + cbConvDisk1.Text
         else
         if (disc1 > 9) and (disc1 < 100) then
           filenameconvert := edConvFilename.Text + '00' + cbConvDisk1.Text
         else
         if (disc1 > 99) and (disc1 < 1000) then
           filenameconvert := edConvFilename.Text + '0' + cbConvDisk1.Text
         else
         if disc1 > 999 then
           filenameconvert := edConvFilename.Text + cbConvDisk1.Text;
       end;
       // Digits 5
       if digits = 5 then
       begin
         if (disc1 < 10) then
           filenameconvert := edConvFilename.Text + '0000' + cbConvDisk1.Text
         else
         if (disc1 > 9) and (disc1 < 100) then
           filenameconvert := edConvFilename.Text + '000' + cbConvDisk1.Text
         else
         if (disc1 > 99) and (disc1 < 1000) then
           filenameconvert := edConvFilename.Text + '00' + cbConvDisk1.Text
         else
         if (disc1 > 999) and (disc1 < 10000) then
           filenameconvert := edConvFilename.Text + '0' + cbConvDisk1.Text
         else
         if (disc1 > 9999) then
           filenameconvert := edConvFilename.Text + cbConvDisk1.Text;
       end;
     end;

     // Disc2
     if disc2 > 0 then
     begin
       // digits 1
       if digits = 1 then
         filenameconvert := filenameconvert + lblOf + cbConvDisk2.Text;
       // digits 2
       if digits = 2 then
       begin
         if (disc2 < 10) then
           filenameconvert := filenameconvert + lblOf + '0' + cbConvDisk2.Text
         else
         if (disc2 > 9) then
           filenameconvert := filenameconvert + lblOf + cbConvDisk2.Text;
       end;

       // digits 3
       if digits = 3 then
       begin
         begin
           if (disc2 < 10) then
             filenameconvert := filenameconvert + lblOf + '00' + cbConvDisk2.Text
           else
           if (disc2 > 9) and (disc2 < 100) then
             filenameconvert := filenameconvert + lblOf + '0' + cbConvDisk2.Text
           else
           if (disc2 > 99) then
             filenameconvert := filenameconvert + lblOf + cbConvDisk2.Text;
         end;
       end;

       // Digits 4
       if digits = 4 then
       begin
         if (disc2 < 10) then
           filenameconvert := filenameconvert + lblOf + '000' + cbConvDisk2.Text
         else
         if (disc2 > 9) and (disc2 < 100) then
           filenameconvert := filenameconvert + lblOf + '00' + cbConvDisk2.Text
         else
         if (disc2 > 99) and (disc2 < 1000) then
           filenameconvert := filenameconvert + lblOf + '0' + cbConvDisk2.Text
         else
         if (disc2 > 999) then
           filenameconvert := filenameconvert + lblOf + cbConvDisk2.Text;
       end;

       // Digits 5
       if digits = 5 then
       begin
         if (disc2 < 10) then
           filenameconvert := filenameconvert + lblOf + '0000' + cbConvDisk2.Text
         else
         if (disc2 > 9) and (disc2 < 100) then
           filenameconvert := filenameconvert + lblOf + '000' + cbConvDisk2.Text
         else
         if (disc2 > 99) and (disc2 < 1000) then
           filenameconvert := filenameconvert + lblOf + '00' + cbConvDisk2.Text
         else
         if (disc2 > 999) and (disc2 < 10000) then
           filenameconvert := filenameconvert + lblOf + '0' + cbConvDisk2.Text
         else
         if (disc2 > 9999) then
           filenameconvert := filenameconvert + lblOf + cbConvDisk2.Text;
       end;
     end;

    // conv file extension - FMFF 4.0
    cbConvFormatOptionHFEVer.Enabled :=false;
    cbConvFormatOptionHFEInt.Enabled :=false;
    cbConvFormatOptionHFEEnc.Enabled :=false;
    case leftStr(cbConvFileFormat.Text,3) of
     'EDS':
      edConvFilenamePreview.Text := FilenameConvert + '.' + lowercase(trim(leftStr(cbConvFileFormat.Text,4)));
     'HFE':
       begin
        cbConvFormatOptionHFEVer.Enabled :=true;
        cbConvFormatOptionHFEInt.Enabled :=true;
        cbConvFormatOptionHFEEnc.Enabled :=true;
        edConvFilenamePreview.Text := FilenameConvert + '.' + Lowercase(leftStr(cbConvFileFormat.Text,3)) + cbConvFormatOption.Text + cbConvFormatOptionHFEVer.Text + cbConvFormatOptionHFEInt.Text + cbConvFormatOptionHFEEnc.Text;
       end;
     'SCP':
       edConvFilenamePreview.Text := FilenameConvert + '.' + Lowercase(leftStr(cbConvFileFormat.Text,3)) + cbConvFormatOption.Text;
     'RAW':
       edConvFilenamePreview.Text := FilenameConvert + '00.0.' + lowercase(leftStr(cbConvFileFormat.Text,3));
     else
       if cbConvFileFormat.Text <> '' then edConvFilenamePreview.Text := FilenameConvert + '.' + lowercase(trim(leftStr(cbConvFileFormat.Text,3)));
       if cbConvFileFormat.Text = '' then edConvFilenamePreview.Text := FilenameConvert;
    end;
   end;

end;
procedure TForm1.CMD_Generate;
var
  cmd : String = '';
  param : String = '';
  specifyDevice : boolean = false;
  specifyDrive : boolean = false;
begin
 edGWCMD.Lines.Clear;

 if edGWFile.Text = '' then
  begin
   edGWCMD.SelStart := edGWCMD.GetTextLen;
   edGWCMD.SelLength := 0;
   edGWCMD.SelText := 'No Greaseweazle application defined!';
   exit;
  end;
 if edGWFile.Text <> '' then
  begin
    if fileexists(edGWFile.Text) = false then
    begin
     edGWCMD.SelStart := edGWCMD.GetTextLen;
     edGWCMD.SelLength := 0;
     edGWCMD.SelText := 'Greaseweazle application not found!';
     exit;
    end;
  end;

 // Generate the cmdline parameters
 if cbSetGlobalActionsBacktrace.Checked = true then cmd := cmd + ' --bt';
 if cbSetGlobalActionsTime.Checked = true then cmd := cmd + ' --time';

 // Read options
 if pCActions.ActivePageIndex = GW_PROP_PAGE_READ then
  begin
  cmd := 'read';
  specifyDevice := true;
  specifyDrive := true;
  if cbReadTplFormatSrc.Text <> 'Internal' then
   begin
   param := param + ' --diskdefs "' + dd + '"';
   if cbReadTplFormat.Text <> '' then param := param + ' --format ' + cbReadTplFormat.Text;
   end;
  if cbReadTplFormatSrc.Text = 'Internal' then
   begin
    if cbReadTplFormat.Text <> '' then param := param + ' --format ' + cbReadTplFormat.Text;
   end;

  // Use all arguments ?
  If mnuArguments.Checked = true then
   begin
    if cbReadTplCyls.Text <> '' then                       //Trackset
     begin
      cbReadTplHeads.Enabled := true;
      cbReadTplSteps.Enabled := true;
      cbReadTplHSwap.Enabled := true;
      cbReadTplFlippy.Enabled := true;
      param := param + Trackset(' --tracks=',cbReadTplCyls.Text,cbReadTplHeads.Text,cbReadTplSteps.Text,cbReadTplHSwap.Checked,cbReadTplFlippy.Text);
      if cbReadTplFlippy.Text <> '' then
       begin
        cbReadTplFlippyReverse.Enabled := true;
        if cbReadTplFlippyReverse.Checked = true then cmd := cmd + ' --reverse';
       end
      else
       cbReadTplFlippyReverse.Enabled := false;
      end;
    if cbReadTplCyls.Text = '' then                       //Trackset
     begin
      cbReadTplHeads.Enabled := false;
      cbReadTplSteps.Enabled := false;
      cbReadTplHSwap.Enabled := false;
      cbReadTplFlippy.Enabled := false;
      cbReadTplFlippyReverse.Enabled := false;
     end;
    if cbReadTplRevs.Text <> '' then
     begin
      param := param + ' --revs=' + cbReadTplRevs.Text;
     end;
    if cbReadTplRaw.Checked = true then
     begin
      param := param + ' --raw ';
     end;
    if cbReadTplFakeIndex.Text <> '' then
     begin
      param := param + ' --fake-index=' + cbReadTplFakeIndex.Text;
     end;
    if cbReadTplHardSec.Checked = true then
     begin
      param := param + ' --hard-sectors ';
     end;
    if cbReadTplAdjustSpeed.Text <> '' then
     begin
      param := param + ' --adjust-speed=' + cbReadTplAdjustSpeed.Text ;
     end;
    if cbReadTplRetries.Text <> '' then
     begin
      param := param + ' --retries=' + cbReadTplRetries.Text;
     end;
    if cbReadTplSeekRetries.Text <> '' then
     begin
      param := param + ' --seek-retries=' + cbReadTplSeekRetries.Text;
     end;
    if cbReadNoOverwrite.Checked = true then
     begin
      param := param + ' -n ';
     end;
    if cbReadTplPLL.Text <> '' then
     begin
      param := param + ' --pll ' + cbReadTplPLL.Text;
     end;
    if cbReadTplDD.Text <> '' then
     begin
      param := param + ' --densel ' + cbReadTplDD.Text;
     end;
   end;
   if cbReadPreview.text <> '' then param := param + ' "' + Dircheck(edReadDirDest.Text) + cbReadPreview.text + '"';
 end;

 // Write options
  if pcActions.ActivePageIndex = GW_PROP_PAGE_WRITE then
   begin
    cmd := 'write';
    specifyDevice := true;
    specifyDrive := true;
    if cbWriteTplFormatSrc.Text <> 'Internal' then
     begin
      param := param + ' --diskdefs "' + dd + '"';
      if cbWriteTplFormat.Text <> '' then param := param + ' --format ' + cbWriteTplFormat.Text;
     end;
    if cbWriteTplFormatSrc.Text = 'Internal' then
     begin
      if cbWriteTplFormat.Text <> '' then param := param + ' --format ' + cbWriteTplFormat.Text;
     end;

   // Use all arguments ?
   If mnuArguments.Checked = true then
    begin
      if cbWriteTplCyls.Text <> '' then
       begin
        cbWriteTplHeads.Enabled := true;
        cbWriteTplSteps.Enabled := true;
        cbWriteTplHSwap.Enabled := true;
        cbWriteTplFlippy.Enabled := true;
        param := param + Trackset(' --tracks=',cbWriteTplCyls.Text,cbWriteTplHeads.Text,cbWriteTplSteps.Text,cbWriteTplHSwap.Checked,cbWriteTplFlippy.Text);
        if cbWriteTplFlippy.Text <> '' then
         begin
          cbWriteTplFlippyReverse.Enabled := true;
          if cbWriteTplFlippyReverse.Checked = true then param := param + ' --reverse';
         end
        else
         cbWriteTplFlippyReverse.Enabled := false;
       end;
      if cbWriteTplCyls.Text = '' then                       //Trackset
       begin
        cbWriteTplHeads.Enabled := false;
        cbWriteTplSteps.Enabled := false;
        cbWriteTplHSwap.Enabled := false;
        cbWriteTplFlippy.Enabled := false;
        cbWriteTplFlippyReverse.Enabled := false;
       end;
      if cbWriteTplPreErase.Checked = true then
       begin
        param := param + ' --pre-erase ';
       end;
      if cbWriteTplEraseEmpty.Checked = true then
       begin
        param := param + ' --erase-empty ';
       end;
      if cbWriteTplFakeIndex.Text <> '' then
       begin
        param := param + ' --fake-index=' + cbWriteTplFakeIndex.Text;
       end;
      if cbWriteTplHardSec.Checked = true then
       begin
        param := param + ' --hard-sectors ';
       end;
      if cbWriteTplNoVerify.Checked = true then
       begin
        param := param + ' --no-verify ';
       end;
      if cbWriteTplRetries.Text <> '' then
       begin
        param := param + ' --retries=' + cbWriteTplRetries.Text;
       end;
      if cbWriteTplPrecomp.Text <> '' then
       begin
        param := param + ' --precomp=' + cbWriteTplPrecomp.Text;
       end;
      if cbWriteTplDensel.Text <> '' then
       begin
        param := param + ' --densel ' + cbWriteTplDensel.Text;
       end;
      if cbWriteTplTplTP43Pin2.Checked then
       begin
        param := param + ' --gen-tg43';
       end;
    end;
    btGo.Default:=false;
    if edWriteFileName.Text <> '' then
     begin
      param := param + ' "' + edWriteFileName.Text + '"';
      btGo.Default:=true;
     end;
   end;


  // Convert options
   if pcActions.ActivePageIndex = GW_PROP_PAGE_CONVERT then
    begin
     cmd := 'convert';
     if cbConvDiskdefs.Text <> 'Internal' then
      begin
       param := param + ' --diskdefs "' + dd +'"';
       if cbConvFormat.Text <> '' then param := param + ' --format ' + cbConvFormat.Text
      end;
     if cbConvDiskdefs.Text = 'Internal' then
      begin
       if cbConvFormat.Text <> '' then param := param + ' --format ' + cbConvFormat.Text;
      end;

    // Use all arguments ?
    If mnuArguments.Checked = true then
     begin
       if cbConvTracksetCyls.Text <> '' then
        begin
          param := param + Trackset(' --tracks=',cbConvTracksetCyls.Text,cbConvTracksetHeads.Text,cbConvTracksetSteps.Text,cbConvTracksetHSwap.Checked,cbConvTracksetFlippy.Text);
        end;
       if cbConvOutTracksetCyls.Text <> '' then
        begin
         param := param + Trackset(' --out-tracks=',cbConvOutTracksetCyls.Text,cbConvOutTracksetHeads.Text,cbConvOutTracksetSteps.Text,cbConvOutTracksetHSwap.Checked,cbConvOutTracksetFlippy.Text);
         if cbConvOutTracksetFlippy.Text <> '' then
          begin
           cbConvTplFlippyReverse.Enabled := true;
           if cbConvTplFlippyReverse.Checked = true then param := param + ' --reverse';
          end
         else
          cbConvTplFlippyReverse.Enabled := false;
        end;
       if cbConvAdjustSpeed.Text <> '' then
        begin
         param := param + ' --adjust-speed=' + cbConvAdjustSpeed.Text;
        end;
       if cbConvNoOverwrite.Checked = true then
        begin
         param := param + ' -n';
        end;
      if cbConvPLL.Text <> '' then
       begin
        param := param + ' --pll ' + cbConvPLL.Text;
       end;
      if cbConvIndexMarks.Text <> '' then
       begin
        param := param + ' ' + cbConvIndexMarks.Text;
       end;
      if edConvFileSource.Text <> '' then
       begin
        param := param + ' "' + edConvFileSource.Text + '"';
       end;
    end;
    if edConvFileName.text <> '' then
     begin
      if cbSrcAsDesDir.Checked then edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
      param := param + ' "' + Dircheck(edConvDirDest.Text) + edConvFilenamePreview.text + '"';
     end;
   end;

   // Tools options
    if pcActions.ActivePageIndex = GW_PROP_PAGE_TOOLS then
     begin
     // Erase
      if rbToolsErase.Checked then
       begin
        btGo.Caption:='Erase';
        cmd := 'erase';
        specifyDevice := true;
        specifyDrive := true;
        if cbToolsEraseRevs.Text <> '' then
         begin
          param := param + ' --revs=' + cbToolsEraseRevs.Text;
         end;
         if cbToolsEraseCyl.Text <> '' then
          begin
           param := param + Trackset(' --tracks=',cbToolsEraseCyl.Text,cbToolsEraseHeads.Text,cbToolsEraseSteps.Text,cbToolsEraseHSwap.Checked,cbToolsEraseFlippy.Text);
          end;
        if lblToolsEraseHFreq.Checked = true then
         begin
          param := param + ' --hfreq';
         end;
        if cbToolsEraseFakeIndex.Text <> '' then
         begin
          param := param + ' --fake-index=' + cbToolsEraseFakeIndex.Text;
         end;
       end;

      // Seek
      if rbToolsSeek.Checked then
       begin
        btGo.Caption:='Seek';
        cmd := 'seek';
        specifyDevice := true;
        specifyDrive := true;
         if cbToolsSeekTrackForce.Checked then param := param + ' --force';
         if cbToolsSeekMotorOn.Checked then param := param + ' --motor-on';
         param := param + ' ' + cbToolsSeekTrack.Text;
       end;
      // Clean
      if rbToolsClean.Checked then
       begin
        btGo.Caption:='Clean';
        cmd := 'clean';
        specifyDevice := true;
        specifyDrive := true;
        param := param + ' --cyls=' + cbToolsCleanCyl.Text;
        param := param + ' --linger=' + cbToolsCleanLinger.Text;
        param := param + ' --passes=' + cbToolsCleanPasses.Text;
       end;
      // RPM
      if rbToolsRPM.Checked then
       begin
        btGo.Caption:='RPM';
        cmd := ' rpm';
        specifyDevice := true;
        specifyDrive := true;
        param := param + ' --nr=' + cbToolsRPMNumbIter.Text;
       end;
    end;

    // Settings
    if pcActions.ActivePageIndex = GW_PROP_PAGE_SETTINGS then
     begin
     if rbSetDelays.Checked = true then
      begin
      cmd := 'delays';
      specifyDevice := true;
      if cbSetDelaySelect.Text <>'' then
        param := param + ' --select ' + cbSetDelaySelect.Text;
      if cbSetDelayStep.Text <>'' then
        param := param + ' --step ' + cbSetDelayStep.Text;
      if cbSetDelaySettle.Text <>'' then
        param := param + ' --settle ' + cbSetDelaySettle.Text;
      if cbSetDelayMotor.Text <>'' then
        param := param + ' --motor ' + cbSetDelayMotor.Text;
      if cbSetDelayAutoOff.Text <>'' then
        param := param + ' --watchdog ' + cbSetDelayAutoOff.Text;
      if cbSetDelayPreWrite.Text <>'' then
        param := param + ' --pre-write ' + cbSetDelayPreWrite.Text;
      if cbSetDelayPostWrite.Text <>'' then
        param := param + ' --post-write ' + cbSetDelayPostWrite.Text;
      if cbSetDelayIndexMask.Text <>'' then
        param := param + ' --index-mask ' + cbSetDelayIndexMask.Text;
      end;

     if rbSetGetPIN.Checked = true then
      begin
       specifyDevice := true;
       // H = true, L = false
       if rbGetPIN.Checked = true then
        begin
           cmd := 'pin get';
           cbSetPINLevel.Text:='';
           cbSetPINLevel.Enabled:=false;
        end;
       if rbSetPIN.Checked = true then
        begin
           cmd := 'pin set';
           cbSetPINLevel.Enabled:=true;
        end;
       if cbSetPINNumber.Text <>'' then
        begin
         param := param + ' ' + cbSetPINNumber.Text;
        end;
       if cbSetPINLevel.Text <>'' then
       begin
         if cbSetPINLevel.Text = 'Low (0v)' then param := param + ' L';
         if cbSetPINLevel.Text = 'High (5v)' then param := param + ' H';
       end;
    end;

    if rbSetFirmware.Checked = true then
     begin
      cmd := 'update';
      specifyDevice := true;
      if cbSetFirmwareBootloader.Checked  = true then
       begin
        param := param + ' --bootloader';
       end;
      if opSetFWFile.Checked = true then
       begin
        param := param + ' --force "' + edToolsFW.Text + '"';
       end;
      if opSetFWTag.Checked = true then
       begin
        param := param + ' --tag "' + edToolsFWtag.Text + '"';
       end;
     end;
    end;

  // Execute GW with cmd, param and where applicable device/drive
  performCmdAction(cmd, param, specifyDevice, specifyDrive);

end;

// Other commands are in the Command Line window with parameters
procedure TForm1.performCmdAction(const cmd: string;
                                  const param: string;
                                  const specifyDevice: boolean;
                                  const specifyDrive: boolean);
var
  execCmdLine : String;
begin

 // Get executable
 execCmdLine := '"' + edGWFile.Text + '"';

  // Append specific user parameters
 execCmdLine := execCmdLine + ' ' + cmd + ' '  + param;

 // Append device and drive fields from form
 if (cbGWDevCOM.Text <> '') and (specifyDevice) then
 begin
   // Adafruit doesn't use equals
   if cbGWHW.Text = 'Adafruit RP2040' then
     begin
       execCmdLine := execCmdLine + ' --device ' + cbGWDevCOM.Text;
     end
   else
     begin
       execCmdLine := execCmdLine + ' --device=' + cbGWDevCOM.Text;
     end
 end;
 if (cbGWDrive.Text <> '') and (specifyDrive) then
 begin
   execCmdLine := execCmdLine + ' --drive=' + cbGWDrive.Text;
 end;


 edGWCMD.SelStart := edGWCMD.GetTextLen;
 edGWCMD.SelLength := 0;
 edGWCMD.SelText := execCmdLine;

end;

// Modal commands only have a single GW command with no parameters
procedure TForm1.performModalCmdAction(const command: string);
begin
  if cbGWDevCOM.Text <> '' then
  begin
    if fileexists(edGWFile.Text) = true then
      begin
        aLine := '"' + edGWFile.Text + '" ' + command + ' --device ' + cbGWDevCOM.Text;
        frmGW.Caption:= GW_APP_NAME + ' - ' + aLine;
        frmGW.showmodal;
      end
    else
      begin
        MessageDlg('Invalid filename or file (' + GW_APP + ') not found!',mtWarning, [mbOK], 0);
      end;
  end
  else
    begin
      MessageDlg('Greaseweazle port not selected!', mtWarning, [mbOK], 0);
    end;
end;

procedure CmdDir(aGW: string; aParam: string);
var
  Proc: TProcess;
begin
  Proc := TProcess.Create(nil);
  try
  {$IFDEF WINDOWS}
    Proc.Executable := 'cmd.exe';
    Proc.Parameters.Add(aGW);
    Proc.Parameters.Add(aParam);
    Proc.ShowWindow := swoShow;
  {$ELSE}
    Proc.Executable := '/bin/bash';
    Proc.Parameters.Add('-c');
    Proc.Parameters.Add(aGW + ' ' + aParam);
  {$ENDIF}
    Proc.Options := [poWaitOnExit];
    Proc.Execute;
  finally
    Proc.Free;
  end;
end;

end.


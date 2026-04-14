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
unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  ComCtrls, DBGrids, StdCtrls, DBCtrls, Menus, EditBtn, Spin, ExtCtrls,
  IniFiles, Process, FileUtil, LazFileUtils, CommonConsts, DOM, XMLRead,
  OperationsDialog

{$IFDEF WINDOWS}
  , Registry, LCLIntf
{$ENDIF};

type

  { TFrmMain }

  TFrmMain = class(TForm)
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
    procedure LoadXML(const FileName: string);
//    procedure LoadOption(OptionNode: TDOMNode; var Opt: TFormatOption);
    procedure performModalCmdAction(const command: string);
    function GetReadFormatSelection : String;
    function GetConvFormatSelection : String;
    procedure UpdateReadFormatSelection;

    procedure performCmdAction(const cmd: string;
                               const param: string;
                               const specifyDevice: boolean;
                               const specifyDrive: boolean);
    procedure ShowOperationsDialog(const CommandLine, Title: string;
      const DisplayMode: OperationsDialog.TOperationDisplayMode);

  private
    FInClick: Boolean;
  public

  end;

procedure CmdDir(AGW: string; AParam: string);
function DirCheck(const dir:string; add_if_length_is_zero:boolean=false):string;
function ExtractFileName_WithoutExt(const AFilename: string): string;
function Trackset(aCommand: string;aCyl: string; aHeads: string; aSteps: string; aHSwap: boolean; aFlippy: string):string;
function SelectFile(title, defaultDir, Filter: String): String;

type
  TFormatOption = record
    Name: string;
    Value: array of string;
  end;

  THfeFormatEntry = record
    BitRate: TFormatOption;
    DiskInterface: TFormatOption;
    Encoding: TFormatOption;
  end;

var
  FrmMain: TFrmMain;
  INI: TIniFile;
  FormatSpecs_Read, FormatSpecs_ReadDiskDefs: TStringList;
  FormatSpecs_Write, FormatSpecs_WriteDiskDefs: TStringList;
  FormatSpecs_Conv, FormatSpecs_ConvDiskDefs: TStringList;
  FormatDest_Ext : TStringList;
  sAppName, sAppPath, sAppVersion, sAppDate, AboutGW, sAppVersion_ReadTmpl, sAppVersion_WriteTmpl : String;
  dd : String; // Diskdefs.cfg
  aLine : String; // GreaseWeazle (frmGW)

  SCPFormatOptions: TFormatOption;
  HFEFormatOptions: THfeFormatEntry;

implementation
uses
 AboutDialog, OptionsDialog;

{$R *.lfm}

{ TFrmMain }

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


function ReadIniString(ThisFile: TIniFile; const Section, Key: string): string;
begin
  Result := ThisFile.ReadString(Section, Key, '');
end;

function ReadIniString(ThisFile: TIniFile; const Section, Key, Default: string): string;
begin
  Result := ThisFile.ReadString(Section, Key, Default);
end;

function ReadIniBool(ThisFile: TIniFile; const Section, Key: String): Boolean;
begin
  Result := ThisFile.ReadBool(Section, Key, false);
end;

function ReadIniBool(ThisFile: TIniFile; const Section, Key: String; Default: Boolean): Boolean;
begin
  Result := ThisFile.ReadBool(Section, Key, Default);
end;

function ReadIniInteger(ThisFile: TIniFile; const Section, Key: String): Integer;
begin
  Result := ThisFile.ReadInteger(Section, Key, 0);
end;

procedure WriteIniString(ThisFile: TIniFile; const Section, Key, Value: string);
begin
  ThisFile.WriteString(Section, Key, Value);
end;

procedure WriteIniStringIfNotEmpty(ThisFile: TIniFile; const Section, Key, Value: string);
begin
  if Value <> '' then
    WriteIniString(ThisFile,Section, Key, Value);
end;

procedure WriteIniInteger(ThisFile: TIniFile; const Section, Key: String; Value: Integer);
begin
   ThisFile.WriteInteger(Section, Key, Value);
end;


procedure WriteIniBool(ThisFile: TIniFile; const Section, Key: String; Value: Boolean);
begin
   ThisFile.WriteBool(Section, Key, Value);
end;


procedure WriteIniBoolIfNotEmpty(ThisFile: TIniFile; const Section, Key: String; Enabled, Value: Boolean);
begin
  if Enabled and Value then
    WriteIniBool(ThisFile, Section, Key, Value);
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
  openDialog:=TOpenDialog.create(FrmMain);
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
procedure TFrmMain.Get_DeviceCOMLinux;
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
procedure TFrmMain.Get_DeviceCOM;
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

procedure TFrmMain.FormShow(Sender: TObject);
var
  gw :string;
  xmlFile: String;
  selTemplate: String;
begin
  sAppName := APP_NAME;
  sAppVersion := APP_VERSION;
  sAppDate := APP_DATE;
  sAppVersion_ReadTmpl := TEMPLATE_VERSION;
  sAppVersion_WriteTmpl := TEMPLATE_VERSION;
  AboutGW := 'Requires "Greaseweazle v1.22+" (and optional "' + GW_DISKDEF_FOLDER + '_.cfg")';
  FrmMain.Caption := sAppName + sAppVersion;

  sAppPath := Dircheck(ExtractFilePath(ParamStr(0)));
  if DirectoryExists(sAppPath + GW_DISKDEF_FOLDER) = false then CreateDir(sAppPath + GW_DISKDEF_FOLDER);
  if DirectoryExists(sAppPath + GW_TEMPLATE_FOLDER) = false then CreateDir(sAppPath + GW_TEMPLATE_FOLDER);
  if DirectoryExists(sAppPath + GW_APP_FILE) = false then CreateDir(sAppPath + GW_APP_FILE);

  xmlFile := sAppPath + FLUX_XML_FILE;
  if FileExists(xmlFile) = True then
  begin
    LoadXML(xmlFile);
  end
  else
  begin
    MessageDlg('File not found',
               'Formats definitions file ' + xmlFile + ' does not exist.' + sLineBreak +
               'Check this file is in your installation',
               mtWarning, [mbOk], 0);
  end;


  // No INI
  if FileExists(sAppPath + GW_INI_FILE) = False then
    try
     INI := TINIFile.Create(sAppPath + GW_INI_FILE);
     WriteIniString(INI,FLUX_INI_NAME, INI_VERSION, sAppVersion);
     WriteIniInteger(INI, FLUX_INI_NAME, INI_VERSION_INI, INI_VERSION_DEFAULT);
     WriteIniInteger(INI, FLUX_INI_NAME, INI_HEIGHT, INITIAL_HEIGHT);
     WriteIniInteger(INI, FLUX_INI_NAME, INI_WIDTH, INITIAL_WIDTH);
     WriteIniBool(INI, FLUX_INI_NAME, INI_SHOWARG, true);
     WriteIniString(INI, FLUX_INI_NAME, INI_GW, '');
     WriteIniBool(INI, FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, true);
     WriteIniString(INI, FLUX_INI_NAME, INI_SAVE_DEVICE, '');
     WriteIniBool(INI, FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, true);
     WriteIniString(INI, FLUX_INI_NAME, INI_SAVE_DRIVE, '');
     WriteIniBool(INI, FLUX_INI_NAME, INI_CODE_PAGE_CMD, true);
     WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_DISKDEFS, sAppPath + GW_DISKDEF_FOLDER + PATH_SPECIFIER);
     WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_TEMPLATES, sAppPath + GW_TEMPLATE_FOLDER + PATH_SPECIFIER);
     WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_READ_DEST, AppendPathDelim(GetUserDir + GW_DOCUMENTS_FOLDER));
     WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_WRITE_SRC, AppendPathDelim(GetUserDir + GW_DOCUMENTS_FOLDER));
     WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_CONVERT_SRC, sAppPath);
     WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST, sAppPath);
     WriteIniBool(INI, FLUX_INI_NAME, INI_TIME, cbSetGlobalActionsTime.Checked);
     WriteIniBool(INI, FLUX_INI_NAME, INI_BACKTRACE, cbSetGlobalActionsBacktrace.Checked);
    finally
     ; // end if
    end;


  INI := TINIFile.Create(sAppPath + GW_INI_FILE);
  If INI.ReadInteger(FLUX_INI_NAME, INI_VERSION_INI, 00) < INI_VERSION_DEFAULT then
   begin
    WriteIniInteger(INI, FLUX_INI_NAME, INI_VERSION_INI, INI_VERSION_DEFAULT);
    WriteIniBool(INI, FLUX_INI_NAME, INI_CODE_PAGE_CMD, true);
   end;
  If ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_DISKDEFS,'') = '' then
    begin
     WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_DISKDEFS, sAppPath + GW_DISKDEF_FOLDER + PATH_SPECIFIER);
    end;
  EdGWFile.Text := ReadIniString(INI, FLUX_INI_NAME, GW_APP_NAME,'');
  mnuArguments.Checked := ReadIniBool(INI, FLUX_INI_NAME, INI_SHOWARG, true);
  edReadDirDest.Directory := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_READ_DEST,'');
  edWriteFilename.InitialDir := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_WRITE_SRC,'');
  edConvFileSource.InitialDir := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_CONVERT_SRC,'');
  edConvDirDest.Directory := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');

  // Form size height/width
  FrmMain.Height := INI.ReadInteger(FLUX_INI_NAME, INI_HEIGHT, INITIAL_HEIGHT);
  FrmMain.Width := INI.ReadInteger(FLUX_INI_NAME, INI_WIDTH, INITIAL_WIDTH);
  Set_View;
  // Center
  FrmMain.Top:=(( Screen.Height-Height)div 2);
  FrmMain.Left:=((Screen.Width-Width)div 2);

  // Where is gw.exe ?
  gw := ReadIniString(INI, FLUX_INI_NAME, GW_APP_NAME, '');
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
         WriteIniString(INI,FLUX_INI_NAME, GW_APP_NAME, edGWfile.Text);
        end;
      end;
    end;
  If gw = '' then
    begin
     if FileExists(sAppPath + GW_APP) = true then
      begin
       edGWfile.Text := sAppPath + GW_APP;
       WriteIniString(INI,FLUX_INI_NAME, GW_APP_NAME, sAppPath + GW_EXECUTABLE);
      end;
     if FileExists(sAppPath + GW_EXECUTABLE) = False then
      begin
       edGWfile.Text := Selectfile('Select Greaseweazle (' + GW_APP + ')',sAppPath, GW_EXECUTABLE);
       if edGWfile.Text <> '' then
        begin
         WriteIniString(INI,FLUX_INI_NAME, GW_APP_NAME, edGWfile.Text);
        end;
      end;
    end;

  // Get possible Greaseweazle Device/COM ports

{$IFDEF WINDOWS}
    Get_DeviceCOM;
{$ELSE}
    Get_DeviceCOMLinux;
  {$ENDIF}

  If ReadIniBool(INI, FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, false) = true then
   begin
    cbGWDevCOM.Text := ReadIniString(INI, FLUX_INI_NAME, INI_SAVE_DEVICE, '');
   end;
  If ReadIniBool(INI, FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, false) = true then
   begin
    cbGWDrive.Text := ReadIniString(INI, FLUX_INI_NAME, INI_SAVE_DRIVE, '');
   end;
  cbGWHW.Text := ReadIniString(INI, FLUX_INI_NAME, INI_ACTIONS_GW_HW, INI_GW);

  // Where are diskdefs_.cfg located?
  Refresh_Diskdefs_DropDown;

  // Create StringList Read Diskdefs
  // TODO: Read these from a configuration file

  cbReadTplFormat.items.Text := FormatSpecs_Read.Text;
  cbReadFormat.Items.Text := FormatDest_Ext.Text;        // bspw. .msa
  cbWriteTplFormat.items.Text := FormatSpecs_Write.Text;
  cbConvFormat.items.Text := FormatSpecs_Conv.Text;
  cbConvFileFormat.Items.Text := FormatDest_Ext.Text;    // bspw. .msa
  Refresh_Templates_Read_DropDown;
  Refresh_Templates_Write_DropDown;

  SelTemplate := ReadIniString(INI, FLUX_INI_NAME, INI_LAST_READ_TEMPLATE);
  if SelTemplate <> '' then
    begin
      cbReadTplName.Text := SelTemplate;
      Refresh_Templates_Read;
    end
  else
    btReadTplNew.Click;

  SelTemplate := ReadIniString(INI, FLUX_INI_NAME, INI_LAST_WRITE_TEMPLATE);
  if SelTemplate <> '' then
    begin
      cbWriteTplName.Text := SelTemplate;
      Refresh_Templates_Write;
    end
  else
    btWriteTplNew.Click;

  CMD_Generate;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
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
procedure TFrmMain.Refresh_Diskdefs_DropDown;
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

procedure TFrmMain.btGoClick(Sender: TObject);
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
       if cbReadTplRaw.Checked = True then
         Add(lblReadTplRaw.Caption + ' Yes');
       if cbReadTplRaw.Checked = False then
         Add(lblReadTplRaw.Caption + ' No');
       Add(lblReadTplFakeIndex.Caption + ' ' + cbReadTplFakeIndex.Text);
       Add(cbReadTplAdjustSpeed.Caption + ' ' + cbReadTplAdjustSpeed.Text);
       Add(lblReadTplRetries.Caption + ' ' + cbReadTplRetries.Text);
       Add(lblReadTplSeekRetries.Caption + ' ' + cbReadTplSeekRetries.Text);
       Add(lblReadTplCyls.Caption + ' ' + cbReadTplCyls.Text);
       Add(lblReadTplHeads.Caption + ' ' + cbReadTplHeads.Text);
       Add(lblReadTplSteps.Caption + ' ' + cbReadTplSteps.Text);
       if cbReadTplHSwap.Checked = True
         then Add(lblReadTplHSwap.Caption + ' Yes');
       if cbReadTplHSwap.Checked = False then
         Add(lblReadTplHSwap.Caption + ' No');
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
       ShowOperationsDialog(EdGWCMD.Lines.Text, GW_APP_NAME + ' - Read', OPERATIONS_READ);
      end;

     // Output with Log
     if cbReadTplLogOutput.Checked = true then
       begin
        if cbReadTplLogBoth.Checked = false then
         begin
          ShowOperationsDialog(EdGWCMD.Lines.Text + ' 2> "' + LogDir +
            LogFileName + '_output.txt"', GW_APP_NAME + ' - Read', OPERATIONS_READ);
         end;
        if cbReadTplLogBoth.Checked = true then
         begin
          ShowOperationsDialog(EdGWCMD.Lines.Text + ' 2>> "' + LogDir + LogFilename + '"',
            GW_APP_NAME + ' - Read', OPERATIONS_READ);
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
      ShowOperationsDialog(EdGWCMD.Lines.Text, GW_APP_NAME + ' - Write',
        OPERATIONS_WRITE);
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
     ShowOperationsDialog(EdGWCMD.Lines.Text, GW_APP_NAME + ' - Convert', OPERATIONS_CONVERT);
    end;

   //Tools ####################################################################
   if pcActions.ActivePage.PageIndex = GW_PROP_PAGE_TOOLS then
     begin
      ShowOperationsDialog(EdGWCMD.Lines.Text, GW_APP_NAME + ' - ' + btGo.Caption, OPERATIONS_OTHER);
     end;

   //Settings ####################################################################
   if pcActions.ActivePage.PageIndex = GW_PROP_PAGE_SETTINGS then
     begin
      ShowOperationsDialog(EdGWCMD.Lines.Text, GW_APP_NAME + ' - ' + btGo.Caption, OPERATIONS_OTHER);
     end;
end;

procedure TFrmMain.btConvExplorerClick(Sender: TObject);
begin
{$IFDEF WINDOWS}
 SysUtils.ExecuteProcess('explorer.exe', '/n,'+edConvDirDest.text, []);
{$ELSE}
//TODO: Test
 SysUtils.ExecuteProcess('bash', edConvDirDest.text);
{$ENDIF}
end;

procedure TFrmMain.btConvClearClick(Sender: TObject);
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

procedure TFrmMain.btGWBandwidthClick(Sender: TObject);
begin
  performModalCmdAction('bandwidth');
end;

procedure TFrmMain.btGWCMDDirClick(Sender: TObject);
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

procedure TFrmMain.btGWInfoClick(Sender: TObject);
begin
  performModalCmdAction('info');
end;

procedure TFrmMain.btGWResetClick(Sender: TObject);
begin
  performModalCmdAction('reset');
end;

procedure TFrmMain.btReadDestExploreClick(Sender: TObject);
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

procedure TFrmMain.btReadDiskResetClick(Sender: TObject);
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

procedure TFrmMain.btReadTplDelClick(Sender: TObject);
var
  tmp : string;
  answer : Integer;
begin
  tmp := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
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

procedure TFrmMain.btReadTplNewClick(Sender: TObject);
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



procedure TFrmMain.btReadTplSaveClick(Sender: TObject);
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

 tmp := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
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
      WriteIniStringIfNotEmpty(INIRead, READ_TEMPLATE, INI_VERSION, sAppVersion_ReadTmpl);
      WriteIniStringIfNotEmpty(INIRead, READ_TEMPLATE, INI_TEMPLATE_NAME, cbReadTplName.Text);
      WriteIniStringIfNotEmpty(INIRead, READ_TEMPLATE, INI_TEMPLATE_DESC, edReadTplDesc.Text);

      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_FOLDER_DISKDEFS, cbReadTplFormatSrc.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, cbReadTplFormat.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_REVS, cbReadTplRevs.Text);

      WriteIniBoolIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_RAW, cbReadTplRaw.Enabled, cbReadTplRaw.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FAKE_INDEX, cbReadTplFakeIndex.Text);
      WriteIniBoolIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_HARD_SECTORS, cbReadTplHardSec.Enabled, cbReadTplHardSec.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_ADJUST_SPEED, cbReadTplAdjustSpeed.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_RETRIES, cbReadTplRetries.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_SEEK_RETRIES, cbReadTplSeekRetries.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_PLL, cbReadTplPLL.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_DD, cbReadTplDD.Text);

      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_CYLINDERS, cbReadTplCyls.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_HEADS, cbReadTplHeads.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_STEPS, cbReadTplSteps.Text);

      WriteIniBoolIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_HSWAP, cbReadTplHSwap.Enabled, cbReadTplHSwap.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FLIPPY, cbReadTplFlippy.Text);
      WriteIniBoolIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FLIPPY_REV, cbReadTplFlippyReverse.Enabled, cbReadTplFlippyReverse.Checked);

      WriteIniBoolIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_LOG_PARAM, cbReadTplLogParam.Enabled, cbReadTplLogParam.Checked);
      WriteIniBoolIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_LOG_OUTPUT, cbReadTplLogOutput.Enabled, cbReadTplLogOutput.Checked);
      WriteIniBoolIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_LOG_ONEFILE, cbReadTplLogBoth.Enabled, cbReadTplLogBoth.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FORMAT, cbReadFormat.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION, cbReadFormatOption.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_VER, cbReadFormatOptionHFEVer.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_INT, cbReadFormatOptionHFEInt.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_ENC, cbReadFormatOptionHFEEnc.Text);

      WriteIniStringIfNotEmpty(INIRead, INI_SETTINGS, INI_TEMPLATE_DIRECTORY, edReadDirDest.Text);
      INIRead.Free;

      tmp := cbReadTplName.Text;
      Refresh_Templates_Read_DropDown;
      cbReadTplName.Text := tmp;
      Refresh_Templates_Read;
    finally
    end;
  end;
end;

procedure TFrmMain.btSetDelaysDefaultClick(Sender: TObject);
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

procedure TFrmMain.btSetDelaysInfoClick(Sender: TObject);
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

procedure TFrmMain.BtWriteTplDelClick(Sender: TObject);
var
 tmp : string;
 answer : Integer;
begin
  tmp := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
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

procedure TFrmMain.BtWriteTplNewClick(Sender: TObject);
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



procedure TFrmMain.BtWriteTplSaveClick(Sender: TObject);
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

 tmp := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
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
    WriteIniStringIfNotEmpty(IniWrite, WRITE_TEMPLATE, INI_VERSION, sAppVersion_WriteTmpl);
    WriteIniStringIfNotEmpty(IniWrite, WRITE_TEMPLATE, INI_TEMPLATE_NAME, cbWriteTplName.Text);
    //WriteIniStringIfNotEmpty(IniWrite, WRITE_TEMPLATE, 'Creator', '');
    WriteIniStringIfNotEmpty(IniWrite, WRITE_TEMPLATE, INI_TEMPLATE_DESC, edWriteTplDesc.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_FOLDER_DISKDEFS, cbWriteTplFormatSrc.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, cbWriteTplFormat.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_ERASE_EMPTY, cbWriteTplEraseEmpty.Enabled, cbWriteTplEraseEmpty.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_FAKE_INDEX, cbWriteTplFakeIndex.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_HARD_SECTORS, cbWriteTplHardSec.Enabled, cbWriteTplHardSec.Checked);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_NO_VERIFY, cbWriteTplNoVerify.Enabled, cbWriteTplNoVerify.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_RETRIES, cbWriteTplRetries.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_PRE_COMP, cbWriteTplPrecomp.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_PRE_ERASE, cbWriteTplPreErase.Enabled, cbWriteTplPreErase.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_DD, cbWriteTplDensel.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_TP43_PIN2, cbWriteTplTplTP43Pin2.Enabled, cbWriteTplTplTP43Pin2.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_CYLINDERS, cbWriteTplCyls.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_HEADS, cbWriteTplHeads.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_STEPS, cbWriteTplSteps.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_HSWAP, cbWriteTplHSwap.Enabled, cbWriteTplHSwap.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_FLIPPY, cbWriteTplFlippy.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_FLIPPY_REV, cbWriteTplFlippyReverse.Enabled, cbWriteTplFlippyReverse.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SETTINGS, INI_TEMPLATE_FORMAT, cbWriteTplFormat.Text);


    IniWrite.Free;

    tmp := cbWriteTplName.Text;
    Refresh_Templates_Write_DropDown;
    cbWriteTplName.Text := tmp;
    Refresh_Templates_Write;
   finally
   end;
  end;
end;

procedure TFrmMain.btGWRefreshUSBClick(Sender: TObject);
begin
{$IFDEF WINDOWS}
 Get_DeviceCOM;
{$ELSE}
 Get_DeviceCOMLinux;
{$ENDIF}
end;

procedure TFrmMain.cbConvTplFlippyReverseClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.Refresh_Templates_Write_DropDown;
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

procedure TFrmMain.Refresh_Templates_Write;
var
  iniFile, iniRefreshWrite: TiniFile;
  TmplFolder: String;
begin
  //Read-Template
  iniFile := TiniFile.Create(sAppPath + GW_INI_FILE);
  TmplFolder := iniFile.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  If TmplFolder = '' then exit;
  iniRefreshWrite := TINIFile.Create(DirCheck(TmplFolder) + cbWriteTplName.Text + GW_INI_WRITE_EXT);
  try
    //ver := iniRefreshRead.ReadString(WRITE_TEMPLATE,INI_VERSION,'');
    //name := iniRefreshRead.ReadString(WRITE_TEMPLATE, INI_TEMPLATE_NAME, '');
    //creator := iniRefreshRead.ReadString(WRITE_TEMPLATE, 'Creator', '');

    cbWriteTplFormatSrc.Text := ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_FOLDER_DISKDEFS, 'Internal');
    Refresh_WriteFormSpec;
    cbWriteTplFormat.Text := ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_FORMAT_SPEC);
    edWriteTplDesc.Text   := ReadIniString(iniRefreshWrite, WRITE_TEMPLATE, INI_TEMPLATE_DESC);
    cbWriteTplEraseEmpty.checked := ReadIniBool(iniRefreshWrite,INI_SETTINGS, INI_TEMPLATE_ERASE_EMPTY);
    cbWriteTplFakeIndex.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_FAKE_INDEX);
    cbWriteTplHardSec.checked := ReadIniBool(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_HARD_SECTORS);
    cbWriteTplNoVerify.checked := ReadIniBool(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_NO_VERIFY);
    cbWriteTplRetries.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_RETRIES);
    cbWriteTplPrecomp.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_PRE_COMP);
    cbWriteTplPreErase.Checked:= ReadIniBool(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_PRE_ERASE);
    cbWriteTplDensel.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_DD);
    cbWriteTplTplTP43Pin2.Checked := ReadIniBool(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_TP43_PIN2);

    cbWriteTplCyls.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_CYLINDERS);
    cbWriteTplHeads.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_HEADS);
    cbWriteTplSteps.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_STEPS);
    cbWriteTplHSwap.Checked:= ReadIniBool(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_HSWAP);
    cbWriteTplFlippy.Text:= ReadIniString(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_FLIPPY);
    cbWriteTplFlippyReverse.checked := ReadIniBool(iniRefreshWrite, INI_SETTINGS, INI_TEMPLATE_FLIPPY_REV);

    if cbWriteTplName.Text <> '' then
      WriteIniString(iniFile, FLUX_INI_NAME, INI_LAST_WRITE_TEMPLATE, cbWriteTplName.Text);
    iniRefreshWrite.Free;
    iniFile.Free;
  finally
    CMD_Generate;
  end;
end;

procedure TFrmMain.Refresh_Templates_Read_DropDown;
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

procedure TFrmMain.Refresh_Templates_Read;
var
  iniRefreshRead, iniFile: TiniFile;
  tmplFolder: String;
begin
  //Read-Template
  iniFile := TiniFile.Create(sAppPath + GW_INI_FILE);
  tmplFolder := iniFile.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  If tmplFolder = '' then exit;

  iniRefreshRead := TINIFile.Create(DirCheck(tmplFolder) + cbReadTplName.Text + GW_INI_READ_EXT);
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

    cbReadFormat.Text              := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FORMAT, '');

    // Update the combo boxes after format is determined
    UpdateReadFormatSelection;
    cbReadFormatOption.Text        := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION, '');
    cbReadFormatOptionHFEVer.Text  := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_VER, '');
    cbReadFormatOptionHFEInt.Text  := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_INT, '');
    cbReadFormatOptionHFEEnc.Text  := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_ENC, '');
    edReadDirDest.Text            := iniRefreshRead.ReadString(INI_SETTINGS, INI_TEMPLATE_DIRECTORY, '');

    if cbReadTplName.Text <> '' then
      WriteIniString(iniFile, FLUX_INI_NAME, INI_LAST_READ_TEMPLATE, cbReadTplName.Text);
    iniRefreshRead.Free;
    iniFile.Free;

  finally
    CMD_Generate;
  end;
end;

procedure TFrmMain.cbConvAdjustSpeedChange(Sender: TObject);
begin
  if cbConvAdjustSpeed.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvDigitsChange(Sender: TObject);
begin
  if cbConvDigits.Focused then  Create_Filename;
end;

procedure TFrmMain.cbConvDisk1Change(Sender: TObject);
begin
  if cbConvDisk1.Focused then  Create_Filename;
end;

procedure TFrmMain.cbConvDisk2Change(Sender: TObject);
begin
  if cbConvDisk2.Focused then  Create_Filename;
end;

procedure TFrmMain.cbConvDiskdefsChange(Sender: TObject);
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

procedure TFrmMain.cbConvFormatOptionChange(Sender: TObject);
begin
 Create_Filename;
end;

procedure TFrmMain.cbConvIndexMarksChange(Sender: TObject);
begin
 if cbConvIndexMarks.Focused then CMD_Generate;
end;

procedure TFrmMain.cbGWHWChange(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TFrmMain.cbReadTplDDChange(Sender: TObject);
begin
 if cbReadTplDD.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplFlippyReverseClick(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TFrmMain.cbReadTplHardSecClick(Sender: TObject);
begin
 if cbReadTplHardSec.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplSeekRetries1Change(Sender: TObject);
begin
 if cbReadTplPLL.Focused then CMD_Generate;
end;

procedure TFrmMain.cbSetDelayAutoOffChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetDelayIndexMaskChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetDelayMotorChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetDelayPostWriteChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetDelayPreWriteChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetDelaySelectChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetDelaySettleChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetDelayStepChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetFirmwareBootloaderClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetPINLevelChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetPINNumberChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSrcAsDesDirChange(Sender: TObject);
begin
 if cbSrcAsDesDir.Checked then edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
 if cbSrcAsDesDir.Checked = false then edConvDirDest.Directory :=ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');
end;

procedure TFrmMain.cbSrcAsDesFileChange(Sender: TObject);
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

procedure TFrmMain.cbToolsCleanCylChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsCleanLingerChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsCleanPassesChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsCleanPassesEnter(Sender: TObject);
begin
 cbToolsCleanPasses.SelectAll;
end;

procedure TFrmMain.cbToolsEraseCylChange(Sender: TObject);
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

procedure TFrmMain.cbToolsEraseFakeIndexChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsEraseFlippyChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsEraseHeadsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsEraseHSwapClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsEraseRevsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsEraseStepsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsRPMNumbIterChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsRPMNumbIterEnter(Sender: TObject);
begin
 cbToolsRPMNumbIter.SelectAll;
end;

procedure TFrmMain.cbToolsSeekMotorOnClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsSeekTrackChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbToolsSeekTrackEnter(Sender: TObject);
begin
 cbToolsSeekTrack.SelectAll;
end;

procedure TFrmMain.cbToolsSeekTrackForceClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbWriteTplDenselChange(Sender: TObject);
begin
  if cbWriteTplDensel.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplFlippyReverseClick(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TFrmMain.cbWriteTplHardSecChange(Sender: TObject);
begin
  if cbWriteTplHardSec.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplPreEraseChange(Sender: TObject);
begin
  if cbWriteTplPreErase.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplTplTP43Pin2Change(Sender: TObject);
begin
 if cbWriteTplTplTP43Pin2.Focused then CMD_Generate;
end;

procedure TFrmMain.edConvDiskOfChange(Sender: TObject);
begin
  if edConvDiskOf.Focused then  Create_Filename;
end;

procedure TFrmMain.cbConvFileFormatChange(Sender: TObject);
var
  index: Integer;
  entryLine: String;
begin
 cbConvFormatOption.ItemIndex := -1;
 cbConvFormatOption.Items.Clear;
 cbConvFormatOption.Enabled:= false;

 // SCP Options
 if cbConvFileFormat.Text = 'SCP (SuperCardPro)' then
 begin
  cbConvFormatOption.Enabled:= true;
  cbConvFormatOption.Items.Clear;
  cbConvFormatOption.ItemIndex := -1;
  cbConvFormatOption.Items.Add('');
  // DiskType
  for index := 0 to High(SCPFormatOptions.Value) do
  begin
    entryLine := '::' + SCPFormatOptions.Name + '=' + SCPFormatOptions.Value[index];
    cbConvFormatOption.Items.Add(entryLine);
  end;
  cbConvFormatOption.ItemIndex := 0;
 end;

 // HFE Options
 if cbConvFileFormat.Text = 'HFE (HxC Floppy Emulator)' then
 begin
  cbConvFormatOption.Enabled:= true;
  cbConvFormatOption.ItemIndex := -1;
  cbConvFormatOption.Items.Clear;
  cbConvFormatOption.Items.Add('');

  // BitRate
  for index := 0 to High(HFEFormatOptions.BitRate.Value) do
  begin
    entryLine := '::' + HFEFormatOptions.BitRate.Name + '=' + HFEFormatOptions.BitRate.Value[index];
    cbConvFormatOption.Items.Add(entryLine);
  end;
  cbConvFormatOption.ItemIndex := 0;

  //HFEVersion
  cbConvFormatOptionHFEVer.ItemIndex := -1;
  cbConvFormatOptionHFEVer.Enabled:= true;

  //HLE InterfaceMode
  cbConvFormatOptionHFEInt.Items.Clear;
  cbConvFormatOptionHFEInt.ItemIndex := -1;
  cbConvFormatOptionHFEInt.Enabled:= true;
  cbConvFormatOptionHFEInt.Items.Add('');
  for index := 0 to High(HFEFormatOptions.DiskInterface.Value) do
  begin
    entryLine := '::' + HFEFormatOptions.DiskInterface.Name + '=' + HFEFormatOptions.DiskInterface.Value[index];
    cbConvFormatOptionHFEInt.Items.Add(entryLine);
  end;
  cbConvFormatOptionHFEInt.ItemIndex := 0;

  //HLE EncodingType
  cbConvFormatOptionHFEEnc.Items.Clear;
  cbConvFormatOptionHFEEnc.ItemIndex := -1;
  cbConvFormatOptionHFEEnc.Enabled:= true;
  cbConvFormatOptionHFEEnc.Items.Add('');
  for index := 0 to High(HFEFormatOptions.Encoding.Value) do
  begin
    entryLine := '::' + HFEFormatOptions.Encoding.Name + '=' + HFEFormatOptions.Encoding.Value[index];
    cbConvFormatOptionHFEEnc.Items.Add(entryLine);
  end;
  cbConvFormatOptionHFEEnc.ItemIndex := 0;
 end;
 Create_Filename;
end;

procedure TFrmMain.cbConvFormatChange(Sender: TObject);
begin
 if cbConvFormat.Focused then
  begin
   CMD_Generate;
 end;
end;

procedure TFrmMain.cbConvIncrementClick(Sender: TObject);
begin
  if cbConvIncrement.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvNoOverwriteClick(Sender: TObject);
begin
  if cbConvNoOverwrite.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvOutTracksetCylsChange(Sender: TObject);
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

procedure TFrmMain.cbConvOutTracksetFlippyChange(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TFrmMain.cbConvOutTracksetHeadsChange(Sender: TObject);
begin
 if cbConvOutTracksetHeads.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvOutTracksetHSwapClick(Sender: TObject);
begin
   if cbConvOutTracksetHSwap.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvOutTracksetStepsChange(Sender: TObject);
begin
   if cbConvOutTracksetSteps.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvPLLChange(Sender: TObject);
begin
  if cbConvPLL.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvTracksetCylsChange(Sender: TObject);
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

procedure TFrmMain.cbConvTracksetFlippyChange(Sender: TObject);
begin
   if cbConvTracksetFlippy.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvTracksetHeadsChange(Sender: TObject);
begin
   if cbConvTracksetHeads.Focused then CMD_Generate;
end;
procedure TFrmMain.cbConvTracksetHSwapClick(Sender: TObject);
begin
   if cbConvTracksetHSwap.Focused then CMD_Generate;
end;

procedure TFrmMain.cbConvTracksetStepsChange(Sender: TObject);
begin
   if cbConvTracksetSteps.Focused then CMD_Generate;
end;

procedure TFrmMain.cbGWDevCOMChange(Sender: TObject);
begin
   if cbGWDevCOM.Focused then CMD_Generate;
end;

procedure TFrmMain.cbGWDriveChange(Sender: TObject);
begin
   if cbGWDrive.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadNoOverwriteClick(Sender: TObject);
begin
   CMD_Generate;
end;

procedure TFrmMain.cbReadPreviewChange(Sender: TObject);
begin
 CMD_Generate;
end;

procedure TFrmMain.cbReadTplAdjustSpeedChange(Sender: TObject);
begin
  if cbReadTplAdjustSpeed.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplCylsChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbReadTplFakeIndexChange(Sender: TObject);
begin
  if cbReadTplFakeIndex.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplFlippyChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbReadTplFormatChange(Sender: TObject);
begin
  if cbReadTplFormat.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplFormatSrcChange(Sender: TObject);
begin
 Refresh_ReadFormSpec;
end;

procedure TFrmMain.Refresh_ReadFormSpec;
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

procedure TFrmMain.Get_FormatSpecs_Read;
var
  i, l : integer;
  tmp : string;
begin
  FormatSpecs_ReadDiskDefs := TStringList.Create;
  FormatSpecs_ReadDiskDefs.Clear;
  dd := DirCheck(ReadIniString(INI, FLUX_INI_NAME, GW_DISKDEF_FOLDER, '')) + cbReadTplFormatSrc.Text + GW_CONFIG_EXT;
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

procedure TFrmMain.Get_FormatSpecs_Write;
var
  i, l  : integer;
  tmp : string;
begin
  FormatSpecs_WriteDiskDefs := TStringList.Create;
  FormatSpecs_WriteDiskDefs.Clear;
  dd := DirCheck(ReadIniString(INI, FLUX_INI_NAME, GW_DISKDEF_FOLDER, '')) + cbWriteTplFormatSrc.Text + GW_CONFIG_EXT;
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

procedure TFrmMain.Get_FormatSpecs_Conv;
var
 i, l : integer;
 tmp : string;
begin
 FormatSpecs_ConvDiskDefs := TStringList.Create;
 FormatSpecs_ConvDiskDefs.Clear;
 dd := DirCheck(ReadIniString(INI, FLUX_INI_NAME, GW_DISKDEF_FOLDER, '')) + cbConvDiskdefs.Text + GW_CONFIG_EXT;
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

procedure TFrmMain.lblToolsEraseHFreqClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.mnuAboutClick(Sender: TObject);
begin
  FrmAbout.showmodal;
end;

procedure TFrmMain.mnuHelpClick(Sender: TObject);
begin

end;

procedure TFrmMain.mnuOptionsClick(Sender: TObject);
begin
  FrmOptions.showmodal;
end;

procedure TFrmMain.mnuArgumentsClick(Sender: TObject);
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

procedure TFrmMain.Set_View;
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



procedure TFrmMain.mnuFMFFClick(Sender: TObject);
begin
  LaunchURL('https://github.com/nistunedev/FluxFloppyManager');
end;

procedure TFrmMain.mnuGWDownloadClick(Sender: TObject);
begin
  LaunchURL('https://github.com/keirf/greaseweazle/wiki/Download-Host-Tools');
end;

procedure TFrmMain.mnuGWGettingStartedClick(Sender: TObject);
begin
 LaunchURL('https://github.com/keirf/greaseweazle/wiki/Getting-Started');
end;

procedure TFrmMain.mnuWebsiteClick(Sender: TObject);
begin
 LaunchURL('https://github.com/keirf/Greaseweazle');
end;

procedure TFrmMain.opSetFWFileClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.opSetFWOnlineClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.opSetFWTagClick(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.pcActionsChange(Sender: TObject);
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

procedure TFrmMain.rbGetPINClick(Sender: TObject);
begin
   if rbGetPIN.Checked = true then BtGo.Caption:= 'Get PIN';
   if rbSetPIN.Checked = true then BtGo.Caption:= 'Set PIN';
   CMD_Generate;
end;

procedure TFrmMain.rbSetPINClick(Sender: TObject);
begin
  if rbGetPIN.Checked = true then BtGo.Caption:= 'Get PIN';
  if rbSetPIN.Checked = true then BtGo.Caption:= 'Set PIN';
  CMD_Generate;
end;

procedure TFrmMain.rbSetDelaysClick(Sender: TObject);
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

procedure TFrmMain.rbSetFirmwareClick(Sender: TObject);
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

procedure TFrmMain.rbSetGetPINClick(Sender: TObject);
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

procedure TFrmMain.rbToolsCleanClick(Sender: TObject);
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

procedure TFrmMain.rbToolsEraseClick(Sender: TObject);
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

procedure TFrmMain.rbToolsRPMClick(Sender: TObject);
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

procedure TFrmMain.rbToolsSeekClick(Sender: TObject);
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

procedure TFrmMain.cbReadTplHeadsChange(Sender: TObject);
begin
  if cbReadTplHeads.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplHSwapChange(Sender: TObject);
begin
  if cbReadTplHSwap.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplNameChange(Sender: TObject);
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

procedure TFrmMain.cbReadTplNameSelect(Sender: TObject);
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

procedure TFrmMain.cbReadTplPLLChange(Sender: TObject);
begin
  if cbReadTplPLL.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplRawClick(Sender: TObject);
begin
 if cbReadTplRaw.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplRetriesChange(Sender: TObject);
begin
  if cbReadTplRetries.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplRevsChange(Sender: TObject);
begin
  if cbReadTplRevs.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplSeekRetriesChange(Sender: TObject);
begin
  if cbReadTplSeekRetries.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplStepsChange(Sender: TObject);
begin
  if cbReadTplSteps.Focused then CMD_Generate;
end;

procedure TFrmMain.cbReadTplLogParamClick(Sender: TObject);
begin
 if cbReadTplLogParam.Checked = false then cbReadTplLogBoth.enabled := false;
 if cbReadTplLogParam.Checked = true then
   begin
    if cbReadTplLogOutput.Checked = true then cbReadTplLogBoth.enabled := true;
    if cbReadTplLogOutput.Checked = false then cbReadTplLogBoth.enabled := false;
   end;
end;

procedure TFrmMain.cbReadTplLogOutputClick(Sender: TObject);
begin
 if cbReadTplLogOutput.Checked = false then cbReadTplLogBoth.enabled := false;
 if cbReadTplLogOutput.Checked = true then
   begin
    if cbReadTplLogParam.Checked = true then cbReadTplLogBoth.enabled := true;
    if cbReadTplLogParam.Checked = false then cbReadTplLogBoth.enabled := false;
   end;
end;

procedure TFrmMain.cbSetGlobalActionsBacktraceChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbSetGlobalActionsTimeChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbWriteTplCylsChange(Sender: TObject);
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

procedure TFrmMain.cbWriteTplEraseEmptyChange(Sender: TObject);
begin
   if cbWriteTplEraseEmpty.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplFakeIndexChange(Sender: TObject);
begin
   if cbWriteTplFakeIndex.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplFlippyChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.cbWriteTplFormatChange(Sender: TObject);
begin
   if cbWriteTplFormat.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplFormatSrcChange(Sender: TObject);
begin
 Refresh_WriteFormSpec;
end;

procedure TFrmMain.Refresh_WriteFormSpec;
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

procedure TFrmMain.cbWriteTplHeadsChange(Sender: TObject);
begin
   if cbWriteTplHeads.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplHSwapChange(Sender: TObject);
begin
  if cbWriteTplHSwap.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplNameChange(Sender: TObject);
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

procedure TFrmMain.cbWriteTplNameSelect(Sender: TObject);
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

procedure TFrmMain.cbWriteTplNoVerifyChange(Sender: TObject);
begin
   if cbWriteTplNoVerify.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplPrecompChange(Sender: TObject);
begin
  if cbWriteTplPrecomp.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplRetriesChange(Sender: TObject);
begin
  if cbWriteTplRetries.Focused then CMD_Generate;
end;

procedure TFrmMain.cbWriteTplStepsChange(Sender: TObject);
begin
  if cbWriteTplSteps.Focused then CMD_Generate;
end;

procedure TFrmMain.edConvDirDestChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.edConvFilenameChange(Sender: TObject);
begin
 if edConvFilename.Focused then Create_Filename;
end;

procedure TFrmMain.edConvFileSourceAcceptFileName(Sender: TObject;
  var Value: String);
begin
  if cbSrcAsDesDir.Checked then edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
  if cbSrcAsDesDir.Checked = false then edConvDirDest.Directory :=ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');
  if cbSrcAsDesFile.Checked then edConvFilename.text:= ExtractFileNameOnly(edConvFileSource.Text);
  if cbSrcAsDesFile.Checked = false then edConvFilename.text:= '';
  if edConvFileSource.Text <> '' then
   begin
    edConvFileSource.InitialDir := ExtractFilePath(edConvFileSource.Text);
    Create_Filename;
    CMD_Generate;
   end;
end;

procedure TFrmMain.edConvFileSourceChange(Sender: TObject);
begin
 if cbSrcAsDesDir.Checked then edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
 if cbSrcAsDesDir.Checked = false then edConvDirDest.Directory :=ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');
 if cbSrcAsDesFile.Checked then edConvFilename.text:= ExtractFileNameOnly(edConvFileSource.Text);
 if cbSrcAsDesFile.Checked = false then edConvFilename.text:= '';
 if edConvFileSource.Text <> '' then
  begin
   edConvFileSource.InitialDir := ExtractFilePath(edConvFileSource.Text);
   Create_Filename;
   CMD_Generate;
  end;
end;

procedure TFrmMain.EdGWFileChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.edReadDigitsChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TFrmMain.edReadDirDestChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.edReadDisk1Change(Sender: TObject);
begin
  Create_Filename;
end;

procedure TFrmMain.edReadDisk2Change(Sender: TObject);
begin
  Create_Filename;
end;

procedure TFrmMain.edReadDiskOfChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TFrmMain.cbReadFormatOptionChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TFrmMain.EdReadFilenameChange(Sender: TObject);
begin
  Create_Filename;
end;

// This need to be called when template selected or initial update
procedure TFrmMain.UpdateReadFormatSelection;
var
  entryLine : string;
  index: Integer;
begin
  cbReadFormatOption.Items.Clear;
  cbReadFormatOption.ItemIndex := -1;
  cbReadFormatOption.Enabled:= false;

  // Disable all options by default
  cbReadFormatOption.Enabled := false;
  cbReadFormatOptionHFEInt.Enabled := false;
  cbReadFormatOptionHFEVer.Enabled := false;
  cbReadFormatOptionHFEEnc.Enabled := false;

  // SCP Options
  if GetReadFormatSelection = COMBO_SELECTION_SCP then
  begin
   cbReadFormatOption.Items.Clear;
   cbReadFormatOption.ItemIndex := -1;
   cbReadFormatOption.Enabled:= true;
   cbReadFormatOption.Items.Add('');

   // DiskType
   for index := 0 to High(SCPFormatOptions.Value) do
   begin
     entryLine := '::' + SCPFormatOptions.Name + '=' + SCPFormatOptions.Value[index];
     cbReadFormatOption.Items.Add(entryLine);
   end;
   cbReadFormatOption.ItemIndex := 0;
  end;

  // HFE Options
  if GetReadFormatSelection = COMBO_SELECTION_HFE then
  begin
   cbReadFormatOption.Items.Clear;
   cbReadFormatOption.ItemIndex := -1;
   cbReadFormatOption.Enabled:= true;
   cbReadFormatOption.Items.Add('');
   // BitRate
   for index := 0 to High(HFEFormatOptions.BitRate.Value) do
   begin
     entryLine := '::' + HFEFormatOptions.BitRate.Name + '=' + HFEFormatOptions.BitRate.Value[index];
     cbReadFormatOption.Items.Add(entryLine);
   end;
   cbReadFormatOption.ItemIndex := 0;

   //HFEVersion
   cbReadFormatOptionHFEVer.ItemIndex := -1;
   cbReadFormatOptionHFEVer.Enabled:= true;

   //HLE InterfaceMode
   cbReadFormatOptionHFEInt.Items.Clear;
   cbReadFormatOptionHFEInt.ItemIndex := -1;
   cbReadFormatOptionHFEInt.Enabled:= true;
   cbReadFormatOptionHFEInt.Items.Add('');
   for index := 0 to High(HFEFormatOptions.DiskInterface.Value) do
   begin
     entryLine := '::' + HFEFormatOptions.DiskInterface.Name + '=' + HFEFormatOptions.DiskInterface.Value[index];
     cbReadFormatOptionHFEInt.Items.Add(entryLine);
   end;
   cbReadFormatOptionHFEInt.ItemIndex := 0;

   //HLE EncodingType
   cbReadFormatOptionHFEEnc.Items.Clear;
   cbReadFormatOptionHFEEnc.ItemIndex := -1;
   cbReadFormatOptionHFEEnc.Enabled:= true;
   cbReadFormatOptionHFEEnc.Items.Add('');
   for index := 0 to High(HFEFormatOptions.Encoding.Value) do
   begin
     entryLine := '::' + HFEFormatOptions.Encoding.Name + '=' + HFEFormatOptions.Encoding.Value[index];
     cbReadFormatOptionHFEEnc.Items.Add(entryLine);
   end;
   cbReadFormatOptionHFEEnc.ItemIndex := 0;
  end;
end;

procedure TFrmMain.cbReadFormatChange(Sender: TObject);
begin
  UpdateReadFormatSelection;

  Create_Filename;
end;

procedure TFrmMain.edToolsFWChange(Sender: TObject);
begin
 if edToolsFW.Focused then CMD_Generate;
end;

procedure TFrmMain.edToolsFWTagChange(Sender: TObject);
begin
 if edToolsFWTag.Focused then CMD_Generate;
end;

procedure TFrmMain.edWriteFileNameAcceptFileName(Sender: TObject;
  var Value: String);
begin
  CMD_Generate;
end;

procedure TFrmMain.edWriteFileNameChange(Sender: TObject);
begin
  CMD_Generate;
end;

procedure TFrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
 INI := TINIFile.Create(sAppPath + GW_INI_FILE);
 WriteIniInteger(INI, FLUX_INI_NAME, INI_HEIGHT, FrmMain.Height);
 WriteIniInteger(INI, FLUX_INI_NAME, INI_WIDTH, FrmMain.Width);
 WriteIniBool(INI, FLUX_INI_NAME, INI_SHOWARG, mnuArguments.Checked);
 WriteIniString(INI,FLUX_INI_NAME, INI_GW, EdGWFile.Text);
 If ReadIniBool(INI, FLUX_INI_NAME, INI_SAVE_DEVICE_FLAG, false) = true then
  begin
   WriteIniString(INI,FLUX_INI_NAME, INI_SAVE_DEVICE, cbGWDevCOM.Text);
  end
 else WriteIniString(INI,FLUX_INI_NAME, INI_SAVE_DEVICE, '');
 If ReadIniBool(INI, FLUX_INI_NAME, INI_SAVE_DRIVE_FLAG, false) = true then
  begin
   WriteIniString(INI,FLUX_INI_NAME, INI_SAVE_DRIVE, cbGWDrive.Text);
  end
 else WriteIniString(INI,FLUX_INI_NAME, INI_SAVE_DRIVE, '');
 WriteIniString(INI,FLUX_INI_NAME, INI_ACTIONS_GW_HW, cbGWHW.Text);
 WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_READ_DEST, edReadDirDest.Directory);
 WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_WRITE_SRC,ExtractFilePath(edWriteFilename.Text));
 WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_CONVERT_SRC,ExtractFilePath(edConvFileSource.Text));
 WriteIniString(INI,FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,edConvDirDest.Directory);
 WriteIniBool(INI, FLUX_INI_NAME, INI_ACTIONS_TIME, cbSetGlobalActionsTime.Checked);
 WriteIniBool(INI, FLUX_INI_NAME, INI_ACTIONS_SHELL, false);
 WriteIniBool(INI, FLUX_INI_NAME, INI_ACTIONS_BACKTRACE, cbSetGlobalActionsBacktrace.Checked);
 INI.Free;
end;



procedure TFrmMain.FormResize(Sender: TObject);
const
  MinWidth = MIN_WIDTH;
  MinHeight = MIN_HEIGHT;
begin
   if Width < MinWidth then Width := MinWidth;
   if Height < MinHeight then Height := MinHeight;
end;

procedure TFrmMain.mnuCloseClick(Sender: TObject);
begin
  close;
end;

function TFrmMain.GetReadFormatSelection(): String;
begin
  Result := trim(leftStr(cbReadFormat.Text,3));
end;

function TFrmMain.GetConvFormatSelection(): String;
begin
  Result := trim(leftStr(cbConvFileFormat.Text,3));
end;

procedure TFrmMain.Create_Filename;
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
     disc1 := StrToInt(edReadDisk1.Text); // disc LHS
     disc2 := StrToInt(edReadDisk2.Text); // of disc RHS
     digits := StrToInt(edReadDigits.Text);
     lblOf := edReadDiskOf.Text;


     if disc1 > 0 then
       filenameRead := edConvFilename.Text + Format('%.*d', [digits, disc1]);

     if disc2 > 0 then
       filenameRead := filenameRead + lblOf + Format('%.*d', [digits, disc2]);

  // read file extension - FMFF 4.0
   cbReadFormatOptionHFEVer.Enabled :=false;
   cbReadFormatOptionHFEInt.Enabled :=false;
   cbReadFormatOptionHFEEnc.Enabled :=false;
   case GetReadFormatSelection of
    COMBO_SELECTION_EDS: //EDSK
      begin
       cbReadPreview.Text := filenameRead + '.' + lowercase(trim(leftStr(cbReadFormat.Text,4)));
      end;
    COMBO_SELECTION_HFE:
      begin
       cbReadFormatOption.Enabled := true;
       cbReadFormatOptionHFEVer.Enabled :=true;
       cbReadFormatOptionHFEInt.Enabled :=true;
       cbReadFormatOptionHFEEnc.Enabled :=true;
       cbReadPreview.Text := filenameRead + '.' + lowercase(GetReadFormatSelection) + cbReadFormatoption.Text + cbReadFormatoptionHFEVer.Text + cbReadFormatoptionHFEInt.Text + cbReadFormatoptionHFEEnc.Text;
      end;
    COMBO_SELECTION_SCP:
      begin
        cbReadFormatOption.Enabled := true;
        cbReadPreview.Text := filenameRead + '.' + lowercase(GetReadFormatSelection) + cbReadFormatoption.Text;
        cbReadPreview.Text := filenameRead + '00.0.' + lowercase(GetReadFormatSelection);
      end
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
       disc1 := cbConvDisk1.Value; // Disc LHS
       disc2 := cbConvDisk2.Value; // of Disc RHS
       digits := cbConvDigits.Value;
       lblOf := edConvDiskOf.Text;
       // Disc1
       if disc1 > 0 then
        filenameConvert := edConvFilename.Text + Format('%.*d', [digits, disc1]);

       if disc2 > 0 then
        filenameConvert := filenameConvert + lblOf + Format('%.*d', [digits, disc2]);

    // conv file extension - FMFF 4.0
    cbConvFormatOption.Enabled := false;
    cbConvFormatOptionHFEVer.Enabled :=false;
    cbConvFormatOptionHFEInt.Enabled :=false;
    cbConvFormatOptionHFEEnc.Enabled :=false;

    case GetConvFormatSelection of
     COMBO_SELECTION_EDS: //EDSK
       begin
        edConvFilenamePreview.Text := FilenameConvert + '.' + lowercase(trim(leftStr(cbConvFileFormat.Text,4)));
       end;
     COMBO_SELECTION_HFE:
       begin
        cbConvFormatOption.Enabled := true;
        cbConvFormatOptionHFEVer.Enabled :=true;
        cbConvFormatOptionHFEInt.Enabled :=true;
        cbConvFormatOptionHFEEnc.Enabled :=true;
        edConvFilenamePreview.Text := FilenameConvert + '.' + Lowercase(GetConvFormatSelection) + cbConvFormatOption.Text + cbConvFormatOptionHFEVer.Text + cbConvFormatOptionHFEInt.Text + cbConvFormatOptionHFEEnc.Text;
       end;
     COMBO_SELECTION_SCP:
       begin
        cbConvFormatOption.Enabled := true;
        edConvFilenamePreview.Text := FilenameConvert + '.' + Lowercase(GetConvFormatSelection) + cbConvFormatOption.Text;
       end;
     COMBO_SELECTION_RAW:
       begin
        edConvFilenamePreview.Text := FilenameConvert + '00.0.' + lowercase(GetConvFormatSelection);
       end;
     else
       if cbConvFileFormat.Text <> '' then edConvFilenamePreview.Text := FilenameConvert + '.' + lowercase(trim(leftStr(cbConvFileFormat.Text,3)));
       if cbConvFileFormat.Text = '' then edConvFilenamePreview.Text := FilenameConvert;
    end;
   end;

end;
procedure TFrmMain.CMD_Generate;
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
procedure TFrmMain.performCmdAction(const cmd: string;
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
procedure TFrmMain.performModalCmdAction(const command: string);
begin
  if cbGWDevCOM.Text <> '' then
  begin
    if fileexists(edGWFile.Text) = true then
      begin
        ShowOperationsDialog('"' + edGWFile.Text + '" ' + command + ' --device ' +
          cbGWDevCOM.Text, GW_APP_NAME + ' - "' + edGWFile.Text + '" ' + command +
          ' --device ' + cbGWDevCOM.Text, OPERATIONS_OTHER);
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

procedure TFrmMain.ShowOperationsDialog(const CommandLine, Title: string;
  const DisplayMode: TOperationDisplayMode);
begin
  aLine := CommandLine;
  FrmOperations.DisplayMode := TOperationDisplayMode(DisplayMode);
  FrmOperations.Caption := Title;
  FrmOperations.ShowModal;
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


// Helper to load a <option> node into a TFormatOption
procedure LoadOption(OptionNode: TDOMNode; var Opt: TFormatOption);
var
  i: Integer;
  ValueNode: TDOMNode;
  Count: Integer;
begin
  Opt.Name := TDOMElement(OptionNode).GetAttribute('name');
  Count := OptionNode.ChildNodes.Count;
  SetLength(Opt.Value, Count);
  i := 0;
  while i < Count do
  begin
    ValueNode := OptionNode.ChildNodes[i];
    if ValueNode.NodeName = 'value' then
    begin
      Opt.Value[i] := ValueNode.TextContent;
      Inc(i);
    end
    else
      Inc(i);
  end;
  SetLength(Opt.Value, i); // trim unused
end;

procedure TFrmMain.LoadXML(const FileName: string);
var
  Doc: TXMLDocument;
  Node, Child: TDOMNode;
  Spec, Ext, Desc: string;
  FormatDesc: string;
  CanRead, CanWrite, CanConvert, CanSave: Boolean;
  WriteFilterAll, WriteFilterList: string;
  ConvFilterAll, ConvFilterList: string;
  i, j: Integer;
  OptionNode: TDOMNode;
begin
  ReadXMLFile(Doc, FileName);
  WriteFilterAll := 'Floppy-Images (*.*)|';
  WriteFilterList := '';
  ConvFilterAll := 'Floppy-Images (*.*)|';
  ConvFilterList := '';

  // Create StringLists Read/Conv Destination fileextension
  FormatDest_Ext := TStringList.Create;
  FormatDest_Ext.Add('');
  FormatSpecs_Read := TStringList.Create;
  FormatSpecs_Read.Add('');
  FormatSpecs_Write := TStringList.Create;
  FormatSpecs_Write.Add('');
  FormatSpecs_Conv := TStringList.Create;
  FormatSpecs_Conv.Add('');

  { ---- formatspecs ---- }
  Node := Doc.DocumentElement.FindNode('formatspecs');
  if Assigned(Node) then
  begin
    Child := Node.FirstChild;
    while Assigned(Child) do
    begin
      if Child is TDOMElement then
      begin
        Spec := TDOMElement(Child).GetAttribute('spec');
        CanRead := TDOMElement(Child).GetAttribute('read')='true';
        CanWrite := TDOMElement(Child).GetAttribute('write')='true';
        CanConvert := TDOMElement(Child).GetAttribute('convert')='true';

        { Use XML flag attributes to add to each list }
        if CanRead then
        begin
          FormatSpecs_Read.Add(Spec);
        end;
        if CanWrite then
        begin
          FormatSpecs_Write.Add(Spec);
        end;
        if CanConvert then
        begin
          FormatSpecs_Conv.Add(Spec);
        end;
      end;
      Child := Child.NextSibling;
    end;
  end;

  { ---- formats ---- }
  Node := Doc.DocumentElement.FindNode('formats');
  if Assigned(Node) then
  begin
    Child := Node.FirstChild;
    while Assigned(Child) do
    begin
      if Child is TDOMElement then
      begin

        Ext := TDOMElement(Child).GetAttribute('ext');
        Desc := TDOMElement(Child).GetAttribute('desc');
        CanSave := TDOMElement(Child).GetAttribute('save')='true';
        CanConvert := TDOMElement(Child).GetAttribute('convert')='true';
        { Add format EXT (Description) }
        FormatDesc := ext + ' (' + Desc + ')';
        FormatDest_Ext.Add(FormatDesc);

        { Write file filter *.EXT|descrption }
        if CanSave then
        begin
           WriteFilterAll := WriteFilterAll + '*.' + LowerCase(Ext) + ';';
           WriteFilterList := WriteFilterList + Desc + ' (' + Ext + ')|*.' + LowerCase(Ext) + '|';
        end;
        { Conversion file filter *.EXT|description }
        if CanConvert then
        begin
            ConvFilterAll := ConvFilterAll + '*.' + LowerCase(Ext) + ';';
            ConvFilterList := ConvFilterList + Desc + ' (' + Ext + ')|*.' + LowerCase(Ext) + '|';
        end;

        { SuperCardPro options }
        if Ext = 'SCP' then
        begin
          for i := 0 to TDOMElement(Child).ChildNodes.Count - 1 do
          begin
            OptionNode := TDOMElement(Child).ChildNodes[i];
            if OptionNode.NodeName = 'option' then
              LoadOption(OptionNode, SCPFormatOptions);
          end;
        end
        else if Ext = 'HFE' then
        begin
          for j := 0 to TDOMElement(Child).ChildNodes.Count - 1 do
          begin
            OptionNode := TDOMElement(Child).ChildNodes[j];
            if OptionNode.NodeName <> 'option' then Continue;

            case TDOMElement(OptionNode).GetAttribute('name') of
              HFE_OPTION_BITRATE:
                LoadOption(OptionNode, HFEFormatOptions.BitRate);
              HFE_OPTION_INTERFACE:
                LoadOption(OptionNode, HFEFormatOptions.DiskInterface);
              HFE_OPTION_ENCODING:
                LoadOption(OptionNode, HFEFormatOptions.Encoding);
            end;
          end;
        end;
      end;
      Child := Child.NextSibling;
    end;
  end;
  Doc.Free;

  EdWriteFileName.Filter := WriteFilterAll + '|' + WriteFilterList;
  edConvFileSource.Filter := ConvFilterAll + '|' + ConvFilterList;

end;

end.


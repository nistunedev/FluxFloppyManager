
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
    btWriteDiskReset: TButton;
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
    cbReadConvFormat: TComboBox;
    cbReadFormat: TComboBox;
    cbReadFormatOption: TComboBox;
    cbReadFormatOptionHFEEnc: TComboBox;
    cbReadFormatOptionHFEInt: TComboBox;
    cbReadFormatOptionHFEVer: TComboBox;
    cbReadIncremental: TCheckBox;
    cbReadNoOverwrite: TCheckBox;
    cbReadPreview: TEdit; // Preview version of the destination filename
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
    edCmdLinePreview: TMemo;
    EdGWFile: TFileNameEdit;
    edReadDigits: TSpinEdit;
    edReadDirDest: TDirectoryEdit;
    edWriteDirDest: TDirectoryEdit;
    edReadDisk1: TSpinEdit;
    edReadDisk2: TSpinEdit;
    edReadDiskOf: TEdit;
    edReadFilename: TEdit;
    edWriteFilename: TFileNameEdit;
    edReadTplDesc: TEdit;
    edToolsFW: TFileNameEdit;
    edToolsFWTag: TEdit;
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
    lblWriteDestDir: TLabel;
    lblReadDestDiskNr: TLabel;
    lblReadDestFile: TLabel;
    lblWriteDestFile: TLabel;
    lblReadDestConvFormat: TLabel;
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
    procedure btGoHXCClick(Sender: TObject);
    procedure btGoSamdiskClick(Sender: TObject);
    procedure btGWBandwidthClick(Sender: TObject);
    procedure btGWCMDDirClick(Sender: TObject);
    procedure btGWInfoClick(Sender: TObject);
    procedure btGWResetClick(Sender: TObject);
    procedure btReadDestExploreClick(Sender: TObject);
    procedure btReadDiskResetClick(Sender: TObject);
    procedure btWriteDiskResetClick(Sender: TObject);
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
    procedure cbReadConvFormatChange(Sender: TObject);
    procedure cbReadTplAdjustSpeedChange(Sender: TObject);
    procedure cbReadTplCylsChange(Sender: TObject);
    procedure cbReadTplFakeIndexChange(Sender: TObject);
    procedure cbReadTplFlippyChange(Sender: TObject);
    procedure cbReadTplFormatChange(Sender: TObject);
    procedure cbReadTplFormatSrcChange(Sender: TObject);
    procedure cbReadTplHeadsChange(Sender: TObject);
    procedure cbReadTplHSwapChange(Sender: TObject);
    procedure checkUpdateReadTemplateButtons;
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
    procedure checkUpdateWriteTemplateButtons;
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
    procedure edWriteDirDestChange(Sender: TObject);
    procedure edReadDisk1Change(Sender: TObject);
    procedure edReadDisk2Change(Sender: TObject);
    procedure edReadDiskOfChange(Sender: TObject);
    procedure cbReadFormatOptionChange(Sender: TObject);
    procedure edReadFilenameChange(Sender: TObject);
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
    function getHfeFormatOptions: String;
    function getScpFormatOptions(): String;
    function BuildReadBaseFilename: String;
    function BuildReadTargetFilename(const BaseName, FormatText: string): String;
    function GetReadFormatSelection : String;
    function GetConvFormatSelection : String;
    function UseReadHFEConversion: Boolean;
    function UseReadSCPConversion: Boolean;
    function checkGwExecutable: boolean;
    procedure setOptionsRead(optenabled: boolean);
    procedure setOptionsConvert(optenabled: boolean);
    function GetHXC_HFE_Module: String;
    function GetHXC_SCP_Module: String;
    procedure UpdateReadFormatSelection;
    procedure Conv_SCP_CMD_Generate;
    procedure Conv_HXC_CMD_Generate(hxcModule: String);
    procedure GW_CMD_Generate;
    function GW_CMD_Read_Generate: string;
    function GW_CMD_Write_Generate: string;
    function GW_CMD_Convert_Generate: string;
    function GW_CMD_Tools_Erase_Generate: string;
    function GW_CMD_Tools_Seek_Generate: string;
    function GW_CMD_Tools_Clean_Generate: string;
    function GW_CMD_Settings_Delays_Generate: string;
    function GW_CMD_Settings_Pin_Generate: string;
    function GW_CMD_Settings_Firmware_Generate: string;
    function LogParameters: string;
    procedure setHfeReadEnabled(hfeEnabled: boolean);
    procedure setHfeConvEnabled(hfeEnabled: boolean);
    procedure setPinEnabled(ctrlEnabled: boolean);
    procedure setDelaysEnabled(ctrlEnabled: boolean);
    procedure setFirmwareEnabled(ctrlEnabled: boolean);
    procedure setEraseEnable(ctrlEnabled: boolean);
    procedure setSeekEnable(ctrlEnabled: boolean);
    procedure setRPMEnable(ctrlEnabled: boolean);
    procedure setCleanEnable(ctrlEnabled: boolean);
    procedure setupGwExecutable;
    function createNewIniFile: TIniFile;
    function getHXCApplication: String;
    function getSamdiskApplication: String;

    procedure updateGwCmdAction(const cmd: string;
                                const param: string;
                                const specifyDevice: boolean;
                                const specifyDrive: boolean);

    procedure updateCmdPreview(const cmdPreview: string);

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
function getFormatExtension(const formatText: string): String;

type
  TFormatOption = record
    Name: string;
    Value: array of string;
  end;

  THXCFormatModule = record
    ModuleId: string;
    Ext: string;
    Desc: string;
    HFEInterface: string;
    DiskType: string; // Comma separated list
  end;

  THfeFormatEntry = record
    BitRate: TFormatOption;
    Version: TFormatOption;
    DiskInterface: TFormatOption;
    Encoding: TFormatOption;
  end;

var
  FrmMain: TFrmMain;
  INI: TIniFile;
  FormatSpecs_Read, FormatSpecs_ReadDiskDefs: TStringList;
  FormatSpecs_Write, FormatSpecs_WriteDiskDefs: TStringList;
  FormatSpecs_Conv, FormatSpecs_ConvDiskDefs: TStringList;
  FormatDest_Ext, FormstDestConv_Ext : TStringList;
  sAppName, sAppPath, sAppVersion, sAppDate, AboutGW, sAppVersion_ReadTmpl, sAppVersion_WriteTmpl : String;
  dd : String; // Diskdefs.cfg
  adjustedCmdLine : String; // GreaseWeazle (frmGW)

  SCPFormatOptions: TFormatOption;
  HFEFormatOptions: THfeFormatEntry;
  HXCFormatModules: array of THXCFormatModule;
  FormDisplayed : Boolean = false;

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
  ThisFile.DeleteKey(Section, Key);
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
    INI := createNewIniFile;

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
  edWriteDirDest.Directory := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_WRITE_SRC,'');
  edConvFileSource.InitialDir := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_CONVERT_SRC,'');
  edConvDirDest.Directory := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_CONVERT_DEST,'');

  // Form size height/width
  FrmMain.Height := INI.ReadInteger(FLUX_INI_NAME, INI_HEIGHT, INITIAL_HEIGHT);
  FrmMain.Width := INI.ReadInteger(FLUX_INI_NAME, INI_WIDTH, INITIAL_WIDTH);
  Set_View;
  // Center
  FrmMain.Top:=(( Screen.Height-Height)div 2);
  FrmMain.Left:=((Screen.Width-Width)div 2);

  setupGwExecutable;

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
  cbReadTplFormat.items.Text := FormatSpecs_Read.Text;
  cbReadFormat.Items.Text := FormatDest_Ext.Text;        // bspw. .msa
  cbReadConvFormat.Items.Text := FormstDestConv_Ext.Text;
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

  FormDisplayed := true;
  CMD_Generate;
end;

function TFrmMain.createNewIniFile: TIniFile;
var
  INI: TIniFile;
begin
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
  Result := INI;
 end;
end;

procedure TFrmMain.setupGwExecutable;
var
  gw: string;
begin
  // Where is gw.exe ?
  gw := ReadIniString(INI, FLUX_INI_NAME, GW_APP_NAME, '');
  If gw <> '' then
    begin
     if FileExists(gw) = true then
      begin
       edGWfile.Text := gw;
      end
     else
      begin
       gw := Selectfile('Select Greaseweazle (' + GW_APP + ')',sAppPath, GW_EXECUTABLE);
       if gw <> '' then
        begin
         WriteIniString(INI,FLUX_INI_NAME, GW_APP_NAME, edGWfile.Text);
         edGWfile.Text := gw;
        end;
      end;
    end
  else
    begin
     if FileExists(sAppPath + GW_APP) = true then
      begin
       edGWfile.Text := sAppPath + GW_APP;
       WriteIniString(INI,FLUX_INI_NAME, GW_APP_NAME, sAppPath + GW_EXECUTABLE);
      end;
     if FileExists(sAppPath + GW_EXECUTABLE) = False then
      begin
       gw := Selectfile('Select Greaseweazle (' + GW_APP + ')',sAppPath, GW_EXECUTABLE);
       if gw <> '' then
        begin
         WriteIniString(INI,FLUX_INI_NAME, GW_APP_NAME, edGWfile.Text);
         edGWfile.Text := gw;
        end;
      end;
    end;
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
    cbReadTplFormatSrc.Items.Add(FORMAT_SPEC_INTERNAL);
    cbWriteTplFormatSrc.items.Clear;
    cbWriteTplFormatSrc.items.Add(FORMAT_SPEC_INTERNAL);
    cbConvDiskdefs.items.Clear;
    cbConvDiskdefs.items.Add(FORMAT_SPEC_INTERNAL);
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


function ConfirmAbort(const Msg: string; Ctrl: TWinControl): Boolean;
begin
  Result := MessageDlg(Msg, mtWarning, [mbCancel], 0) = mrCancel;

  if Result then
    Ctrl.SetFocus;
end;

function ConfirmAbort(const Msg: string): Boolean;
begin
  Result := MessageDlg(Msg, mtWarning, [mbCancel], 0) = mrCancel;
end;

function ConfirmYesNoAbort(const Msg: string; Ctrl: TWinControl): Integer;
begin
  Result := MessageDlg(Msg, mtWarning, [mbYes, mbCancel], 0);

  if Result = mrCancel then
    Ctrl.SetFocus;
end;


function TFrmMain.getHXCApplication: String;
var
  hxcFile: String;
begin

  hxcFile := ReadIniString(INI, FLUX_INI_NAME, HXC_APP_NAME, '');
  if hxcFile = '' then
     ConfirmAbort('Please define location of HxC Floppy Image Converter!')
  else if FileExists(hxcFile) = false then
   ConfirmAbort('HxC Floppy Image Converter not found!');

  Result := hxcFile;
end;

function TFrmMain.getSamdiskApplication: String;
var
  sdDiskfile: String;
begin
  sdDiskfile := ReadIniString(INI, FLUX_INI_NAME, SAMDISK_APP_NAME, '');
  if sdDiskfile = '' then
     ConfirmAbort('Please define location of Samdisk Converter!')
  else if FileExists(sdDiskfile) = false then
   ConfirmAbort('Samdisk Converter not found!');

  Result := sdDiskfile;
end;



procedure TFrmMain.btGoHXCClick(Sender: TObject);
var
  hxcFile, hxcInputFile: String;
begin
  hxcFile := getHXCApplication;
  if UseReadHFEConversion and (hxcFile <> '') then
  begin
     hxcInputFile := DirCheck(edReadDirDest.Text) + GetReadFormatSelection;

     if FileExists(hxcInputFile) = false then
       if ConfirmAbort('HxC input file not found!' + chr(10) + hxcInputFile) then
         exit;

     ShowOperationsDialog(edCmdLinePreview.Lines.Text, 'HxC Floppy Image Converter - Convert', OPERATIONS_OTHER);
     exit;
   end;

end;

procedure TFrmMain.btGoSamdiskClick(Sender: TObject);
var
  sdFile, sdInputFile: String;
begin
  sdFile := getSamdiskApplication;
  if UseReadSCPConversion and (sdFile <> '') then
  begin
     sdInputFile := DirCheck(edReadDirDest.Text) + GetReadFormatSelection;

     if FileExists(sdInputFile) = false then
       if ConfirmAbort('Samdisk input file not found!' + chr(10) + sdInputFile) then
         exit;

     ShowOperationsDialog(edCmdLinePreview.Lines.Text, 'SamDisk Converter - Convert', OPERATIONS_OTHER);
     exit;
   end;

end;


function TFrmMain.LogParameters: string;
var
 LogDir, LogFilename : String;
begin
  with TStringList.Create do
   try
    LogDir := DirCheck(edReadDirDest.Text);
    LogFilename := ExtractFileName_WithoutExt(cbReadPreview.Text) + '.txt';

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
    Result := LogDir + LogFilename;
   finally
    Free;
   end;
end;


// btGoClick()

// This procedure does preliminary checks and brings up the GW modal window
// edCmdLinePreview.Lines.Text already contains the constructed command line
// Some parts of this sneakily add other parameters such as logging parameters
// which are not displayed on the command line

// In: edCmdLinePreview.Lines - Displayed GW command line
// Out: adjustedCmdLine - Final GW command line
// Out: Caption - GW Modal window title bar

procedure TFrmMain.btGoClick(Sender: TObject);
var
    answer : integer;
    logDirFile : string = '';
begin


   // Read  ######################################################################
   case pcActions.ActivePageIndex of
    GW_PROP_PAGE_READ:
     begin
       if edReadDirDest.Text = '' then
         if ConfirmAbort('Destination directory not defined!') then exit;

       if Directoryexists(Dircheck(edReadDirDest.Text)) = false then
        begin
          answer := ConfirmYesNoAbort('Destination directory not found! Create directory?',edReadDirDest);
           if answer = mrCancel then exit
           else if answer = mrYes then
             Forcedirectories(dircheck(edReadDirDest.Text));
        end;

       if edReadFilename.Text = '' then
         if ConfirmAbort('Destination filename is not defined!',edReadFilename) then
           exit;

       if cbReadFormat.Text = '' then
         if ConfirmAbort('Destination format setting is missing!',cbReadFormat) then
           exit;

       // RAW or not -format
       if (cbReadFormat.Text = 'IMA (Disk Image)') or (cbReadFormat.Text = 'IMG (Disk Image)') then
         if cbReadTplFormat.Text = '' then
          if ConfirmAbort('Sector image requires a disk format to be specified!',cbReadTplFormat) then
            exit;

       // HFE bitrate
       if (UseReadHFEConversion = false) and (cbReadFormat.Text = 'HFE (HxC Floppy Emulator)') then
         if cbReadFormatoption.Text = '' then
          if ConfirmAbort('HFE: Requires bitrate to be specified (eg. filename.hfe::bitrate=500)',cbReadFormatoption) then
            exit;

       // Existing file
       if FileExists(DirCheck(edReadDirDest.Text) + cbReadPreview.Text) then
           if ConfirmYesNoAbort('Destination file is already existing! Overwrite?', edReadDirDest) = mrCancel then
             exit;

       //Log parameter
       if cbReadTplLogParam.Checked = true then
         logDirFile := LogParameters;

       if cbReadTplLogOutput.Checked = false then
         ShowOperationsDialog(edCmdLinePreview.Lines.Text, GW_APP_NAME + ' - Read', OPERATIONS_READ);

       // Output with Log
       if cbReadTplLogOutput.Checked = true then
         begin
          if cbReadTplLogBoth.Checked = false then
           begin
            ShowOperationsDialog(edCmdLinePreview.Lines.Text + ' 2> "' + logDirFile + '_output.txt"', GW_APP_NAME + ' - Read', OPERATIONS_READ);
           end;
          if cbReadTplLogBoth.Checked = true then
           begin
            ShowOperationsDialog(edCmdLinePreview.Lines.Text + ' 2>> "' + logDirFile + '"', GW_APP_NAME + ' - Read', OPERATIONS_READ);
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
     end; // GW_PROP_PAGE_READ
    // read end

  // Write  ######################################################################
  GW_PROP_PAGE_WRITE:
     begin
      if edWriteFilename.Text = '' then
       if ConfirmAbort('No source file selected!') then
        exit;
      if fileexists(edWriteFilename.Text) = false then
        if ConfirmAbort('Source file not found!') then
         exit;

      ShowOperationsDialog(edCmdLinePreview.Lines.Text, GW_APP_NAME + ' - Write', OPERATIONS_WRITE);
     end; // GW_PROP_PAGE_WRITE

   // Convert ####################################################################
   GW_PROP_PAGE_CONVERT:
    begin
     if edConvFileSource.Text = '' then
       if ConfirmAbort('No source file selected!') then
       exit;

     if fileexists(edConvFileSource.Text) = false then
      if ConfirmAbort('Source file not found!') then
        exit;

     if Directoryexists(Dircheck(edConvDirDest.Text)) = false then
      begin
       answer := ConfirmYesNoAbort('Destination directory not found! Create directory?',edConvFileSource);
       if answer = mrCancel then
         exit;
       if answer = mrYes then
         Forcedirectories(dircheck(edConvDirDest.Text));
      end;

     if cbConvFileFormat.Text = '' then
      if ConfirmAbort('Destination fileformat settings incomplete!') then
       exit;

     if edConvFilenamePreview.Text = '' then
       if ConfirmAbort('Destination filename settings incomplete!') then
        exit;

     ShowOperationsDialog(edCmdLinePreview.Lines.Text, GW_APP_NAME + ' - Convert', OPERATIONS_CONVERT);
    end;

   //Tools ####################################################################
   GW_PROP_PAGE_TOOLS:
     begin
      ShowOperationsDialog(edCmdLinePreview.Lines.Text, GW_APP_NAME + ' - ' + btGo.Caption, OPERATIONS_OTHER);
     end;

   //Settings ####################################################################
   GW_PROP_PAGE_SETTINGS:
     begin
      ShowOperationsDialog(edCmdLinePreview.Lines.Text, GW_APP_NAME + ' - ' + btGo.Caption, OPERATIONS_OTHER);
     end;
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
 cbReadConvFormat.Text := '';
 cbReadFormat.Text := '';
 cbReadFormatOption.Text := '';
 cbReadFormatOptionHFEVer.Text:='';
 cbReadFormatOptionHFEInt.Text:='';
 cbReadFormatOptionHFEEnc.Text:='';
 edReadFilename.Text := '';
 cbReadPreview.Text:='';
end;

procedure TFrmMain.btWriteDiskResetClick(Sender: TObject);
begin
  edWriteFilename.Text := '';
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
     // Read template section
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_READ_TEMPLATE, INI_VERSION, sAppVersion_ReadTmpl);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_READ_TEMPLATE, INI_TEMPLATE_NAME, cbReadTplName.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_READ_TEMPLATE, INI_TEMPLATE_DESC, edReadTplDesc.Text);

      // Setting section
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_FOLDER_DISKDEFS, cbReadTplFormatSrc.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, cbReadTplFormat.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_REVS, cbReadTplRevs.Text);

      WriteIniBoolIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_RAW, cbReadTplRaw.Enabled, cbReadTplRaw.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FAKE_INDEX, cbReadTplFakeIndex.Text);
      WriteIniBoolIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_HARD_SECTORS, cbReadTplHardSec.Enabled, cbReadTplHardSec.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_ADJUST_SPEED, cbReadTplAdjustSpeed.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_RETRIES, cbReadTplRetries.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_SEEK_RETRIES, cbReadTplSeekRetries.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_PLL, cbReadTplPLL.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DD, cbReadTplDD.Text);

      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_CYLINDERS, cbReadTplCyls.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_HEADS, cbReadTplHeads.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_STEPS, cbReadTplSteps.Text);

      WriteIniBoolIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_HSWAP, cbReadTplHSwap.Enabled, cbReadTplHSwap.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY, cbReadTplFlippy.Text);
      WriteIniBoolIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY_REV, cbReadTplFlippyReverse.Enabled, cbReadTplFlippyReverse.Checked);

      WriteIniBoolIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_LOG_PARAM, cbReadTplLogParam.Enabled, cbReadTplLogParam.Checked);
      WriteIniBoolIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_LOG_OUTPUT, cbReadTplLogOutput.Enabled, cbReadTplLogOutput.Checked);
      WriteIniBoolIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_LOG_ONEFILE, cbReadTplLogBoth.Enabled, cbReadTplLogBoth.Checked);

      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT, cbReadFormat.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_CONV_FORMAT, cbReadConvFormat.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION, cbReadFormatOption.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_VER, cbReadFormatOptionHFEVer.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_INT, cbReadFormatOptionHFEInt.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_ENC, cbReadFormatOptionHFEEnc.Text);

      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DIRECTORY, edReadDirDest.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SELECT, cbSetDelaySelect.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_STEP, cbSetDelayStep.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SETTLE, cbSetDelaySettle.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_MOTOR, cbSetDelayMotor.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_AUTOOFF, cbSetDelayAutoOff.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_PREWRITE, cbSetDelayPreWrite.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_POSTWRITE, cbSetDelayPostWrite.Text);
      WriteIniStringIfNotEmpty(INIRead, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_INDEXMASK, cbSetDelayIndexMask.Text);
      INIRead.DeleteKey(INI_SECTION_SETTINGS,INI_TEMPLATE_LEGACY_RPM); // older than 2.00

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
begin
  if checkGwExecutable then
   performModalCmdAction('delays');
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

    // Write-Template Section
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_WRITE_TEMPLATE, INI_VERSION, sAppVersion_WriteTmpl);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_WRITE_TEMPLATE, INI_TEMPLATE_NAME, cbWriteTplName.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_WRITE_TEMPLATE, INI_TEMPLATE_DESC, edWriteTplDesc.Text);
    //WriteIniStringIfNotEmpty(IniWrite, WRITE_TEMPLATE, 'Creator', '');

    // Settings section
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_FOLDER_DISKDEFS, cbWriteTplFormatSrc.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, cbWriteTplFormat.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_ERASE_EMPTY, cbWriteTplEraseEmpty.Enabled, cbWriteTplEraseEmpty.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FAKE_INDEX, cbWriteTplFakeIndex.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_HARD_SECTORS, cbWriteTplHardSec.Enabled, cbWriteTplHardSec.Checked);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_NO_VERIFY, cbWriteTplNoVerify.Enabled, cbWriteTplNoVerify.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_RETRIES, cbWriteTplRetries.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_PRE_COMP, cbWriteTplPrecomp.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_PRE_ERASE, cbWriteTplPreErase.Enabled, cbWriteTplPreErase.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DD, cbWriteTplDensel.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_TP43_PIN2, cbWriteTplTplTP43Pin2.Enabled, cbWriteTplTplTP43Pin2.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_CYLINDERS, cbWriteTplCyls.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_HEADS, cbWriteTplHeads.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_STEPS, cbWriteTplSteps.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_HSWAP, cbWriteTplHSwap.Enabled, cbWriteTplHSwap.Checked);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY, cbWriteTplFlippy.Text);
    WriteIniBoolIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY_REV, cbWriteTplFlippyReverse.Enabled, cbWriteTplFlippyReverse.Checked);
    //WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT, cbWriteTplFormat.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DIRECTORY, edWriteDirDest.Directory);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SELECT, cbSetDelaySelect.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_STEP, cbSetDelayStep.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SETTLE, cbSetDelaySettle.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_MOTOR, cbSetDelayMotor.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_AUTOOFF, cbSetDelayAutoOff.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_PREWRITE, cbSetDelayPreWrite.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_POSTWRITE, cbSetDelayPostWrite.Text);
    WriteIniStringIfNotEmpty(IniWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_INDEXMASK, cbSetDelayIndexMask.Text);

    // Remove legacy items
    IniWrite.DeleteKey(INI_SECTION_SETTINGS,INI_TEMPLATE_LEGACY_RPM); // older than 2.00
    IniWrite.DeleteKey(INI_SECTION_SETTINGS,INI_TEMPLATE_LEGACY_ERASE_EMPTY); // older than 2.00
    IniWrite.DeleteKey(INI_SECTION_SETTINGS,INI_TEMPLATE_LEGACY_NO_VERIFY); // older than 2.00

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
  TmplFolder : String;
  INITmplFolder : TIniFile;
  i :integer = 0;
begin
  try
    INITmplFolder := TINIFile.Create(sAppPath + GW_INI_FILE);
    TmplFolder := INITmplFolder.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
    If TmplFolder = '' then exit;
    INITmplFolder.Free;

    cbWriteTplName.Items.Clear;
    Templates_Write := FindAllFiles(DirCheck(TmplFolder), '*.iniw', True);
    if Templates_Write.Count = 0 then
    begin
      Templates_Write.Free;
      checkUpdateWriteTemplateButtons;
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
  initialDir, TmplFolder: String;
begin
  //Read-Template
  iniFile := TiniFile.Create(sAppPath + GW_INI_FILE);
  TmplFolder := iniFile.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  initialDir := ReadIniString(INI, FLUX_INI_NAME, INI_FOLDER_WRITE_SRC,'');
  If TmplFolder = '' then exit;
  iniRefreshWrite := TINIFile.Create(DirCheck(TmplFolder) + cbWriteTplName.Text + GW_INI_WRITE_EXT);
  try

    // Write template section (not used)
    //ver := iniRefreshRead.ReadString(INI_SECTION_WRITE_TEMPLATE,INI_VERSION,'');
    //name := iniRefreshRead.ReadString(INI_SECTION_WRITE_TEMPLATE, INI_TEMPLATE_NAME, '');
    //creator := iniRefreshRead.ReadString(INI_SECTION_WRITE_TEMPLATE, 'Creator', '');

    // Setting section
    cbWriteTplFormatSrc.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_FOLDER_DISKDEFS, FORMAT_SPEC_INTERNAL);
    Refresh_WriteFormSpec;
    cbWriteTplFormat.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_SPEC);
    edWriteTplDesc.Text   := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DESC);
    cbWriteTplEraseEmpty.checked := ReadIniBool(iniRefreshWrite,INI_SECTION_SETTINGS, INI_TEMPLATE_ERASE_EMPTY);
    cbWriteTplFakeIndex.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FAKE_INDEX);
    cbWriteTplHardSec.checked := ReadIniBool(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_HARD_SECTORS);
    cbWriteTplNoVerify.checked := ReadIniBool(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_NO_VERIFY);
    cbWriteTplRetries.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_RETRIES);
    cbWriteTplPrecomp.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_PRE_COMP);
    cbWriteTplPreErase.Checked:= ReadIniBool(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_PRE_ERASE);
    cbWriteTplDensel.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DD);
    cbWriteTplTplTP43Pin2.Checked := ReadIniBool(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_TP43_PIN2);

    cbWriteTplCyls.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_CYLINDERS);
    cbWriteTplHeads.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_HEADS);
    cbWriteTplSteps.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_STEPS);
    cbWriteTplHSwap.Checked:= ReadIniBool(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_HSWAP);
    cbWriteTplFlippy.Text:= ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY);
    cbWriteTplFlippyReverse.checked := ReadIniBool(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY_REV);

    edWriteDirDest.Directory := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DIRECTORY, initialDir);
    edWriteFilename.InitialDir := edWriteDirDest.Directory;
    cbSetDelaySelect.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SELECT, cbSetDelaySelect.Text);
    cbSetDelayStep.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_STEP, cbSetDelayStep.Text);
    cbSetDelaySettle.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SETTLE, cbSetDelaySettle.Text);
    cbSetDelayMotor.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_MOTOR, cbSetDelayMotor.Text);
    cbSetDelayAutoOff.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_AUTOOFF, cbSetDelayAutoOff.Text);
    cbSetDelayPreWrite.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_PREWRITE, cbSetDelayPreWrite.Text);
    cbSetDelayPostWrite.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_POSTWRITE, cbSetDelayPostWrite.Text);
    cbSetDelayIndexMask.Text := ReadIniString(iniRefreshWrite, INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_INDEXMASK, cbSetDelayIndexMask.Text);

    if cbWriteTplName.Text <> '' then
    begin
      WriteIniString(iniFile, FLUX_INI_NAME, INI_LAST_WRITE_TEMPLATE, cbWriteTplName.Text);
      checkUpdateWriteTemplateButtons;
    end;
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
      checkUpdateReadTemplateButtons;
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
  initialDir, tmplFolder: String;
begin
  //Read-Template
  iniFile := TiniFile.Create(sAppPath + GW_INI_FILE);
  tmplFolder := iniFile.ReadString(FLUX_INI_NAME, INI_FOLDER_TEMPLATES, '');
  If tmplFolder = '' then exit;
  initialDir := iniFile.ReadString(FLUX_INI_NAME, INI_FOLDER_READ_DEST,'');
  iniRefreshRead := TINIFile.Create(DirCheck(tmplFolder) + cbReadTplName.Text + GW_INI_READ_EXT);

  try
    // Read template section
    edReadTplDesc.Text := iniRefreshRead.ReadString(INI_SECTION_READ_TEMPLATE, INI_TEMPLATE_DESC, '');

    // Settings Section
    cbReadTplFormatSrc.Text        := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_FOLDER_DISKDEFS, FORMAT_SPEC_INTERNAL);
    Refresh_ReadFormSpec;
    cbReadTplFormat.Text           := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_SPEC, '');
    cbReadTplRevs.Text             := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_REVS, '');
    cbReadTplRaw.Checked           := iniRefreshRead.ReadBool(INI_SECTION_SETTINGS, INI_TEMPLATE_REVS, false);
    cbReadTplFakeIndex.Text        := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FAKE_INDEX, '');
    cbReadTplHardSec.Checked       := iniRefreshRead.ReadBool(INI_SECTION_SETTINGS, INI_TEMPLATE_HARD_SECTORS, false);
    cbReadTplAdjustSpeed.Text      := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_ADJUST_SPEED, '');
    cbReadTplRetries.Text          := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_RETRIES, '');
    cbReadTplSeekRetries.Text      := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_SEEK_RETRIES, '');
    cbReadTplPLL.Text              := iniRefreshRead.ReadString(INI_SECTION_SETTINGS,INI_TEMPLATE_PLL, '');
    cbReadTplDD.Text               := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DD, '');

    cbReadTplCyls.Text             := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_CYLINDERS, '');
    cbReadTplHeads.Text            := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_HEADS, '');
    cbReadTplSteps.Text            := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_STEPS, '');
    cbReadTplHSwap.Checked         := iniRefreshRead.ReadBool(INI_SECTION_SETTINGS, INI_TEMPLATE_HSWAP, false);
    cbReadTplFlippy.Text           := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY, '');
    cbReadTplFlippyReverse.Checked := iniRefreshRead.ReadBool(INI_SECTION_SETTINGS, INI_TEMPLATE_FLIPPY_REV, false);

    cbReadTplLogParam.Checked      := iniRefreshRead.ReadBool(INI_SECTION_SETTINGS, INI_TEMPLATE_LOG_PARAM, false);
    cbReadTplLogOutput.Checked     := iniRefreshRead.ReadBool(INI_SECTION_SETTINGS, INI_TEMPLATE_LOG_OUTPUT, false);
    cbReadTplLogBoth.Checked       := iniRefreshRead.ReadBool(INI_SECTION_SETTINGS, INI_TEMPLATE_LOG_ONEFILE, false);

    cbReadFormat.Text              := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT, '');

    // Update the combo boxes after format is determined
    UpdateReadFormatSelection;
    cbReadConvFormat.Text    := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_CONV_FORMAT, '');
    cbReadFormatOption.Text        := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION, '');
    cbReadFormatOptionHFEVer.Text  := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_VER, '');
    cbReadFormatOptionHFEInt.Text  := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_INT, '');
    cbReadFormatOptionHFEEnc.Text  := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_FORMAT_OPTION_HFE_ENC, '');
    edReadDirDest.Text            := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DIRECTORY, initialDir);
    cbSetDelaySelect.Text         := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SELECT, cbSetDelaySelect.Text);
    cbSetDelayStep.Text           := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_STEP, cbSetDelayStep.Text);
    cbSetDelaySettle.Text         := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_SETTLE, cbSetDelaySettle.Text);
    cbSetDelayMotor.Text          := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_MOTOR, cbSetDelayMotor.Text);
    cbSetDelayAutoOff.Text        := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_AUTOOFF, cbSetDelayAutoOff.Text);
    cbSetDelayPreWrite.Text       := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_PREWRITE, cbSetDelayPreWrite.Text);
    cbSetDelayPostWrite.Text      := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_POSTWRITE, cbSetDelayPostWrite.Text);
    cbSetDelayIndexMask.Text      := iniRefreshRead.ReadString(INI_SECTION_SETTINGS, INI_TEMPLATE_DELAY_INDEXMASK, cbSetDelayIndexMask.Text);
    Create_Filename;

    if cbReadTplName.Text <> '' then
    begin
      WriteIniString(iniFile, FLUX_INI_NAME, INI_LAST_READ_TEMPLATE, cbReadTplName.Text);
      checkUpdateReadTemplateButtons;
    end;
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
   if cbConvDiskdefs.Text = FORMAT_SPEC_INTERNAL then
    begin
     cbConvFormat.Clear;
     cbConvFormat.items.Text := FormatSpecs_Conv.Text;
    end
   else
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
var
  eraseEnabled : boolean;
begin
  eraseEnabled := cbToolsEraseCyl.Text <> '';
   lblToolsEraseHeads.Enabled := eraseEnabled;
   cbToolsEraseHeads.Enabled := eraseEnabled;
   lblToolsEraseSteps.Enabled := eraseEnabled;
   cbToolsEraseSteps.Enabled := eraseEnabled;
   lblToolsEraseHSwap.Enabled := eraseEnabled;
   cbToolsEraseHSwap.Enabled := eraseEnabled;
   lblToolsEraseFlippy.Enabled := eraseEnabled;
   cbToolsEraseFlippy.Enabled := eraseEnabled;

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
  cbConvFormatOptionHFEVer.Items.Clear;
  cbConvFormatOptionHFEVer.ItemIndex := -1;
  cbConvFormatOptionHFEVer.Enabled:= true;
  cbConvFormatOptionHFEVer.Items.Add('');
  for index := 0 to High(HFEFormatOptions.Version.Value) do
  begin
    entryLine := '::' + HFEFormatOptions.Version.Name + '=' + HFEFormatOptions.Version.Value[index];
    cbConvFormatOptionHFEVer.Items.Add(entryLine);
  end;
  cbConvFormatOptionHFEVer.ItemIndex := 0;

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
var
  convOutEnabled: boolean;
begin
 convOutEnabled := cbConvOutTracksetCyls.Text <> '';
 cbConvOutTracksetHeads.Enabled := convOutEnabled;
 cbConvOutTracksetSteps.Enabled := convOutEnabled;
 cbConvOutTracksetHSwap.Enabled := convOutEnabled;
 cbConvOutTracksetFlippy.Enabled := convOutEnabled;
 cbConvTplFlippyReverse.Enabled := convOutEnabled;
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
var
  trackSetEnabled : boolean;
begin
  trackSetEnabled := cbConvTracksetCyls.Text <> '';
   cbConvTracksetHeads.Enabled := trackSetEnabled;
   cbConvTracksetSteps.Enabled := trackSetEnabled;
   cbConvTracksetHSwap.Enabled := trackSetEnabled;
   cbConvTracksetFlippy.Enabled := trackSetEnabled;
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
  if cbReadTplFormatSrc.Text = FORMAT_SPEC_INTERNAL then
   begin
    cbReadTplFormat.Clear;
    cbReadTplFormat.items.Text := FormatSpecs_Read.Text;
    cbReadTplFormat.ItemIndex:=0;
   end
  else
   begin
    Get_FormatSpecs_Read;
   end;
  CMD_Generate;
end;

// Runs through diskdefs_XXX.cfg file looking for entries 'disk' and adds them to the top list
// This logic was updated in 5.2.5 to use the 'ibm' from  '# prefix: ibm' and ends up with just a format size number
// Same logic for read, write and convert. Could be optimised probably

// This does change what is showed in the dropdown form so no longer see 'ibm.1440' only '1440' does not match
// GW format options shown in 1.23 help

procedure TFrmMain.Get_FormatSpecs_Read;
var
  i : integer;
  line : string;
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
       line := TrimLeft(Memo1.Lines[i]);
       if line.StartsWith(DISK_DEF_TYPE_PREFIX) then
         FormatSpecs_ReadDiskDefs.Add(TrimRight(Copy(line, Length(DISK_DEF_TYPE_PREFIX)+1, MaxInt)));
     end;

    cbReadTplFormat.Items.Assign(FormatSpecs_ReadDiskDefs);

    if cbReadTplFormat.Items.Count > 0 then
      cbReadTplFormat.ItemIndex := 0;
   end
  else
end;

procedure TFrmMain.Get_FormatSpecs_Write;
var
  i : integer;
  line : string;
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
      line := TrimLeft(Memo1.Lines[i]);
      if line.StartsWith(DISK_DEF_TYPE_PREFIX) then
          FormatSpecs_WriteDiskDefs.Add(TrimRight(Copy(line, Length(DISK_DEF_TYPE_PREFIX)+1, MaxInt)));
     end;

     cbWriteTplFormat.Items.Assign(FormatSpecs_WriteDiskDefs);

     if cbWriteTplFormat.Items.Count > 0 then
       cbWriteTplFormat.ItemIndex:=0;
    end
  else
    cbWriteTplFormat.Clear;
end;

procedure TFrmMain.Get_FormatSpecs_Conv;
var
 i : integer;
 line : string;
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
      line := TrimLeft(Memo1.Lines[i]);
      if line.StartsWith(DISK_DEF_TYPE_PREFIX) then
       FormatSpecs_ConvDiskDefs.Add(TrimRight(Copy(line, Length(DISK_DEF_TYPE_PREFIX)+1, MaxInt)));
    end;

    cbConvFormat.Items.Assign(FormatSpecs_ConvDiskDefs);

   if cbConvFormat.items.Count > 0 then
    cbConvFormat.ItemIndex:=0;
  end
 else
   cbConvFormat.Clear;
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
  case pcActions.ActivePageIndex of
  GW_PROP_PAGE_READ:
   begin
    btGo.Caption:='Read';
    checkUpdateReadTemplateButtons;
    cbReadTplLogParam.Visible:=true;
    cbReadTplLogOutput.Visible:=true;
    cbReadTplLogBoth.Visible:=true;
   end;

   GW_PROP_PAGE_WRITE:
   begin
    checkUpdateWriteTemplateButtons;
    btGo.Caption:='Write';
    cbReadTplLogParam.Visible:=false;
    cbReadTplLogOutput.Visible:=false;
    cbReadTplLogBoth.Visible:=false;
   end;

   GW_PROP_PAGE_CONVERT:
   begin
    btGo.Caption:='Convert';
    pcActions.ActivePage.Height:=20;
    cbReadTplLogParam.Visible:=false;
    cbReadTplLogOutput.Visible:=false;
    cbReadTplLogBoth.Visible:=false;
   end;

   GW_PROP_PAGE_TOOLS:
   begin
    if rbToolsErase.Checked then btGo.Caption:='Erase';
    if rbToolsSeek.Checked then btGo.Caption:='Seek';
    if rbToolsClean.Checked then btGo.Caption:='Clean';
    if rbToolsRPM.Checked then btGo.Caption:='RPM';
    cbReadTplLogParam.Visible:=false;
    cbReadTplLogOutput.Visible:=false;
    cbReadTplLogBoth.Visible:=false;
   end;

   GW_PROP_PAGE_SETTINGS:
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
  end; // case
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

procedure TFrmMain.setPinEnabled(ctrlEnabled: boolean);
begin
  rbSetGetPIN.Checked:=ctrlEnabled;
  lblSetPINNumber.Enabled:=ctrlEnabled;
  cbSetPINnumber.Enabled:=ctrlEnabled;
  rbGetPin.Enabled:=ctrlEnabled;
  rbSetPin.Enabled:=ctrlEnabled;
  cbSetPINlevel.Enabled:=ctrlEnabled;

end;

procedure TFrmMain.setDelaysEnabled(ctrlEnabled: boolean);
begin
 rbSetDelays.Checked:=ctrlEnabled;
 btSetDelaysInfo.Enabled:=ctrlEnabled;
 btSetDelaysDefault.Enabled:=ctrlEnabled;
 lblSetDelaySelect.Enabled:=ctrlEnabled;
 lblSetDelayStep.Enabled:=ctrlEnabled;
 lblSetDelayMotor.Enabled:=ctrlEnabled;
 lblSetDelaySettle.Enabled:=ctrlEnabled;
 lblSetDelayAutoOff.Enabled:=ctrlEnabled;
 lblSetDelaySelect.Enabled:=ctrlEnabled;
 cbSetDelaySelect.Enabled:=ctrlEnabled;
 cbSetDelayStep.Enabled:=ctrlEnabled;
 cbSetDelayMotor.Enabled:=ctrlEnabled;
 cbSetDelaySettle.Enabled:=ctrlEnabled;
 cbSetDelayAutoOff.Enabled:=ctrlEnabled;
end;

procedure TFrmMain.setFirmwareEnabled(ctrlEnabled: boolean);
begin
 rbSetFirmware.Checked:=ctrlEnabled;
 lblSetFirmwareHint.Enabled:=ctrlEnabled;
 cbSetFirmwareBootloader.Enabled:=ctrlEnabled;
 opSetFWOnline.Enabled:=ctrlEnabled;
 opSetFWFile.Enabled:=ctrlEnabled;
 edToolsFW.Enabled:=ctrlEnabled;
 opSetFWTag.Enabled:=ctrlEnabled;
 edToolsFWTag.Enabled:=ctrlEnabled;

end;

procedure TFrmMain.rbSetDelaysClick(Sender: TObject);
begin
   if FInClick then Exit;
   FInClick := true;
   BtGo.Caption:= 'Set delays';
   setDelaysEnabled(true);
   setPinEnabled(false);
   setFirmwareEnabled(false);
   FInClick := false;

   CMD_Generate;
end;

procedure TFrmMain.rbSetFirmwareClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;
  BtGo.Caption:= 'Firmware';
  setFirmwareEnabled(true);
  setDelaysEnabled(false);
  setPinEnabled(false);
  FInClick := false;

  CMD_Generate;
end;

procedure TFrmMain.rbSetGetPINClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;
  if rbGetPIN.Checked = true then BtGo.Caption:= 'Get PIN';
  if rbSetPIN.Checked = true then BtGo.Caption:= 'Set PIN';
  setPinEnabled(true);
  setFirmwareEnabled(false);
  setDelaysEnabled(false);
  FInClick := false;

  CMD_Generate;
end;

procedure TFrmMain.setEraseEnable(ctrlEnabled: boolean);
var
  eraseEnabled : boolean;
begin
  rbToolsErase.Checked:=ctrlEnabled;
  lblToolsEraseCyl.Enabled:=ctrlEnabled;
  cbToolsEraseCyl.Enabled:=ctrlEnabled;
  lblToolsEraseHeads.Enabled:=ctrlEnabled;
  cbToolsEraseHeads.Enabled:=ctrlEnabled;
  lblToolsEraseFakeIndex.Enabled:=ctrlEnabled;
  cbToolsEraseFakeIndex.Enabled:=ctrlEnabled;
  lblToolsEraseHFreq.Enabled:=ctrlEnabled;

  eraseEnabled := (ctrlEnabled) and (cbToolsEraseCyl.Text <> '');

  lblToolsEraseHeads.Enabled:=eraseEnabled;
  cbToolsEraseHeads.Enabled:=eraseEnabled;
  lblToolsEraseSteps.Enabled:=eraseEnabled;
  cbToolsEraseSteps.Enabled:=eraseEnabled;
  lblToolsEraseHSwap.Enabled:=eraseEnabled;
  cbToolsEraseHSwap.Enabled:=eraseEnabled;
  lblToolsEraseFlippy.Enabled:=eraseEnabled;
  cbToolsEraseFlippy.Enabled:=eraseEnabled;

end;

procedure TFrmMain.setSeekEnable(ctrlEnabled: boolean);
begin
 rbToolsSeek.Checked:=ctrlEnabled;
 lblToolsSeek.Enabled:=ctrlEnabled;
 cbToolsSeekTrack.Enabled:=ctrlEnabled;
 cbToolsSeekTrackForce.Enabled:=ctrlEnabled;
 cbToolsSeekMotorOn.Enabled:=ctrlEnabled;

end;


procedure TFrmMain.setRPMEnable(ctrlEnabled: boolean);
begin
 rbToolsRPM.Checked:=ctrlEnabled;
 lblToolsRPMNumbIter.Enabled:=ctrlEnabled;
 cbToolsRPMNumbIter.Enabled:=ctrlEnabled;

end;


procedure TFrmMain.setCleanEnable(ctrlEnabled: boolean);
begin
 rbToolsClean.Checked:=ctrlEnabled;
 lblToolsCleanCyl.Enabled:=ctrlEnabled;
 cbToolsCleanCyl.Enabled:=ctrlEnabled;
 lblToolsCleanLinger.Enabled:=ctrlEnabled;
 cbToolsCleanLinger.Enabled:=ctrlEnabled;
 lblToolsCleanPasses.Enabled:=ctrlEnabled;
 cbToolsCleanPasses.Enabled:=ctrlEnabled;

end;


procedure TFrmMain.rbToolsCleanClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;
  setCleanEnable(true);
  setEraseEnable(false);
  setSeekEnable(false);
  setRPMEnable(false);
  FInClick := false;
  CMD_Generate;
end;

procedure TFrmMain.rbToolsEraseClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;
  setEraseEnable(true);
  setCleanEnable(false);
  setSeekEnable(false);
  setRPMEnable(false);
  FInClick := false;

  CMD_Generate;
end;

procedure TFrmMain.rbToolsRPMClick(Sender: TObject);
begin
  if FInClick then Exit;
  FInClick := true;
  setRPMEnable(true);
  setEraseEnable(false);
  setCleanEnable(false);
  setSeekEnable(false);
  CMD_Generate;
end;

procedure TFrmMain.rbToolsSeekClick(Sender: TObject);
begin

  if FInClick then Exit;
  FInClick := true;
  setSeekEnable(true);
  setRPMEnable(false);
  setEraseEnable(false);
  setCleanEnable(false);
  FInClick := false;
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
  checkUpdateReadTemplateButtons;
  Refresh_Templates_Read;
end;

procedure TFrmMain.checkUpdateReadTemplateButtons;
  var
    buttonsEnabled: boolean;
begin
   buttonsEnabled := cbReadTplName.Text <> '';
   btReadTplSave.Enabled := buttonsEnabled;
   btReadTplDel.Enabled := buttonsEnabled;
end;

procedure TFrmMain.cbReadTplNameSelect(Sender: TObject);
begin
  checkUpdateReadTemplateButtons;
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
var
  writeTplEnable : boolean;
begin
  writeTplEnable := cbWriteTplCyls.Text <> '';
  cbWriteTplHeads.Enabled := writeTplEnable;
  cbWriteTplSteps.Enabled := writeTplEnable;
  cbWriteTplHSwap.Enabled := writeTplEnable;
  cbWriteTplFlippy.Enabled := writeTplEnable;
  cbWriteTplFlippyReverse.Enabled := writeTplEnable;
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
 // This will reset the format spec dropdown combo box if Internal is selected
 // May be confusing to the user if they set that, and then it auto clears
  if cbWriteTplFormatSrc.Text = FORMAT_SPEC_INTERNAL then
   begin
    cbWriteTplFormat.Clear;
    cbWriteTplFormat.items.Text := FormatSpecs_Write.Text;
    cbWriteTplFormat.ItemIndex:=0;
   end
  else
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
  checkUpdateWriteTemplateButtons;
  Refresh_Templates_Write;
end;

procedure TFrmMain.checkUpdateWriteTemplateButtons;
var enableButtons : boolean;
begin
   enableButtons := cbWriteTplName.Text <> '';
   btWriteTplSave.Enabled := enableButtons;
   btWriteTplDel.Enabled := enableButtons;
end;

procedure TFrmMain.cbWriteTplNameSelect(Sender: TObject);
begin
 checkUpdateWriteTemplateButtons;
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

procedure TFrmMain.edWriteDirDestChange(Sender: TObject);
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
  CMD_Generate;
end;

function ExtractOptionValue(const OptionText: string): string;
var
  p: Integer;
begin
  p := Pos('=', OptionText);
  if p > 0 then
    Result := Copy(OptionText, p + 1, MaxInt)
  else
    Result := '';
end;

// HXC using Interface
function GetHXCModuleForInterface(const SelInterface: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to High(HXCFormatModules) do
  begin
    if SameText(HXCFormatModules[i].HFEInterface, SelInterface) then
      exit(HXCFormatModules[i].ModuleId);
  end;
end;

// SCP has ::disktype=amstrad-cpc
function GetSCPModuleForDiskType(const DiskType: string): string;
var
  i, j: Integer;
  parts: TStringArray;
begin
  Result := '';

  if (DiskType <> '') then
    for i := 0 to High(HXCFormatModules) do
    begin
      // Extract various disk types from CSV string
      parts := HXCFormatModules[i].DiskType.Split([',']);
      for j := 0 to High(parts) do
        if SameText(Trim(parts[j]), DiskType) then
          exit(HXCFormatModules[i].ModuleId);
    end;
end;

function GetHXCModuleForExtension(const Ext: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to High(HXCFormatModules) do
  begin
    if SameText(HXCFormatModules[i].Ext, Ext) then
      exit(HXCFormatModules[i].ModuleId);
  end;
end;

procedure TFrmMain.cbReadConvFormatChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TFrmMain.edReadFilenameChange(Sender: TObject);
begin
  Create_Filename;
end;

procedure TFrmMain.setHfeReadEnabled(hfeEnabled: boolean);
begin
 cbReadFormatOptionHFEInt.Enabled := hfeEnabled;
 cbReadFormatOptionHFEVer.Enabled := hfeEnabled;
 cbReadFormatOptionHFEEnc.Enabled := hfeEnabled;
 cbReadConvFormat.Enabled:=hfeEnabled;
 cbReadFormatOption.Enabled :=hfeEnabled;

end;

procedure TFrmMain.setHfeConvEnabled(hfeEnabled: boolean);
begin
 cbConvFormatOptionHFEInt.Enabled := hfeEnabled;
 cbConvFormatOptionHFEVer.Enabled := hfeEnabled;
 cbConvFormatOptionHFEEnc.Enabled := hfeEnabled;
 cbConvFormatOption.Enabled := hfeEnabled;
end;


// This need to be called when template selected or initial update
procedure TFrmMain.UpdateReadFormatSelection;
var
  entryLine : string;
  index: Integer;
  hasReadFilename: Boolean;
begin
  hasReadFilename := Trim(edReadFilename.Text) <> '';

  cbReadFormatOption.Items.Clear;
  cbReadFormatOption.ItemIndex := -1;
  cbReadFormatOption.Enabled:= false;

  // Disable all options by default
  setHfeReadEnabled(false);

  // SCP Options
  if GetReadFormatSelection = COMBO_SELECTION_SCP then
  begin
   cbReadFormatOption.Items.Clear;
   cbReadFormatOption.ItemIndex := -1;
   cbReadFormatOption.Enabled:= hasReadFilename;
   cbReadFormatOption.Items.Add('');
   cbReadConvFormat.Enabled := hasReadFilename;

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
   cbReadFormatOption.Enabled:= hasReadFilename;
   cbReadFormatOption.Items.Add('');
   cbReadConvFormat.Enabled := hasReadFilename;

   // BitRate
   for index := 0 to High(HFEFormatOptions.BitRate.Value) do
   begin
     entryLine := '::' + HFEFormatOptions.BitRate.Name + '=' + HFEFormatOptions.BitRate.Value[index];
     cbReadFormatOption.Items.Add(entryLine);
   end;
   cbReadFormatOption.ItemIndex := 0;

   //HFEVersion
   cbReadFormatOptionHFEVer.Items.Clear;
   cbReadFormatOptionHFEVer.ItemIndex := -1;
   cbReadFormatOptionHFEVer.Enabled:= hasReadFilename;
   cbReadFormatOptionHFEVer.Items.Add('');
   for index := 0 to High(HFEFormatOptions.Version.Value) do
   begin
     entryLine := '::' + HFEFormatOptions.Version.Name + '=' + HFEFormatOptions.Version.Value[index];
     cbReadFormatOptionHFEVer.Items.Add(entryLine);
   end;
   cbReadFormatOptionHFEVer.ItemIndex := 0;

   //HLE InterfaceMode
   cbReadFormatOptionHFEInt.Items.Clear;
   cbReadFormatOptionHFEInt.ItemIndex := -1;
   cbReadFormatOptionHFEInt.Enabled:= hasReadFilename;
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
   cbReadFormatOptionHFEEnc.Enabled:= hasReadFilename;
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

// Get extension of format combo box
function TFrmMain.GetReadFormatSelection(): String;
begin
  Result := trim(leftStr(cbReadFormat.Text,3));
end;

function TFrmMain.UseReadHFEConversion: Boolean;
begin
  Result := (pcActions.ActivePageIndex = GW_PROP_PAGE_READ) and
    (GetReadFormatSelection = COMBO_SELECTION_HFE) and
    (cbReadFormat.Text <> '') and
    (cbReadConvFormat.Text <> '');
end;

function TFrmMain.UseReadSCPConversion: Boolean;
begin
 Result := (pcActions.ActivePageIndex = GW_PROP_PAGE_READ) and
   (GetReadFormatSelection = COMBO_SELECTION_SCP) and
   (cbReadFormat.Text <> '') and
   (cbReadConvFormat.Text <> '');
end;

// Return the module for the currently selected disk type (if any)
function TFrmMain.GetHXC_HFE_Module: String;
begin
  Result := GetHXCModuleForInterface
  (StringReplace(cbReadFormatOptionHFEInt.Text, '::interface=','', []));
end;

// Return the module for the currently selected disk type (if any)
function TFrmMain.GetHXC_SCP_Module: String;
begin
  // Strip the prefix before calling
  Result := GetSCPModuleForDiskType
    (StringReplace(cbReadFormatOption.Text, '::disktype=', '', []));
end;


function TFrmMain.BuildReadBaseFilename: String;
var
  filenameRead, lblOf: string;
begin
  filenameRead := edReadFilename.Text;
  lblOf := edReadDiskOf.Text;

  if edReadDisk1.Value > 0 then
    filenameRead := edReadFilename.Text + Format('%.*d', [edReadDigits.Value, edReadDisk1.Value]);

  if edReadDisk2.Value > 0 then
    filenameRead := filenameRead + lblOf + Format('%.*d', [edReadDigits.Value, edReadDisk2.Value]);

  Result := filenameRead;
end;

function getFormatExtension(const formatText: string): String;
begin
  Result := trim(leftStr(formatText,3));
end;

// Adds additional formatting to file formats (HFE, SCP for example)
// Adds prefixes for RAW and SCP formats
function TFrmMain.BuildReadTargetFilename(const BaseName, formatText: string): string;
var
  formatCode: string;
begin
  formatCode := getFormatExtension(formatText);


  case formatCode of
    COMBO_SELECTION_EDS:
      Result := BaseName + '.' + LowerCase(Trim(LeftStr(FormatText, 4)));
    COMBO_SELECTION_HFE:
      Result := BaseName + '.' + LowerCase(formatCode) + getHfeFormatOptions();
    COMBO_SELECTION_SCP:
      Result := BaseName + '00.0.' + LowerCase(formatCode) + getScpFormatOptions();
    COMBO_SELECTION_RAW:
      Result := BaseName + '00.0.' + LowerCase(formatCode);
  else
    if FormatText <> '' then
      Result := BaseName + '.' + LowerCase(formatCode)
    else
      Result := BaseName;
  end;
end;



function TFrmMain.GetConvFormatSelection: String;
begin
  Result := getFormatExtension(cbConvFileFormat.Text);
end;

function TFrmMain.getScpFormatOptions(): String;
begin
  Result := cbReadFormatOption.Text;
end;

function TFrmMain.getHfeFormatOptions(): String;
begin
  Result :=
    cbReadFormatOption.Text +
    cbReadFormatOptionHFEVer.Text +
    cbReadFormatOptionHFEInt.Text +
    cbReadFormatOptionHFEEnc.Text;
end;

procedure TFrmMain.setOptionsRead(optenabled: boolean);
begin
 btReadDiskReset.Enabled:=optenabled;
 edReadDisk1.Enabled:=optenabled;
 edReadDiskOf.Enabled:=optenabled;
 edReadDisk2.Enabled:=optenabled;
 edReadDigits.Enabled:=optenabled;
 cbReadIncremental.Enabled:=optenabled;
 cbReadNoOverwrite.Enabled := optenabled;
 cbReadFormat.Enabled:=optenabled;
 btGo.Default:=optenabled;
 cbReadPreview.Text:='';
end;

procedure TFrmMain.setOptionsConvert(optenabled: boolean);
begin
 cbConvDisk1.Enabled:=optenabled;
 edConvDiskOf.Enabled:=optenabled;
 cbConvDisk2.Enabled:=optenabled;
 cbConvDigits.Enabled:=optenabled;
 cbConvIncrement.Enabled:=optenabled;
 cbConvNoOverwrite.Enabled := optenabled;
 btConvClear.Enabled:=optenabled;
 cbConvFileFormat.Enabled:=optenabled;
end;

procedure TFrmMain.Create_Filename;
var
  filenameRead, lblOf, filenameConvert: string;
  disc1, disc2, digits : integer;
begin

  // Read
  case pcActions.ActivePageIndex of
   GW_PROP_PAGE_READ:
   begin
     if edReadFilename.Text = '' then
      begin
       setOptionsRead(false);
       exit;
      end;

     setOptionsRead(true);
     filenameRead := BuildReadBaseFilename;
     disc1 := StrToInt(edReadDisk1.Text); // disc LHS
     disc2 := StrToInt(edReadDisk2.Text); // of disc RHS
     digits := StrToInt(edReadDigits.Text);
     lblOf := edReadDiskOf.Text;

     // read file extension - FMFF 4.0
     setHfeReadEnabled(false);

     case GetReadFormatSelection of
       COMBO_SELECTION_HFE:
         begin
           setHfeReadEnabled(true);
           cbReadFormatOption.Enabled := true;
           cbReadConvFormat.Enabled:=true;
         end;
       COMBO_SELECTION_SCP:
         begin
           cbReadFormatOption.Enabled := true;
           cbReadConvFormat.Enabled:=true;
         end
     end; // case

     cbReadPreview.Text := BuildReadTargetFilename(filenameRead, cbReadFormat.Text);

   end; // GW_PROP_PAGE_READ

  // Convert ####################################################################
  GW_PROP_PAGE_CONVERT:
     begin
       if edConvFilename.Text = '' then
        begin
         setOptionsConvert(false);
         edConvFileNamePreview.Text:='';
         exit;
       end;

       setOptionsConvert(true);
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
    setHfeConvEnabled(false);

    case GetConvFormatSelection of
     COMBO_SELECTION_EDS: //EDSK
       begin
        edConvFilenamePreview.Text := FilenameConvert + '.' + lowercase(trim(leftStr(cbConvFileFormat.Text,4)));
       end;
     COMBO_SELECTION_HFE:
       begin
        setHfeConvEnabled(true);
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
       begin
        if cbConvFileFormat.Text <> '' then
          edConvFilenamePreview.Text := FilenameConvert + '.' + lowercase(trim(leftStr(cbConvFileFormat.Text,3)))
        else
          edConvFilenamePreview.Text := FilenameConvert;
       end;

    end; // case ConfFormatSelection


   end; // GW_PROP_PAGE_CONVERT
 end; // case
end;


// Called by most updates to parameters via GUI to update the command line
procedure TFrmMain.CMD_Generate;
begin

 if FormDisplayed then
  begin
    btGo.Default:=false;

    if UseReadSCPConversion and (GetHXC_SCP_Module <> '') then
      Conv_HXC_CMD_Generate(GetHXC_SCP_Module);
    if UseReadHFEConversion and (GetHXC_HFE_Module <> '') then
      Conv_HXC_CMD_Generate(GetHXC_HFE_Module)
    else
      GW_CMD_Generate;
  end;
end;

// This shoudl work for HXC inputs SCP or HFE to DSK
procedure TFrmMain.Conv_HXC_CMD_Generate(hxcModule: String);
var
  sourceFile, targetFile : String;
  param : String = '';
  app: String;
begin

  app := getHXCApplication;

  if app = '' then
    exit;

  if hxcModule <> '' then
   begin
    btGo.Default:=true;

    sourceFile := BuildReadBaseFilename + '.' + LowerCase(getFormatExtension(cbReadFormat.Text));
    targetFile := BuildReadBaseFilename + '.' + LowerCase(getFormatExtension(cbReadConvFormat.Text));

    param :=
      ' -finput:"' + DirCheck(edReadDirDest.Text) + sourceFile + '"' +
      ' -conv:' + hxcModule +
      ' -foutput:"' + DirCheck(edReadDirDest.Text) + targetFile + '"';

    updateCmdPreview(app + param);

   end; // if
end;

procedure TFrmMain.Conv_SCP_CMD_Generate;
var
  app: String;
  param : String = '';
  hxcModule : String = '';
begin

   app := getHXCApplication;

   if app = '' then
    exit;

   //TODO
//   if cbReadFormatOption.Text <> '' then
//     hxcModule := GetHXC_SCPModule;

   if hxcModule <> '' then
    begin
     btGo.Default:=true;

     param :=
       ' -finput:"' + DirCheck(edReadDirDest.Text) + BuildReadBaseFilename + '"' +
//       ' -conv:' + GetHXC_SCPModule +
       ' -foutput:"' + DirCheck(edReadDirDest.Text) + BuildReadBaseFilename + '"';

//TODO updateCmdPreview

    end; // if
end;


procedure TFrmMain.GW_CMD_Generate;
var
  cmd : String = '';
  param : String = '';
  specifyDevice : boolean = false;
  specifyDrive : boolean = false;
begin

 if not checkGwExecutable then
  begin
    edCmdLinePreview.clear;
    exit;
  end;

 // Generate the cmdline parameters
 if cbSetGlobalActionsBacktrace.Checked = true then
   cmd := cmd + ' --bt';

 if cbSetGlobalActionsTime.Checked = true then
   cmd := cmd + ' --time';

 case pCActions.ActivePageIndex of

  // Read options
  GW_PROP_PAGE_READ:
    begin
      specifyDevice := true;
      specifyDrive := true;

      if cbReadPreview.text <> '' then
       begin
        param := GW_CMD_Read_Generate + ' "' + Dircheck(edReadDirDest.Text) + cbReadPreview.text + '"';
        cmd := cmd + 'read';
        btGo.Default:=true;
       end
    end; // GW_PROP_PAGE_READ

  // Write options
  GW_PROP_PAGE_WRITE:
   begin
     specifyDevice := true;
     specifyDrive := true;

     if edWriteFileName.Text <> '' then
      begin
       param := GW_CMD_Write_Generate + ' "' + edWriteFileName.Text + '"';
       cmd := 'write';
       btGo.Default:=true;
      end;

   end; // GW_PROP_PAGE_WRITE

  // Convert options
  GW_PROP_PAGE_CONVERT:
   begin

     if edConvFileName.text <> '' then
     begin
       if cbSrcAsDesDir.Checked then
         edConvDirDest.Directory:= DirCheck(ExtractfileDir(edConvFileSource.Text));
       btGo.Caption:='Convert';
       cmd := 'convert';
       param := param + ' "' + Dircheck(edConvDirDest.Text) + edConvFilenamePreview.text + '"';
     end;
   end; // GW_PROP_PAGE_CONVERT

  // Tools options
  GW_PROP_PAGE_TOOLS:
   begin
    specifyDevice := true;
    specifyDrive := true;

     // Erase
     if rbToolsErase.Checked then
     begin
       btGo.Caption:='Erase';
       cmd := 'erase';
       param := GW_CMD_Tools_Erase_Generate;
     end;

     // Seek
     if rbToolsSeek.Checked then
     begin
       btGo.Caption:='Seek';
       cmd := 'seek';
       param := GW_CMD_Tools_Seek_Generate;
     end;

     // Clean
     if rbToolsClean.Checked then
     begin
       btGo.Caption:='Clean';
       cmd := 'clean';
       param := GW_CMD_Tools_Clean_Generate;
     end;

     // RPM
     if rbToolsRPM.Checked then
     begin
       btGo.Caption:='RPM';
       cmd := ' rpm';
       param := param + ' --nr=' + cbToolsRPMNumbIter.Text;
     end;
   end; // GW_PROP_PAGE_TOOLS

   // Settings
   GW_PROP_PAGE_SETTINGS:
    begin
      specifyDevice := true;

       if rbSetDelays.Checked = true then
       begin
         cmd := 'delays';
         param := GW_CMD_Settings_Delays_Generate;
       end;

       if rbSetGetPIN.Checked = true then
       begin
         // cmd specified inside function
         cmd := GW_CMD_Settings_Pin_Generate;
      end;

      if rbSetFirmware.Checked = true then
      begin
        cmd := 'update';
        param := GW_CMD_Settings_Firmware_Generate;
      end;
    end; // GW_PROP_PAGE_SETTINGS
  end; // case

 // Update command preview with cmd, param and where applicable device/drive
 updateGwCmdAction(cmd, param, specifyDevice, specifyDrive);

end; // GW_CMD_Generate

function TFrmMain.GW_CMD_Read_Generate: string;
var
  param : String = '';
begin
   if cbReadTplFormatSrc.Text <> FORMAT_SPEC_INTERNAL then
     param := param + ' --diskdefs "' + dd + '"';

   if cbReadTplFormat.Text <> '' then
     param := param + ' --format ' + cbReadTplFormat.Text;

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
      cbReadTplFlippyReverse.Enabled := cbReadTplFlippy.Text <> '';

      if cbReadTplFlippyReverse.Enabled then
       begin
        if cbReadTplFlippyReverse.Checked = true then
          param := param + ' --reverse';
       end;
     end
    else
     begin
       cbReadTplHeads.Enabled := false;
       cbReadTplSteps.Enabled := false;
       cbReadTplHSwap.Enabled := false;
       cbReadTplFlippy.Enabled := false;
       cbReadTplFlippyReverse.Enabled := false;
     end;

    if cbReadTplRevs.Text <> '' then
      param := param + ' --revs=' + cbReadTplRevs.Text;
    if cbReadTplRaw.Checked = true then
      param := param + ' --raw ';
    if cbReadTplFakeIndex.Text <> '' then
      param := param + ' --fake-index=' + cbReadTplFakeIndex.Text;
    if cbReadTplHardSec.Checked = true then
      param := param + ' --hard-sectors ';
    if cbReadTplAdjustSpeed.Text <> '' then
      param := param + ' --adjust-speed=' + cbReadTplAdjustSpeed.Text ;
    if cbReadTplRetries.Text <> '' then
      param := param + ' --retries=' + cbReadTplRetries.Text;
    if cbReadTplSeekRetries.Text <> '' then
      param := param + ' --seek-retries=' + cbReadTplSeekRetries.Text;
    if cbReadNoOverwrite.Checked = true then
      param := param + ' -n ';
    if cbReadTplPLL.Text <> '' then
      param := param + ' --pll ' + cbReadTplPLL.Text;
    if cbReadTplDD.Text <> '' then
      param := param + ' --densel ' + cbReadTplDD.Text;
   end;

   Result := param;
end;

function TFrmMain.GW_CMD_Write_Generate: string;
var
  param : String = '';
begin

    if cbWriteTplFormatSrc.Text <> FORMAT_SPEC_INTERNAL then
      param := param + ' --diskdefs "' + dd + '"';

    if cbWriteTplFormat.Text <> '' then
      param := param + ' --format ' + cbWriteTplFormat.Text;

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

       cbWriteTplFlippyReverse.Enabled := cbWriteTplFlippy.Text <> '';

       if cbWriteTplFlippyReverse.Enabled then
         if cbWriteTplFlippyReverse.Checked = true then
             param := param + ' --reverse';
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
        param := param + ' --pre-erase ';

       if cbWriteTplEraseEmpty.Checked = true then
         param := param + ' --erase-empty ';

       if cbWriteTplFakeIndex.Text <> '' then
         param := param + ' --fake-index=' + cbWriteTplFakeIndex.Text;

       if cbWriteTplHardSec.Checked = true then
         param := param + ' --hard-sectors ';

       if cbWriteTplNoVerify.Checked = true then
         param := param + ' --no-verify ';

       if cbWriteTplRetries.Text <> '' then
         param := param + ' --retries=' + cbWriteTplRetries.Text;

       if cbWriteTplPrecomp.Text <> '' then
         param := param + ' --precomp=' + cbWriteTplPrecomp.Text;

       if cbWriteTplDensel.Text <> '' then
         param := param + ' --densel ' + cbWriteTplDensel.Text;

       if cbWriteTplTplTP43Pin2.Checked then
         param := param + ' --gen-tg43';
    end;
   Result := param;
end;

function TFrmMain.GW_CMD_Convert_Generate: string;
var
  param : String = '';
begin

     if cbConvDiskdefs.Text <> FORMAT_SPEC_INTERNAL then
       param := param + ' --diskdefs "' + dd +'"';

     if cbConvFormat.Text <> '' then
       param := param + ' --format ' + cbConvFormat.Text;

     // Use all arguments ?
     if mnuArguments.Checked = true then
     begin
       if cbConvTracksetCyls.Text <> '' then
         param := param + Trackset(' --tracks=',cbConvTracksetCyls.Text,cbConvTracksetHeads.Text,cbConvTracksetSteps.Text,cbConvTracksetHSwap.Checked,cbConvTracksetFlippy.Text);

       if cbConvOutTracksetCyls.Text <> '' then
       begin
         param := param + Trackset(' --out-tracks=',cbConvOutTracksetCyls.Text,cbConvOutTracksetHeads.Text,cbConvOutTracksetSteps.Text,cbConvOutTracksetHSwap.Checked,cbConvOutTracksetFlippy.Text);

         cbConvTplFlippyReverse.Enabled := cbConvOutTracksetFlippy.Text <> '';
         if cbConvTplFlippyReverse.Enabled and cbConvTplFlippyReverse.Checked = true then
           param := param + ' --reverse';
       end;

       if cbConvAdjustSpeed.Text <> '' then
         param := param + ' --adjust-speed=' + cbConvAdjustSpeed.Text;
       if cbConvNoOverwrite.Checked = true then
          param := param + ' -n';
       if cbConvPLL.Text <> '' then
         param := param + ' --pll ' + cbConvPLL.Text;
       if cbConvIndexMarks.Text <> '' then
         param := param + ' ' + cbConvIndexMarks.Text;
       if edConvFileSource.Text <> '' then
         param := param + ' "' + edConvFileSource.Text + '"';
     end;

  Result := param;
end;

function TFrmMain.GW_CMD_Tools_Erase_Generate: string;
var
  param : String = '';
begin
   if cbToolsEraseRevs.Text <> '' then
     param := param + ' --revs=' + cbToolsEraseRevs.Text;
   if cbToolsEraseCyl.Text <> '' then
     param := param + Trackset(' --tracks=',cbToolsEraseCyl.Text,cbToolsEraseHeads.Text,cbToolsEraseSteps.Text,cbToolsEraseHSwap.Checked,cbToolsEraseFlippy.Text);
   if lblToolsEraseHFreq.Checked = true then
     param := param + ' --hfreq';
   if cbToolsEraseFakeIndex.Text <> '' then
     param := param + ' --fake-index=' + cbToolsEraseFakeIndex.Text;

   Result := param;
end;

function TFrmMain.GW_CMD_Tools_Seek_Generate: string;
var
  param : String = '';
begin
   if cbToolsSeekTrackForce.Checked then
     param := param + ' --force';
   if cbToolsSeekMotorOn.Checked then
     param := param + ' --motor-on';

   Result := param + ' ' + cbToolsSeekTrack.Text;
end;

function TFrmMain.GW_CMD_Tools_Clean_Generate: string;
var
  param : String = '';
begin
  param := param + ' --cyls=' + cbToolsCleanCyl.Text;
  param := param + ' --linger=' + cbToolsCleanLinger.Text;
  param := param + ' --passes=' + cbToolsCleanPasses.Text;
  Result := param;
end;

function TFrmMain.GW_CMD_Settings_Delays_Generate: string;
var
  param : String = '';
begin
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

   Result := param;
end;

function TFrmMain.GW_CMD_Settings_Pin_Generate: string;
var
  cmd : String = '';
  param : String = '';
begin
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

     if cbSetPINNumber.Text <>'' then
       param := param + ' ' + cbSetPINNumber.Text;

     // H = true, L = false
     if cbSetPINLevel.Text <>'' then
     begin
       if cbSetPINLevel.Text = 'Low (0v)' then
         param := param + ' L';
       if cbSetPINLevel.Text = 'High (5v)' then
         param := param + ' H';
     end
   end;
   Result := cmd + ' ' + param;
end;


function TFrmMain.GW_CMD_Settings_Firmware_Generate: string;
var
  param : String = '';
begin
   if cbSetFirmwareBootloader.Checked  = true then
     param := param + ' --bootloader';
   if opSetFWFile.Checked = true then
     param := param + ' --force "' + edToolsFW.Text + '"';
   if opSetFWTag.Checked = true then
     param := param + ' --tag "' + edToolsFWtag.Text + '"';

   Result := param;
end;


// Other commands are in the Command Line window with parameters
procedure TFrmMain.updateGwCmdAction(const cmd: string;
                                  const param: string;
                                  const specifyDevice: boolean;
                                  const specifyDrive: boolean);
var
  execCmdLine : String;
begin

  // Get GW executable
  execCmdLine := '"' + edGWFile.Text + '"';

  // Append specific user parameters
  execCmdLine := execCmdLine + ' ' + cmd + ' '  + param;

  // Append device and drive fields from form
  if (cbGWDevCOM.Text <> '') and (specifyDevice) then
  begin
    // Adafruit doesn't use equals
    if cbGWHW.Text = 'Adafruit RP2040' then
      execCmdLine := execCmdLine + ' --device ' + cbGWDevCOM.Text
    else
      execCmdLine := execCmdLine + ' --device=' + cbGWDevCOM.Text;
  end;

  if (cbGWDrive.Text <> '') and (specifyDrive) then
  begin
    execCmdLine := execCmdLine + ' --drive=' + cbGWDrive.Text;
  end;

  updateCmdPreview(execCmdLine);

end;

procedure TFrmMain.updateCmdPreview(const cmdPreview: string);
begin
  edCmdLinePreview.Text := cmdPreview;
  edCmdLinePreview.SelStart := Length(cmdPreview);
end;


// Modal commands only have a single GW command with no parameters
procedure TFrmMain.performModalCmdAction(const command: string);
var
  cmdParams: String;
begin
  if cbGWDevCOM.Text <> '' then
   begin
     if checkGwExecutable then
      begin
        cmdParams := command + ' --device ' + cbGWDevCOM.Text;
        // Command line, Title, Display Mode
        ShowOperationsDialog('"' + edGWFile.Text + '" ' + cmdParams,
                             GW_APP_NAME + ' - "' + edGWFile.Text + '" ' + cmdParams,
                             OPERATIONS_OTHER);
      end
   end
  else
    begin
      MessageDlg('Greaseweazle port not selected!', mtWarning, [mbOK], 0);
    end;
end;

function TFrmMain.checkGwExecutable: boolean;
begin

  if edGWFile.Text = '' then
     if MessageDlg('Please define location of Greaseweazle (' + GW_APP + ')',mtWarning, [mbOK], 0) = mrOk then
      edGWFile.SetFocus;

  if (Fileexists(edGWFile.Text) = true) then
    Result := true
  else
    if ConfirmAbort(GW_APP_NAME + ' (' + GW_APP + ') not found!',edGWFile) then
      exit;
end;

procedure TFrmMain.ShowOperationsDialog(const CommandLine, Title: string;
  const DisplayMode: TOperationDisplayMode);
begin
  adjustedCmdLine := CommandLine;
  FrmOperations.Caption := Title;
  FrmOperations.ShowModal;
  FrmOperations.DisplayMode := TOperationDisplayMode(DisplayMode);
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
  Node, Child, HXCNode: TDOMNode;
  Spec, Ext, Desc: string;
  FormatDesc: string;
  CanRead, CanWrite, CanConvert, CanHfeConvert, CanSave: Boolean;
  WriteFilterAll, WriteFilterList: string;
  ConvFilterAll, ConvFilterList: string;
  i, j, HXCCount: Integer;
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
  FormstDestConv_Ext := TStringList.Create;
  FormstDestConv_Ext.Add('');
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

        Ext := TDOMElement(Child).GetAttribute(HFE_CONV_EXT);
        Desc := TDOMElement(Child).GetAttribute(HFE_CONV_DESC);
        CanSave := TDOMElement(Child).GetAttribute(XML_OPTION_SAVE)='true';
        CanConvert := TDOMElement(Child).GetAttribute(XML_OPTION_CONVERT)='true';
        CanHfeConvert := TDOMElement(Child).GetAttribute(XML_OPTION_HFE_CONVERT)='true';

        { Add format EXT (Description) }
        FormatDesc := ext + ' (' + Desc + ')';
        FormatDest_Ext.Add(FormatDesc);

        { Add format EXT (Description) to HFE conversion }
        if CanHfeConvert then
          FormstDestConv_Ext.Add(FormatDesc);

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
        if Ext = COMBO_SELECTION_SCP then
        begin
          for i := 0 to TDOMElement(Child).ChildNodes.Count - 1 do
          begin
            OptionNode := TDOMElement(Child).ChildNodes[i];
            if OptionNode.NodeName = 'option' then
              LoadOption(OptionNode, SCPFormatOptions);
          end;
        end
        else if Ext = COMBO_SELECTION_HFE then
        begin
          for j := 0 to TDOMElement(Child).ChildNodes.Count - 1 do
          begin
            OptionNode := TDOMElement(Child).ChildNodes[j];
            if OptionNode.NodeName <> 'option' then Continue;

            case TDOMElement(OptionNode).GetAttribute('name') of
              HFE_OPTION_BITRATE:
                LoadOption(OptionNode, HFEFormatOptions.BitRate);
              HFE_OPTION_VERSION:
                LoadOption(OptionNode, HFEFormatOptions.Version);
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

  Node := Doc.DocumentElement.FindNode('hxcformats');
  if Assigned(Node) then
  begin
    HXCCount := 0;
    HXCNode := Node.FirstChild;
    while Assigned(HXCNode) do
    begin
      if (HXCNode is TDOMElement) and (HXCNode.NodeName = 'format') then
      begin
        SetLength(HXCFormatModules, HXCCount + 1);
        HXCFormatModules[HXCCount].ModuleId := TDOMElement(HXCNode).GetAttribute(HFE_CONV_MODULE_ID);
        HXCFormatModules[HXCCount].Ext := TDOMElement(HXCNode).GetAttribute(HFE_CONV_EXT);
        HXCFormatModules[HXCCount].Desc := TDOMElement(HXCNode).GetAttribute(HFE_CONV_DESC);
        HXCFormatModules[HXCCount].DiskType := TDOMElement(HXCNode).GetAttribute(HFE_CONV_DISKTYPE);
        HXCFormatModules[HXCCount].HFEInterface := TDOMElement(HXCNode).GetAttribute(HFE_CONV_INTERFACE);
        Inc(HXCCount);
      end;
      HXCNode := HXCNode.NextSibling;
    end;
  end;

  Doc.Free;

  edWriteFileName.Filter := WriteFilterAll + '|' + WriteFilterList;
  edConvFileSource.Filter := ConvFilterAll + '|' + ConvFilterList;

end;

end.


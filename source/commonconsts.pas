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

unit CommonConsts;


{$mode ObjFPC}{$H+}

interface

const

  GW_INI_FILE = 'FluxFloppyManager.ini';
  GW_APP_NAME = 'Greaseweazle';
  SAMDISK_APP_NAME = 'Samdisk';
  HXC_APP_NAME = 'HxCFloppyImageConverter';
  GW_DISKDEF_FOLDER = 'Diskdefs';
  GW_TEMPLATE_FOLDER = 'Templates';
  GW_APP_FILE = 'Greaseweazle';
  GW_DOCUMENTS_FOLDER = 'Documents';

  INITIAL_HEIGHT = 920;
  INITIAL_WIDTH = 1850;
  MIN_HEIGHT = 500;
  MIN_WIDTH = 920;

// XML Format file
  FLUX_XML_FILE = 'definitions.xml';

// INI Main section
  FLUX_INI_NAME = 'FluxMyFluffyFloppy';
  
// Section INI Settings
  INI_SECTION_READ_TEMPLATE = 'FluxMyFluffyFloppy-Read-Template';
  INI_SECTION_WRITE_TEMPLATE = 'FluxMyFluffyFloppy-Write-Template';
  INI_VERSION = 'Version';
  INI_VERSION_INI = 'VersionINI';
  INI_VERSION_DEFAULT = 10;
  INI_HEIGHT = 'Height';
  INI_WIDTH = 'Width';
  INI_GW = 'Greaseweazle';
  INI_SHOWARG = 'ShowArg';
  INI_SAVE_DEVICE_FLAG = 'SaveBoolGWDevCom';
  INI_SAVE_DRIVE_FLAG = 'SaveBoolGWDrive';
  INI_SAVE_DEVICE = 'SaveGWDevice';
  INI_SAVE_DRIVE = 'SaveGWDrive';
  INI_CODE_PAGE_CMD =  'CodepageCMD';
  INI_FOLDER_DISKDEFS = 'Diskdefs';
  INI_FOLDER_TEMPLATES = 'FolderTemplates';
  INI_FOLDER_READ_DEST = 'LastFolder_Read_Dest';
  INI_FOLDER_WRITE_SRC = 'LastFolder_Write_Source';
  INI_FOLDER_CONVERT_SRC = 'LastFolder_Convert_Source';
  INI_FOLDER_CONVERT_DEST = 'LastFolder_Convert_Dest';
  INI_TIME = 'Time';
  INI_BACKTRACE = 'Backtrace';
  INI_LAST_READ_TEMPLATE = 'LastReadTemplate';
  INI_LAST_WRITE_TEMPLATE = 'LastWriteTemplate';
  
  INI_ACTIONS_TIME = 'cbSetGlobalActionsTime';
  INI_ACTIONS_SHELL = 'cbSetGlobalActionsShellWindow';
  INI_ACTIONS_BACKTRACE = 'cbSetGlobalActionsBacktrace';
  INI_ACTIONS_GW_HW = 'GWHW';

// Section INI Templates
  INI_SECTION_SETTINGS = 'Settings';
  
  // Pre 2.0 Version
  INI_TEMPLATE_LEGACY_RPM = 'RPM';
  INI_TEMPLATE_LEGACY_ERASE_EMPTY = 'Erase-Empty';
  INI_TEMPLATE_LEGACY_NO_VERIFY = 'No-Verify';
  
  // Current
  INI_TEMPLATE_NAME = 'Name';
  INI_TEMPLATE_DESC = 'Description';
  INI_TEMPLATE_FORMAT_SPEC =  'FormatSpec';
  INI_TEMPLATE_REVS = 'Revs';
  INI_TEMPLATE_RAW = 'Raw';
  INI_TEMPLATE_FAKE_INDEX = 'Fake-Index';
  INI_TEMPLATE_HARD_SECTORS = 'Hard-Sectors';
  INI_TEMPLATE_ADJUST_SPEED = 'Adjust-Speed';
  INI_TEMPLATE_RETRIES =  'Retries';
  INI_TEMPLATE_SEEK_RETRIES = 'Seek-Retries';
  INI_TEMPLATE_PLL = 'PLL';
  INI_TEMPLATE_DD = 'DD';
  INI_TEMPLATE_CYLINDERS = 'Cylinders';
  INI_TEMPLATE_HEADS = 'Heads';
  INI_TEMPLATE_STEPS = 'Steps';
  INI_TEMPLATE_HSWAP = 'HSwap';
  INI_TEMPLATE_FLIPPY = 'Flippy';
  INI_TEMPLATE_FLIPPY_REV = 'FlippyReverse';
  INI_TEMPLATE_LOG_PARAM = 'Log_Param';
  INI_TEMPLATE_LOG_OUTPUT = 'Log_Output';
  INI_TEMPLATE_LOG_ONEFILE = 'Log_InOneFile';

  INI_TEMPLATE_ERASE_EMPTY = 'EraseEmpty';
  INI_TEMPLATE_NO_VERIFY = 'NoVerify';
  INI_TEMPLATE_PRE_COMP = 'Precomp';
  INI_TEMPLATE_PRE_ERASE = 'Pre-Erase';
  INI_TEMPLATE_TP43_PIN2 = 'TP43Pin2';
  INI_TEMPLATE_DELAY_SELECT = 'DelaySelect';
  INI_TEMPLATE_DELAY_STEP = 'DelayStep';
  INI_TEMPLATE_DELAY_SETTLE = 'DelaySettle';
  INI_TEMPLATE_DELAY_MOTOR = 'DelayMotor';
  INI_TEMPLATE_DELAY_AUTOOFF = 'DelayAutoOff';
  INI_TEMPLATE_DELAY_PREWRITE = 'DelayPreWrite';
  INI_TEMPLATE_DELAY_POSTWRITE = 'DelayPostWrite';
  INI_TEMPLATE_DELAY_INDEXMASK = 'DelayIndexMask';

  // Additions V4.0
  INI_TEMPLATE_FORMAT = 'Format';
  INI_TEMPLATE_FORMAT_OPTION = 'FormatOption';
  INI_TEMPLATE_CONV_FORMAT = 'ConvFormatOption';

  INI_TEMPLATE_FORMAT_OPTION_HFE_VER = 'FormatOptionHFEVer';
  INI_TEMPLATE_FORMAT_OPTION_HFE_INT = 'FormatOptionHFEInt';
  INI_TEMPLATE_FORMAT_OPTION_HFE_ENC = 'FormatOptionHFEEnc';
  INI_TEMPLATE_DIRECTORY = 'Directory';

  PATH_TEMPLATES = 'Templates';

  GW_INI_WRITE_EXT = '.iniw';
  GW_INI_READ_EXT = '.inir';
  GW_CONFIG_EXT = '.cfg';
  GW_PROP_PAGE_READ = 0;
  GW_PROP_PAGE_WRITE = 1;
  GW_PROP_PAGE_CONVERT = 2;
  GW_PROP_PAGE_TOOLS = 3;
  GW_PROP_PAGE_SETTINGS = 4;

  // Casing is important for GW and this also must match XML tags
  HFE_OPTION_BITRATE = 'bitrate';
  HFE_OPTION_VERSION = 'version';
  HFE_OPTION_INTERFACE = 'interface';
  HFE_OPTION_ENCODING = 'encoding';

  XML_OPTION_SAVE = 'save';
  XML_OPTION_CONVERT = 'convert';
  XML_OPTION_HFE_CONVERT = 'hfeconvert';
  HFE_CONV_MODULE_ID = 'moduleid';
  HFE_CONV_EXT = 'ext';
  HFE_CONV_DESC = 'desc';
  HFE_CONV_DISKTYPE = 'disktype';
  HFE_CONV_INTERFACE = 'interface';

//  COMBO_SELECTION_SCP = 'SCP (SuperCardPro)';
//  COMBO_SELECTION_HFE = 'HFE (HxC Floppy Emulator)';

  COMBO_SELECTION_EDS = 'EDS';
  COMBO_SELECTION_HFE = 'HFE';
  COMBO_SELECTION_SCP = 'SCP';
  COMBO_SELECTION_RAW = 'RAW';

  FORMAT_SPEC_INTERNAL = 'Internal';
  DISK_DEF_TYPE_PREFIX = 'disk ';

  APP_NAME = 'Flux Floppy Manager ';
  APP_VERSION = 'v5.2.7.2';
  APP_DATE = '2026-03-09';

  TEMPLATE_VERSION = '4.00';

  {$IFDEF WINDOWS}
    GW_EXECUTABLE = 'greaseweazle\gw.exe';
    GW_APP = 'gw.exe';
    PATH_SPECIFIER: char ='\';
  {$ELSE}
    GW_EXECUTABLE = 'gw';  // or full path, see note below
    GW_APP = 'gw';
    PATH_SPECIFIER: char ='/';
  {$ENDIF}

implementation

end.

unit API.Types;

interface
uses
  System.SysUtils;

type
  EDatabaseError = class(Exception);
  EInvalidParameterError = class(EDatabaseError);
  EConnectionError = class(EDatabaseError);

  TDriverFDTypeEnum = (dtAccessDB, dtSqlite, dtPostgreSql, dtMySQL, dtFirebird, dtInterbase, dtInterbaseLite);
  TDriverFDTypeEnumHelper = record helper for TDriverFDTypeEnum
  public
    function ToString: string;
    function GetDriverName: string;
  end;

  TBaseFiredacDriver = class
  protected
    class function DBName(const aValue: TDriverFDTypeEnum): string; static;
    class function DriverName(const aValue: TDriverFDTypeEnum): string; static;
  end;

  TMSAccessDriver = class(TBaseFiredacDriver) end;
  TSQLiteDriver = class(TBaseFiredacDriver) end;
  TPostgreSqlDriver = class(TBaseFiredacDriver) end;
  TMySQLDriver = class(TBaseFiredacDriver) end;
  TFirebirdDriver = class(TBaseFiredacDriver) end;
  TInterbaseDriver = class(TBaseFiredacDriver) end;
  TInterbaseLiteDriver = class(TBaseFiredacDriver) end;

  TSQLiteLockingMode = (mLockingExclusive, mLockingNormal);
  TSQLiteLockingModeHelper = record helper for TSQLiteLockingMode
  public
    function ToString: string;
  end;

  TSQLiteEncryptMode = (EncryptNone, AES128, AES192, AES256, AES_CTR128, AES_CTR192, AES_CTR256, AES_ECB128, AES_ECB192, AES_ECB256);
  TSQLiteEncryptModeHelper = record helper for TSQLiteEncryptMode
  public
    function ToString: string;
    class function FromString(const aValue: string): TSQLiteEncryptMode; static;
  end;

implementation

{ TDriverFDTypeEnumHelper }

function TDriverFDTypeEnumHelper.ToString: string;
const
  cDBTypeNames: array [TDriverFDTypeEnum] of string = (
    'MSAccess', 'SQLite', 'PostgreSQL', 'MySQL', 'Firebird', 'Interbase', 'Interbase Lite'
  );
begin
  Result := cDBTypeNames[Self];
end;

function TDriverFDTypeEnumHelper.GetDriverName: string;
const
  cDBDriverNames: array [TDriverFDTypeEnum] of string = (
    'MSAcc', 'SQLite', 'PG', 'MySQL', 'FB', 'IB', 'IBLite'
  );
begin
  Result := cDBDriverNames[Self];
end;

{ TBaseFiredacDriver }

class function TBaseFiredacDriver.DBName(
  const aValue: TDriverFDTypeEnum): string;
begin
  Result := aValue.ToString;
end;

class function TBaseFiredacDriver.DriverName(
  const aValue: TDriverFDTypeEnum): string;
begin
  Result := aValue.GetDriverName;
end;

{ TSQLiteLockingModeHelper }

function TSQLiteLockingModeHelper.ToString: string;
const
  cLockingModeNames: array [TSQLiteLockingMode] of string = (
    'Exclusive','Normal'
  );
begin
  Result := cLockingModeNames[Self];
end;

{ TSQLiteEncryptModeHelper }

function TSQLiteEncryptModeHelper.ToString: string;
const
  cEncryptModeNames: array [TSQLiteEncryptMode] of string = (
    'No', 'aes-128', 'aes-192', 'aes-256', 'aes-ctr-128',
    'aes-ctr-192', 'aes-ctr-256', 'aes-ecb-128', 'aes-ecb-192', 'aes-ecb-256'
  );
begin
  Result := cEncryptModeNames[Self];
end;

class function TSQLiteEncryptModeHelper.FromString(const aValue: string): TSQLiteEncryptMode;
var
  LEncryptMode: TSQLiteEncryptMode;
begin
  for LEncryptMode := Low(TSQLiteEncryptMode) to High(TSQLiteEncryptMode) do
    if SameText(aValue, LEncryptMode.ToString) then
      Exit(LEncryptMode);

  raise EInvalidParameterError.CreateFmt('Invalid encryption mode: %s', [aValue]);
end;

end.

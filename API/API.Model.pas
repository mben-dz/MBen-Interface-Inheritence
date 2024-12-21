unit API.Model;

interface
uses
  API.Types,
  API.Interfaces;

type
  TBaseConnectionParams = class(TInterfacedObject, iBaseFiredacParams)
  strict private
    fPooled: Boolean;
    fDatabase,
    fUsername,
    fPassword: string;
  protected
    function Pooled(aValue: Boolean): iBaseFiredacParams; overload; virtual;
    function Database(aValue: string): iBaseFiredacParams; overload; virtual;
    function Username(aValue: string): iBaseFiredacParams; overload; virtual;
    function Password(aValue: string): iBaseFiredacParams; overload; virtual;

    function Pooled: Boolean; overload; virtual;
    function Database: string; overload; virtual;
    function UserName: string; overload; virtual;
    function Password: string; overload; virtual;

    function Params: iBaseFiredacParams; virtual;

     procedure ValidateParams; virtual; abstract;
  end;

  TSqliteParams = class(TBaseConnectionParams, iSQLiteParams)
  strict private
    fLockingMode: TSQLiteLockingMode;
    fEncrypt: TSQLiteEncryptMode;
  public
    function Pooled(aValue: Boolean): iSQLiteParams; reintroduce; overload;  virtual;
    function Database(aValue: string): iSQLiteParams; reintroduce; overload; virtual;
    function Username(aValue: string): iSQLiteParams; reintroduce; overload; virtual;
    function Password(aValue: string): iSQLiteParams; reintroduce; overload; virtual;

    function Pooled: Boolean; reintroduce; overload; override;
    function Database: string; reintroduce; overload; override;
    function UserName: string; reintroduce; overload; override;
    function Password: string; reintroduce; overload; override;

    function Params: iSQLiteParams; reintroduce; virtual;

    constructor Create
      (const aDatabase: string;
       const aUsername: string = ''; const aPassword: string = '';
       const aLockingMode: TSQLiteLockingMode = mLockingExclusive; aEncrypt: TSQLiteEncryptMode = EncryptNone);
    procedure ValidateParams; override;

    function LockingMode(aValue: TSQLiteLockingMode): iSQLiteParams; overload;
    function Encrypt(aValue: TSQLiteEncryptMode): iSQLiteParams; overload;

    function LockingMode: TSQLiteLockingMode; overload;
    function Encrypt: TSQLiteEncryptMode; overload;
  end;

implementation

{ TBaseConnectionParams }

{$REGION '  Base Firedac Params .. '}
function TBaseConnectionParams.Pooled(aValue: Boolean): iBaseFiredacParams;
begin
  result := Self;

  fPooled := aValue;
end;

function TBaseConnectionParams.Pooled: Boolean;
begin
  Result := fPooled;
end;

function TBaseConnectionParams.Database(aValue: string): iBaseFiredacParams;
begin
  result := Self;

  fDatabase := aValue;
end;

function TBaseConnectionParams.Database: string;
begin
  Result := fDatabase;
end;

function TBaseConnectionParams.Username(aValue: string): iBaseFiredacParams;
begin
  result := Self;

  fUsername := aValue;
end;

function TBaseConnectionParams.Username: string;
begin
  Result := fUsername;
end;

function TBaseConnectionParams.Password(aValue: string): iBaseFiredacParams;
begin
  Result := Self;

  fPassword := aValue;
end;

function TBaseConnectionParams.Password: string;
begin
  Result := fPassword;
end;

function TBaseConnectionParams.Params: iBaseFiredacParams;
begin
  Result := Self;
end;
{$ENDREGION}

{ TSqliteParams }

constructor TSqliteParams.Create(const aDatabase, aUsername, aPassword: string;
  const aLockingMode: TSQLiteLockingMode; aEncrypt: TSQLiteEncryptMode);
begin
//
end;

function TSqliteParams.Pooled(aValue: Boolean): iSQLiteParams;
begin inherited Pooled(aValue);
  Result := Self;
end;

function TSqliteParams.Pooled: Boolean;
begin Result := inherited Pooled;
end;

function TSqliteParams.Database(aValue: string): iSQLiteParams;
begin inherited Database(aValue);
  Result := Self;
end;

function TSqliteParams.Database: string;
begin Result := inherited Database;
end;

function TSqliteParams.Username(aValue: string): iSQLiteParams;
begin inherited UserName(aValue);
  Result := Self;
end;

function TSqliteParams.Username: string;
begin Result := inherited Username;
end;

function TSqliteParams.Password(aValue: string): iSQLiteParams;
begin inherited Password(aValue);
  Result := Self;
end;

function TSqliteParams.Password: string;
begin Result := inherited Password;
end;

function TSqliteParams.Params: iSQLiteParams;
begin inherited Params;
  Result := Self;
end;

function TSqliteParams.LockingMode(
  aValue: TSQLiteLockingMode): iSQLiteParams;
begin
  Result := Self;

  fLockingMode := aValue;
end;

function TSqliteParams.LockingMode: TSQLiteLockingMode;
begin
  Result := fLockingMode;
end;

function TSqliteParams.
Encrypt(aValue: TSQLiteEncryptMode): iSQLiteParams;
begin
  Result := Self;

  fEncrypt := aValue;
end;

function TSqliteParams.Encrypt: TSQLiteEncryptMode;
begin
  Result := fEncrypt;
end;

procedure TSqliteParams.ValidateParams;
begin
//
end;

end.

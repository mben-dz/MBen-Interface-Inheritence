unit API.Interfaces;

interface
uses
  API.Types;

type
  iBaseFDParams<TDBType: TBaseFiredacDriver> = interface ['{B5A4A031-EFA0-4424-902D-2529FC4F1B48}']

    function Pooled(aValue: Boolean): iBaseFDParams<TDBType>; overload;
    function Database(aValue: string): iBaseFDParams<TDBType>; overload;
    function Username(aValue: string): iBaseFDParams<TDBType>; overload;
    function Password(aValue: string): iBaseFDParams<TDBType>; overload;

    function Pooled: Boolean; overload;
    function Database: string; overload;
    function UserName: string; overload;
    function Password: string; overload;

    function Params: iBaseFDParams<TDBType>;
  end;
  iBaseFiredacParams = iBaseFDParams<TBaseFiredacDriver>;
  iMSAccesseParams   = iBaseFDParams<TMSAccessDriver>;

  iSQLiteParams      = interface (iBaseFiredacParams)
    function LockingMode(aValue: TSQLiteLockingMode): iSQLiteParams; overload;
    function Encrypt(aValue: TSQLiteEncryptMode): iSQLiteParams; overload;

    function LockingMode: TSQLiteLockingMode; overload;
    function Encrypt: TSQLiteEncryptMode; overload;
  end;

  iPostgreSqlParams = iBaseFDParams<TPostgreSqlDriver>;
  iMySQLParams      = iBaseFDParams<TMySQLDriver>;
  iFirebirdParams   = iBaseFDParams<TFirebirdDriver>;
  iInterbaseParams  = iBaseFDParams<TInterbaseDriver>;
  iInterbaseLParams = iBaseFDParams<TInterbaseLiteDriver>;


implementation


end.

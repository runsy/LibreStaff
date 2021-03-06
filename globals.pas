unit Globals;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, INIfiles, ExtCtrls, Graphics;

type
	TDataFormat= (dtNull, dtString, dtInteger, dtBoolean, dtDate, dtChar, dtText,
  							dtBlob);

type
	TAction= (acEdit, acAdd);

//USER OBJECT DEFINITION
(*
The User Object has:
	-Name
  -A record set of TPermissions
*)
type TPermission= record
  //Edit employees
  EditEmployee, AddEmployee, DeleteEmployee: Boolean;
	//Show Tabs
  ShowTabAddress: Boolean;
  //Admin
  AdminControlAccess, AdminDatabase: Boolean;
  end;

type TUser= class(TObject)
  var
    Permissions: TPermission;
  public
    Name: String;
  end;
//END OF USER OBJECT DEFINITION

var
	PathApp, PathIni, SQLiteLibraryName: String;
  INIFile: TINIFile;
  Lang, FallBacklang: String;
  AccessControl, RememberUsername: Boolean;
  User: TUser;

const
  AUTOCLOSE_POPUPNOTIFIER_TIME= 3000;
  AVATARS_COUNT= 399;
  DATABASE_DEFAULT_VERSION= '0.0.0';
  DATABASE_EXTENSION= '.db';
  DATABASE_NAME= 'librestaff';
  DATABASE_VERSION_SEPARATOR= '.';
	DATABASE_VERSION_SUBSTRINGS_COUNT= 3;
  EDIT_ERROR_COLOR= clRed;
  MYSQL_COLLATION= 'utf8_unicode_ci';
  MYSQL_ENGINE_VERSION= '5.6.27.0';
  PASSWORD_LENGTH= 12;
  PATH_SEPARATOR=
  {$ifdef Win32}
    '\';
  {$else}
		'/';
  {$endif}
  RANDOMIDLENGHT= 9;
  SALT_LENGTH= 3;
  SQLITE_ENGINE_VERSION= '3.13.0.0';
  SUPERUSER_GROUP= 'SUPERUSERS';
  SUPERUSER_NAME= 'SUPERUSER';
  SUPERUSER_PASSWORD= 'B887275D13AA5DB8FBDFF89576D245F03B7E9C48';
  SUPERUSER_SALT= 'zYJ';
  TABLES_COUNT= 9;
  USERNAME_LENGTH= 12;

implementation

end.


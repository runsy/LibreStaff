unit Globals;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, INIfiles, PopupNotifier, ExtCtrls, Graphics;

//Custom PopupNotifier with a autoclose delay
type TCustomPopupNotifier= class(TPopupNotifier)
		private
    Counter, Seconds: Integer;
		procedure OnPopupTimer(Sender: TObject);
    public
 		PopupTimer: TTimer;
		constructor Create(Delay: Integer=0); overload;
  end;

type
	TDataFormat= (dtNull, dtString, dtInteger, dtBoolean, dtDate);

type TPermission= record
  EditEmployee, AddEmployee, DeleteEmployee: Boolean;
  ShowTabAddress: Boolean;
  end;

type TUser= class(TObject)
  var
    Permissions: TPermission;
  public
    Name: String;
  end;

var
	PathApp, SQLiteLibraryName, DatabaseName, DatabasePath: String;
  INIFile: TINIFile;
  Lang, FallBacklang: String;
  AccessControl, RememberUsername: Boolean;
  User: TUser;

const
  AVATARS_COUNT= 399;
  EDIT_ERROR_COLOR= clRed;
  PASSWORD_LENGTH= 12;
  SALT_LENGTH= 3;
  SUPERUSER_GROUP= 'SUPERUSERS';
  SUPERUSER_NAME= 'SUPERUSER';
  SUPERUSER_PASSWORD= 'B887275D13AA5DB8FBDFF89576D245F03B7E9C48';
  SUPERUSER_SALT= 'zYJ';
  USERNAME_LENGTH= 12;

implementation

//Custom Popup Notifier procedures
constructor TCustomPopupNotifier.Create(Delay: Integer=0);
begin
  inherited create(nil);
 	if (Delay>0) then
	  begin
	  PopupTimer:= TTimer.Create(Self);
  	with PopupTimer do
	  	begin
      Counter:= 0;
      Seconds:= Delay;
      Interval:= 1000;
  		Enabled:= TRUE;
  		OnTimer:= @OnPopupTimer; //The @ avoid parameters
	    end;
  	end;
end;

procedure TCustomPopupNotifier.OnPopupTimer(Sender: TObject);
begin
  Inc(Counter, 1); //Increase the counter
  if (Counter>= Seconds) then //If counter equal to delay in seconds...
  	begin
    Free; //...then free the popup
    end;
end;

end.


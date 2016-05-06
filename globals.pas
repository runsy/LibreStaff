unit Globals;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, INIfiles, PopupNotifier, ExtCtrls;

type TCustomPopupNotifier= class(TPopupNotifier)
		private
    Counter, Seconds: Integer;
		procedure OnPopupTimer(Sender: TObject);
    public
 		PopupTimer: TTimer;
		constructor Create(Delay: Integer=0); overload;
  end;

var
	PathApp, SQLiteLibraryName, DatabaseName, DatabasePath: String;
  INIFile: TINIFile;
  AccessControl: Boolean;

const
  POPUP_DELAY= 3600;
  USERNAME_LENGTH= 12;
  PASSWORD_LENGTH= 12;
  SALT_LENGTH= 3;
  SUPERUSER_NAME= 'SUPERUSER';
  SUPERUSER_PASSWORD= '';
  SUPERUSER_SALT= '';

implementation

constructor TCustomPopupNotifier.Create(Delay: Integer=0);
begin
  inherited create(nil);
 	if Delay>0 then
	  begin
	  PopupTimer:= TTimer.Create(Self);
  	with PopupTimer do
	  	begin
      Counter:= 0;
      Seconds:= Delay;
      Interval:= 1000;
  		Enabled:= TRUE;
  		OnTimer:= @OnPopupTimer;
	    end;
  	end;
end;

procedure TCustomPopupNotifier.OnPopupTimer(Sender: TObject);
begin
  Counter:= Counter+1;
  if Counter>= Seconds then
  	begin
    Free;
    end;
end;

end.


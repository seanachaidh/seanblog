unit seanblogdb;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql55, mysql55conn;

type

  { TSeanblogConnection }

  TSeanblogConnection = class
    private
      constructor Init;
      DBConnection: TMySQL55Connection;
    public
      name: String;
      class function Create: TSeanblogConnection;
  end;

implementation
var
   Singleton: TSeanblogConnection = nil;

{ TSeanblogConnection }

constructor TSeanblogConnection.Init;
begin
  inherited Create;
  DBConnection:= TMySQL55Connection.Create(nil);
  //TODO: Verkrijg deze waarden door middel van een configuratiebestand
  DBConnection.HostName:= 'localhost';
  DBConnection.UserName:= 'testuser';
  DBConnection.Password:= 'test';
  DBConnection.DatabaseName:= 'test';
  DBConnection.Connected:= true;
end;

class function TSeanblogConnection.Create: TSeanblogConnection;
begin
  if Singleton = nil then
  begin
    Singleton:= TSeanblogConnection.Init;
  end;

  Result:= Singleton;
end;


end.


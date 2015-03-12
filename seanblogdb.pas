unit seanblogdb;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, mysql55, mysql55conn;

type

  { TSeanblogConnection }

  TSeanblogConnection = class
    private
      DBConnection: TMySQL55Connection;
      constructor Init;
      function getConnected: boolean;
      function getConnection: TSQLConnection;
    public
      name: String;
      class function Create: TSeanblogConnection;
      procedure connect;
      property isConnected: boolean read getConnected;
      //TODO: Werkt dit wel?
      property Connection: TSQLConnection read getConnection;
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
  DBConnection.Password:= '12345';
  DBConnection.DatabaseName:= 'blogschema';
  DBConnection.Transaction:= TSQLTransaction.Create(nil);
  DBConnection.Transaction.DataBase:= DBConnection;
  DBConnection.Connected:= true;
end;

function TSeanblogConnection.getConnected: boolean;
begin
  Result:= DBConnection.Connected;
end;

function TSeanblogConnection.getConnection: TSQLConnection;
var
   retval: TSQLConnection;
begin
  retval:= TSQLConnection(DBConnection);
  result:= retval;
end;

class function TSeanblogConnection.Create: TSeanblogConnection;
begin
  if Singleton = nil then
  begin
    Singleton:= TSeanblogConnection.Init;
  end;

  Result:= Singleton;
end;

procedure TSeanblogConnection.connect;
begin
  //mconnected:= true;
  DBConnection.Connected:= true;
end;


end.

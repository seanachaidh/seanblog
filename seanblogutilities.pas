unit seanblogutilities;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xmlread, xmlutils, DOM;

type

  { TSeanblogConfiguration }

  TSeanblogConfiguration = class
    private
      mclienttype: string;
      musername: string;
      mpassword: string;
      mhostname: string;
      mdb: string;

      xmldoc: TXMLDocument;

    public
      function loadConfiguration(conffile: string): boolean;
      procedure unloadConfiguration;

      property ClientType: string read mclienttype;
      property Username: string read musername;
      property Password: string read mpassword;
      property Hostname: string read mhostname;
      property DB: string read mdb;
  end;

implementation

{ TSeanblogConfiguration }

function TSeanblogConfiguration.loadConfiguration(conffile: string): boolean;
begin
  try
    ReadXMLFile(xmldoc, conffile);
    mpassword:= xmldoc.FindNode('password').NodeValue;
    musername:= xmldoc.FindNode('username').NodeValue;
    mhostname:= xmldoc.FindNode('hostname').NodeValue;
    mdb:= xmldoc.FindNode('database').NodeValue;
    mclienttype:= xmldoc.FindNode('clienttype').NodeValue;
  finally
    xmldoc.Free;
  end;
end;

procedure TSeanblogConfiguration.unloadConfiguration;
begin
  mpassword:= '';
  musername:= '';
  mhostname:= '';
  mdb:= '';
  mclienttype:= '';
end;

end.


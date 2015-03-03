unit databases;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, seanblogdb;

type

  TDatabaseCase= class(TTestCase)
  protected
    procedure SetUp; override;
  published
    procedure TestHookUp;
  end;

implementation

procedure TDatabaseCase.TestHookUp;
begin
  Fail('Write your own test');
end;

procedure TDatabaseCase.SetUp;
begin

end;


initialization

  RegisterTest(TDatabaseCase);
end.


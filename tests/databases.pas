unit databases;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, seanblogdb;

type

  { TDatabaseCase }

  TDatabaseCase= class(TTestCase)
  protected
    testdb: TSeanblogConnection;

    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestHookUp;
    procedure TestConnection;
  end;

  { TCommentsCase }

  TCommentsCase = class(TTestCase)
    protected
      procedure SetUp; override;
      procedure TearDown; override;
    published
      procedure testquery;
  end;

implementation

{ TCommentsCase }

procedure TCommentsCase.SetUp;
var
  testdb: TSeanblogConnection;
begin

end;

procedure TCommentsCase.TearDown;
begin
  inherited TearDown;
end;

procedure TCommentsCase.testquery;
begin
  Fail('nog niet gemaakt');
end;

procedure TDatabaseCase.TestHookUp;
begin
  Fail('Write your own test');
end;

procedure TDatabaseCase.TestConnection;
begin
  AssertTrue(testdb.isConnected);
end;

procedure TDatabaseCase.SetUp;
begin
  testdb:= TSeanblogConnection.Create;
  testdb.connect
end;

procedure TDatabaseCase.TearDown;
begin
  inherited TearDown;
end;


initialization
  RegisterTest(TCommentsCase);
  RegisterTest(TDatabaseCase);
end.


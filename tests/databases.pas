unit databases;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, seanblogdb, seanblogprocs,
  seanblogusers;

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

  { TUsersCase }

  TUsersCase = class(TTestCase)
    private
      testuser: TSeanblogUser;
    protected
      procedure SetUp; override;
      procedure TearDown; override;
    published
      procedure TestQuery;
  end;

implementation

{ TUsersCase }

procedure TUsersCase.SetUp;
begin
  testuser:= TSeanblogUser.Create;
  testuser.Name:= 'Van Keymeulen';
  testuser.Username:= 'pieter';
  testuser.Surname:= 'Pieter';
  testuser.Password:= '12345';

  insertUser(testuser);
end;

procedure TUsersCase.TearDown;
begin
end;

procedure TUsersCase.TestQuery;
var
  tmplist: TSeanblogUserList;
begin
  tmplist:= getAllUsers;
  Assert((tmplist.IndexOf(testuser) > 0));
end;

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
  RegisterTest(TUsersCase);
end.


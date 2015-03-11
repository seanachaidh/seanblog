unit seanblogprocs;

{$mode objfpc}{$H+}
{
 deze unit bevat enkele functies voor het verkrijgen van data uit de databank
 Het zou beter zijn mocht ik dit kunnen vervangen dooor een systeem van object
 relationship mapping
}

interface

uses
  Classes, SysUtils, seanblogdb, seanblogcomments, seanblogposts, seanblogusers,
  sqldb, db;

//DBProcs

//Users
function getAllUsers: TSeanblogUserList;
function insertUser(item: TSeanblogUser): boolean;
function getAllUserByUsername(username: string): TSeanblogUserList;

implementation
var
   curdb: TSeanblogConnection;

function getAllUsers: TSeanblogUserList;
var
   trans: TSQLTransaction;
   query: TSQLQuery;
   retval: TSeanblogUserList;
   tmpuser: TSeanblogUser;
begin
  query:= TSQLQuery.Create(nil);
  retval:= TSeanblogUserList.Create;

  curdb.Connection.Transaction.Active:= true;
  query.SQL.Text:= 'select * from seanblog_users';

  query.Open;
  query.First;
  while not query.EOF do
  begin
    tmpuser:= TSeanblogUser.Create;
    tmpuser.Name:= query.FieldByName('name').AsString;
    tmpuser.Password:= query.FieldByName('password').AsString;
    tmpuser.Surname:= query.FieldByName('surname').AsString;
    tmpuser.Username:= query.FieldByName('username').AsString;

    retval.Add(tmpuser);
  end;

  result:= retval;
end;

function insertUser(item: TSeanblogUser): boolean;
var
   query: TSQLQuery;
   trans: TSQLTransaction;
begin
  query:= TSQLQuery.Create(nil);
  query.SQL.Text:= 'insert into seanblog_users values(NULL, :username, :password, :surname, :name)';

  query.Params.ParamByName('username').AsString:= item.Username;
  query.Params.ParamByName('password').AsString:= item.Password;
  query.Params.ParamByName('surname').AsString:= item.Surname;
  query.Params.ParamByName('name').AsString:= item.Name;

  query.ExecSQL;
  curdb.Connection.Transaction.Commit;
end;

function getAllUserByUsername(username: string): TSeanblogUserList;
begin

end;

initialization
curdb:= TSeanblogConnection.Create;
end.


unit seanblogusers;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BrookAction, fgl;
type

  TSeanblogUser = class
    private
      mid: integer;
      musername: string;
      mpassword: string;
      msurname: string;
      mname: string;
    public
      { zou het niet beter zijn op deze eigenschappen alleen-lezen te maken? }
      property Username: string read musername write musername;
      property Password: string read mpassword write mpassword;
      property Surname: string read msurname write msurname;
      property Name: string read mname write mname;
      property Id: integer read mid write mid;
  end;

  { TSeanblogUsersAction }

  TSeanblogUsersAction = class(TBrookAction)
    public
      procedure Get; override;
  end;

  TSeanblogUserList = specialize TFPGList<TSeanblogUser>;

implementation

{ TSeanblogUsersAction }

procedure TSeanblogUsersAction.Get;
begin
  Write('nog niet gemaakt');
end;
{ TODO; initialisatie toevogen! }
end.


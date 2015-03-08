unit seanblogusers;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BrookAction;
type

  TSeanblogUser = class
    private
      musername: string;
      mpassword: string;
      msurname: string;
      mname: string;
    public
      property Username: string read musername write musername;
      property Password: string read mpassword write mpassword;
      property Surname: string read msurname write msurname;
      property Name: string read mname write mname;
  end;

  { TSeanblogUsersAction }

  TSeanblogUsersAction = class(TBrookAction)
    public
      procedure Get; override;
  end;

implementation

{ TSeanblogUsersAction }

procedure TSeanblogUsersAction.Get;
begin
  Write('nog niet gemaakt');
end;

end.


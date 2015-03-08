unit seanblogusers;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BrookAction;
type

  TSeanblogUser = class

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


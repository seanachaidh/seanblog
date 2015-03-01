unit seanblogactions;

{$mode objfpc}{$H+}

interface

uses BrookAction;

type

  { TMyAction }

  TMyAction = class(TBrookAction)
    public
      procedure Get; override;
  end;

implementation

{ TMyAction }

procedure TMyAction.Get;
begin
  write('hello world');
end;

initialization
TMyAction.Register('*');
end.

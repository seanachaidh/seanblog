unit seanblogcomments;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BrookAction;
type
  SeanblogComment = class

  end;

  { SeanblogCommentAction }

  SeanblogCommentAction = class(TBrookAction)
    public
      procedure Get; override;
  end;

implementation

{ SeanblogCommentAction }

procedure SeanblogCommentAction.Get;
begin
  write('seanblog comments');
end;
initialization
SeanblogCommentAction.Register('*');
end.


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
      procedure Post; override;
  end;

implementation

{ SeanblogCommentAction }

procedure SeanblogCommentAction.Get;
begin
  write('seanblog comments');
end;

procedure SeanblogCommentAction.Post;
begin
  write('nog niet gemaakt');
end;

initialization
SeanblogCommentAction.Register('/comments');
end.


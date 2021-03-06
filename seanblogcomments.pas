unit seanblogcomments;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BrookAction;
type
  TSeanblogComment = class
     private
       mAuthor: string;
       mText: string;
       mDate: longint;
     public
       property Author: string read mAuthor write mAuthor;
       property Text: string read mText write mText;
       property Date: longint read mDate write mDate;
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

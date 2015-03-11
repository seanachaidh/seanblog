unit seanblogposts;

{$mode objfpc}{$H+}

interface

uses BrookAction, classes, fgl, seanblogcomments, seanblogusers;

type
  TCommentsList = specialize TFPGList<TSeanblogComment>;

  { TSeanblogPost }

  TSeanblogPost = class
    private
      mTitle: string;
      mAuthor: TSeanblogUser;
      mText: string;
      //Bestaat er in pascal een datumtype
      mDate: longint;
      mTags: TStrings;

    public
      constructor Create(title, text: string; date: longint);

      //procs
      procedure AddTag(toadd: string);

      //props
      property Title: string read mTitle write mTitle;
      property Author: string read mAuthor write mAuthor;
      property Text: String read mText write mText;
      property Date: longint read mDate write mDate;

  end;

  { TSeanblogPostAction }

  TSeanblogPostAction = class(TBrookAction)
    public
      procedure Get; override;
      procedure Post; override;
  end;

implementation

{ TSeanblogPost }

constructor TSeanblogPost.Create(title, text: string; date: longint);
begin
  self.Title:= title;
  self.Text:= text;
  self.Date:= date;

  mTags:= TStrings.Create;
end;

procedure TSeanblogPost.AddTag(toadd: string);
begin
  mTags.Add(toadd);
end;

{ TSeanblogPostAction }

procedure TSeanblogPostAction.Get;
begin
  write('hello world');
end;

procedure TSeanblogPostAction.Post;
begin
  write('nog niet gemaakt');
end;

initialization
TSeanblogPostAction.Register('/posts');
end.

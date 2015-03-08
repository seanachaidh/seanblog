unit seanblogprocs;

{$mode objfpc}{$H+}
{
 deze unit bevat enkele functies voor het verkrijgen van data uit de databank
 Het zou beter zijn mocht ik dit kunnen vervangen dooor een systeem van object
 relationship mapping
}

interface

uses
  Classes, SysUtils, seanblogdb, seanblogcomments, seanblogposts;

implementation
var
   curdb: TSeanblogConnection;
initialization
curdb:= TSeanblogConnection.Create;
end.


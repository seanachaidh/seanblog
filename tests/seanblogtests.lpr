program seanblogtests;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, GuiTestRunner, databases;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.


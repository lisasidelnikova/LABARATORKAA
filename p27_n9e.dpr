program p27_n9e;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  USort in 'USort.pas',
  UChart in 'UChart.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

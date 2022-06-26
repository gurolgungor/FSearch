program FSearch;

uses
  Vcl.Forms,
  FSearchU1 in 'FSearchU1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

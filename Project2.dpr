program Project2;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {Form3},
  signForm in 'signForm.pas' {Form1},
  loginForm in 'loginForm.pas' {Form2},
  watchForm in 'watchForm.pas' {Form4},
  editForm in 'editForm.pas' {Form7},
  postForm in 'postForm.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.

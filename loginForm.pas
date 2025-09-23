unit loginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    sendBtn: TButton;
    rtnBtn: TButton;
    edtID: TEdit;
    edtPW: TEdit;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure sendBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    checkAuth: integer;
    getName: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Clear;
  FDConnection1.DriverName := 'MySQL';
  FDConnection1.Params.Add('CharacterSet=utf8mb4');
  FDConnection1.Params.Add('Server=localhost');
  FDConnection1.Params.Add('Database=conbetra');
  FDConnection1.Params.Add('User_Name=conbetra_root');
  FDConnection1.Params.Add('Password=1234');
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    sendBtn.Click;
  if Key = VK_ESCAPE then
    rtnBtn.Click;
end;

procedure TForm1.sendBtnClick(Sender: TObject);
begin
  if edtID.Text = '' then
  begin
    ShowMessage('아이디');
    edtID.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  if edtPW.Text = '' then
  begin
    ShowMessage('비밀번호');
    edtPW.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  FDQuery1.SQL.Text := 'SELECT * FROM auth WHERE loginId = :loginId AND pw = :pw';
  FDQuery1.ParamByName('loginId').AsWideString := edtID.Text;
  FDQuery1.ParamByName('pw').AsWideString := edtPW.Text;
  FDQuery1.Open;

  if not FDQuery1.IsEmpty then
  begin
    ShowMessage('로그인 성공');
    checkAuth := FDQuery1.FieldByName('empId').AsInteger;
    getName := FDQuery1.FieldByName('display_name').AsString;
    Self.ModalResult := mrOK;
  end
  else
  begin
    ShowMessage('해당하는 계정은 존재하지 않습니다.');
    edtId.Clear;
    edtPW.Clear;
    Self.ModalResult := mrNone;
  end;
end;

end.

unit signForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    signBtn: TButton;
    returnBtn: TButton;
    edtID: TEdit;
    edtName: TEdit;
    edtPW: TEdit;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    checkIdBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure signBtnClick(Sender: TObject);
    procedure checkIdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  cnt: integer;
  t_cnt: Boolean;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.Clear;
  FDConnection1.DriverName := 'MySQL';
  FDConnection1.Params.Add('CharacterSet=utf8mb4');
  FDConnection1.Params.Add('Server=localhost');
  FDConnection1.Params.Add('Database=conbetra');
  FDConnection1.Params.Add('User_Name=conbetra_root');
  FDConnection1.Params.Add('Password=1234');
end;

procedure TForm2.checkIdBtnClick(Sender: TObject);
begin
  if edtID.Text = '' then
  begin
    edtID.SetFocus;
    ShowMessage('아이디를 한 글자 이상 작성 후 중복검사를 실행하세요.');
    t_cnt := false;
    Exit;
  end;

  if edtID.Text = ' ' then
  begin
    edtID.SetFocus;
    ShowMessage('이름이 공백일 순  없습니다.');
    t_cnt := false;
    Exit;
  end;
  
  FDQuery2.SQL.Text := 'SELECT TRIM(loginId) FROM auth WHERE loginId = :loginId';
  FDQuery2.ParamByName('loginId').AsString := edtID.Text;
  FDQuery2.Open;

  if not FDQuery2.IsEmpty then
  begin
    ShowMessage('중복되는 아이디 입니다.');
    edtID.SetFocus;
    Inc(cnt);
    t_cnt := false;
    Exit;
  end
  else 
  begin 
    ShowMessage('사용 가능한 아이디입니다.');
    edtID.SetFocus;
    Inc(cnt);
    t_cnt := true;
    Exit;
  end;
end;


procedure TForm2.signBtnClick(Sender: TObject);
begin
  if edtID.Text = '' then
  begin
    edtID.SetFocus;
    ShowMessage('아이디를 적어 주세요');
    Self.ModalResult := mrNone;
    Exit;
  end;
  
  if edtName.Text = '' then
  begin
    edtName.SetFocus;
    ShowMessage('이름을 적어 주세요');
    Self.ModalResult := mrNone;
    Exit;
  end;

  if edtPW.Text = '' then
  begin
    edtPW.SetFocus;
    ShowMessage('비밀번호를 적어 주세요');
    Self.ModalResult := mrNone;
    Exit;
  end;

  if cnt < 1 then
  begin
    ShowMessage('중복검사를 먼저 하십시오');
    Self.ModalResult := mrNone;
    Exit;
  end;

  if t_cnt = false then
  begin
    ShowMessage('이 이름은 이미 존재하는 이름입니다.');
    Self.ModalResult := mrNone;
    Exit;
  end;
  
  FDQuery1.SQL.Text := 'INSERT INTO auth(loginId, display_name, pw) VALUES(:loginId, :display_name, :pw)';
  FDQuery1.ParamByName('loginId').AsWideString := edtID.Text;
  FDQuery1.ParamByName('display_name').AsWideString := edtName.Text;
  FDQuery1.ParamByName('pw').AsWideString := edtPW.Text;
  FDQuery1.ExecSQL;
end;

end.

unit mainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, loginForm, signForm, watchForm, postForm, editForm;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    loginBtn: TButton;
    signBtn: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    watchBtn: TButton;
    Label2: TLabel;
    Label3: TLabel;
    postBtn: TButton;
    adminBtn: TButton;
    Label4: TLabel;
    logoutBtn: TButton;
    FDQuery2: TFDQuery;
    Timer1: TTimer;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure loginBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure logoutBtnClick(Sender: TObject);
    procedure signBtnClick(Sender: TObject);
    procedure watchBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure postBtnClick(Sender: TObject);
    procedure adminBtnClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    getPostid: integer;
    getEmpid: integer;

  end;

var
  Form3: TForm3;
  loginForm: TForm1;
  signForm: TForm2;
  watchForm: TForm4;
  postForm: TForm5;
  adminForm: TForm7;
  modified: boolean;

implementation

{$R *.dfm}
procedure TForm3.FormCreate(Sender: TObject);
begin
    FDConnection1.Params.Clear;
    FDConnection1.DriverName := 'MySQL';
    FDConnection1.Params.Add('CharacterSet=utf8mb4');
    FDConnection1.Params.Add('Server=localhost');
    FDConnection1.Params.Add('Database=conbetra');
    FDConnection1.Params.Add('User_Name=conbetra_root');
    FDConnection1.Params.Add('Password=1234');

    FDQuery1.Open;

    adminBtn.Hide;
    logoutBtn.Hide;
    label3.Hide;

    FDQuery2.SQL.Text := 'SELECT * FROM posting WHERE postId = :id';
    FDQuery2.ParamByName('id').AsString := FDQuery1.FieldByName('postId').AsString;
    FDQuery2.Open;

    if not FDQuery2.IsEmpty then
    begin
      getPostid := FDQuery1.FieldByName('postId').AsInteger;
  end;
end;

procedure TForm3.adminBtnClick(Sender: TObject);
begin
  getPostid := FDQuery1.FieldByName('postId').AsInteger;
  adminForm := TForm7.Create(Application);
  if adminForm.ShowModal = mrOK then
  begin
    ShowMessage('게시물 수정이 완료되었습니다.');
  end;
end;

procedure TForm3.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  label2.Caption := '데이터소스 테스트 동작';
  if DBGrid1.SelectedRows.Count = 0 then
  label3.Caption := 'Count = ' + FDQuery1.FieldByName('postId').AsString;
end;


procedure TForm3.loginBtnClick(Sender: TObject);
begin
  loginForm := TForm1.Create(Application);
    if loginForm.ShowModal = mrOK then
    begin
      label1.Caption := '로그인 성공';
      Self.Refresh;
      loginBtn.Hide;
      signBtn.Hide;
      logoutBtn.Show;
      label4.Show;
      label4.Caption := '이름: ' + loginForm.getName;
      getEmpid := loginForm.checkAuth;
      if loginForm.getName.Equals('admin') then
      begin
        adminBtn.Show;
        label3.Show;
      end;
    end;

end;

procedure TForm3.logoutBtnClick(Sender: TObject);
begin
  Hide;
  getEmpid := 0;
  ShowMessage('로그아웃 되었습니다.');
  Show;
  label1.Caption := '로그아웃 상태';
  loginBtn.Show;
  signBtn.Show;
  logoutBtn.Hide;
  adminBtn.Hide;
  label4.Hide;
  label3.Hide;
  Self.Refresh;
end;

procedure TForm3.postBtnClick(Sender: TObject);
begin
  if label1.Caption = '로그아웃 상태' then
  begin
    ShowMessage('게시물 작성은 로그인 이 후에 이용할 수 있습니다.');
    loginBtn.SetFocus;
    Exit;
  end;

  if getEmpid = 0 then
  begin
    ShowMessage('게시물 작성은 로그인 이 후에 이용할 수 있습니다.');
    Exit;
  end;

  postForm := TForm5.Create(Application);
  if postForm.ShowModal = mrOK then
  begin
    ShowMessage('게시물등록 완료');
  end;
end;



procedure TForm3.signBtnClick(Sender: TObject);
begin
  signForm := TForm2.Create(Application);
    if signForm.ShowModal = mrOK then
    begin
      ShowMessage('회원가입 완료');
      Self.Refresh;
    end;
end;



procedure TForm3.Timer1Timer(Sender: TObject);
begin
  Timer1.Interval := 5000;
  Timer1.Enabled := True;
  DBGrid1.DataSource.DataSet.Refresh;
end;

procedure TForm3.watchBtnClick(Sender: TObject);
begin
  getPostid := FDQuery1.FieldByName('postId').AsInteger; // 여기에 한 이유는 FormCreate에서 하면 한 번만 실행되어 값이 1로 고정되기에 이 곳에 할당
  if getPostid <= 0 then
  begin
    ShowMessage('존재하는 게시물이 없습니다.');
    Exit;
  end;
  watchForm := TForm4.Create(Application);
  if watchForm.ShowModal = mrOK then
  begin

  end;
end;

end.

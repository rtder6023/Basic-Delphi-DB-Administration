unit postForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm5 = class(TForm)
    headerPanel: TPanel;
    nameEdt: TEdit;
    sectionPanel: TPanel;
    postMemo: TMemo;
    postBtn: TButton;
    footerPanel: TPanel;
    Button2: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure postBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
implementation
uses
  mainForm;
{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
  postMemo.Text := '';
  FDConnection1.Params.Clear;
  FDConnection1.DriverName := 'MySQL';
  FDConnection1.Params.Add('CharacterSet=utf8mb4');
  FDConnection1.Params.Add('Server=localhost');
  FDConnection1.Params.Add('User_Name=conbetra_root');
  FDConnection1.Params.Add('Database=conbetra');
  FDConnection1.Params.Add('Password=1234');


end;


procedure TForm5.postBtnClick(Sender: TObject);
var
  id : integer;
begin
  id := Form3.getEmpid;
  if nameEdt.Text = '' then
  begin
    ShowMessage('제목');
    nameEdt.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  FDQuery1.SQL.Text := 'INSERT INTO posting(postName, postBio, uploader) VALUES (:title, :post, :name)';
  FDQuery1.ParamByName('title').AsWideString := nameEdt.Text;    // varchar, text는 ftWideString를 사용, 그렇지 않으면 한글깨짐
  FDQuery1.ParamByName('post').AsWideString := postMemo.Text;    // memo는 ftWideMemo를 사용, 이유는 위와 같음
  FDQuery1.ParamByName('name').AsInteger := id;
  FDQuery1.ExecSQL;

end;

end.



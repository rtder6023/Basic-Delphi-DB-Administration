unit editForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm7 = class(TForm)
    headerPanel: TPanel;
    sectionPanel: TPanel;
    footerPanel: TPanel;
    modMemo: TMemo;
    modEdt: TEdit;
    modBtn: TButton;
    Button2: TButton;
    deleBtn: TButton;
    userPanel: TPanel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure modBtnClick(Sender: TObject);
    procedure deleBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses
  mainForm;

{$R *.dfm}

procedure TForm7.deleBtnClick(Sender: TObject);
var
  id: integer;
begin
  id := Form3.getPostid;
  FDQuery2.SQL.Text := 'DELETE FROM  posting  WHERE postId = :id';
  FDQuery2.ParamByName('id').AsInteger := id;
  FDQuery2.ExecSQL;
end;

procedure TForm7.FormCreate(Sender: TObject);
var
  id : integer;
begin
  id := Form3.getPostid;
  FDConnection1.DriverName := 'MySQL';
  FDConnection1.Params.Add('Server=localhost');
  FDConnection1.Params.Add('Database=conbetra');
  FDConnection1.Params.Add('User_Name=conbetra_root');
  FDConnection1.Params.Add('Password=1234');
  FDConnection1.Params.Add('CharacterSet=utf8mb4');

  FDQuery1.SQL.Text := 'SELECT * FROM   posting   p JOIN   auth a ON a.empid = p.uploader WHERE p.postId = :id';
  FDQuery1.ParamByName('id').AsInteger := id;

  FDQuery1.Open;
  modEdt.Text := FDQuery1.FieldByName('postName').AsString;
  userPanel.Caption := FDQuery1.FieldByName('display_name').AsString;
  modMemo.Text := FDQuery1.FieldByName('postBio').AsString;
end;

procedure TForm7.modBtnClick(Sender: TObject);
var
  id : integer;
begin
  id := Form3.getPostid;
  if modEdt.Text = '' then
  begin
    ShowMessage('Á¦¸ñ');
    modEdt.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  FDQuery1.SQL.Text := 'UPDATE posting p JOIN auth a ON a.empid = p.uploader SET postName = :name, postBio = :bio WHERE p.postid = :id';
  FDQuery1.ParamByName('name').AsWideString := modEdt.Text;
  FDQuery1.ParamByName('bio').AsWideString := modMemo.Text;
  FDQuery1.ParamByName('id').AsInteger := id;
  FDQuery1.ExecSQL;

end;

end.

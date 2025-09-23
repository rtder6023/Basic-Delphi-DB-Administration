unit watchForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm4 = class(TForm)
    headerPanel: TPanel;
    contentPanel: TPanel;
    namePanel: TPanel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
  uses mainForm;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
var
  id: integer;
begin
id := Form3.getPostid;
label1.Hide;
label2.Hide;

//var
//  id: string;
//  mainForm: TForm3; 위 방법이 되는 이유는 mainForm은 빈 깡통을 만든 것이고 윗 것은 정상적으로 받아옴
//begin
//  id:=mainForm.getID;
  FDConnection1.Params.Clear;
  FDConnection1.DriverName := 'MySQL';
  FDConnection1.Params.Add('CharacterSet=utf8mb4');
  FDConnection1.Params.Add('Server=localhost');
  FDConnection1.Params.Add('Database=conbetra');
  FDConnection1.Params.Add('User_Name=conbetra_root');
  FDConnection1.Params.Add('Password=1234');

  Memo1.ReadOnly := true;

  FDQuery1.SQL.Text := 'SELECT * FROM   posting p JOIN   auth a ON a.empid = p.uploader WHERE p.postId = :id;';
  FDQuery1.ParamByName('id').AsInteger := id;

  FDQuery1.Open;
  headerPanel.Caption := FDQuery1.FieldByName('postName').AsString;
  namePanel.Caption := FDQuery1.FieldByName('display_name').AsString;
  Memo1.Text := FDQuery1.FieldByName('postBio').AsString;
end;
procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('');
  ModalResult := mrOK;
end;


end.

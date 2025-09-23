object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
    object sendBtn: TButton
      Left = 232
      Top = 192
      Width = 75
      Height = 25
      Caption = #47196#44536#51064
      TabOrder = 0
      OnClick = sendBtnClick
    end
    object rtnBtn: TButton
      Left = 232
      Top = 223
      Width = 75
      Height = 25
      Caption = #46028#50500#44032#44592
      ModalResult = 2
      TabOrder = 1
    end
    object edtID: TEdit
      Left = 80
      Top = 176
      Width = 121
      Height = 23
      TabOrder = 2
      TextHint = #50500#51060#46356#47484' '#51077#47141
    end
    object edtPW: TEdit
      Left = 80
      Top = 224
      Width = 121
      Height = 23
      PasswordChar = '*'
      TabOrder = 3
      TextHint = #48708#48128#48264#54840#47484' '#51077#47141
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=conbetra'
      'User_Name=conbetra_root'
      'Password=1234'
      'Server=localhost'
      'CharacterSet=utf8mb4'
      'DriverID=MySQL')
    Left = 488
    Top = 320
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 496
    Top = 384
  end
end

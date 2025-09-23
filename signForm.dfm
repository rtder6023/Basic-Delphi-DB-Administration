object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
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
    object signBtn: TButton
      Left = 296
      Top = 136
      Width = 75
      Height = 25
      Caption = #54924#50896#44032#51077
      ModalResult = 1
      TabOrder = 0
      OnClick = signBtnClick
    end
    object returnBtn: TButton
      Left = 296
      Top = 182
      Width = 75
      Height = 25
      Caption = #46028#50500#44032#44592
      ModalResult = 2
      TabOrder = 1
    end
    object edtID: TEdit
      Left = 144
      Top = 112
      Width = 121
      Height = 23
      TabOrder = 2
      TextHint = #50500#51060#46356
    end
    object edtName: TEdit
      Left = 145
      Top = 158
      Width = 121
      Height = 23
      TabOrder = 3
      TextHint = #51060#47492
    end
    object edtPW: TEdit
      Left = 145
      Top = 203
      Width = 121
      Height = 23
      TabOrder = 4
      TextHint = #48708#48128#48264#54840
    end
    object checkIdBtn: TButton
      Left = 296
      Top = 105
      Width = 75
      Height = 25
      Caption = #51473#48373#44160#49324
      TabOrder = 5
      OnClick = checkIdBtnClick
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
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 488
    Top = 264
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 304
    Top = 224
  end
end

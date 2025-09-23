object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Form5'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object headerPanel: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 81
    TabOrder = 0
    object nameEdt: TEdit
      Left = 208
      Top = 16
      Width = 185
      Height = 23
      TabOrder = 0
      TextHint = #44172#49884#47932#51032' '#51060#47492
    end
  end
  object sectionPanel: TPanel
    Left = 0
    Top = 87
    Width = 625
    Height = 290
    Caption = 'sectionPanel'
    TabOrder = 1
    object postMemo: TMemo
      Left = 8
      Top = 8
      Width = 609
      Height = 273
      Hint = #44172#49884#47932#51032' '#45236#50857
      Lines.Strings = (
        'postMemo')
      TabOrder = 0
    end
  end
  object footerPanel: TPanel
    Left = 0
    Top = 383
    Width = 625
    Height = 58
    TabOrder = 2
    object postBtn: TButton
      Left = 216
      Top = 9
      Width = 97
      Height = 40
      Caption = #44172#49884#47932' '#50732#47532#44592
      ModalResult = 1
      TabOrder = 0
      OnClick = postBtnClick
    end
    object Button2: TButton
      Left = 319
      Top = 8
      Width = 97
      Height = 40
      Caption = #52712#49548
      ModalResult = 2
      TabOrder = 1
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=conbetra'
      'User_Name=conbetra_root'
      'Password=1234'
      'Server=localhost'
      'CharacterSet=utf8mb4'
      'DriverID=mySQL')
    Left = 512
    Top = 400
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 584
    Top = 400
  end
end

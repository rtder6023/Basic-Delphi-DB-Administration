object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object headerPanel: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 81
    TabOrder = 0
    object modEdt: TEdit
      Left = 208
      Top = 16
      Width = 185
      Height = 23
      TabOrder = 0
      TextHint = #44172#49884#47932#51032' '#51060#47492
    end
    object deleBtn: TButton
      Left = 408
      Top = 22
      Width = 97
      Height = 40
      Caption = #44172#49884#47932' '#49325#51228
      ModalResult = 1
      TabOrder = 1
      OnClick = deleBtnClick
    end
  end
  object sectionPanel: TPanel
    Left = 0
    Top = 87
    Width = 625
    Height = 290
    Caption = 'sectionPanel'
    TabOrder = 1
    object modMemo: TMemo
      Left = 8
      Top = 8
      Width = 609
      Height = 273
      Lines.Strings = (
        'modMemo')
      TabOrder = 0
    end
  end
  object footerPanel: TPanel
    Left = 0
    Top = 383
    Width = 625
    Height = 58
    TabOrder = 2
    object modBtn: TButton
      Left = 216
      Top = 8
      Width = 97
      Height = 40
      Caption = #44172#49884#47932' '#49688#51221
      ModalResult = 1
      TabOrder = 0
      OnClick = modBtnClick
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
  object userPanel: TPanel
    Left = 17
    Top = 20
    Width = 185
    Height = 41
    TabOrder = 3
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=conbetra'
      'User_Name=conbetra_root'
      'Password=1234'
      'Server=localhost'
      'CharacterSet=utf8mb4'
      'DriverID=MySQL')
    Left = 448
    Top = 392
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 520
    Top = 392
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 576
    Top = 392
  end
end

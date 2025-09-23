object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
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
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object contentPanel: TPanel
    Left = 0
    Top = 41
    Width = 624
    Height = 400
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 19
      Width = 274
      Height = 15
      Caption = '<'#48376' '#44172#49884#47932#51008' '#44288#47532#51088#50640' '#51032#54644' '#49688#51221#46108' '#44172#49884#47932#51077#45768#45796'.>'
    end
    object Label2: TLabel
      Left = 32
      Top = 19
      Width = 52
      Height = 15
      Caption = '<'#49688#51221#46120'>'
    end
    object namePanel: TPanel
      Left = 432
      Top = 6
      Width = 185
      Height = 41
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 8
      Top = 53
      Width = 609
      Height = 340
      Lines.Strings = (
        'Memo1')
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
      'DriverID=mySQL'
      'Datatype=ftWideString')
    Left = 304
    Top = 224
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 304
    Top = 288
  end
end

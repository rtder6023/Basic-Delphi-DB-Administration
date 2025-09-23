object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Form3'
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
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 75
      Height = 15
      Caption = #47196#44536#50500#50883' '#49345#53468
    end
    object Label2: TLabel
      Left = 128
      Top = 40
      Width = 34
      Height = 15
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 296
      Top = 40
      Width = 34
      Height = 15
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 32
      Top = 72
      Width = 3
      Height = 15
    end
    object loginBtn: TButton
      Left = 392
      Top = 16
      Width = 75
      Height = 25
      Caption = #47196#44536#51064
      TabOrder = 0
      OnClick = loginBtnClick
    end
    object signBtn: TButton
      Left = 504
      Top = 16
      Width = 75
      Height = 25
      Caption = #54924#50896#44032#51077
      TabOrder = 1
      OnClick = signBtnClick
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 127
      Width = 640
      Height = 329
      Ctl3D = True
      DataSource = DataSource1
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'postId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'empId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = #44172#49884#47932#51060#47492
          Visible = True
        end
        item
          Expanded = False
          FieldName = #51089#49457#51088
          Visible = True
        end>
    end
    object watchBtn: TButton
      Left = 464
      Top = 127
      Width = 75
      Height = 25
      Caption = #44172#49884#47932' '#54869#51064
      TabOrder = 3
      OnClick = watchBtnClick
    end
    object postBtn: TButton
      Left = 464
      Top = 158
      Width = 75
      Height = 25
      Caption = #44172#49884#47932' '#51089#49457
      TabOrder = 4
      OnClick = postBtnClick
    end
    object adminBtn: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = #44172#49884#47932' '#44288#47532
      TabOrder = 5
      OnClick = adminBtnClick
    end
    object logoutBtn: TButton
      Left = 392
      Top = 16
      Width = 75
      Height = 25
      Caption = #47196#44536#50500#50883
      TabOrder = 6
      OnClick = logoutBtnClick
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=conbetra'
      'User_Name=conbetra_root'
      'Password=1234'
      'CharacterSet=utf8mb4'
      'DriverID=mySQL')
    Connected = True
    Left = 528
    Top = 176
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT p.postId, p.postBio, a.empId, p.postName AS '#44172#49884#47932#51060#47492', a.disp' +
        'lay_name AS '#51089#49457#51088' FROM   posting p '#10'JOIN   auth a ON a.empid = p.u' +
        'ploader ORDER BY p.postId;')
    Left = 528
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 528
    Top = 48
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 528
    Top = 280
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 384
    Top = 64
  end
end

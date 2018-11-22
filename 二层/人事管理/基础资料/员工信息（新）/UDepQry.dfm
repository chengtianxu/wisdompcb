object FrmDepQry: TFrmDepQry
  Left = 614
  Top = 134
  Width = 394
  Height = 480
  Caption = #37096#38376#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 401
    Align = alClient
    TabOrder = 0
    object tv1: TTreeView
      Left = 1
      Top = 1
      Width = 376
      Height = 399
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnClick = tv1Click
      OnDblClick = tv1DblClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 401
    Width = 378
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnCancel: TButton
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object qryDep: TADOQuery
    Connection = FDM.con1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, departmentname, departmentcode, superior, charg' +
        'ename, departmentration,'
      ' departmentcount, scarcity,NeedBox'
      'FROM   dbo.datadepartment'
      ' where isnull(invalid,0)=0 order by departmentcode')
    Left = 128
    Top = 208
  end
end

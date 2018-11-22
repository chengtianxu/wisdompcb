object Frm_UserSelect: TFrm_UserSelect
  Left = 233
  Top = 188
  BorderStyle = bsDialog
  Caption = #25805#20316#21592#36873#25321
  ClientHeight = 402
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 70
    Height = 14
    Caption = #25805#20316#21592#20195#30721
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 40
    Width = 401
    Height = 362
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -14
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'isSel'
        Footers = <>
        Title.Caption = #36873#25321
        Width = 33
      end
      item
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        Title.Caption = #25805#20316#21592#20195#30721
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Caption = #25805#20316#21592#21517#31216
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Caption = #37096#38376#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Caption = #37096#38376#21517#31216
        Width = 78
      end>
  end
  object BitBtn1: TBitBtn
    Left = 424
    Top = 184
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 424
    Top = 272
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
  object Edit1: TEdit
    Left = 88
    Top = 8
    Width = 121
    Height = 22
    TabOrder = 3
    OnChange = Edit1Change
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 352
    Top = 72
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    OnFilterRecord = ClientDataSet1FilterRecord
    Left = 392
    Top = 72
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = DM.tmp
    Left = 432
    Top = 72
  end
end

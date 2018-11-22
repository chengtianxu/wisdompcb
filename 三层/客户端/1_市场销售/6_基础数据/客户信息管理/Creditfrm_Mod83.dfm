object frmCredit_Mod83: TfrmCredit_Mod83
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#20449#29992#35760#24405#26597#35810
  ClientHeight = 425
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Grd310: TDBGrid
    Left = 0
    Top = 0
    Width = 727
    Height = 389
    Align = alTop
    DataSource = ds310
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Record_number'
        Title.Caption = #35760#24405#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPR_BY'
        Title.Caption = #35760#24405#20154#21592
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_date'
        Title.Caption = #35760#24405#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Record'
        Title.Caption = #20449#29992#35760#24405
        Width = 432
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 247
    Top = 395
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 391
    Top = 395
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object cds310: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = cds310AfterInsert
    Left = 384
    Top = 208
  end
  object ds310: TDataSource
    DataSet = cds310
    Left = 264
    Top = 208
  end
end

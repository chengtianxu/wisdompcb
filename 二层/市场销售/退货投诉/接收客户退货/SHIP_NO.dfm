object Form3: TForm3
  Left = 324
  Top = 162
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#21495#30721#25628#32034
  ClientHeight = 393
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 582
    Height = 354
    Align = alTop
    DataSource = dm.DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'shipment_no'
        Title.Caption = #25351#27966#25209#27425
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #25351#27966#21592#24037
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_shipped'
        Title.Caption = #35013#36816#26085#26399
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_shipped'
        Title.Caption = #24050#35013#36816#30340#25968#37327
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_credited'
        Title.Caption = #24050#36864#36135#25968#37327
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_aval'
        Title.Caption = #21487#29992#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_2'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 202
    Top = 361
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 282
    Top = 361
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end

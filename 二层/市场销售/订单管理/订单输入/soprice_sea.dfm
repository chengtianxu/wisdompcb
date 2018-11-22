object Form4: TForm4
  Left = 322
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37319#36141#23450#21333#20215#26684#25628#32034
  ClientHeight = 453
  ClientWidth = 611
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
  object Button1: TButton
    Left = 264
    Top = 417
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 611
    Height = 409
    Align = alTop
    DataSource = dm.DataSource4
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'sales_order'
        Title.Caption = #38144#21806#35746#21333
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ent_date'
        Title.Caption = #36755#20837#26085#26399
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'po_number'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parts_ordered'
        Title.Caption = #35746#36141#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_price'
        Title.Caption = #20215#26684
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sotp'
        Title.Caption = #21152#24037#24418#24335
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #20379#24212#21830#20195#30721
        Width = 75
        Visible = True
      end>
  end
end

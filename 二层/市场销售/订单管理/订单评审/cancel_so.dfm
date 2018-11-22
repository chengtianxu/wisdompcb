object Form3: TForm3
  Left = 273
  Top = 162
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24050#35780#23457#35746#21333#26597#35810
  ClientHeight = 500
  ClientWidth = 763
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
  object Label1: TLabel
    Left = 68
    Top = 15
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#35746#21333#21495':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 761
    Height = 416
    DataSource = DM.DataSource5
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
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
        FieldName = 'SALES_ORDER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parts_mianji'
        Title.Caption = #38754#31215#13217'('#19981#21547#26495#36793')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_SCHED_SHIP_DATE'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sch_date'
        Width = 110
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 146
    Top = 11
    Width = 102
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 253
    Top = 8
    Width = 28
    Height = 26
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object Button2: TButton
    Left = 279
    Top = 469
    Width = 67
    Height = 24
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 3
  end
  object RadioGroup1: TRadioGroup
    Left = 299
    Top = 2
    Width = 158
    Height = 36
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #38144#21806#35746#21333
      #26412#21378#32534#21495)
    TabOrder = 4
    OnClick = RadioGroup1Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 104
    Top = 112
    object N1: TMenuItem
      Caption = #21462#28040#35780#23457
      OnClick = DBGrid1DblClick
    end
  end
end

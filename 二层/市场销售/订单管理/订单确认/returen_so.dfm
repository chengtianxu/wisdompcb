object Form10: TForm10
  Left = 277
  Top = 141
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#35746#21333#24212#26399#36864#22238
  ClientHeight = 517
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 11
  object Label1: TLabel
    Left = 52
    Top = 19
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#35746#21333':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 46
    Width = 861
    Height = 436
    DataSource = DM.DataSource3
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
        FieldName = 'sales_order'
        Title.Caption = #38144#21806#35746#21333
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sch_date'
        Title.Caption = #22238#22797#20132#26399
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_code'
        Title.Caption = #23458#25143
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'po_number'
        Title.Caption = #37319#36141#35746#21333
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_part_number'
        Title.Caption = #26412#21378#32534#21495
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_PaRT_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_SCHED_SHIP_DATE'
        Title.Caption = #35745#21010#20132#26399
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sch_DATE'
        Title.Caption = #22238#22797#20132#26399
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Title.Caption = #25968#37327
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 321
    Top = 484
    Width = 64
    Height = 26
    Caption = #36864#22238
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 420
    Top = 484
    Width = 63
    Height = 26
    Cancel = True
    Caption = #21462#28040
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 113
    Top = 15
    Width = 138
    Height = 19
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 258
    Top = 11
    Width = 25
    Height = 26
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
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
  object RadioGroup1: TRadioGroup
    Left = 306
    Top = 2
    Width = 159
    Height = 36
    Caption = #26597#25214#23383#27573
    Columns = 2
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #38144#21806#35746#21333
      #23458#25143#22411#21495)
    ParentFont = False
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 24
    Top = 16
    object N1: TMenuItem
      Caption = #26597#30475#32454#33410
      OnClick = N1Click
    end
  end
end

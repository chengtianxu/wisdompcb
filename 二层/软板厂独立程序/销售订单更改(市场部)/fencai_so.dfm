object Form6: TForm6
  Left = 225
  Top = 243
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25286#20998#38144#21806#35746#21333
  ClientHeight = 369
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 18
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35746#21333#32534#21495':'
  end
  object Label22: TLabel
    Left = 72
    Top = 176
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20132#26399':'
  end
  object Label23: TLabel
    Left = 276
    Top = 176
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35745#21010#20132#26399':'
  end
  object Label5: TLabel
    Left = 276
    Top = 18
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#31616#31216':'
  end
  object Label6: TLabel
    Left = 72
    Top = 45
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20135#21697#32534#21495':'
  end
  object Label8: TLabel
    Left = 72
    Top = 71
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37096#20214#25551#36848':'
  end
  object Label9: TLabel
    Left = 85
    Top = 97
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#21516#21495':'
  end
  object Label15: TLabel
    Left = 24
    Top = 150
    Width = 107
    Height = 13
    Alignment = taRightJustify
    Caption = #21407#35746#21333#25968#37327'(PCS):'
  end
  object Label2: TLabel
    Left = 254
    Top = 151
    Width = 81
    Height = 13
    Alignment = taRightJustify
    Caption = #24050#35013#36816'(PCS):'
  end
  object Label3: TLabel
    Left = 24
    Top = 124
    Width = 107
    Height = 13
    Alignment = taRightJustify
    Caption = #21407#35746#21333#25968#37327'(SET):'
  end
  object Label4: TLabel
    Left = 263
    Top = 124
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#36135#26495#26041#24335':'
  end
  object Label10: TLabel
    Left = 336
    Top = 124
    Width = 28
    Height = 13
    Caption = '    '
  end
  object Label11: TLabel
    Left = 263
    Top = 97
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #20851#32852#25991#20214#21495':'
  end
  object Label12: TLabel
    Left = 276
    Top = 70
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35746#21333#29366#24577':'
  end
  object DBEdit1: TDBEdit
    Left = 132
    Top = 15
    Width = 102
    Height = 21
    Color = cl3DLight
    DataField = 'SALES_ORDER'
    DataSource = DM.DataSource3
    TabOrder = 0
  end
  object DBEdit20: TDBEdit
    Left = 132
    Top = 172
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'ORIG_REQUEST_DATE'
    DataSource = DM.DataSource3
    TabOrder = 1
  end
  object DBEdit21: TDBEdit
    Left = 336
    Top = 172
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'ORIG_SCHED_SHIP_DATE'
    DataSource = DM.DataSource3
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 336
    Top = 15
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'ABBR_NAME'
    DataSource = DM.DataSource3
    TabOrder = 3
  end
  object DBEdit6: TDBEdit
    Left = 132
    Top = 41
    Width = 102
    Height = 21
    Color = cl3DLight
    DataField = 'MANU_PART_NUMBER'
    DataSource = DM.DataSource3
    TabOrder = 4
  end
  object DBEdit8: TDBEdit
    Left = 132
    Top = 67
    Width = 139
    Height = 21
    Color = cl3DLight
    DataField = 'MANU_PART_DESC'
    DataSource = DM.DataSource3
    TabOrder = 5
  end
  object DBEdit9: TDBEdit
    Left = 132
    Top = 93
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'PO_NUMBER'
    DataSource = DM.DataSource3
    TabOrder = 6
  end
  object DBEdit2: TDBEdit
    Left = 336
    Top = 146
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'PARTS_SHIPPED'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 7
  end
  object SGrid1: TStringGrid
    Left = 0
    Top = 201
    Width = 608
    Height = 168
    Align = alBottom
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 8
    OnDblClick = SGrid1DblClick
    ColWidths = (
      155
      102
      105
      108
      112)
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 1
    Width = 68
    Height = 29
    Caption = #20445#23384
    Enabled = False
    TabOrder = 9
    OnClick = BitBtn1Click
    Glyph.Data = {
      26050000424D26050000000000003604000028000000100000000F0000000100
      080000000000F0000000CE0E0000C40E00000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF00000000
      000000000000000000FFFF0003030000000000000707000300FFFF0003030000
      000000000707000300FFFF0003030000000000000707000300FFFF0003030000
      000000000000000300FFFF0003030303030303030303030300FFFF0003030000
      000000000000030300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
      FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
      FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000000FFFF000300FFFF
      FFFFFFFFFFFF000700FFFF0000000000000000000000000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF}
  end
  object BitBtn2: TBitBtn
    Left = 0
    Top = 32
    Width = 68
    Height = 29
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 10
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Edit1: TEdit
    Left = 132
    Top = 146
    Width = 95
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
  end
  object Edit2: TEdit
    Left = 132
    Top = 120
    Width = 95
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 12
  end
  object Edit3: TEdit
    Left = 336
    Top = 93
    Width = 95
    Height = 21
    MaxLength = 50
    TabOrder = 13
  end
  object DBEdit3: TDBEdit
    Left = 336
    Top = 67
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'STATUS'
    DataSource = DM.DataSource3
    TabOrder = 14
  end
  object DBGridEh1: TDBGridEh
    Left = 435
    Top = 15
    Width = 172
    Height = 178
    DataSource = DM.ds360
    FooterColor = clRed
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 1
    PopupMenu = PopupMenu2
    SumList.Active = True
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'sch_date'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
        Title.Caption = #23436#24037#26085#26399
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #23436#24037#25968#37327
        Width = 59
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 146
    Top = 276
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 528
    Top = 128
    object MenuItem1: TMenuItem
      Caption = #21024#38500
      OnClick = MenuItem1Click
    end
  end
end

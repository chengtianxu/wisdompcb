object frmAdd176: TfrmAdd176
  Left = 383
  Top = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #23384#20179#20301#32622#23450#20041
  ClientHeight = 353
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 353
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 429
      Height = 353
      Hint = #20445#23384
      Align = alClient
      DataSource = dm.ds176
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Color = clScrollBar
          Expanded = False
          FieldName = 'rkey'
          Visible = False
        end
        item
          Color = clScrollBar
          Expanded = False
          FieldName = 'rkey_16'
          Visible = False
        end
        item
          Color = clScrollBar
          Expanded = False
          FieldName = 'code'
          Title.Caption = #20179#24211#20195#30721
          Width = 56
          Visible = True
        end
        item
          Color = clScrollBar
          Expanded = False
          FieldName = 'MainLocation'
          Title.Caption = #20179#24211#21517#31216
          Width = 106
          Visible = True
        end
        item
          Color = clScrollBar
          Expanded = False
          FieldName = 'abbr_name'
          Title.Caption = #24037#21378#31616#31216
          Visible = True
        end
        item
          Color = clScrollBar
          Expanded = False
          FieldName = 'type'
          Title.Caption = #31867#22411
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'location'
          Title.Caption = #35814#32454#20301#32622
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 429
    Top = 0
    Width = 89
    Height = 353
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object btnAdd: TBitBtn
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 8
      Top = 80
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 8
      Top = 104
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnRefresh: TBitBtn
      Left = 8
      Top = 265
      Width = 75
      Height = 25
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnRefreshClick
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
    object btnExit: TBitBtn
      Left = 8
      Top = 296
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnExitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
end

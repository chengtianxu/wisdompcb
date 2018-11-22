object Form1: TForm1
  Left = 208
  Top = 149
  Width = 742
  Height = 549
  Caption = #37197#26009#21333#30830#35748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 278
    Width = 726
    Height = 5
    Cursor = crVSplit
    Align = alTop
    ResizeStyle = rsLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 237
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #37197#26009#21333#21495
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 5
      Width = 55
      Height = 29
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
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
    object BitBtn3: TBitBtn
      Left = 62
      Top = 5
      Width = 55
      Height = 29
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object Edit1: TEdit
      Left = 293
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 429
      Top = 0
      Width = 259
      Height = 38
      Caption = #26085#26399#33539#22260
      TabOrder = 3
      object Label8: TLabel
        Left = 6
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 134
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object DTPK1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnClick = DTPK1Click
        OnExit = DTPK1Click
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnClick = DTPK1Click
        OnExit = DTPK1Click
      end
    end
    object Button2: TButton
      Left = 118
      Top = 3
      Width = 67
      Height = 31
      Caption = #23548#20986#25968#25454
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 726
    Height = 240
    Align = alTop
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_NO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20135#21697#24615#36136
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISSUE_DATE'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISSUED_QTY'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25237#20135#24615#36136
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = #30830#35748#20154#21592
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'con_date'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pnl1_size'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PANEL_1_QTY'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPANEL1'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pnl2_size'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PANEL_2_QTY'
        ReadOnly = False
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPANEL2'
        ReadOnly = False
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Width = 64
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 283
    Width = 726
    Height = 228
    Align = alClient
    DataSource = DM.DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid2KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'DEPT_CODE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_BOM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ISSUED'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDOR'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26469#28304#24211#23384
        Width = 53
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 160
    Top = 64
    object N1: TMenuItem
      Caption = #30830#35748
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#30830#35748
      OnClick = N2Click
    end
  end
end

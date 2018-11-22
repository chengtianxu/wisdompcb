object Form1: TForm1
  Left = 249
  Top = 141
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#24207#22806#21457#23457#25209
  ClientHeight = 517
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
    Top = 297
    Width = 745
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 745
    Height = 257
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'epiboly_number'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'warehouse_abbname'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ent_data'
        Title.Caption = #30003#35831#26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 108
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label10: TLabel
      Left = 379
      Top = 16
      Width = 42
      Height = 13
      Caption = '      '
    end
    object BitBtn1: TBitBtn
      Left = 3
      Top = 4
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
    object Edit1: TEdit
      Left = 266
      Top = 10
      Width = 77
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object BitBtn2: TBitBtn
      Left = 347
      Top = 8
      Width = 25
      Height = 25
      Hint = #26597#25214#37096#38376
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 58
      Top = 4
      Width = 55
      Height = 29
      Caption = #21047#26032
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
    object ComboBox1: TComboBox
      Left = 189
      Top = 10
      Width = 75
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #20379#24212#21830
      Items.Strings = (
        #20379#24212#21830
        #22806#21457#24037#24207)
    end
    object rdgType: TRadioGroup
      Left = 437
      Top = 0
      Width = 179
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #21322#21046#31243
        #20840#21046#31243)
      TabOrder = 0
      OnClick = rdgTypeClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 303
    Width = 745
    Height = 214
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 745
      Height = 195
      Align = alClient
      DataSource = DM.DataSource3
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu3
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = MenuItem1Click
      Columns = <
        item
          Expanded = False
          FieldName = 'MANU_PART_NUMBER'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANU_PART_DESC'
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STANDARD'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTITY'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMOUNT'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LAYER'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DATE'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMARTK'
          Width = 142
          Visible = True
        end>
    end
    object Bar1: TStatusBar
      Left = 0
      Top = 195
      Width = 745
      Height = 19
      Panels = <>
      SimpleText = #25628#32034':'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 72
    Top = 256
    object N2: TMenuItem
      Caption = #25209#20934
      OnClick = N2Click
    end
    object N10: TMenuItem
      Caption = #21462#28040#23457#25209
      OnClick = N10Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N12: TMenuItem
      Caption = #36864#22238#30003#36141#32773
      OnClick = N12Click
    end
    object N9: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N9Click
    end
    object N13: TMenuItem
      Caption = #23548#20986#22806#21457#25968#25454
      OnClick = N13Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 73
    Top = 344
    object MenuItem1: TMenuItem
      Caption = #26816#26597
      OnClick = MenuItem1Click
    end
  end
end

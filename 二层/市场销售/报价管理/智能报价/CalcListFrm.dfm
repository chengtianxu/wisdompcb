object frmCalcList: TfrmCalcList
  Left = 387
  Top = 26
  Width = 585
  Height = 553
  Caption = #35745#31639#20844#24335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 514
    Align = alClient
    TabOrder = 0
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 567
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnExit: TBitBtn
        Left = 2
        Top = 1
        Width = 58
        Height = 33
        Cursor = crHandPoint
        Hint = #36864#20986
        Caption = #36864#20986
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
      object btnRefresh: TBitBtn
        Left = 60
        Top = 1
        Width = 57
        Height = 33
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
        TabOrder = 1
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
      object btnHelp: TBitBtn
        Left = 384
        Top = 8
        Width = 81
        Height = 25
        Caption = #20844#24335#35828#26126
        TabOrder = 2
        OnClick = btnHelpClick
        Kind = bkHelp
      end
    end
    object pnlAll: TPanel
      Left = 1
      Top = 38
      Width = 567
      Height = 475
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pnlRight: TPanel
        Left = 467
        Top = 0
        Width = 100
        Height = 475
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object btnAppend: TBitBtn
          Left = 11
          Top = 40
          Width = 75
          Height = 31
          Caption = #26032#22686
          TabOrder = 0
          OnClick = btnAppendClick
        end
        object btnEdit: TBitBtn
          Left = 11
          Top = 96
          Width = 75
          Height = 31
          Caption = #32534#36753
          TabOrder = 1
          OnClick = btnEditClick
        end
        object btnDelete: TBitBtn
          Left = 11
          Top = 152
          Width = 75
          Height = 31
          Caption = #21024#38500
          TabOrder = 2
          OnClick = btnDeleteClick
        end
      end
      object pgc1: TPageControl
        Left = 0
        Top = 0
        Width = 467
        Height = 475
        ActivePage = ts1
        Align = alClient
        TabOrder = 1
        object ts1: TTabSheet
          Caption = #21152#20215#39033
          object eh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 459
            Height = 447
            Align = alClient
            DataSource = ds164
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Code'
                Footers = <>
                Title.Caption = #21152#20215#21517#31216
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'AddType'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1'
                  '2'
                  '3')
                PickList.Strings = (
                  #21046#26495#36153#21333#20215#27604#20363#21152#25104
                  #21046#26495#36153#21333#20215#37329#39069#21152#25104
                  #21512#21516#24635#20540#27604#20363#21152#25104
                  #21512#21516#24635#20540#37329#39069#21152#25104)
                Title.Caption = #21152#20215#31867#22411
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'VisableStr'
                Footers = <>
                Title.Caption = #35302#21457#26465#20214
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ValueStr'
                Footers = <>
                Title.Caption = #21462#20540#20844#24335
                Width = 100
              end>
          end
        end
        object ts3: TTabSheet
          Caption = #22522#20215#39033
          ImageIndex = 2
          object eh3: TDBGridEh
            Left = 0
            Top = 0
            Width = 459
            Height = 447
            Align = alClient
            DataSource = ds316
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Spec_Key'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9')
                PickList.Strings = (
                  #21046#29256#36153
                  #24037#31243#36153
                  #27979#35797#36153
                  #37329#25163#25351#36153
                  #21152#24613#36153
                  #33778#26519#36153
                  #24037#31243#26631#20934#21152#25104#21333#20215
                  #21152#24613#22825#25968
                  #20132#36135#22825#25968
                  #25240#25187#37329#39069)
                Title.Caption = #22522#20215#31867#22411
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'ValueStr'
                Footers = <>
                Title.Caption = #21462#20540#20844#24335
                Width = 300
              end>
          end
        end
        object ts4: TTabSheet
          Caption = #20108#32500#34920#26684
          ImageIndex = 3
          object eh4: TDBGridEh
            Left = 0
            Top = 0
            Width = 459
            Height = 447
            Align = alClient
            DataSource = ds311
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'TName'
                Footers = <>
                Title.Caption = #34920#21517#31216
                Width = 120
              end
              item
                EditButtons = <>
                FieldName = 'TDesc'
                Footers = <>
                Title.Caption = #25551#36848
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'XCount'
                Footers = <>
                Title.Caption = #21015#25968
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'YCount'
                Footers = <>
                Title.Caption = #34892#25968
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'VType'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1')
                PickList.Strings = (
                  #31934#30830
                  #33539#22260)
                Title.Caption = #21462#20540#26041#24335
              end
              item
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
                Title.Caption = #23458#25143
                Width = 70
              end>
          end
        end
      end
    end
  end
  object ds164: TDataSource
    DataSet = ads164
    Left = 120
    Top = 145
  end
  object ads164: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    CommandText = 'select * from data0164'
    Parameters = <>
    Left = 72
    Top = 146
    object ads164RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads164AddType: TWordField
      FieldName = 'AddType'
    end
    object ads164Code: TStringField
      FieldName = 'Code'
      Size = 250
    end
    object ads164VisableStr: TStringField
      FieldName = 'VisableStr'
      Size = 500
    end
    object ads164ValueStr: TStringField
      FieldName = 'ValueStr'
      Size = 500
    end
    object wrdfldads164AddTypeTotal: TWordField
      FieldName = 'AddTypeTotal'
    end
    object wrdfldads164AddTypeEng: TWordField
      FieldName = 'AddTypeEng'
    end
    object strngfldads164TotalValueStr: TStringField
      FieldName = 'TotalValueStr'
      Size = 500
    end
    object strngfldads164EngValueStr: TStringField
      FieldName = 'EngValueStr'
      Size = 500
    end
  end
  object ads316: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    CommandText = 'select * from data0316'
    Parameters = <>
    Left = 221
    Top = 142
    object ads316Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ads316Spec_Key: TIntegerField
      FieldName = 'Spec_Key'
    end
    object ads316ValueStr: TStringField
      FieldName = 'ValueStr'
      Size = 5000
    end
  end
  object ds316: TDataSource
    DataSet = ads316
    Left = 269
    Top = 142
  end
  object ds311: TDataSource
    DataSet = ads311
    Left = 268
    Top = 205
  end
  object ads311: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT d311.*,d10.CUST_CODE FROM Data0311 d311'#13#10'LEFT JOIN Data00' +
      '10 d10 ON d311.Custom_ptr = d10.RKEY'#13#10'order by d311.tname asc'
    Parameters = <>
    Left = 220
    Top = 205
    object ads311TName: TStringField
      FieldName = 'TName'
      Size = 500
    end
    object ads311TDesc: TStringField
      FieldName = 'TDesc'
      Size = 500
    end
    object ads311XCount: TIntegerField
      FieldName = 'XCount'
    end
    object ads311YCount: TIntegerField
      FieldName = 'YCount'
    end
    object ads311VType: TIntegerField
      FieldName = 'VType'
    end
    object ads311Custom_ptr: TIntegerField
      FieldName = 'Custom_ptr'
    end
    object ads311CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
  end
end

object FrmMain: TFrmMain
  Left = 234
  Top = 287
  Width = 1085
  Height = 628
  Caption = #24037#24207#22312#32447#26102#38271#20998#27573#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1069
    Height = 590
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 1067
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl_field: TLabel
        Left = 358
        Top = 16
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#24207#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 672
        Top = 16
        Width = 86
        Height = 13
        Caption = #25968#37327#20026'pan'#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edt_value: TEdit
        Left = 414
        Top = 12
        Width = 151
        Height = 21
        TabOrder = 0
        OnChange = edt_valueChange
      end
      object btn_export: TBitBtn
        Left = 62
        Top = 5
        Width = 55
        Height = 29
        Hint = #23548#20986#25968#25454'Excel'
        Caption = #23548#20986
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btn_exportClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
          EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
          DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
          70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      end
      object btn_qry: TBitBtn
        Left = 126
        Top = 5
        Width = 55
        Height = 29
        Hint = #26356#25913#26597#35810#26465#20214
        Caption = #26597#35810
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btn_qryClick
        Glyph.Data = {
          C6050000424DC605000000000000360400002800000014000000140000000100
          08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
          0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
          F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
          8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
          C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
          A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
          8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
          F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
          8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
          6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
          1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
          C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
          5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
          3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
          4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
          C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
          7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
          F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
          B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
          D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
          F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
          0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
          0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
          78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
          450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
          D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
          00000000000044F8120000400000000000000000000028F81200000000000000
          00000000000000000000000C000000000200000000000101120000872B00F877
          0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
          000000000000804B1B00000500000000870031E6770084F8120000218600E677
          9800F81200006713000010FFFF00000020000100000038A8F800000000000000
          7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
          200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
          1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
          6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
          24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
          248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
          1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
          638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
          98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
          776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
          532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
          576C245353532C5353555314C557776F14002C246C5706535355575353315353
          551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
          9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
          861D8680775398535355}
      end
      object btn_exit: TBitBtn
        Left = 6
        Top = 5
        Width = 55
        Height = 29
        Cursor = crHandPoint
        Hint = #36864#20986
        Caption = #36864#20986
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TabStop = False
        OnClick = btn_exitClick
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
    object pnl3: TPanel
      Left = 1
      Top = 42
      Width = 1067
      Height = 547
      Align = alClient
      TabOrder = 1
      object dbgrdh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 1065
        Height = 545
        Align = alClient
        DataSource = ds1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clRed
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
        ParentFont = False
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = dbgrdh1KeyDown
        OnTitleClick = dbgrdh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = #24037#24207#20195#30721
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24037#24207#21517#31216
            Footers = <>
            Width = 94
          end
          item
            EditButtons = <>
            FieldName = #24635#25968#37327
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Footer.FieldName = #24635#25968#37327
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clRed
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = #24635#38754#31215
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Footer.FieldName = #24635#38754#31215
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clRed
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = '24'#23567#26102#20869'('#25968#37327')'
            Footer.FieldName = '24'#23567#26102#20869'('#25968#37327')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '24'#23567#26102#20869'('#38754#31215')'
            Footer.FieldName = '24'#23567#26102#20869'('#38754#31215')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '1--2'#22825'('#25968#37327')'
            Footer.FieldName = '1--2'#22825'('#25968#37327')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '1--2'#22825'('#38754#31215')'
            Footer.FieldName = '1--2'#22825'('#38754#31215')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '3--5'#22825'('#25968#37327')'
            Footer.FieldName = '3--5'#22825'('#25968#37327')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '3--5'#22825'('#38754#31215')'
            Footer.FieldName = '3--5'#22825'('#38754#31215')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '6--10'#22825'('#25968#37327')'
            Footer.FieldName = '6--10'#22825'('#25968#37327')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '6--10'#22825'('#38754#31215')'
            Footer.FieldName = '6--10'#22825'('#38754#31215')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '11--20'#22825'('#25968#37327')'
            Footer.FieldName = '11--20'#22825'('#25968#37327')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '11--20'#22825'('#38754#31215')'
            Footer.FieldName = '11--20'#22825'('#38754#31215')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '20--30'#22825'('#25968#37327')'
            Footer.FieldName = '20--30'#22825'('#25968#37327')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '20--30'#22825'('#38754#31215')'
            Footer.FieldName = '20--30'#22825'('#38754#31215')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '30'#22825#21450#20197#19978'('#25968#37327')'
            Footer.FieldName = '30'#22825#21450#20197#19978'('#25968#37327')'
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = '30'#22825#21450#20197#19978'('#38754#31215')'
            Footer.FieldName = '30'#22825#21450#20197#19978'('#38754#31215')'
            Footer.ValueType = fvtSum
            Footers = <>
          end>
      end
    end
  end
  object qry1: TADOQuery
    AutoCalcFields = False
    Connection = DM.con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'sp_ProcessTimeQry '#39#39)
    Left = 353
    Top = 146
    object strngfldqry1DSDesigner: TStringField
      FieldName = #24037#24207#20195#30721
      Size = 10
    end
    object strngfldqry1DSDesigner2: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
    end
    object intgrfldqry1DSDesigner3: TIntegerField
      FieldName = #24635#25968#37327
    end
    object fltfldqry1DSDesigner4: TFloatField
      FieldName = #24635#38754#31215
    end
    object intgrfldqry1DSDesigner24: TIntegerField
      FieldName = '24'#23567#26102#20869'('#25968#37327')'
      ReadOnly = True
    end
    object fltfldqry1DSDesigner242: TFloatField
      FieldName = '24'#23567#26102#20869'('#38754#31215')'
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner12: TIntegerField
      FieldName = '1--2'#22825'('#25968#37327')'
      ReadOnly = True
    end
    object fltfldqry1DSDesigner122: TFloatField
      FieldName = '1--2'#22825'('#38754#31215')'
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner35: TIntegerField
      FieldName = '3--5'#22825'('#25968#37327')'
      ReadOnly = True
    end
    object fltfldqry1DSDesigner352: TFloatField
      FieldName = '3--5'#22825'('#38754#31215')'
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner610: TIntegerField
      FieldName = '6--10'#22825'('#25968#37327')'
      ReadOnly = True
    end
    object fltfldqry1DSDesigner6102: TFloatField
      FieldName = '6--10'#22825'('#38754#31215')'
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner1120: TIntegerField
      FieldName = '11--20'#22825'('#25968#37327')'
      ReadOnly = True
    end
    object fltfldqry1DSDesigner11202: TFloatField
      FieldName = '11--20'#22825'('#38754#31215')'
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner2030: TIntegerField
      FieldName = '20--30'#22825'('#25968#37327')'
      ReadOnly = True
    end
    object fltfldqry1DSDesigner20302: TFloatField
      FieldName = '20--30'#22825'('#38754#31215')'
      ReadOnly = True
    end
    object intgrfldqry1DSDesigner30: TIntegerField
      FieldName = '30'#22825#21450#20197#19978'('#25968#37327')'
      ReadOnly = True
    end
    object fltfldqry1DSDesigner302: TFloatField
      FieldName = '30'#22825#21450#20197#19978'('#38754#31215')'
      ReadOnly = True
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 649
    Top = 146
  end
end

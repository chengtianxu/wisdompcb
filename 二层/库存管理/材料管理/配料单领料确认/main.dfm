object Form_main: TForm_main
  Left = 277
  Top = 240
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37197#26009#21333#39046#26009#30830#35748
  ClientHeight = 525
  ClientWidth = 855
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 525
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object Panel5: TPanel
      Left = 1
      Top = 29
      Width = 172
      Height = 508
      Align = alCustom
      Color = clGradientActiveCaption
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 290
        Width = 86
        Height = 19
        Caption = #21592#24037#24037#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 362
        Width = 86
        Height = 19
        Caption = #21592#24037#22995#21517':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 6
        Top = 223
        Width = 49
        Height = 19
        Caption = 'IC'#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label1: TLabel
        Left = 6
        Top = 56
        Width = 86
        Height = 19
        Caption = #37197#26009#21333#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 13
        Top = 414
        Width = 149
        Height = 162
        AutoSize = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label7: TLabel
        Left = 5
        Top = 4
        Width = 7
        Height = 13
        Color = clGradientActiveCaption
        Font.Charset = GB2312_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 6
        Top = 81
        Width = 160
        Height = 27
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 6
        Top = 249
        Width = 161
        Height = 27
        Color = clScrollBar
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnEnter = Edit2Enter
        OnExit = Edit2Exit
        OnKeyPress = Edit2KeyPress
      end
      object Edit3: TEdit
        Left = 6
        Top = 384
        Width = 161
        Height = 27
        Color = clScrollBar
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = Edit2Enter
        OnExit = Edit2Exit
        OnKeyPress = Edit2KeyPress
      end
      object Edit4: TEdit
        Left = 6
        Top = 317
        Width = 161
        Height = 27
        Color = clScrollBar
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnEnter = Edit2Enter
        OnExit = Edit2Exit
        OnKeyPress = Edit2KeyPress
      end
    end
    object Panel3: TPanel
      Left = 174
      Top = 39
      Width = 673
      Height = 200
      TabOrder = 1
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 671
        Height = 198
        TabStop = False
        Align = alClient
        DataSource = DM.DataSource1
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        OnMouseDown = DBGridEh1MouseDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CUT_NO'
            Footers = <>
            Title.Caption = #37197#26009#21333#21495
            Width = 168
          end
          item
            EditButtons = <>
            FieldName = 'ConfMan'
            Footers = <>
            Title.Caption = #39046#26009#21592#24037#24037#21495
            Width = 213
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            Title.Caption = #39046#26009#21592#24037#22995#21517
          end>
      end
    end
    object Panel4: TPanel
      Left = 173
      Top = 245
      Width = 675
      Height = 272
      TabOrder = 2
      object DBGridEh2: TDBGridEh
        Left = 1
        Top = 1
        Width = 673
        Height = 270
        TabStop = False
        Align = alClient
        DataSource = DM.DataSource2
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = DBGridEh2DblClick
        OnDrawColumnCell = DBGridEh2DrawColumnCell
        OnMouseDown = DBGridEh2MouseDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DEPT_NAME'
            Footers = <>
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'remark'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 163
          end>
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 853
      Height = 32
      Align = alTop
      TabOrder = 3
      object BitBtn2: TBitBtn
        Left = 7
        Top = 4
        Width = 59
        Height = 23
        Caption = #36864#20986
        TabOrder = 0
        OnClick = BitBtn2Click
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
      object BitBtn1: TBitBtn
        Left = 70
        Top = 4
        Width = 59
        Height = 23
        Hint = #21382#21490#35760#24405#26597#35810
        Caption = #26597#35810
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn1Click
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
    end
  end
end

object FrmWorkEmp: TFrmWorkEmp
  Left = 561
  Top = 246
  Width = 667
  Height = 368
  Caption = #37096#38376#39033#30446#20154#21592#26126#32454#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 337
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 295
      Width = 657
      Height = 41
      Align = alBottom
      TabOrder = 0
      object Label5: TLabel
        Left = 18
        Top = 12
        Width = 215
        Height = 13
        Caption = #35813#27719#24635#25968#25454#19981#21253#21547#21462#28040#30340#24037#26102#20316#19994#21333'.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 461
        Top = 12
        Width = 52
        Height = 13
        Caption = #24635#35745#24037#26102
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 528
        Top = 4
        Width = 97
        Height = 21
        Color = cl3DLight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 657
      Height = 41
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 228
        Top = 20
        Width = 26
        Height = 13
        Caption = #37096#38376
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 366
        Top = 20
        Width = 52
        Height = 13
        Caption = #24037#26102#26399#38388
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 511
        Top = 19
        Width = 13
        Height = 13
        Caption = #33267
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 2
        Top = 7
        Width = 80
        Height = 28
        Caption = #20851#38381
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          0400000000007800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
          FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
          0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
          4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
          F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
      end
      object BitBtn3: TBitBtn
        Left = 82
        Top = 7
        Width = 80
        Height = 28
        Caption = #23548#20986
        TabOrder = 1
        OnClick = BitBtn3Click
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
      object edt_1: TEdit
        Left = 259
        Top = 15
        Width = 110
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        OnChange = edt_1Change
      end
      object DateTimePicker1: TDateTimePicker
        Left = 422
        Top = 15
        Width = 89
        Height = 21
        Date = 41161.682054756950000000
        Time = 41161.682054756950000000
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
        OnChange = DateTimePicker1Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 526
        Top = 15
        Width = 89
        Height = 21
        Date = 41161.682054756950000000
        Time = 41161.682054756950000000
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
        OnChange = DateTimePicker1Change
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 42
      Width = 657
      Height = 253
      Align = alClient
      TabOrder = 2
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 655
        Height = 251
        Align = alClient
        DataSource = damo.ds3
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = #24037#21495
            Footers = <>
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = #22995#21517
            Footers = <>
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = #37096#38376
            Footers = <>
            Width = 153
          end
          item
            EditButtons = <>
            FieldName = #24037#26102#26085#26399
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24037#26102
            Footers = <>
            Width = 86
          end
          item
            EditButtons = <>
            FieldName = #32771#21220#24037#26102
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #36229#20986#23567#26102
            Footers = <>
            Width = 57
          end>
      end
    end
  end
end

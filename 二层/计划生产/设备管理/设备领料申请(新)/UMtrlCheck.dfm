object frmMtrlCheck: TfrmMtrlCheck
  Left = 463
  Top = 237
  Width = 443
  Height = 332
  Caption = #26448#26009#26816#26597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 301
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 257
      Width = 433
      Height = 43
      Align = alBottom
      TabOrder = 0
      object btn1: TBitBtn
        Left = 295
        Top = 7
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 0
        Kind = bkCancel
      end
      object btn2: TBitBtn
        Left = 89
        Top = 7
        Width = 75
        Height = 25
        Caption = #30830#23450
        Default = True
        TabOrder = 1
        OnClick = btn2Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 433
      Height = 256
      Align = alClient
      TabOrder = 1
      object lbl3: TLabel
        Left = 50
        Top = 114
        Width = 80
        Height = 19
        Caption = #26377#25928#24211#23384
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl11: TLabel
        Left = 80
        Top = 83
        Width = 52
        Height = 13
        Caption = #24211#23384#21333#20301
      end
      object lbl10: TLabel
        Left = 48
        Top = 51
        Width = 85
        Height = 13
        Caption = #26448#26009#21517#31216'/'#35268#26684
      end
      object lbl9: TLabel
        Left = 80
        Top = 23
        Width = 52
        Height = 13
        Caption = #26448#26009#32534#30721
      end
      object lbl_desc: TLabel
        Left = 312
        Top = 96
        Width = 56
        Height = 13
        Caption = 'lbl_name'
        Visible = False
      end
      object grp2: TGroupBox
        Left = 19
        Top = 140
        Width = 535
        Height = 101
        Caption = #30003#35831#20449#24687
        TabOrder = 0
        object lbl12: TLabel
          Left = 13
          Top = 67
          Width = 39
          Height = 13
          Caption = #20379#24212#21830
        end
        object lbl13: TLabel
          Left = -2
          Top = 26
          Width = 56
          Height = 13
          Caption = #30003#35831#25968#37327
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_RQty: TEdit
          Left = 55
          Top = 22
          Width = 122
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object cbb_Vendor: TComboBox
          Left = 55
          Top = 64
          Width = 130
          Height = 21
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object edt_Qty: TEdit
        Left = 136
        Top = 109
        Width = 81
        Height = 27
        Color = clScrollBar
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edt_MUnitName: TEdit
        Left = 136
        Top = 80
        Width = 81
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 2
      end
      object edt_MDesc: TEdit
        Left = 136
        Top = 48
        Width = 218
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 3
      end
      object edt_MCode: TEdit
        Left = 136
        Top = 19
        Width = 218
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
end

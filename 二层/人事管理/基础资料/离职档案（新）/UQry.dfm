object FrmQry: TFrmQry
  Left = 371
  Top = 183
  Width = 661
  Height = 339
  Caption = #26597#35810
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 301
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 56
      Top = 288
      Width = 497
      Height = 13
      AutoSize = False
      Caption = '(select rkey from datadepartment)'
      Visible = False
    end
    object GroupBox6: TGroupBox
      Left = 0
      Top = 0
      Width = 617
      Height = 241
      Caption = #26597#35810#26465#20214#23450#20041
      TabOrder = 0
      object Label8: TLabel
        Left = 151
        Top = 24
        Width = 146
        Height = 15
        AutoSize = False
        Caption = #31163#32844#31867#22411
      end
      object lbl_to: TLabel
        Left = 208
        Top = 72
        Width = 2
        Height = 13
        Caption = '|'
        Visible = False
      end
      object rg1: TRadioGroup
        Left = 147
        Top = 73
        Width = 157
        Height = 57
        Caption = #26465#20214
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #31934#30830#26597#25214' '
          #27169#31946#26597#25214)
        TabOrder = 10
        Visible = False
      end
      object edtValue: TEdit
        Left = 147
        Top = 42
        Width = 132
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
      end
      object btn_OK: TButton
        Left = 237
        Top = 150
        Width = 62
        Height = 25
        Caption = #28155#21152
        TabOrder = 1
        OnClick = btn_OKClick
      end
      object lst_field: TListBox
        Left = 10
        Top = 41
        Width = 135
        Height = 184
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ItemHeight = 13
        TabOrder = 2
        OnClick = lst_fieldClick
      end
      object StaticText7: TStaticText
        Left = 10
        Top = 23
        Width = 135
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #26465#20214#39033#30446
        Color = clGrayText
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
      object btn_Del: TButton
        Left = 238
        Top = 196
        Width = 62
        Height = 25
        Caption = #28165#38500
        TabOrder = 4
        OnClick = btn_DelClick
      end
      object BitBtn1: TBitBtn
        Left = 290
        Top = 48
        Width = 23
        Height = 23
        TabOrder = 5
        Visible = False
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
      object dtp1: TDateTimePicker
        Left = 147
        Top = 42
        Width = 142
        Height = 21
        Date = 40780.667675590280000000
        Time = 40780.667675590280000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        Visible = False
      end
      object cbb_nation: TComboBox
        Left = 147
        Top = 42
        Width = 141
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ItemHeight = 13
        TabOrder = 8
        Visible = False
        Items.Strings = (
          #27721#26063
          #26397#40092#26063
          #33945#21476#26063
          #28385#26063
          #36203#21746#26063
          #36798#26017#23572#26063
          #37122#28201#20811#26063
          #37122#20262#26149#26063
          #22238#26063
          #19996#20065#26063
          #22303#26063
          #25746#25289#26063
          #20445#23433#26063
          #35029#22266#26063
          #32500#21566#23572#26063
          #21704#33832#20811#26063
          #26607#23572#20811#23388#26063
          #38177#20271#26063
          #22612#21513#20811#26063
          #20044#23388#21035#20811#26063
          #20420#32599#26031#26063
          #22612#22612#23572#26063
          #34255#26063
          #38376#24052#26063
          #29662#24052#26063
          #32652#26063
          #24413#26063
          #30333#26063
          #21704#23612#26063
          #20643#26063
          #20616#20723#26063
          #20324#26063
          #25289#31068#26063
          #32435#35199#26063
          #26223#39047#26063
          #24067#26391#26063
          #38463#26124#26063
          #26222#31859#26063
          #24594#26063
          #24503#26114#26063
          #29420#40857#26063
          #22522#35834#26063
          #33495#26063
          #24067#20381#26063
          #20375#26063
          #27700#26063
          #20193#20332#26063
          #22766#26063
          #29814#26063
          #20203#20332#26063
          #27611#21335#26063
          #20140#26063
          #22303#23478#26063
          #40654#26063
          #30066#26063
          #39640#23665#26063)
      end
      object cbb1: TComboBox
        Left = 147
        Top = 42
        Width = 141
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ItemHeight = 13
        TabOrder = 9
        Visible = False
        Items.Strings = (
          #25163#26426#36890#23380#26495
          #25163#26426#26495
          #26222#36890#26495
          #20809#26495
          '')
      end
      object btn1: TBitBtn
        Left = 286
        Top = 40
        Width = 22
        Height = 23
        TabOrder = 11
        Visible = False
        OnClick = btn1Click
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
      end
      object StaticText2: TStaticText
        Left = 311
        Top = 30
        Width = 298
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #24050#23450#20041#30340#26465#20214
        Color = clGrayText
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 12
      end
      object SGrid: TStringGrid
        Left = 312
        Top = 48
        Width = 305
        Height = 175
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        PopupMenu = PopupMenu1
        ScrollBars = ssHorizontal
        TabOrder = 13
        ColWidths = (
          87
          209
          3)
      end
      object rg2: TRadioGroup
        Left = 147
        Top = 80
        Width = 157
        Height = 58
        Caption = #26465#20214
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #31561#20110' ='
          #22823#20110' >'
          #23567#20110' <'
          #20171#20110#21306#38388)
        TabOrder = 6
        Visible = False
      end
      object dtp2: TDateTimePicker
        Left = 147
        Top = 98
        Width = 142
        Height = 21
        Date = 40780.667675590280000000
        Time = 40780.667675590280000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 14
        Visible = False
      end
    end
    object Button1: TButton
      Left = 63
      Top = 260
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 1
    end
    object btn_cancel: TButton
      Left = 343
      Top = 260
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
      OnClick = btn_cancelClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 91
    object N1: TMenuItem
      Caption = #21024#38500
    end
  end
end

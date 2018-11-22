object Frm_main: TFrm_main
  Left = 280
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#25104#21697#36716#31227
  ClientHeight = 558
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 780
    Height = 265
    Align = alTop
    Caption = #20174
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 28
      Top = 58
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = '   '#23458#25143':'
    end
    object Label2: TLabel
      Left = 21
      Top = 104
      Width = 63
      Height = 14
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495':'
    end
    object Label3: TLabel
      Left = 21
      Top = 132
      Width = 63
      Height = 14
      Alignment = taRightJustify
      Caption = #23458#25143#22411#21495':'
    end
    object Label4: TLabel
      Left = 28
      Top = 206
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = '   '#24037#21378':'
    end
    object Label5: TLabel
      Left = 28
      Top = 237
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = '   '#20179#24211':'
    end
    object Label6: TLabel
      Left = -1
      Top = 169
      Width = 84
      Height = 14
      Alignment = taRightJustify
      Caption = '   '#21487#29992#25968#37327':'
    end
    object LBfac: TLabel
      Left = 168
      Top = 206
      Width = 7
      Height = 14
    end
    object LBStore: TLabel
      Left = 168
      Top = 237
      Width = 7
      Height = 14
    end
    object LBCust: TLabel
      Left = 95
      Top = 79
      Width = 7
      Height = 14
    end
    object EdtCust: TEdit
      Left = 94
      Top = 52
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = EdtCustEnter
      OnExit = EdtCustExit
    end
    object EdtPart: TEdit
      Left = 94
      Top = 99
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = EdtPartEnter
      OnExit = EdtPartExit
    end
    object EdtCustPart: TEdit
      Left = 94
      Top = 129
      Width = 171
      Height = 22
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
    end
    object EdtFac: TEdit
      Left = 94
      Top = 202
      Width = 65
      Height = 22
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
    end
    object EdtStore: TEdit
      Left = 94
      Top = 233
      Width = 65
      Height = 22
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
    end
    object Edit6: TEdit
      Left = 94
      Top = 165
      Width = 97
      Height = 22
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 5
      Text = '0'
      OnChange = Edit6Change
    end
    object BitBtn1: TBitBtn
      Left = 160
      Top = 51
      Width = 25
      Height = 25
      TabOrder = 6
      TabStop = False
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Tag = 1
      Left = 242
      Top = 98
      Width = 25
      Height = 25
      TabOrder = 7
      TabStop = False
      OnClick = BitBtn1Click
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
      Tag = 2
      Left = 196
      Top = 164
      Width = 25
      Height = 25
      TabOrder = 8
      OnClick = BitBtn1Click
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
    object Rd1: TRadioButton
      Left = 24
      Top = 21
      Width = 78
      Height = 17
      Caption = #21333#39033#36716#31227
      Checked = True
      TabOrder = 9
      TabStop = True
      OnClick = Rd1Click
    end
    object Rd2: TRadioButton
      Left = 128
      Top = 21
      Width = 78
      Height = 17
      Caption = #22810#39033#36716#31227
      TabOrder = 10
      OnClick = Rd1Click
    end
    object Grid1: TDBGridEh
      Left = 280
      Top = 16
      Width = 498
      Height = 247
      Align = alRight
      DataSource = DS
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -14
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ParentFont = False
      TabOrder = 11
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -14
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          EditButtons = <>
          FieldName = 'sel'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #36873#25321
          Width = 30
        end
        item
          EditButtons = <>
          FieldName = 'warehouse_code'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24037#21378
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'location'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20179#20301
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'WORK_ORDER_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24037#21333#21495
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'REFERENCE_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21442#32771#21495
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'MFG_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20837#24211#26085#26399
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'QTY_AVAIL'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #26377#25928#25968
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 272
    Width = 779
    Height = 238
    Caption = #21040
    TabOrder = 1
    object Label10: TLabel
      Left = 32
      Top = 19
      Width = 56
      Height = 14
      Alignment = taRightJustify
      Caption = '   '#23458#25143':'
    end
    object Label11: TLabel
      Left = 25
      Top = 48
      Width = 63
      Height = 14
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495':'
    end
    object Label12: TLabel
      Left = 25
      Top = 76
      Width = 63
      Height = 14
      Alignment = taRightJustify
      Caption = #23458#25143#22411#21495':'
    end
    object Label13: TLabel
      Left = 53
      Top = 105
      Width = 35
      Height = 14
      Alignment = taRightJustify
      Caption = #24037#21378':'
    end
    object Label14: TLabel
      Left = 53
      Top = 134
      Width = 35
      Height = 14
      Alignment = taRightJustify
      Caption = #20179#24211':'
    end
    object Label15: TLabel
      Left = 25
      Top = 161
      Width = 63
      Height = 14
      Alignment = taRightJustify
      Caption = #36716#31227#25968#37327':'
    end
    object LBCust1: TLabel
      Left = 202
      Top = 18
      Width = 7
      Height = 14
    end
    object LBfac1: TLabel
      Left = 201
      Top = 104
      Width = 7
      Height = 14
    end
    object LBStore1: TLabel
      Left = 201
      Top = 133
      Width = 7
      Height = 14
    end
    object Label23: TLabel
      Left = 25
      Top = 187
      Width = 63
      Height = 14
      Alignment = taRightJustify
      Caption = #20837#20179#21333#21495':'
    end
    object Label24: TLabel
      Left = 53
      Top = 213
      Width = 35
      Height = 14
      Alignment = taRightJustify
      Caption = #22791#27880':'
    end
    object EdtCust1: TEdit
      Left = 98
      Top = 14
      Width = 65
      Height = 22
      TabOrder = 0
      OnEnter = EdtCust1Enter
      OnExit = EdtCust1Exit
    end
    object EdtPart1: TEdit
      Left = 98
      Top = 44
      Width = 187
      Height = 22
      TabOrder = 1
      OnEnter = EdtPart1Enter
      OnExit = EdtPart1Exit
    end
    object EdtCustPart1: TEdit
      Left = 98
      Top = 72
      Width = 183
      Height = 22
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
    end
    object EdtFac1: TEdit
      Left = 98
      Top = 100
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnEnter = EdtFac1Enter
      OnExit = EdtFac1Exit
    end
    object EdtStore1: TEdit
      Left = 98
      Top = 129
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = EdtStore1Enter
      OnExit = EdtStore1Exit
    end
    object Edit12: TEdit
      Left = 98
      Top = 156
      Width = 97
      Height = 22
      Enabled = False
      TabOrder = 5
      Text = '0'
      OnKeyPress = Edit12KeyPress
    end
    object BitBtn4: TBitBtn
      Tag = 3
      Left = 167
      Top = 12
      Width = 25
      Height = 25
      TabOrder = 7
      TabStop = False
      OnClick = BitBtn1Click
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
    object BitBtn5: TBitBtn
      Tag = 4
      Left = 287
      Top = 42
      Width = 25
      Height = 25
      TabOrder = 8
      TabStop = False
      OnClick = BitBtn1Click
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
    object BitBtn6: TBitBtn
      Tag = 5
      Left = 167
      Top = 99
      Width = 25
      Height = 25
      TabOrder = 9
      TabStop = False
      OnClick = BitBtn1Click
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
    object BitBtn7: TBitBtn
      Tag = 6
      Left = 167
      Top = 127
      Width = 25
      Height = 25
      TabOrder = 10
      TabStop = False
      OnClick = BitBtn1Click
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
    object Edit14: TEdit
      Left = 96
      Top = 207
      Width = 286
      Height = 22
      MaxLength = 50
      TabOrder = 11
    end
    object MaskEdit1: TMaskEdit
      Left = 96
      Top = 182
      Width = 121
      Height = 22
      TabOrder = 6
    end
  end
  object Button1: TButton
    Left = 210
    Top = 525
    Width = 75
    Height = 21
    Hint = #20445#23384
    Caption = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 450
    Top = 523
    Width = 75
    Height = 25
    Hint = #36864#20986
    Caption = #21462#28040
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 330
    Top = 523
    Width = 75
    Height = 25
    Caption = #26032#22686
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button3Click
  end
  object DS: TDataSource
    DataSet = CDS
    Left = 488
    Top = 136
  end
  object CDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 136
  end
end

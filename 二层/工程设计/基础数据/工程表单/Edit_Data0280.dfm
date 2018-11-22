object frmEdit_Data0280: TfrmEdit_Data0280
  Left = 307
  Top = 132
  Width = 646
  Height = 509
  Caption = #24037#31243#34920#21333#32534#36753
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 201
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 25
      Width = 65
      Height = 13
      Caption = #34920#21333#21517#31216#65306
    end
    object Label2: TLabel
      Left = 24
      Top = 86
      Width = 65
      Height = 13
      Caption = #34920#21333#25551#36848#65306
    end
    object Label3: TLabel
      Left = 24
      Top = 148
      Width = 60
      Height = 13
      Caption = #29366'   '#24577#65306
    end
    object Label4: TLabel
      Left = 24
      Top = 115
      Width = 65
      Height = 13
      Caption = #25968#25454#31867#22411#65306
    end
    object Label6: TLabel
      Left = 272
      Top = 19
      Width = 153
      Height = 13
      AutoSize = False
      Caption = #21442#25968#26684#24335#65306'F(X , Y)'
    end
    object Label5: TLabel
      Left = 262
      Top = 153
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#34892#25968':'
    end
    object Label7: TLabel
      Left = 351
      Top = 153
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#21015#25968':'
    end
    object spBtnToExcel: TSpeedButton
      Left = 544
      Top = 96
      Width = 75
      Height = 25
      Caption = #23548#20986
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      OnClick = spBtnToExcelClick
    end
    object spbtnX: TSpeedButton
      Left = 206
      Top = 46
      Width = 23
      Height = 22
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      OnClick = spbtnXClick
    end
    object spBtnY: TSpeedButton
      Left = 374
      Top = 46
      Width = 23
      Height = 22
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
      OnClick = spBtnYClick
    end
    object Label8: TLabel
      Left = 64
      Top = 50
      Width = 14
      Height = 13
      Caption = 'X:'
    end
    object Label9: TLabel
      Left = 240
      Top = 50
      Width = 14
      Height = 13
      Caption = 'Y:'
    end
    object Label10: TLabel
      Left = 25
      Top = 51
      Width = 26
      Height = 13
      Caption = #21442#25968
    end
    object SpeedButton1: TSpeedButton
      Left = 400
      Top = 46
      Width = 105
      Height = 22
      Caption = 'Y'#19981#21462#24037#31243#21442#25968
      OnClick = SpeedButton1Click
    end
    object spBtnCheck: TSpeedButton
      Left = 400
      Top = 106
      Width = 105
      Height = 22
      Caption = #26816#39564#21442#25968'(&C)'
      OnClick = spBtnCheckClick
    end
    object rgStatus: TRadioGroup
      Left = 96
      Top = 132
      Width = 161
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #26377#25928
        #22833#25928)
      TabOrder = 0
      OnClick = edtDescChange
    end
    object edtName: TEdit
      Left = 96
      Top = 17
      Width = 161
      Height = 21
      TabOrder = 1
      OnChange = edtNameChange
    end
    object edtDesc: TEdit
      Left = 96
      Top = 78
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnChange = edtDescChange
    end
    object comboxDatatype: TComboBox
      Left = 96
      Top = 107
      Width = 161
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #25968#23383
      OnChange = edtDescChange
      Items.Strings = (
        #25968#23383
        #23383#31526)
    end
    object panelRow: TPanel
      Left = 320
      Top = 147
      Width = 33
      Height = 20
      BevelOuter = bvLowered
      TabOrder = 4
    end
    object panelCol: TPanel
      Left = 408
      Top = 147
      Width = 33
      Height = 20
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object Button1: TButton
      Left = 285
      Top = 106
      Width = 108
      Height = 22
      Caption = #35774#32622#34892#21644#21015
      TabOrder = 6
      OnClick = Button1Click
    end
    object btnSave: TButton
      Left = 544
      Top = 16
      Width = 75
      Height = 25
      Caption = #20445#23384'(&S)'
      TabOrder = 7
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 544
      Top = 56
      Width = 75
      Height = 25
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 8
      OnClick = btnCancelClick
    end
    object edtFX: TEdit
      Left = 96
      Top = 46
      Width = 105
      Height = 21
      Color = clInactiveCaptionText
      ReadOnly = True
      TabOrder = 9
      OnChange = edtNameChange
    end
    object edtFY: TEdit
      Left = 264
      Top = 46
      Width = 105
      Height = 21
      Color = clInactiveCaptionText
      ReadOnly = True
      TabOrder = 10
      OnChange = edtNameChange
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 201
    Width = 638
    Height = 281
    Align = alClient
    ColCount = 4
    DefaultColWidth = 82
    DefaultRowHeight = 20
    RowCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing, goTabs, goAlwaysShowEditor]
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    OnExit = StringGrid1Exit
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
    OnSetEditText = StringGrid1SetEditText
  end
end

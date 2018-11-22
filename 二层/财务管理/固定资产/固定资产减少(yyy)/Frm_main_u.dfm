object Frm_main: TFrm_main
  Left = 350
  Top = 144
  Width = 749
  Height = 480
  Caption = #22266#23450#36164#20135#20943#23569
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object empl_name: TLabel
      Left = 378
      Top = 3
      Width = 7
      Height = 13
      Visible = False
    end
    object curr_code: TLabel
      Left = 378
      Top = 19
      Width = 7
      Height = 13
      Visible = False
    end
    object Label2: TLabel
      Left = 386
      Top = 14
      Width = 46
      Height = 13
      Caption = #26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 546
      Top = 14
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Label1: TLabel
      Left = 206
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20837#24080#26085#26399
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 6
      Width = 56
      Height = 29
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      Left = 58
      Top = 6
      Width = 56
      Height = 29
      Hint = #21047#26032
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object BitBtn2: TBitBtn
      Left = 114
      Top = 6
      Width = 56
      Height = 29
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn2Click
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
    object Edit1: TEdit
      Left = 264
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 436
      Top = 9
      Width = 106
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 4
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 571
      Top = 10
      Width = 106
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 5
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 37
    Width = 733
    Height = 405
    Align = alClient
    DataSource = DM.DS525
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    ReadOnly = True
    SortLocal = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    UseMultiTitle = True
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'dimi_date'
        Footers = <>
        Title.Color = clRed
        Title.TitleButton = True
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'id_code'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 152
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_DESC'
        Footers = <>
        Title.TitleButton = True
        Width = 172
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_TYPE'
        Footers = <>
        Title.TitleButton = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'ORIGINAL_VALUE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'SUMMED_DEPRE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'MONTH_DEPRE_AMT'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'fasset_alt_type'
        Footers = <>
        Title.TitleButton = True
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'Employee_name'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'reson'
        Footers = <>
        Title.TitleButton = True
        Width = 312
      end
      item
        EditButtons = <>
        FieldName = 'FASSET_CODE'
        Footers = <>
        Title.TitleButton = True
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'BOOK_DATE'
        Footers = <>
        Title.Caption = #20837#36134#26085#26399
        Width = 100
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 176
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #26816#26597
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
  end
end

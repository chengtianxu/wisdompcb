object frmEdit: TfrmEdit
  Left = 511
  Top = 124
  Width = 913
  Height = 596
  Caption = #32534#36753'/'#26597#30475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 905
    Height = 565
    Align = alClient
    TabOrder = 0
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 903
      Height = 29
      Align = alTop
      TabOrder = 0
      object BitBtn6: TBitBtn
        Left = 16
        Top = -1
        Width = 67
        Height = 29
        Caption = #36864#20986
        TabOrder = 0
        TabStop = False
        OnClick = BitBtn6Click
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
      object BitBtn5: TBitBtn
        Left = 88
        Top = -1
        Width = 67
        Height = 29
        Caption = #20445#23384
        TabOrder = 1
        OnClick = BitBtn5Click
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF5AFFFFF
          0000000000000FFFF5AFFFF08B000000880B0FFF55FAFFF0B800000088080FFF
          55FAFFF08B000000880B0FFFFFFFFFF0B800000000080FFFFFFFFFF08B8B8B8B
          8B8B0FFFFFFFFFF0B800000000B80FFFFFFFFFF080888888880B0FFFFFFFFFF0
          B088888888080FFFFFFFFFF080888888880B0FFFFFFFFFF0B088888888080FFF
          FFFFFFF08088888888000FFFFFFFFFF0B088888888080FFFFFFFFFF000000000
          00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFF0000}
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 318
      Width = 903
      Height = 246
      Align = alBottom
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 400
        Height = 244
        Align = alLeft
        Caption = #36131#20219#37096#38376#20998#26512
        TabOrder = 0
        object DBGridEh1: TDBGridEh
          Left = 2
          Top = 15
          Width = 396
          Height = 227
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          DataSource = DataSource1
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'MyDEPT_CODE'
              Footers = <>
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'MyDEPT_NAME'
              Footers = <>
              Width = 148
            end
            item
              EditButtons = <>
              FieldName = 'FLAG'
              Footers = <>
              Width = 45
            end>
        end
      end
      object GroupBox5: TGroupBox
        Left = 401
        Top = 1
        Width = 501
        Height = 244
        Align = alClient
        Caption = #30456#20851#25991#26723#35828#26126
        TabOrder = 1
        object DBGrid4: TDBGrid
          Left = 2
          Top = 15
          Width = 497
          Height = 227
          Align = alClient
          DataSource = DataSource2
          ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu2
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'rec_no'
              Title.Caption = #24207#21495
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'file_name'
              Title.Caption = #25991#20214#21517
              Width = 139
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'in_date'
              Title.Caption = #19978#20256#26085#26399
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'remark'
              Title.Caption = #22791#27880#35828#26126
              Width = 197
              Visible = True
            end>
        end
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 30
      Width = 903
      Height = 288
      Align = alClient
      TabOrder = 2
      object Label9: TLabel
        Left = 14
        Top = 21
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#25237#35785#32534#21495':'
      end
      object Label23: TLabel
        Left = 440
        Top = 12
        Width = 85
        Height = 13
        Alignment = taCenter
        Caption = #25237#35785#20869#23481#25551#36848':'
      end
      object Label22: TLabel
        Left = 13
        Top = 177
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#25237#35785#32423#21035':'
      end
      object Label21: TLabel
        Left = 13
        Top = 129
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#25237#35785#26085#26399':'
      end
      object Label20: TLabel
        Left = 219
        Top = 52
        Width = 7
        Height = 13
      end
      object Label19: TLabel
        Left = 110
        Top = 103
        Width = 265
        Height = 13
        AutoSize = False
        Caption = '.....'
      end
      object Label18: TLabel
        Left = 39
        Top = 153
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#25968#37327':'
      end
      object Label11: TLabel
        Left = 13
        Top = 78
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#26412#21378#32534#21495':'
      end
      object Label10: TLabel
        Left = 39
        Top = 53
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#23458#25143':'
      end
      object Label1: TLabel
        Left = 197
        Top = 154
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#21333#20301':'
      end
      object GroupBox4: TGroupBox
        Left = 21
        Top = 205
        Width = 400
        Height = 73
        Caption = #25237#35785#22788#29702#20449#24687
        TabOrder = 0
        object Label5: TLabel
          Left = -8
          Top = 21
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = '    '#20027#35201#32570#38519':'
        end
        object Label6: TLabel
          Left = 44
          Top = 44
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = #21608#26399':'
        end
      end
      object Memo4: TMemo
        Left = 437
        Top = 30
        Width = 436
        Height = 251
        Ctl3D = False
        MaxLength = 600
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Edit4: TEdit
        Left = 107
        Top = 249
        Width = 150
        Height = 21
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 107
        Top = 221
        Width = 150
        Height = 21
        TabOrder = 3
      end
      object Edit15: TEdit
        Left = 107
        Top = 151
        Width = 97
        Height = 21
        TabOrder = 4
        OnKeyPress = Edit15KeyPress
      end
      object Edit14: TEdit
        Left = 107
        Top = 18
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object Edit13: TEdit
        Left = 107
        Top = 48
        Width = 81
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 6
        OnExit = Edit13Exit
      end
      object Edit12: TEdit
        Left = 107
        Top = 75
        Width = 193
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 7
        OnExit = Edit12Exit
      end
      object Edit1: TEdit
        Left = 258
        Top = 151
        Width = 72
        Height = 21
        ReadOnly = True
        TabOrder = 8
      end
      object DateTimePicker1: TDateTimePicker
        Left = 107
        Top = 125
        Width = 137
        Height = 21
        Date = 39330.617030335650000000
        Time = 39330.617030335650000000
        TabOrder = 9
      end
      object ComboBox2: TComboBox
        Left = 107
        Top = 175
        Width = 105
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 10
        Text = #19968#33324
        Items.Strings = (
          #19968#33324
          #36731#24494
          #20005#37325
          #33268#21629)
      end
      object BitBtn8: TBitBtn
        Left = 194
        Top = 46
        Width = 25
        Height = 25
        TabOrder = 11
        TabStop = False
        OnClick = BitBtn8Click
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
      object BitBtn7: TBitBtn
        Left = 301
        Top = 72
        Width = 25
        Height = 25
        TabOrder = 12
        TabStop = False
        OnClick = BitBtn7Click
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
      object BitBtn1: TBitBtn
        Left = 330
        Top = 148
        Width = 25
        Height = 25
        TabOrder = 13
        TabStop = False
        OnClick = BitBtn1Click
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
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 487
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOQ0118
    Left = 328
    Top = 463
  end
  object PopupMenu2: TPopupMenu
    OnChange = PopupMenu2Change
    Left = 593
    Top = 428
    object N30: TMenuItem
      Caption = #19978#20256#25991#20214
      OnClick = N30Click
    end
    object N31: TMenuItem
      Caption = #21024#38500#25991#20214
      OnClick = N31Click
    end
    object N32: TMenuItem
      Caption = #32534#36753#22791#27880
      OnClick = N32Click
    end
    object N33: TMenuItem
      Caption = #25171#24320#25991#20214
      OnClick = N33Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 464
    Top = 488
  end
  object DataSource2: TDataSource
    DataSet = DM.ADO148
    Left = 814
    Top = 456
  end
end

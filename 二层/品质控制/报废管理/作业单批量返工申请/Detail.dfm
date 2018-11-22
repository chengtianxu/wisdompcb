object Frm_Detail: TFrm_Detail
  Left = 225
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36820#24037#30003#35831#35814#32454#20449#24687
  ClientHeight = 650
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    856
    650)
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 5
    Top = 45
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #36820#24037#20195#30721':'
  end
  object Label1: TLabel
    Left = 5
    Top = 74
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#21378#32534#21495':'
  end
  object Label10: TLabel
    Left = 5
    Top = 106
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #30003#35831#24037#24207':'
  end
  object Label2: TLabel
    Left = 5
    Top = 137
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24322#24120#31561#32423':'
  end
  object Label23: TLabel
    Left = 8
    Top = 172
    Width = 59
    Height = 13
    Alignment = taCenter
    Caption = #24322#24120#25551#36848':'
  end
  object Label3: TLabel
    Left = 8
    Top = 308
    Width = 59
    Height = 13
    Alignment = taCenter
    Caption = #24322#24120#21407#22240':'
  end
  object Label4: TLabel
    Left = 8
    Top = 442
    Width = 59
    Height = 13
    Alignment = taCenter
    Caption = #36820#24037#26041#26696':'
  end
  object Label5: TLabel
    Left = 224
    Top = 73
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 224
    Top = 106
    Width = 7
    Height = 13
  end
  object BitBtn6: TBitBtn
    Left = 1
    Top = 2
    Width = 67
    Height = 27
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
    Left = 73
    Top = 2
    Width = 67
    Height = 27
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
  object Edit14: TEdit
    Left = 67
    Top = 41
    Width = 120
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 2
  end
  object Edit12: TEdit
    Left = 67
    Top = 70
    Width = 120
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    MaxLength = 20
    ParentFont = False
    TabOrder = 3
    OnClick = Edit12Click
    OnExit = Edit12Exit
  end
  object BitBtn7: TBitBtn
    Left = 191
    Top = 68
    Width = 25
    Height = 25
    TabOrder = 4
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
  object Edit13: TEdit
    Left = 67
    Top = 102
    Width = 120
    Height = 21
    Color = cl3DLight
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    MaxLength = 5
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object BitBtn8: TBitBtn
    Left = 191
    Top = 100
    Width = 25
    Height = 25
    TabOrder = 6
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
  object Edit1: TEdit
    Left = 67
    Top = 133
    Width = 120
    Height = 21
    Color = cl3DLight
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    MaxLength = 5
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 131
    Width = 25
    Height = 25
    TabOrder = 8
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
  object Memo4: TMemo
    Left = 5
    Top = 190
    Width = 400
    Height = 112
    Ctl3D = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    MaxLength = 600
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 5
    Top = 324
    Width = 400
    Height = 112
    Color = clAqua
    Ctl3D = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    MaxLength = 600
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 10
  end
  object Memo2: TMemo
    Left = 5
    Top = 460
    Width = 400
    Height = 178
    Color = clAqua
    Ctl3D = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    MaxLength = 600
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object GroupBox1: TGroupBox
    Left = 413
    Top = 4
    Width = 436
    Height = 219
    Anchors = [akLeft, akTop, akBottom]
    Caption = #36820#24037#20316#19994#21333#21015#34920
    TabOrder = 12
    object StringGrid1: TStringGrid
      Left = 2
      Top = 15
      Width = 432
      Height = 202
      Align = alClient
      ColCount = 6
      Ctl3D = False
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goAlwaysShowEditor]
      ParentCtl3D = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      ColWidths = (
        13
        164
        9
        15
        93
        121)
    end
  end
  object GroupBox2: TGroupBox
    Left = 414
    Top = 200
    Width = 435
    Height = 243
    Anchors = [akLeft, akTop, akBottom]
    Caption = #36820#24037#27969#31243#20998#26512
    TabOrder = 13
    object StringGrid2: TStringGrid
      Left = 2
      Top = 15
      Width = 431
      Height = 226
      Align = alClient
      Color = clAqua
      ColCount = 6
      Ctl3D = False
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentCtl3D = False
      PopupMenu = PopupMenu2
      TabOrder = 0
      ColWidths = (
        31
        77
        87
        110
        65
        78)
    end
  end
  object GroupBox3: TGroupBox
    Left = 413
    Top = 420
    Width = 435
    Height = 219
    Anchors = [akLeft, akTop, akBottom]
    Caption = #30456#20851#23457#25209#20449#24687
    TabOrder = 14
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 431
      Height = 202
      Align = alClient
      DataSource = DM.DataSource2
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'rkey203'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dept_ptr'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dept_name'
          Title.Caption = #35780#23457#37096#38376
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'user_ptr'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'employee_name'
          Title.Caption = #35780#23457#29992#25143
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'auth_date'
          Title.Caption = #35780#23457#26085#26399
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PUTH_INFO'
          Title.Caption = #35780#23457#22791#27880
          Width = 154
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 533
    Top = 96
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 574
    Top = 360
    object N3: TMenuItem
      Caption = #30830#23450#36820#24037#27969#31243
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500#20840#37096
      OnClick = N4Click
    end
  end
end

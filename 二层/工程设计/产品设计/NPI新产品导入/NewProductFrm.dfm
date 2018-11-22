object frm_NewProduct: Tfrm_NewProduct
  Left = 253
  Top = 218
  Width = 961
  Height = 498
  Caption = 'NPI'#26032#20135#21697#23548#20837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 953
    Height = 41
    Align = alTop
    TabOrder = 0
    object BitBtn5: TBitBtn
      Left = 73
      Top = 2
      Width = 67
      Height = 27
      Caption = #20445#23384
      TabOrder = 0
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
    object BitBtn6: TBitBtn
      Left = 1
      Top = 2
      Width = 67
      Height = 27
      Caption = #36864#20986
      TabOrder = 1
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 953
    Height = 208
    Align = alTop
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 393
      Top = 1
      Width = 559
      Height = 206
      Align = alClient
      DataSource = DM.DS601
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = PopupMenu2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnExit = DBGridEh1Exit
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'rec_no'
          Footers = <>
          ReadOnly = True
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'FileName'
          Footers = <>
          ReadOnly = True
          Width = 127
        end
        item
          EditButtons = <>
          FieldName = 'UploadTime'
          Footers = <>
          ReadOnly = True
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          ReadOnly = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'remark'
          Footers = <>
          Width = 200
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 392
      Height = 206
      Align = alLeft
      TabOrder = 1
      object Label10: TLabel
        Left = 5
        Top = 96
        Width = 59
        Height = 13
        Caption = #35780#23457#20027#39064':'
      end
      object Label11: TLabel
        Left = 195
        Top = 96
        Width = 59
        Height = 13
        Caption = #22791#27880#35828#26126':'
      end
      object Label7: TLabel
        Left = 5
        Top = 70
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #23457#25209#20195#30721':'
      end
      object Label1: TLabel
        Left = 5
        Top = 41
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #26412#21378#32534#21495':'
      end
      object Label8: TLabel
        Left = 224
        Top = 40
        Width = 7
        Height = 13
      end
      object Label9: TLabel
        Left = 10
        Top = 12
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'NPI'#32534#21495':'
      end
      object Memo1: TMemo
        Left = 7
        Top = 112
        Width = 177
        Height = 89
        TabOrder = 0
      end
      object Memo2: TMemo
        Left = 192
        Top = 112
        Width = 185
        Height = 89
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 192
        Top = 64
        Width = 25
        Height = 25
        TabOrder = 2
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
      object Edit1: TEdit
        Left = 67
        Top = 66
        Width = 120
        Height = 21
        Color = cl3DLight
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object Edit12: TEdit
        Left = 67
        Top = 37
        Width = 120
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 4
        OnClick = Edit12Click
        OnExit = Edit12Exit
      end
      object BitBtn7: TBitBtn
        Left = 191
        Top = 35
        Width = 25
        Height = 25
        TabOrder = 5
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
      object Edit14: TEdit
        Left = 67
        Top = 8
        Width = 120
        Height = 21
        TabOrder = 6
      end
    end
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 249
    Width = 953
    Height = 215
    Align = alClient
    DataSource = DM.DS6031
    PanelHeight = 107
    PanelWidth = 936
    PopupMenu = PopupMenu1
    TabOrder = 2
    RowCount = 2
    OnKeyDown = DBCtrlGrid1KeyDown
    object Label2: TLabel
      Left = 16
      Top = 0
      Width = 26
      Height = 13
      Caption = #24207#21495
    end
    object Label3: TLabel
      Left = 122
      Top = 0
      Width = 52
      Height = 13
      Caption = #38590#28857#25551#36848
    end
    object Label4: TLabel
      Left = 338
      Top = 0
      Width = 52
      Height = 13
      Caption = #35299#20915#26041#26696
    end
    object Label5: TLabel
      Left = 500
      Top = 0
      Width = 39
      Height = 13
      Caption = #36131#20219#20154
    end
    object Label6: TLabel
      Left = 610
      Top = 0
      Width = 91
      Height = 13
      Caption = #23436#25104#26102#38388#21450#29366#20917
    end
    object DBMemo1: TDBMemo
      Left = 57
      Top = 16
      Width = 185
      Height = 89
      DataField = 'diff_declare'
      DataSource = DM.DS6031
      ReadOnly = True
      TabOrder = 0
    end
    object DBMemo2: TDBMemo
      Left = 256
      Top = 16
      Width = 225
      Height = 89
      DataField = 'solution'
      DataSource = DM.DS6031
      ReadOnly = True
      TabOrder = 1
    end
    object DBMemo3: TDBMemo
      Left = 568
      Top = 16
      Width = 241
      Height = 89
      DataField = 'status_date'
      DataSource = DM.DS6031
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 16
      Width = 33
      Height = 21
      DataField = 'rec_no'
      DataSource = DM.DS6031
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 496
      Top = 16
      Width = 57
      Height = 21
      DataField = 'duty_officer'
      DataSource = DM.DS6031
      ReadOnly = True
      TabOrder = 4
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 536
    Top = 296
    object N1: TMenuItem
      Caption = #22686#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 608
    Top = 113
    object N4: TMenuItem
      Caption = #19978#20256#25991#20214
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #19979#36733#25991#20214
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21024#38500#25991#20214
      OnClick = N6Click
    end
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 784
    Top = 169
  end
end

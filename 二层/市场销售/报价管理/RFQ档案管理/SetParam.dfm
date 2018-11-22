object frmSetParam: TfrmSetParam
  Left = 298
  Top = 166
  Width = 656
  Height = 480
  Caption = #35774#23450'RFQ'#21442#25968#31867#22411
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnExit: TBitBtn
      Left = 2
      Top = 1
      Width = 58
      Height = 33
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnExitClick
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
    object btnRefresh: TBitBtn
      Left = 60
      Top = 1
      Width = 57
      Height = 33
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnRefreshClick
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 648
    Height = 404
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 554
      Height = 404
      Align = alClient
      DataSource = dm.dsSetParam
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch]
      PopupMenu = pmOP
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Group_Type'
          Footers = <>
          ReadOnly = True
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'Group_Name'
          Footers = <>
          ReadOnly = True
          Width = 117
        end
        item
          EditButtons = <>
          FieldName = 'PARAMETER_NAME'
          Footers = <>
          ReadOnly = True
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'PARAMETER_DESC'
          Footers = <>
          ReadOnly = True
          Width = 131
        end
        item
          EditButtons = <>
          FieldName = 'SEQ_NO'
          Footers = <>
          ReadOnly = True
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'MustInput'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          PickList.Strings = (
            #26159
            #21542)
          ReadOnly = True
          Width = 55
        end>
    end
    object Panel3: TPanel
      Left = 554
      Top = 0
      Width = 94
      Height = 404
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object btnAppend: TBitBtn
        Left = 11
        Top = 8
        Width = 73
        Height = 33
        Caption = #26032#22686
        TabOrder = 0
        OnClick = btnAppendClick
      end
      object btnEdit: TBitBtn
        Left = 11
        Top = 68
        Width = 73
        Height = 33
        Caption = #32534#36753
        TabOrder = 1
        OnClick = btnEditClick
      end
      object btnDelete: TBitBtn
        Left = 11
        Top = 128
        Width = 73
        Height = 33
        Caption = #21024#38500
        TabOrder = 2
        OnClick = btnDeleteClick
      end
    end
  end
  object pmOP: TPopupMenu
    Left = 437
    Top = 328
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = btnAppendClick
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = btnEditClick
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = btnDeleteClick
    end
  end
end

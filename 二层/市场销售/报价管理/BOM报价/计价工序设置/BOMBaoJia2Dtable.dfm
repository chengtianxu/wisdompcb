object frmBOMBaoJiaEdit2Dtable: TfrmBOMBaoJiaEdit2Dtable
  Left = 0
  Top = 0
  Caption = #34920#26684
  ClientHeight = 471
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btn1: TBitBtn
      Left = 0
      Top = 2
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 57
      Top = 2
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object eh1: TDBGridEh
    Left = 0
    Top = 34
    Width = 655
    Height = 437
    Align = alClient
    DataSource = dsBP12
    DynProps = <>
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pm1
    ReadOnly = True
    TabOrder = 1
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'TName'
        Footers = <>
        Title.Caption = #34920#21517
        Width = 250
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object cdsBP12: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 304
    Top = 208
    object strngfldBP12IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP12TName: TStringField
      FieldName = 'TName'
      Size = 500
    end
    object intgrfldBP12XCount: TIntegerField
      FieldName = 'XCount'
    end
    object intgrfldBP12YCount: TIntegerField
      FieldName = 'YCount'
    end
    object intgrfldBP12VType: TIntegerField
      FieldName = 'XVType'
    end
    object intgrfldBP12Xtype: TIntegerField
      FieldName = 'Xtype'
    end
    object intgrfldBP12Ytype: TIntegerField
      FieldName = 'Ytype'
    end
    object intgrfldBP12YVType: TIntegerField
      FieldName = 'YVType'
    end
  end
  object dsBP12: TDataSource
    DataSet = cdsBP12
    Left = 376
    Top = 208
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 152
    Top = 184
    object mniNew: TMenuItem
      Caption = #26032#22686
      OnClick = mniNewClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniDele: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleClick
    end
    object mniView: TMenuItem
      Caption = #26597#30475
      OnClick = mniViewClick
    end
  end
end

object frmMainBOMBaoJiaDept: TfrmMainBOMBaoJiaDept
  Left = 0
  Top = 0
  Caption = 'BOM'#25253#20215#25104#26412#20013#24515
  ClientHeight = 474
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 318
      Top = 11
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#20195#30721
    end
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
    object edtFilter: TEdit
      Left = 370
      Top = 7
      Width = 165
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 2
      OnChange = edtFilterChange
    end
    object btn3: TBitBtn
      Left = 150
      Top = 2
      Width = 83
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #22522#30784#25968#25454
      Kind = bkHelp
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btn3Click
    end
  end
  object ehMain: TDBGridEh
    Left = 0
    Top = 34
    Width = 774
    Height = 440
    Align = alClient
    DataSource = dsMain
    DynProps = <>
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    PopupMenu = pm1
    ReadOnly = True
    TabOrder = 1
    OnTitleClick = ehMainTitleClick
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Caption = #24037#24207#20195#30721
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Caption = #24037#24207#21517#31216
        Width = 150
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 176
    Top = 176
    object strngfldMainIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object intgrfldMainD34_ptr: TIntegerField
      FieldName = 'D34_ptr'
    end
    object strngfldMainDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object strngfldMainDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object strngfldMainP2: TStringField
      FieldName = 'P2'
      Size = 1024
    end
    object strngfldMainP3: TStringField
      FieldName = 'P3'
      Size = 1024
    end
    object strngfldMainP4: TStringField
      FieldName = 'P4'
      Size = 1024
    end
    object strngfldMainP5: TStringField
      FieldName = 'P5'
      Size = 1024
    end
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 248
    Top = 176
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 256
    Top = 256
    object mniNew: TMenuItem
      Caption = #26032#22686
      OnClick = mniNewClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniN2: TMenuItem
      Caption = #26597#30475
      OnClick = mniN2Click
    end
  end
  object pm2: TPopupMenu
    Left = 208
    Top = 16
    object mniN4: TMenuItem
      Caption = #34920#26684#35774#32622
      OnClick = mniN4Click
    end
    object mniN5: TMenuItem
      Caption = #20844#29992#20844#24335
      OnClick = mniN5Click
    end
  end
end

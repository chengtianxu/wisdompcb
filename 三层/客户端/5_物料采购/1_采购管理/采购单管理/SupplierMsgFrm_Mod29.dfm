inherited frmSupplierMsg_Mod29: TfrmSupplierMsg_Mod29
  Left = 379
  Top = 257
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#36164#26009
  ClientHeight = 349
  ClientWidth = 511
  ExplicitLeft = 379
  ExplicitTop = 257
  ExplicitWidth = 527
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnClose: TBitBtn
      Left = 1
      Top = 3
      Width = 72
      Height = 35
      Caption = #20851#38381
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
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 511
    Height = 308
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 57
      Top = 15
      Width = 48
      Height = 13
      Caption = #20379#24212#21830#65306
    end
    object Label2: TLabel
      Left = 33
      Top = 47
      Width = 72
      Height = 13
      Caption = #24080#30446#32852#31995#20154#65306
    end
    object Label3: TLabel
      Left = 281
      Top = 47
      Width = 36
      Height = 13
      Caption = #30005#35805#65306
    end
    object Label4: TLabel
      Left = 69
      Top = 79
      Width = 36
      Height = 13
      Caption = #22320#22336#65306
    end
    object Label5: TLabel
      Left = 33
      Top = 114
      Width = 72
      Height = 13
      Caption = #19968#33324#35760#20107#26412#65306
    end
    object Label6: TLabel
      Left = 33
      Top = 194
      Width = 72
      Height = 13
      Caption = #20132#36135#35760#20107#26412#65306
    end
    object edt1: TDBEdit
      Left = 109
      Top = 12
      Width = 335
      Height = 21
      DataField = 'supplier_name'
      DataSource = ds23
      Enabled = False
      TabOrder = 0
    end
    object edt2: TDBEdit
      Left = 111
      Top = 44
      Width = 121
      Height = 21
      DataField = 'contact_name_1'
      DataSource = ds23
      Enabled = False
      TabOrder = 1
    end
    object edt3: TDBEdit
      Left = 323
      Top = 44
      Width = 121
      Height = 21
      DataField = 'CONT_PHONE_1'
      DataSource = ds23
      Enabled = False
      TabOrder = 2
    end
    object edt4: TDBEdit
      Left = 111
      Top = 76
      Width = 333
      Height = 21
      DataField = 'BILLING_ADDRESS_1'
      DataSource = ds23
      Enabled = False
      TabOrder = 3
    end
    object mmo1: TMemo
      Left = 111
      Top = 108
      Width = 333
      Height = 73
      Enabled = False
      TabOrder = 4
    end
    object mmo2: TMemo
      Left = 111
      Top = 193
      Width = 333
      Height = 73
      Enabled = False
      TabOrder = 5
    end
  end
  object cds23: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 65
  end
  object ds23: TDataSource
    DataSet = cds23
    Left = 472
    Top = 113
  end
end

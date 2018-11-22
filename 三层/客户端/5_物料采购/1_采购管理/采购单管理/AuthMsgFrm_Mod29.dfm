inherited frmAuthMsg_Mod29: TfrmAuthMsg_Mod29
  Left = 461
  Top = 327
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #23457#25209#20449#24687
  ClientHeight = 282
  ClientWidth = 485
  ExplicitLeft = 461
  ExplicitTop = 327
  ExplicitWidth = 501
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnClose: TBitBtn
      Left = 2
      Top = 2
      Width = 65
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
    Width = 485
    Height = 241
    Align = alClient
    TabOrder = 1
    object ehAuthMsg: TDBGridEh
      Left = 1
      Top = 1
      Width = 483
      Height = 239
      Align = alClient
      DataSource = ds78
      DynProps = <>
      ReadOnly = True
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'user_login_name'
          Footers = <>
          Title.Caption = #23457#25209#20195#30721
          Width = 74
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'user_full_name'
          Footers = <>
          Title.Caption = #23457#25209#20154#22995#21517
          Width = 86
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'auth_flag'
          Footers = <>
          Title.Caption = #23457#25209#29366#24577
          Width = 81
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'auth_date'
          Footers = <>
          Title.Caption = #23457#25209#26085#26399
          Width = 85
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ranking'
          Footers = <>
          HighlightRequired = True
          Title.Caption = #23457#25209#39034#24207
          Width = 68
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object cds78: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT user_login_name,user_full_name'#13#10'               ,data0078.' +
      'auth_flag, auth_date'#13#10'               ,ranking'#13#10'FROM data0078 INN' +
      'ER JOIN data0073'#13#10'               On data0078.user_ptr=data0073.r' +
      'key'
    Params = <>
    ReadOnly = True
    Left = 248
    Top = 129
  end
  object ds78: TDataSource
    DataSet = cds78
    Left = 296
    Top = 137
  end
end

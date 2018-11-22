object frm_supplier: Tfrm_supplier
  Left = 311
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#20449#24687
  ClientHeight = 379
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 640
    Height = 329
    Align = alTop
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = #20379#24212#21830#31616#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = #29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26448#26009#22411#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVL'#35748#21487
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26085#26399
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 336
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 1
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
  object ads23: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     dbo.Data0023.ABBR_NAME as '#20379#24212#21830#31616#31216','
      
        ' case dbo.Data0023.status when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' end ' +
        'as '#29366#24577','
      ' dbo.Data0028.SUPPLIER_PART_NO as '#26448#26009#22411#21495', '
      ' dbo.Data0028.AVL_FLAG as AVL'#35748#21487', dbo.Data0028.TDATE as '#26085#26399
      'FROM         dbo.Data0028 INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR ' +
        '= dbo.Data0023.RKEY'
      'where Data0028.INVENTORY_PTR=:rkey17')
    Left = 400
    Top = 64
    object ads23DSDesigner: TStringField
      FieldName = #20379#24212#21830#31616#31216
      Size = 16
    end
    object ads23DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 4
    end
    object ads23DSDesigner3: TStringField
      FieldName = #26448#26009#22411#21495
    end
    object ads23AVL: TStringField
      FieldName = 'AVL'#35748#21487
      FixedChar = True
      Size = 1
    end
    object ads23DSDesigner4: TDateTimeField
      FieldName = #26085#26399
    end
  end
  object DataSource1: TDataSource
    DataSet = ads23
    Left = 352
    Top = 64
  end
end

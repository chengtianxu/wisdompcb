object Form_unfinished: TForm_unfinished
  Left = 360
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26410#23436#25104#20135#21697#22411#21495#21015#34920
  ClientHeight = 459
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn3: TBitBtn
      Left = 64
      Top = 5
      Width = 60
      Height = 30
      Caption = #23548#20986
      TabOrder = 0
      OnClick = BitBtn3Click
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
    object BitBtn1: TBitBtn
      Left = 3
      Top = 5
      Width = 60
      Height = 30
      Caption = #36864#20986
      ModalResult = 1
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 444
    Height = 418
    Align = alClient
    Ctl3D = False
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTOMER_PART_NUMBER'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customer_part_desc'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_REV'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTPART_ENT_DATE'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQ50
    Left = 320
    Top = 400
  end
  object ADOQ50: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CP_REV,CUSTOMER_PART_NUMBER,customer_part_desc,'
      'CUSTPART_ENT_DATE'
      'from data0050'
      'where'
      '(audited_by_ptr>0) and'
      '(cost_appr_by is null)and'
      '(custpart_ent_date > :date1) and'
      '(custpart_ent_date <= :date2)')
    Left = 356
    Top = 400
    object ADOQ50CP_REV: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ADOQ50CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADOQ50CUSTPART_ENT_DATE: TDateTimeField
      DisplayLabel = #24314#26723#26085#26399
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object ADOQ50customer_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'customer_part_desc'
      Size = 40
    end
  end
end

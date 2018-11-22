object FrmMOSearch: TFrmMOSearch
  Left = 262
  Top = 152
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25237#26009#21333#25628#32034
  ClientHeight = 406
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 358
    Height = 41
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 54
    Top = 17
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#25237#26009#21333#21495#65306
  end
  object Panel1: TPanel
    Left = 0
    Top = 370
    Width = 358
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtn2: TBitBtn
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn3: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Edit1: TEdit
    Left = 135
    Top = 12
    Width = 135
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 273
    Top = 13
    Width = 22
    Height = 21
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn1Click
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 358
    Height = 329
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cut_no'
        Title.Caption = #25237#26009#21333#21495
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_part_number'
        Title.Caption = #20135#21697#22411#21495
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sch_compl_date'
        Title.Alignment = taCenter
        Title.Caption = #29983#20135#20132#36135#26399#26085#26399
        Width = 115
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 33
    Top = 375
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=SJ_V20_live;Data Source=DGHYERP'
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select distinct data0492.cut_no,data0025.manu_part_number,'
      'data0492.sch_compl_date,data0492.bom_ptr'
      'from data0492,data0026,data0025'
      'where data0492.bom_ptr=data0026.manu_bom_ptr'
      'and data0492.bom_ptr=data0025.rkey'
      'and data0492.completed=0'
      'and data0026.dept_ptr=:vptr'
      'order by data0492.sch_compl_date')
    Left = 65
    Top = 375
  end
end

object Frm_EdtDetail: TFrm_EdtDetail
  Left = 237
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #22686#21152'/'#32534#36753#22806#21457#39033#30446
  ClientHeight = 448
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 25
    Top = 19
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#26412#21378#32534#21495':'
  end
  object Label4: TLabel
    Left = 49
    Top = 308
    Width = 49
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21333#20301':'
  end
  object Label5: TLabel
    Left = 32
    Top = 335
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#22806#21457#25968#37327':'
  end
  object Label7: TLabel
    Left = 13
    Top = 280
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #35201#27714#21040#36135#26085#26399':'
  end
  object Label13: TLabel
    Left = 65
    Top = 391
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880':'
  end
  object Label15: TLabel
    Left = 45
    Top = 64
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26495#35268#26684':'
  end
  object DBText4: TDBText
    Left = 97
    Top = 42
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'PART_DESC'
    DataSource = DM.DataSource3
  end
  object Label1: TLabel
    Left = 12
    Top = 118
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = #38754#31215'('#24179#26041#31859'):'
  end
  object Label3: TLabel
    Left = -1
    Top = 145
    Width = 99
    Height = 13
    Alignment = taRightJustify
    Caption = #38754#31215'('#24179#26041#33521#23610'):'
  end
  object Label6: TLabel
    Left = 58
    Top = 173
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23618#25968':'
    Visible = False
  end
  object Label8: TLabel
    Left = 32
    Top = 202
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23436#25104#26495#21402':'
  end
  object Label9: TLabel
    Left = 32
    Top = 255
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26368#23567#23380#24452':'
  end
  object Label10: TLabel
    Left = 65
    Top = 362
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #21333#20215':'
  end
  object Label11: TLabel
    Left = 58
    Top = 229
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#38108#21402':'
  end
  object Label12: TLabel
    Left = 32
    Top = 173
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20135#21697#31867#22411':'
  end
  object Label14: TLabel
    Left = 26
    Top = 91
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #20132#36135#21333#20803#25968':'
  end
  object BitBtn3: TBitBtn
    Left = 231
    Top = 13
    Width = 24
    Height = 24
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn3Click
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
  object DBEdit1: TDBEdit
    Left = 97
    Top = 331
    Width = 113
    Height = 21
    DataField = 'QUANTITY'
    DataSource = DM.DataSource3
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnExit = DBEdit1Exit
  end
  object BtSave: TButton
    Left = 169
    Top = 416
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 18
    OnClick = BtSaveClick
  end
  object Button2: TButton
    Left = 289
    Top = 416
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 19
    OnClick = Button2Click
  end
  object DBEdit5: TDBEdit
    Left = 97
    Top = 387
    Width = 401
    Height = 21
    DataField = 'REMARTK'
    DataSource = DM.DataSource3
    TabOrder = 17
  end
  object DBEdit6: TDBEdit
    Left = 97
    Top = 15
    Width = 132
    Height = 21
    DataField = 'PART_NUMBER'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 2
  end
  object DBComboBox1: TDBComboBox
    Left = 97
    Top = 304
    Width = 75
    Height = 21
    Style = csDropDownList
    DataField = 'UNIT_NAME'
    DataSource = DM.DataSource3
    ItemHeight = 13
    Items.Strings = (
      'PNL'
      'SET'
      'PCS')
    TabOrder = 14
    OnChange = DBComboBox1Change
  end
  object DBEdit3: TDBEdit
    Left = 97
    Top = 114
    Width = 113
    Height = 21
    DataField = 'AREA_SQM'
    DataSource = DM.DataSource3
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 97
    Top = 141
    Width = 113
    Height = 21
    DataField = 'AREA_SQF'
    DataSource = DM.DataSource3
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 97
    Top = 169
    Width = 113
    Height = 21
    DataField = 'LAYER'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Visible = False
  end
  object DBEdit9: TDBEdit
    Left = 97
    Top = 197
    Width = 113
    Height = 21
    DataField = 'THINK'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object DBComboBox2: TDBComboBox
    Left = 97
    Top = 60
    Width = 155
    Height = 21
    DataField = 'STANDARD'
    DataSource = DM.DataSource3
    ItemHeight = 13
    TabOrder = 4
    OnChange = DBComboBox2Change
  end
  object DBEdit7: TDBEdit
    Left = 97
    Top = 250
    Width = 113
    Height = 21
    DataField = 'MIN_aperture'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object DateTimePicker1: TDateTimePicker
    Left = 97
    Top = 277
    Width = 113
    Height = 21
    Date = 38678.000000000000000000
    Time = 38678.000000000000000000
    TabOrder = 13
  end
  object Grd: TDBGridEh
    Left = 256
    Top = 15
    Width = 293
    Height = 363
    Ctl3D = False
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ParentCtl3D = False
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    UseMultiTitle = True
    OnKeyDown = GrdKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OUTSOURCE'
        Footers = <>
        Width = 19
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        ReadOnly = True
        Width = 123
      end
      item
        EditButtons = <>
        FieldName = 'PNLS'
        Footers = <>
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'pcs'
        Footers = <>
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'sets'
        Footers = <>
        Width = 33
      end>
  end
  object EdtPart: TEdit
    Left = 97
    Top = 15
    Width = 132
    Height = 21
    TabOrder = 1
    OnExit = EdtPartExit
  end
  object DBEdit2: TDBEdit
    Left = 97
    Top = 359
    Width = 113
    Height = 21
    DataField = 'PRICE'
    DataSource = DM.DataSource3
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object DBEdit10: TDBEdit
    Left = 97
    Top = 224
    Width = 113
    Height = 21
    DataField = 'Cu_THK'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object DBEdit11: TDBEdit
    Left = 97
    Top = 169
    Width = 113
    Height = 21
    DataField = 'prod_type'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object DBEdit12: TDBEdit
    Left = 97
    Top = 87
    Width = 113
    Height = 21
    DataField = 'set_qty'
    DataSource = DM.DataSource3
    TabOrder = 5
  end
  object ADO279: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0278.SPEC_RKEY, dbo.Data0279.PARAMETER_VALUE'
      'FROM dbo.Data0278 INNER JOIN'
      
        '      dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Data0279.PARAMETER' +
        '_PTR'
      'WHERE (dbo.Data0279.SOURCE_PTR = :rkey25)')
    Left = 273
    Top = 105
    object ADO279SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object ADO279PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
  end
  object ADOMIN_aperture: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0494.PARAMETER_VALUE'
      'FROM dbo.Data0278 INNER JOIN'
      '      dbo.Data0494 ON '
      '      dbo.Data0278.RKEY = dbo.Data0494.PARAMETER_PTR INNER JOIN'
      
        '      dbo.Data0038 ON dbo.Data0494.custpart_ptr = dbo.Data0038.S' +
        'OURCE_PTR AND '
      '      dbo.Data0494.step_number = dbo.Data0038.STEP_NUMBER'
      'WHERE (dbo.Data0278.SPEC_RKEY = '#39'AP'#39') AND'
      '(Data0038.SOURCE_PTR=:rkey25)'
      'ORDER BY dbo.Data0494.PARAMETER_VALUE')
    Left = 273
    Top = 161
    object ADOMIN_aperturePARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOWk_sel
    Left = 376
    Top = 153
  end
  object ADOWk_sel: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'Bom_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'WHOUSE_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DEPT_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  a.OUTSOURCE,'
      '      b.WORK_ORDER_NUMBER, '
      '      (a.QTY_BACKLOG-b.quan_allrej) as pcs  , '
      '      (a.PANELS-b.quan_allPnl) as PNLS  , '
      
        '      a.WO_PTR,round((a.QTY_BACKLOG-b.quan_allrej)/d.set_qty+0.4' +
        '99,0) sets'
      
        'FROM data0056  a inner join data0006 b on  a.wo_ptr=b.rkey inner' +
        ' join Data0492 c'
      'on b.cut_No=c.cut_no inner join data0025 d on b.bom_ptr=d.rkey'
      'where b.BOM_ptr=:Bom_ptr and c.WHOUSE_PTR=:WHOUSE_PTR and'
      '          a.DEPT_PTR = :DEPT_PTR and b.prod_status=4'
      'order by b.WORK_ORDER_NUMBER')
    Left = 408
    Top = 153
    object ADOWk_selOUTSOURCE: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'OUTSOURCE'
      OnChange = ADOWk_selOUTSOURCEChange
    end
    object ADOWk_selWORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOWk_selPNLS: TIntegerField
      FieldName = 'PNLS'
      ReadOnly = True
    end
    object ADOWk_selpcs: TFloatField
      DisplayLabel = 'PCS'
      FieldName = 'pcs'
      ReadOnly = True
    end
    object ADOWk_selWO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADOWk_selsets: TFloatField
      FieldName = 'sets'
      ReadOnly = True
    end
  end
end

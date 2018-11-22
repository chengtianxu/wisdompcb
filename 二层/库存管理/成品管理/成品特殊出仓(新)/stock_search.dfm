object Form_Stock: TForm_Stock
  Left = 276
  Top = 209
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#26126#32454#26597#25214
  ClientHeight = 446
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 33
    Width = 799
    Height = 376
    Align = alTop
    DataSource = dsInvent
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IsSelected'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Title.Alignment = taCenter
        Title.Caption = #36873#20013
        Width = 28
      end
      item
        EditButtons = <>
        FieldName = 'RKEY'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'whouse'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#21378
        Width = 110
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'wo_number'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#21333#21495#30721
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'location'
        Footers = <>
        Title.Caption = #20179#24211
        Width = 69
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'place'
        Footers = <>
        Title.Alignment = taCenter
        Width = 108
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'MFG_DATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #21046#36896#26085#26399
        Width = 116
      end
      item
        Color = clScrollBar
        EditButtons = <>
        FieldName = 'QTY_AVAIL'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25968#37327
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'abbr23'
        Footers = <>
        Title.Caption = #22806#21327#21378#23478
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'tttype'
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 51
      Top = 11
      Width = 59
      Height = 13
      Caption = #24037#21333#21495#30721':'
    end
    object Label4: TLabel
      Left = 370
      Top = 10
      Width = 85
      Height = 13
      Caption = #24050#36873#20986#20179#24635#25968':'
    end
    object Label5: TLabel
      Left = 462
      Top = 10
      Width = 42
      Height = 13
      Caption = 'Label5'
    end
    object Edit1: TEdit
      Left = 115
      Top = 6
      Width = 194
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Button2: TButton
    Left = 398
    Top = 417
    Width = 75
    Height = 26
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 258
    Top = 417
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object dsInvent: TDataSource
    DataSet = cdsInvent
    Left = 96
    Top = 144
  end
  object cdsInvent: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'dspInvent'
    Left = 176
    Top = 144
    object cdsInventIsSelected: TSmallintField
      FieldName = 'IsSelected'
      OnChange = cdsInventIsSelectedChange
    end
    object cdsInventRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsInventwhouse: TStringField
      FieldName = 'whouse'
      ReadOnly = True
      Size = 10
    end
    object cdsInventlocation: TStringField
      FieldName = 'location'
      ReadOnly = True
    end
    object cdsInventwo_number: TStringField
      FieldName = 'wo_number'
      ReadOnly = True
      Size = 22
    end
    object cdsInventplace: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'place'
      ReadOnly = True
    end
    object cdsInventMFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
      ReadOnly = True
    end
    object cdsInventQTY_AVAIL: TFloatField
      FieldName = 'QTY_AVAIL'
      ReadOnly = True
    end
    object cdsInventD06RKEY: TAutoIncField
      FieldName = 'D06RKEY'
      ReadOnly = True
    end
    object cdsInventNPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
      ReadOnly = True
    end
    object cdsInventabbr23: TStringField
      FieldName = 'abbr23'
      ReadOnly = True
      Size = 16
    end
    object cdsInventRMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object cdsInventtttype: TStringField
      DisplayLabel = #24211#23384#31867#22411
      FieldName = 'tttype'
      ReadOnly = True
      Size = 8
    end
    object cdsInventspec_place: TStringField
      FieldName = 'spec_place'
    end
  end
  object dspInvent: TDataSetProvider
    DataSet = aqInvent
    Left = 240
    Top = 144
  end
  object aqInvent: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = aqInventAfterOpen
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
      
        'SELECT Cast(0 as tinyint) as IsSelected,d53.RKEY,D15.ABBR_NAME a' +
        's whouse,d16.location,'
      
        '    D06.WORK_ORDER_NUMBER as wo_number,D53.REFERENCE_NUMBER as p' +
        'lace,D53.MFG_DATE,d53.RMA_PTR,'
      
        '    D53.QTY_ON_HAND-D53.QTY_ALLOC as QTY_AVAIL,D06.RKEY as D06RK' +
        'EY,d53.NPAD_PTR,D23.ABBR_NAME AS abbr23,'
      'case d53.rma_ptr '
      
        'when 0 then '#39#27491#24120#36807#25968#39'  when 1 then '#39#36864#36135#37325#26816#39' when 2 then '#39#36820#20462#37325#26816#39' when 3' +
        ' then '#39#30452#25509#20837#20179#39
      
        'when 4 then '#39#22996#22806#21152#24037#39'  when 5 then '#39#22996#22806#36864#36135#39' when 6 then '#39#38144#21806#36864#36135#39' when 7' +
        ' then '#39#36716#25442#20837#20179#39' when 8 then '#39#30424#28857#20837#20179#39
      'end as tttype,d53.spec_place'
      
        '    FROM Data0053 d53 inner join Data0015 d15 on D53.WHSE_PTR=D1' +
        '5.RKEY '
      '    inner join Data0016 d16 on D53.LOC_PTR=D16.RKEY '
      '    left outer join Data0006 d06 on D53.WORK_ORDER_PTR=D06.RKEY '
      '    inner join Data0025 d25 on D53.CUST_PART_PTR=D25.rkey '
      '    inner join Data0416 D416 on D53.NPAD_PTR=D416.rkey '
      '    left outer join Data0060 D60 on D416.so_ptr=D60.rkey '
      '    left outer join Data0023 D23 on D60.supplier_ptr=D23.rkey '
      
        '    WHERE (D53.QTY_ON_HAND - D53.QTY_ALLOC > 0) and d16.allow_pu' +
        'tout=1'
      '    and D53.CUST_PART_PTR=:rkey25'
      '    Order by D53.MFG_DATE ')
    Left = 320
    Top = 144
    object aqInventIsSelected: TWordField
      FieldName = 'IsSelected'
    end
    object aqInventRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqInventwhouse: TStringField
      FieldName = 'whouse'
      ReadOnly = True
      Size = 10
    end
    object aqInventlocation: TStringField
      FieldName = 'location'
      ReadOnly = True
    end
    object aqInventwo_number: TStringField
      FieldName = 'wo_number'
      ReadOnly = True
      Size = 22
    end
    object aqInventplace: TStringField
      FieldName = 'place'
      ReadOnly = True
    end
    object aqInventMFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
      ReadOnly = True
    end
    object aqInventQTY_AVAIL: TFloatField
      FieldName = 'QTY_AVAIL'
      ReadOnly = True
    end
    object aqInventD06RKEY: TAutoIncField
      FieldName = 'D06RKEY'
      ReadOnly = True
    end
    object aqInventNPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
      ReadOnly = True
    end
    object aqInventabbr23: TStringField
      FieldName = 'abbr23'
      ReadOnly = True
      Size = 16
    end
    object aqInventRMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object aqInventtttype: TStringField
      FieldName = 'tttype'
      ReadOnly = True
      Size = 8
    end
    object aqInventspec_place: TStringField
      FieldName = 'spec_place'
    end
  end
end

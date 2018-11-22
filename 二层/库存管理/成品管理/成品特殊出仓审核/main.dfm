object Form1: TForm1
  Left = 321
  Top = 214
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29305#27530#20986#20179#26126#32454
  ClientHeight = 453
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 75
    Top = 75
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143':'
  end
  object Label2: TLabel
    Left = 50
    Top = 106
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#21378#32534#21495':'
  end
  object Label4: TLabel
    Left = 216
    Top = 76
    Width = 77
    Height = 13
    Caption = '           '
  end
  object Label5: TLabel
    Left = 115
    Top = 129
    Width = 70
    Height = 13
    Caption = '          '
  end
  object Label6: TLabel
    Left = 50
    Top = 43
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#20179#21333#21495':'
  end
  object Label7: TLabel
    Left = 270
    Top = 44
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#20179#26085#26399':'
  end
  object Label8: TLabel
    Left = 76
    Top = 182
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880':'
  end
  object Label9: TLabel
    Left = 307
    Top = 182
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#20179#25968#37327':'
  end
  object Label3: TLabel
    Left = 50
    Top = 152
    Width = 59
    Height = 13
    Caption = #36864#36135#21333#21495':'
    Visible = False
  end
  object BitBtncancel: TBitBtn
    Left = 61
    Top = 6
    Width = 54
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    TabStop = False
    OnClick = BitBtncancelClick
    NumGlyphs = 2
  end
  object Edit1: TEdit
    Left = 113
    Top = 72
    Width = 62
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 113
    Top = 101
    Width = 106
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Edit2Click
    OnKeyDown = Edit2KeyDown
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 69
    Width = 28
    Height = 27
    TabOrder = 5
    TabStop = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 225
    Top = 98
    Width = 27
    Height = 27
    TabOrder = 6
    TabStop = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 208
    Width = 643
    Height = 245
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE'
        Width = 110
        Visible = True
      end>
  end
  object BitBnpost: TBitBtn
    Left = 3
    Top = 6
    Width = 54
    Height = 25
    Caption = ' '#20445#23384
    TabOrder = 8
    TabStop = False
    OnEnter = BitBnpostEnter
    NumGlyphs = 2
  end
  object Edit4: TEdit
    Left = 114
    Top = 40
    Width = 105
    Height = 21
    MaxLength = 15
    TabOrder = 0
    OnKeyDown = Edit4KeyDown
  end
  object Edit5: TEdit
    Left = 331
    Top = 40
    Width = 134
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 9
  end
  object Edit6: TEdit
    Left = 114
    Top = 178
    Width = 159
    Height = 21
    MaxLength = 50
    TabOrder = 3
    OnKeyDown = Edit6KeyDown
  end
  object Edit7: TEdit
    Left = 372
    Top = 178
    Width = 93
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 10
    Text = '0'
  end
  object Edit3: TEdit
    Left = 114
    Top = 149
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
    Visible = False
  end
  object ADO465: TADOQuery
    Connection = Form4.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey415'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0465.QUANTITY, dbo.Data0465.reference, dbo.Da' +
        'ta0006.WORK_ORDER_NUMBER,'
      ' dbo.Data0015.ABBR_NAME, dbo.Data0016.LOCATION, '
      '                      dbo.Data0053.REFERENCE_NUMBER'
      'FROM         dbo.Data0006 RIGHT OUTER JOIN'
      '                      dbo.Data0015 INNER JOIN'
      '                      dbo.Data0465 INNER JOIN'
      
        '                      dbo.Data0053 ON dbo.Data0465.D0053_PTR = d' +
        'bo.Data0053.RKEY ON dbo.Data0015.RKEY = dbo.Data0053.WHSE_PTR IN' +
        'NER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo' +
        '.Data0016.RKEY ON dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDER_PT' +
        'R'
      'WHERE     (dbo.Data0465.heard_ptr = :rkey415)')
    Left = 55
    Top = 248
    object ADO465QUANTITY: TIntegerField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO465REFERENCE: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 20
      FieldName = 'REFERENCE'
      Size = 50
    end
    object ADO465WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADO465ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO465LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADO465REFERENCE_NUMBER: TStringField
      DisplayLabel = #24211#23384#22791#27880
      FieldName = 'REFERENCE_NUMBER'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO465
    Left = 23
    Top = 248
  end
  object ADOQuery1: TADOQuery
    Connection = Form4.ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 24
    Top = 384
  end
  object ADO415: TADOQuery
    Connection = Form4.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey415'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0415'
      'where rkey=:rkey415')
    Left = 3
    Top = 175
    object ADO415rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO415number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object ADO415type: TWordField
      FieldName = 'type'
    end
    object ADO415status: TWordField
      FieldName = 'status'
    end
    object ADO415empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO415custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object ADO415sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object ADO415quantity: TIntegerField
      FieldName = 'quantity'
    end
    object ADO415reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object ADO415rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
  end
end

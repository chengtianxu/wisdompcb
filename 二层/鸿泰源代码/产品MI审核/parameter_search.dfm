object Form_parameter: TForm_parameter
  Left = 354
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21046#31243#21442#25968#26597#25214
  ClientHeight = 523
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 86
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #21442#25968#20195#30721
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 143
      Top = 8
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = MaskEdit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn2: TBitBtn
      Left = 301
      Top = 6
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn2Click
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 458
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 137
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 217
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 458
    Height = 444
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PARAMETER_NAME'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARAMETER_DESC'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORY_NAME'
        Title.Color = cl3DLight
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datatype'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 344
    Top = 475
  end
  object ADOQuery1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0278.RKEY,dbo.Data0277.CATEGORY_NAME, '#13#10'    dbo.D' +
      'ata0278.PARAMETER_NAME, '#13#10'      dbo.Data0278.PARAMETER_DESC, dbo' +
      '.Data0002.UNIT_NAME, '#13#10'        case data0278.DATA_TYPE'#13#10'when 1 t' +
      'hen '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39#13#10'end as datatype,data0278.status3'#13#10'FRO' +
      'M dbo.Data0002 INNER JOIN'#13#10'      dbo.Data0278 ON dbo.Data0002.RK' +
      'EY = dbo.Data0278.UNIT_PTR INNER JOIN'#13#10'      dbo.Data0277 ON dbo' +
      '.Data0278.CATEGORY_PTR = dbo.Data0277.RKEY'#13#10'WHERE (dbo.Data0277.' +
      'CATEGORY_TYPE > 2)'
    IndexFieldNames = 'PARAMETER_NAME'
    Parameters = <>
    Left = 375
    Top = 475
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CATEGORY_NAME: TStringField
      DisplayLabel = #21442#25968#31867#21035
      FieldName = 'CATEGORY_NAME'
      Size = 10
    end
    object ADOQuery1PARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#20195#30721
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1PARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1datatype: TStringField
      DisplayLabel = #25968#25454#31867#22411
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1status3: TWordField
      FieldName = 'status3'
    end
  end
end

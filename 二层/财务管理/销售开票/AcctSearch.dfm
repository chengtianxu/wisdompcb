object Form_Acct: TForm_Acct
  Left = 234
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24635#24080#24080#30446#25628#32034
  ClientHeight = 508
  ClientWidth = 604
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
  object Label1: TLabel
    Left = 145
    Top = 14
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31185#30446#32534#30721':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 467
    Width = 604
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 230
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 315
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
    Top = 40
    Width = 604
    Height = 427
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'GL_ACC_NUMBER'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description_2'
        Width = 321
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26041#21521
        ReadOnly = False
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22806#24065#26680#31639
        ReadOnly = False
        Width = 90
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 207
    Top = 10
    Width = 162
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 375
    Top = 8
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
  object RadioGroup1: TRadioGroup
    Left = 409
    Top = 0
    Width = 193
    Height = 39
    Caption = #36807#28388#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #21069#26041#19968#33268
      #27169#31946#26597#25214)
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 243
    Top = 320
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT     dbo.Data0103.RKEY,dbo.Data0103.GL_ACC_NUMBER,  '
      
        '     CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' THEN '#39#36151#26041#39' E' +
        'ND AS '#26041#21521', '
      
        '     CASE data0103.curr_tp WHEN 0 THEN '#39#19981#26680#31639#39' WHEN 1 THEN '#39#26680#31639#39' WH' +
        'EN 2 THEN '#39#26680#31639#21333#19968#39' END AS '#22806#24065#26680#31639',  '
      '   CASE WHEN data0103_3.GL_DESCRIPTION IS NOT NULL '
      
        '          THEN data0103_3.GL_DESCRIPTION + '#39'-'#39' + data0103_2.GL_D' +
        'ESCRIPTION + '#39'-'#39' +'
      
        '               data0103_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL_DES' +
        'CRIPTION '
      'ELSE CASE WHEN data0103_2.GL_DESCRIPTION IS NOT NULL '
      
        '          THEN data0103_2.GL_DESCRIPTION + '#39'-'#39' + data0103_1.GL_D' +
        'ESCRIPTION + '#39'-'#39' + data0103.GL_DESCRIPTION  '
      ' ELSE CASE WHEN data0103_1.GL_DESCRIPTION IS NOT NULL '
      
        '                      THEN data0103_1.GL_DESCRIPTION + '#39'-'#39' + dat' +
        'a0103.GL_DESCRIPTION'
      '      ELSE data0103.GL_DESCRIPTION '
      '      END '
      '     END '
      
        '    END AS description_2,dbo.Data0103.CURR_TP, dbo.Data0103.CURR' +
        '_PTR'
      'FROM         dbo.Data0103 AS Data0103_2 LEFT OUTER JOIN'
      
        '                      dbo.Data0103 AS data0103_3 ON Data0103_2.P' +
        'ARENT_PTR = data0103_3.RKEY RIGHT OUTER JOIN'
      
        '                      dbo.Data0103 AS Data0103_1 ON Data0103_2.R' +
        'KEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'
      
        '                      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data' +
        '0103.PARENT_PTR'
      'WHERE (dbo.Data0103.HAS_CHILD = 0)'
      'order by Data0103.GL_ACC_NUMBER')
    Left = 272
    Top = 320
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CURR_TP: TWordField
      FieldName = 'CURR_TP'
    end
    object ADOQuery1CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADOQuery1DSDesigner2: TStringField
      FieldName = #22806#24065#26680#31639
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#32534#30721
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object ADOQuery1description_2: TStringField
      DisplayLabel = #31185#30446#20840#31216
      FieldName = 'description_2'
      ReadOnly = True
      Size = 100
    end
    object ADOQuery1DSDesigner: TStringField
      FieldName = #26041#21521
      ReadOnly = True
      Size = 4
    end
  end
end

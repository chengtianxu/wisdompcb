object FrmAcctSearch: TFrmAcctSearch
  Left = 272
  Top = 90
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24635#24080#24080#30446#25628#32034
  ClientHeight = 563
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 604
    Height = 35
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 173
    Top = 12
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #31185#30446#20195#30721
  end
  object Edit1: TEdit
    Left = 228
    Top = 8
    Width = 162
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 394
    Top = 7
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
  object Button2: TButton
    Left = 291
    Top = 530
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 211
    Top = 530
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 601
    Height = 482
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
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
        Title.Caption = #31185#30446#20195#30721
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description_2'
        Title.Caption = #31185#30446#21517#31216
        Width = 318
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
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
  object RadioGroup1: TRadioGroup
    Left = 458
    Top = -2
    Width = 137
    Height = 35
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #31934#30830
      #27169#31946)
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = ADOData0103
    OnDataChange = DataSource1DataChange
    Left = 219
    Top = 208
  end
  object ADOData0103: TADODataSet
    Connection = DM.Cnn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CUR' +
      'R_PTR,'#13#10'      CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' TH' +
      'EN '#39#36151#26041#39' END AS '#31867#22411','#13#10'      case data0103.curr_tp when 0 then '#39#19981#26680#31639 +
      #39#13#10'                            when 1 then '#39#26680#31639#39#13#10'               ' +
      '             when 2 then '#39#26680#31639#21333#19968#39#13#10'      end  as '#22806#24065#26680#31639','#13#10'      Data' +
      '0103.GL_ACC_NUMBER,'#13#10'case when data0103_2.GL_DESCRIPTION is not ' +
      'null then'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1.GL_DES' +
      'CRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10'else'#13#10' case when data0103_' +
      '1.GL_DESCRIPTION is not null then'#13#10'   data0103_1.GL_DESCRIPTION+' +
      #39'-'#39'+data0103.GL_DESCRIPTION'#13#10'  else data0103.GL_DESCRIPTION'#13#10'  e' +
      'nd  '#13#10'end as description_2'#13#10'FROM dbo.Data0103 Data0103_2 RIGHT O' +
      'UTER JOIN'#13#10'      dbo.Data0103 Data0103_1 ON '#13#10'      Data0103_2.R' +
      'KEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data0103' +
      ' ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'#13#10'where (dbo.Data01' +
      '03.HAS_CHILD = 0)'#13#10'order by dbo.Data0103.gl_acc_number'#13#10
    Parameters = <>
    Left = 256
    Top = 208
    object ADOData0103RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0103CURR_TP: TWordField
      FieldName = 'CURR_TP'
    end
    object ADOData0103CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADOData0103DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object ADOData0103DSDesigner2: TStringField
      FieldName = #22806#24065#26680#31639
      ReadOnly = True
      Size = 8
    end
    object ADOData0103GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object ADOData0103description_2: TStringField
      FieldName = 'description_2'
      ReadOnly = True
      Size = 152
    end
  end
end

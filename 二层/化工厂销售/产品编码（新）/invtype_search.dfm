object Form_invtype: TForm_invtype
  Left = 197
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#31867#21035#25628#32034
  ClientHeight = 474
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
  object Edit1: TEdit
    Left = 169
    Top = 9
    Width = 166
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 342
    Top = 8
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object Button1: TButton
    Left = 164
    Top = 436
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 244
    Top = 436
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 492
    Height = 388
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Title.Caption = #31867#21035#21517#31216
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_DESC'
        Title.Caption = #25551#36848
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_desc'
        Title.Caption = #32452#21035#21517#31216
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctype'
        Title.Caption = #31867#22411
        Width = 72
        Visible = True
      end>
  end
  object rg1: TRadioGroup
    Left = 2
    Top = -1
    Width = 161
    Height = 34
    BiDiMode = bdLeftToRight
    Columns = 2
    Ctl3D = True
    ItemIndex = 0
    Items.Strings = (
      #31867#21035#21517#31216
      #25551#36848)
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 5
    OnClick = rg1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 340
    Top = 427
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOCon
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'if not exists ( SELECT   Data0496.RKEY, Data0496.GROUP_NAME, dat' +
        'a0496.if_flag,'
      
        '         Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_' +
        'number,'
      '         Data0019.inv_group_name,Data0019.inv_group_desc'
      'FROM     Data0019 INNER JOIN'
      '         Data0496 ON Data0019.rkey = Data0496.group_ptr'
      
        'where    GROUP_PTR  in (select rkey from data0019 where inv_grou' +
        'p_name='#39'vwj'#39' )'
      ' ) '
      'begin'
      ' SELECT   Data0496.RKEY, Data0496.GROUP_NAME, data0496.if_flag,'
      
        '         Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_' +
        'number,'
      '         Data0019.inv_group_name,Data0019.inv_group_desc'
      'FROM     Data0019 INNER JOIN'
      '         Data0496 ON Data0019.rkey = Data0496.group_ptr'
      'end'
      'else'
      'begin'
      'SELECT   Data0496.RKEY, Data0496.GROUP_NAME, data0496.if_flag,'
      
        '         Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_' +
        'number,'
      '         Data0019.inv_group_name,Data0019.inv_group_desc'
      'FROM     Data0019 INNER JOIN'
      '         Data0496 ON Data0019.rkey = Data0496.group_ptr'
      
        'where    GROUP_PTR  in (select rkey from data0019 where inv_grou' +
        'p_name='#39'vwj'#39' )'
      'order by  data0496.group_name'
      'end')
    Left = 408
    Top = 432
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADOQuery1if_flag: TWordField
      FieldName = 'if_flag'
    end
    object ADOQuery1GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOQuery1ttype: TStringField
      FieldName = 'ttype'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1mask_inv_number: TStringField
      FieldName = 'mask_inv_number'
      Size = 25
    end
    object ADOQuery1inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADOQuery1inv_group_desc: TStringField
      FieldName = 'inv_group_desc'
      Size = 40
    end
    object adoquery1ctype: TStringField
      FieldKind = fkCalculated
      FieldName = 'adoquery1ctype'
      Calculated = True
    end
  end
end

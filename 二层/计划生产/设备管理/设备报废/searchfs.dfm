object Form_fasset: TForm_fasset
  Left = 344
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35774#22791#25628#32034
  ClientHeight = 486
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Left = 2
    Top = 15
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35774#22791#32534#21495':'
  end
  object Edit1: TEdit
    Left = 76
    Top = 11
    Width = 158
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 239
    Top = 9
    Width = 25
    Height = 25
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
    Left = 8
    Top = 47
    Width = 409
    Height = 394
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'FASSET_CODE'
        Title.Caption = #35774#22791#32534#21495
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FASSET_NAME'
        Title.Caption = #35774#22791#21517#31216
        Width = 222
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 116
    Top = 454
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 236
    Top = 454
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 270
    Top = -1
    Width = 148
    Height = 42
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #32534#21495
      #21517#31216)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADO417
    Left = 104
    Top = 184
  end
  object ADO417: TADOQuery
    Connection = dm.ADOCon
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from data0417 where active_flag in (1,2,3,4)')
    Left = 192
    Top = 192
    object ADO417RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO417FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ADO417FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO417FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO417FASSET_TYPE_PTR: TSmallintField
      FieldName = 'FASSET_TYPE_PTR'
    end
    object ADO417DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO417LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADO417PURCH_DATE: TDateTimeField
      FieldName = 'PURCH_DATE'
    end
    object ADO417BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object ADO417REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO417active_flag: TWordField
      FieldName = 'active_flag'
    end
    object ADO417USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADO417USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO417warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO417supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 50
    end
    object ADO417MAKE_VENDER: TStringField
      FieldName = 'MAKE_VENDER'
      Size = 50
    end
    object ADO417confi_date: TDateTimeField
      FieldName = 'confi_date'
    end
    object ADO417confi_userptr: TIntegerField
      FieldName = 'confi_userptr'
    end
    object ADO417install_date: TDateTimeField
      FieldName = 'install_date'
    end
    object ADO417install_userptr: TIntegerField
      FieldName = 'install_userptr'
    end
    object ADO417machine_number: TStringField
      FieldName = 'machine_number'
      Size = 50
    end
    object ADO417id_code: TStringField
      FieldName = 'id_code'
      Size = 15
    end
  end
end

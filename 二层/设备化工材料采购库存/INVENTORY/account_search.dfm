object Form_account: TForm_account
  Left = 272
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24635#24080#24080#30446#25628#32034
  ClientHeight = 453
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = -4
    Top = 12
    Width = 120
    Height = 13
    Alignment = taRightJustify
    Caption = '     '#24635#24080#24080#30446#21517#31216':'
  end
  object Edit1: TEdit
    Left = 119
    Top = 8
    Width = 193
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 441
    Height = 381
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
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
        FieldName = 'gl_acc_number'
        Title.Caption = #24635#24080#24080#30446#21495#30721
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gl_description'
        Title.Caption = #24635#24080#24080#30446#21517#31216
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = #31867#22411
        Width = 54
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 131
    Top = 422
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 210
    Top = 422
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 317
    Top = 5
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 331
    Top = 416
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select rkey,gl_acc_number,gl_description,db_cr,active_flag'
      ' from data0103'
      'where'
      '   active_flag='#39'Y'#39'  and'
      '   HAS_CHILD=0'
      'order by gl_acc_number')
    Left = 360
    Top = 416
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1gl_acc_number: TStringField
      FieldName = 'gl_acc_number'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1gl_description: TStringField
      FieldName = 'gl_description'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1db_cr: TStringField
      FieldName = 'db_cr'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1active_flag: TStringField
      FieldName = 'active_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1type: TStringField
      FieldKind = fkCalculated
      FieldName = 'type'
      Size = 6
      Calculated = True
    end
  end
end

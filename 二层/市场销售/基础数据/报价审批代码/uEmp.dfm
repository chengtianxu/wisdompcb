object frmEmp: TfrmEmp
  Left = 321
  Top = 181
  Width = 426
  Height = 445
  Caption = #29992#25143
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 78
    Top = 8
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#29992#25143#26631#35782':'
  end
  object Edit1: TEdit
    Left = 146
    Top = 3
    Width = 151
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 304
    Top = 1
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
    Left = 0
    Top = 33
    Width = 417
    Height = 339
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_ID'
        Title.Caption = #29992#25143#26631#35782
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Title.Caption = #29992#25143#21517#31216
        Width = 307
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 99
    Top = 385
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 187
    Top = 385
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 368
    Top = 379
  end
  object ADOQuery1: TADOQuery
    Connection = DM.Conn
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'select rkey,USER_LOGIN_NAME as user_id,user_full_name from data0' +
        '073'
      'where user_group_flag=1 and  ACTIVE_FLAG=0'
      'order by user_id')
    Left = 336
    Top = 384
  end
end

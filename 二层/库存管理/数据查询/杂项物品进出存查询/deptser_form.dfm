object Form_deptser: TForm_deptser
  Left = 360
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37096#38376#25628#32034
  ClientHeight = 394
  ClientWidth = 364
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 16
      Width = 65
      Height = 13
      Caption = #37096#38376#32534#21495#65306
    end
    object Edit1: TEdit
      Left = 114
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 261
      Top = 10
      Width = 33
      Height = 25
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 353
    Width = 364
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 364
    Height = 312
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DEPT_CODE'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 256
    Top = 320
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select DEPT_CODE,DEPT_NAME'
      'from data0034'
      'order by DEPT_CODE')
    Left = 288
    Top = 320
    object ADOQuery1DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#32534#21495
      DisplayWidth = 19
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 27
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
end

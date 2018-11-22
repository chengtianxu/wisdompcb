object frmEmployee: TfrmEmployee
  Left = 261
  Top = 273
  Width = 439
  Height = 460
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25628#32034#19994#21153#21592
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Left = 106
    Top = 11
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #19994#21153#21592#20195#30721
  end
  object SpeedButton1: TSpeedButton
    Left = 310
    Top = 7
    Width = 25
    Height = 25
    Hint = #21047#26032
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 176
    Top = 8
    Width = 129
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = Edit1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 421
    Height = 333
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        FieldName = 'REP_CODE'
        Title.Caption = #19994#21153#21592#20195#30721
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_REP_NAME'
        Title.Caption = #19994#21153#21592#21517#31216
        Width = 290
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 124
    Top = 381
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 204
    Top = 381
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = Query1
    OnDataChange = DataSource1DataChange
    Left = 320
    Top = 368
  end
  object Query1: TADOQuery
    Connection = DM.Conn
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT EMPL_CODE as REP_CODE, EMPLOYEE_NAME as SALES_REP_NAME'
      'FROM Data0005'
      'order by EMPL_CODE')
    Left = 360
    Top = 368
    object Query1REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object Query1SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
  end
end

object Form2: TForm2
  Left = 214
  Top = 163
  Width = 450
  Height = 480
  Caption = #24037#24207#24037#36164#35774#23450
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
    Width = 442
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 133
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#24207#20195#30721
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 6
      Width = 62
      Height = 28
      Caption = #20851#38381
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object Edit1: TEdit
      Left = 187
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 442
    Height = 415
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
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
      end
      item
        Expanded = False
        FieldName = #25104#26412#20013#24515
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'wage_flag'
        ReadOnly = False
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADS34
    Left = 64
    Top = 72
  end
  object ADS34: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT DEPT_CODE, DEPT_NAME, wage_flag, '#13#10'case IS_COST_DEPT'#13#10'whe' +
      'n 0 then '#39#21542#39' when 1 then '#39#26159#39#13#10'end as '#25104#26412#20013#24515#13#10#13#10' from Data0034'#13#10'whe' +
      're ttype=1 '
    IndexFieldNames = 'dept_code'
    Parameters = <>
    Left = 32
    Top = 72
    object ADS34DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      DisplayWidth = 10
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS34DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 30
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS34wage_flag: TBooleanField
      DisplayLabel = #35745#31639#24037#36164
      DisplayWidth = 10
      FieldName = 'wage_flag'
    end
    object ADS34DSDesigner: TStringField
      FieldName = #25104#26412#20013#24515
      ReadOnly = True
      Size = 2
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 96
    Top = 72
    object N1: TMenuItem
      Caption = #35774#23450#20026#35745#31639#24037#36164
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#35774#23450
      OnClick = N2Click
    end
  end
end

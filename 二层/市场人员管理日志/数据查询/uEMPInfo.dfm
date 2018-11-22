object frmEMPINFO: TfrmEMPINFO
  Left = 437
  Top = 204
  BorderStyle = bsSingle
  Caption = #25628#32034#21592#24037
  ClientHeight = 416
  ClientWidth = 404
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
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 404
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 57
    Top = 12
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #21592#24037#20195#30721':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 404
    Height = 342
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
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
        FieldName = 'EMPL_CODE'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 241
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 259
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
  object Panel1: TPanel
    Left = 0
    Top = 375
    Width = 404
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 131
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 211
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Edit1: TEdit
    Left = 120
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 3
    OnChange = Edit1Change
  end
  object DataSource1: TDataSource
    DataSet = AQery5
    Left = 192
    Top = 123
  end
  object AQery5: TADOQuery
    Connection = DM.Conn
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT RKEY,EMPL_CODE, EMPLOYEE_NAME,EMPLOYEE_ID,popedom,CASE WH' +
        'EN Data0005.popedom = 0 THEN '#39#26080#39' WHEN Data0005.popedom = 1 THEN ' +
        #39#36319#21333#21592#39
      
        '       WHEN Data0005.popedom = 2 THEN '#39#19994#21153#21592#39' WHEN Data0005.popedo' +
        'm = 3 THEN '#39#33829#38144#32463#29702#39
      '       WHEN Data0005.popedom = 4 THEN '#39#24320#21457#21103#24635#39' END AS ZY'
      'FROM Data0005')
    Left = 232
    Top = 123
    object AQery5EMPL_CODE: TStringField
      DisplayLabel = #21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQery5EMPLOYEE_NAME: TStringField
      DisplayLabel = #21592#24037#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQery5RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQery5EMPLOYEE_ID: TIntegerField
      FieldName = 'EMPLOYEE_ID'
    end
    object AQery5popedom: TWordField
      FieldName = 'popedom'
    end
    object AQery5ZY: TStringField
      FieldName = 'ZY'
      ReadOnly = True
      Size = 8
    end
  end
end

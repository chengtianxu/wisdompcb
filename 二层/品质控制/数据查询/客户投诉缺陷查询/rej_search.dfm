object Form_rej: TForm_rej
  Left = 322
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25298#25910#21697#25628#32034
  ClientHeight = 410
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 11
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #25298#25910#21697#20195#30721':'
  end
  object Edit1: TEdit
    Left = 137
    Top = 8
    Width = 138
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 6
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
    Top = 40
    Width = 425
    Height = 329
    DataSource = DataSource4
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'REJ_CODE'
        Title.Color = clRed
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REJECT_DESCRIPTION'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#21035
        ReadOnly = False
        Title.Caption = #31867#22411
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Width = 71
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 136
    Top = 380
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 216
    Top = 380
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource4: TDataSource
    DataSet = AQ39
    OnDataChange = DataSource4DataChange
    Left = 98
    Top = 248
  end
  object AQ39: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT RKEY,REJ_CODE,REJECT_DESCRIPTION,'
      'case REJECT_DEFECT_FLAG when '#39'D'#39' then '#39#19981#33391#21697#39
      'when '#39'R'#39' then '#39#25253#24223#21697#39' end as '#31867#21035','
      'case rej_type when 0 then '#39#24037#21378#25253#24223#39
      'when 1 then '#39#20379#24212#21830#25253#24223#39
      'when 2 then '#39#23458#25143#25253#24223#39
      'when 3 then '#39#24066#22330#25253#24223#39' end as '#31867#22411
      'FROM  Data0039'
      'ORDER BY REJ_CODE')
    Left = 131
    Top = 246
    object AQ39RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ39REJ_CODE: TStringField
      DisplayLabel = #32570#38519#20195#30721
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object AQ39REJECT_DESCRIPTION: TStringField
      DisplayLabel = #32570#38519#21517#31216
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object AQ39DSDesigner: TStringField
      FieldName = #31867#21035
      ReadOnly = True
      Size = 6
    end
    object AQ39DSDesigner2: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 10
    end
  end
end

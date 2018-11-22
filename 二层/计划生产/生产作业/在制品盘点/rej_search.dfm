object Form_rej: TForm_rej
  Left = 322
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25298#25910#21697#25628#32034
  ClientHeight = 410
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ËÎÌו'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 55
    Top = 16
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#25298#25910#21697#20195#30721':'
  end
  object Edit1: TEdit
    Left = 129
    Top = 13
    Width = 138
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 11
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
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'ËÎÌו'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'REJ_CODE'
        Title.Caption = #25298#25910#21697#20195#30721
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REJECT_DESCRIPTION'
        Title.Caption = #25298#25910#21697#21517#31216
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ttype'
        Title.Caption = #31867#22411
        Width = 80
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 127
    Top = 380
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 207
    Top = 380
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 336
    Top = 373
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT rkey,REJ_CODE, REJECT_DESCRIPTION, '#39#25253#24223#21697#39' AS ttype'
      'FROM dbo.Data0039'
      'WHERE (REJECT_DEFECT_FLAG = '#39'R'#39')')
    Left = 366
    Top = 372
    object ADOQuery1REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object ADOQuery1REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1ttype: TStringField
      FieldName = 'ttype'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
end

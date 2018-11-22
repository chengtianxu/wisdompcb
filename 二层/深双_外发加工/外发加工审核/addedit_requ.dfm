object Form3: TForm3
  Left = 248
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#22806#21457#39033#30446
  ClientHeight = 427
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 79
    Top = 32
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#26412#21378#32534#21495':'
  end
  object Label4: TLabel
    Left = 247
    Top = 259
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#21333#20301':'
  end
  object Label5: TLabel
    Left = 86
    Top = 259
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#22806#21457#25968#37327':'
  end
  object Label7: TLabel
    Left = 67
    Top = 314
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #35201#27714#21040#36135#26085#26399':'
  end
  object Label13: TLabel
    Left = 119
    Top = 345
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880':'
  end
  object Label15: TLabel
    Left = 112
    Top = 90
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#35268#26684':'
  end
  object DBText4: TDBText
    Left = 160
    Top = 58
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'MANU_PART_DESC'
    DataSource = DM.DataSource3
  end
  object Label1: TLabel
    Left = 52
    Top = 118
    Width = 100
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#38754#31215'('#24179#26041#31859'):'
  end
  object Label3: TLabel
    Left = 39
    Top = 147
    Width = 113
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#38754#31215'('#24179#26041#33521#23610'):'
  end
  object Label6: TLabel
    Left = 112
    Top = 174
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23618#25968':'
  end
  object Label8: TLabel
    Left = 86
    Top = 204
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23436#25104#26495#21402':'
  end
  object Label9: TLabel
    Left = 86
    Top = 232
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26368#23567#23380#24452':'
  end
  object Label10: TLabel
    Left = 119
    Top = 287
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #21333#20215':'
  end
  object BitBtn3: TBitBtn
    Left = 299
    Top = 26
    Width = 25
    Height = 25
    TabOrder = 0
    TabStop = False
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object DBEdit1: TDBEdit
    Left = 160
    Top = 255
    Width = 112
    Height = 21
    DataField = 'QUANTITY'
    DataSource = DM.DataSource3
    TabOrder = 8
    OnExit = DBEdit1Exit
  end
  object Button1: TButton
    Left = 172
    Top = 387
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 13
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 252
    Top = 387
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 15
    OnClick = Button2Click
  end
  object DBEdit5: TDBEdit
    Left = 160
    Top = 341
    Width = 290
    Height = 21
    DataField = 'REMARTK'
    DataSource = DM.DataSource3
    TabOrder = 12
  end
  object Button3: TButton
    Left = 212
    Top = 387
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 14
    Visible = False
    OnClick = Button3Click
  end
  object DBEdit6: TDBEdit
    Left = 160
    Top = 28
    Width = 132
    Height = 21
    DataField = 'MANU_PART_NUMBER'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 1
  end
  object DBComboBox1: TDBComboBox
    Left = 325
    Top = 256
    Width = 75
    Height = 21
    Style = csDropDownList
    DataField = 'UNIT_NAME'
    DataSource = DM.DataSource3
    ItemHeight = 13
    Items.Strings = (
      'PNL'
      'SET'
      'PCS')
    TabOrder = 9
  end
  object DBEdit3: TDBEdit
    Left = 160
    Top = 114
    Width = 113
    Height = 21
    DataField = 'AREA_SQM'
    DataSource = DM.DataSource3
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 160
    Top = 142
    Width = 113
    Height = 21
    DataField = 'AREA_SQF'
    DataSource = DM.DataSource3
    TabOrder = 4
  end
  object DBEdit8: TDBEdit
    Left = 160
    Top = 171
    Width = 112
    Height = 21
    DataField = 'LAYER'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object DBEdit9: TDBEdit
    Left = 160
    Top = 199
    Width = 112
    Height = 21
    DataField = 'THINK'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object DBComboBox2: TDBComboBox
    Left = 160
    Top = 86
    Width = 145
    Height = 21
    DataField = 'STANDARD'
    DataSource = DM.DataSource3
    ItemHeight = 13
    TabOrder = 2
  end
  object DBEdit7: TDBEdit
    Left = 160
    Top = 227
    Width = 112
    Height = 21
    DataField = 'MIN_aperture'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object DateTimePicker1: TDateTimePicker
    Left = 160
    Top = 311
    Width = 113
    Height = 21
    Date = 38678.000000000000000000
    Time = 38678.000000000000000000
    TabOrder = 11
  end
  object DBEdit2: TDBEdit
    Left = 160
    Top = 283
    Width = 112
    Height = 21
    DataField = 'PRICE'
    DataSource = DM.DataSource3
    TabOrder = 10
    OnExit = DBEdit1Exit
  end
  object ADO279: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0278.SPEC_RKEY, dbo.Data0279.PARAMETER_VALUE'
      'FROM dbo.Data0278 INNER JOIN'
      
        '      dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Data0279.PARAMETER' +
        '_PTR'
      'WHERE (dbo.Data0279.SOURCE_PTR = :rkey25)')
    Left = 352
    Top = 40
    object ADO279SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 2
    end
    object ADO279PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
  end
  object ADOMIN_aperture: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0494.PARAMETER_VALUE'
      'FROM dbo.Data0038 INNER JOIN'
      '      dbo.Data0494 ON '
      '      dbo.Data0038.RKEY = dbo.Data0494.ROUTE_STEP_PTR INNER JOIN'
      
        '      dbo.Data0278 ON dbo.Data0494.PARAMETER_PTR = dbo.Data0278.' +
        'RKEY'
      'WHERE (dbo.Data0278.SPEC_RKEY = '#39'AP'#39') AND'
      '(Data0038.SOURCE_PTR=:rkey25)'
      'ORDER BY dbo.Data0494.PARAMETER_VALUE')
    Left = 352
    Top = 72
    object ADOMIN_aperturePARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
  end
end

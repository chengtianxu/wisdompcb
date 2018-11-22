object frmEdit_Data0348: TfrmEdit_Data0348
  Left = 294
  Top = 65
  BorderStyle = bsDialog
  Caption = #25253#20215#35268#21017#20844#24335#35774#32622
  ClientHeight = 551
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 21
    Width = 39
    Height = 13
    Caption = #21517#31216#65306
  end
  object Label4: TLabel
    Left = 32
    Top = 413
    Width = 49
    Height = 13
    Caption = '(/Part)'
  end
  object Label2: TLabel
    Left = 32
    Top = 345
    Width = 49
    Height = 13
    Caption = '(/Part)'
  end
  object Label3: TLabel
    Left = 32
    Top = 252
    Width = 49
    Height = 13
    Caption = '(/Part)'
  end
  object Label5: TLabel
    Left = 40
    Top = 448
    Width = 59
    Height = 13
    Caption = #20844#24335#21442#25968':'
  end
  object Label7: TLabel
    Left = 272
    Top = 48
    Width = 108
    Height = 13
    Caption = #27611#21033#29575#65306'       %'
  end
  object DBEdit1: TDBEdit
    Left = 80
    Top = 16
    Width = 321
    Height = 21
    DataField = 'ADDER_NAME'
    DataSource = frmMain_167.dsMaster
    ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
    TabOrder = 0
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 32
    Top = 46
    Width = 89
    Height = 89
    Caption = #36153#29992#31867#21035
    DataField = 'TTYPE'
    DataSource = frmMain_167.dsMaster
    Items.Strings = (
      #29305#27530#24037#33402
      #29305#21035#36153#29992)
    TabOrder = 1
    Values.Strings = (
      '1'
      '2')
    OnChange = DBRadioGroup1Change
  end
  object DBRadioGroup2: TDBRadioGroup
    Left = 147
    Top = 46
    Width = 110
    Height = 89
    Caption = #35745#20215#27169#24335
    DataField = 'PCENTS'
    DataSource = frmMain_167.dsMaster
    Items.Strings = (
      #37329#39069
      #24635#20215#30334#20998#27604
      #26448#26009#30334#20998#27604
      #22522#20215#30334#20998#27604)
    TabOrder = 2
    Values.Strings = (
      '0'
      '1'
      '2'
      '3')
  end
  object btnSave: TButton
    Left = 424
    Top = 48
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 424
    Top = 96
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 32
    Top = 137
    Width = 473
    Height = 71
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 5
    object SpeedButton1: TSpeedButton
      Left = 192
      Top = 40
      Width = 23
      Height = 22
      Caption = '+'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 215
      Top = 40
      Width = 23
      Height = 22
      Caption = '-'
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 238
      Top = 40
      Width = 22
      Height = 22
      Caption = '*'
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 260
      Top = 40
      Width = 22
      Height = 22
      Caption = '/'
      OnClick = SpeedButton1Click
    end
    object SpeedButton5: TSpeedButton
      Left = 282
      Top = 40
      Width = 22
      Height = 22
      Caption = '='
      OnClick = SpeedButton1Click
    end
    object SpeedButton6: TSpeedButton
      Left = 304
      Top = 40
      Width = 22
      Height = 22
      Caption = '<'
      OnClick = SpeedButton1Click
    end
    object SpeedButton7: TSpeedButton
      Left = 326
      Top = 40
      Width = 22
      Height = 22
      Caption = '>'
      OnClick = SpeedButton1Click
    end
    object SpeedButton8: TSpeedButton
      Left = 348
      Top = 40
      Width = 22
      Height = 22
      Caption = '<>'
      OnClick = SpeedButton1Click
    end
    object SpeedButton9: TSpeedButton
      Left = 370
      Top = 40
      Width = 22
      Height = 22
      Caption = '<='
      OnClick = SpeedButton1Click
    end
    object SpeedButton10: TSpeedButton
      Left = 392
      Top = 40
      Width = 22
      Height = 22
      Caption = '>='
      OnClick = SpeedButton1Click
    end
    object SpeedButton11: TSpeedButton
      Left = 414
      Top = 40
      Width = 22
      Height = 22
      Caption = 'IF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton12: TSpeedButton
      Left = 436
      Top = 40
      Width = 22
      Height = 22
      Caption = '()'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton13: TSpeedButton
      Left = 72
      Top = 40
      Width = 49
      Height = 22
      Caption = #28165#38500
      OnClick = SpeedButton13Click
    end
    object SpeedButton14: TSpeedButton
      Left = 8
      Top = 40
      Width = 49
      Height = 22
      Caption = #39564#35777
      OnClick = SpeedButton14Click
    end
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = #24037#31243#34920#21333#65306
    end
    object SpeedButton15: TSpeedButton
      Left = 312
      Top = 8
      Width = 49
      Height = 22
      Caption = #21442#25968
      OnClick = SpeedButton15Click
    end
    object Combobox3: TComboBox
      Left = 72
      Top = 8
      Width = 209
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
      ItemHeight = 13
      TabOrder = 0
      OnChange = Combobox3Change
    end
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 228
    Width = 81
    Height = 17
    Caption = #35745#31639#25104#26412#65306
    TabOrder = 6
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 321
    Width = 81
    Height = 17
    Caption = #26368#20302#25104#26412#65306
    TabOrder = 7
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 16
    Top = 389
    Width = 81
    Height = 17
    Caption = #26368#39640#25104#26412#65306
    TabOrder = 8
    OnClick = RadioButton3Click
  end
  object Memo1: TDBMemo
    Left = 104
    Top = 212
    Width = 401
    Height = 98
    DataField = 'FORMULA'
    DataSource = frmMain_167.dsMaster
    ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
    TabOrder = 9
  end
  object Memo2: TDBMemo
    Left = 104
    Top = 313
    Width = 401
    Height = 65
    DataField = 'MIN_VALUE'
    DataSource = frmMain_167.dsMaster
    ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
    TabOrder = 10
  end
  object Memo3: TDBMemo
    Left = 104
    Top = 381
    Width = 401
    Height = 57
    DataField = 'MAX_VALUE'
    DataSource = frmMain_167.dsMaster
    ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
    TabOrder = 11
  end
  object DBGrid1: TDBGrid
    Left = 104
    Top = 440
    Width = 401
    Height = 105
    DataSource = dsParamList
    ImeName = #20013#25991' ('#31616#20307') - '#29579#30721#20116#31508#22411'86'#29256
    ReadOnly = True
    TabOrder = 12
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Parameter_name'
        Title.Alignment = taCenter
        Title.Caption = #21442#25968#21517#31216
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Parameter_Desc'
        Title.Alignment = taCenter
        Title.Caption = #21442#25968#25551#36848
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Code'
        Title.Alignment = taCenter
        Title.Caption = #21333#20301
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Type'
        Title.Alignment = taCenter
        Title.Caption = #25968#25454#31867#22411
        Width = 65
        Visible = True
      end>
  end
  object DBCheckBox1: TDBCheckBox
    Left = 409
    Top = 20
    Width = 97
    Height = 17
    Caption = #26377#25928
    DataField = 'ActiveFlag'
    DataSource = frmMain_167.dsMaster
    TabOrder = 13
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit2: TDBEdit
    Left = 320
    Top = 44
    Width = 49
    Height = 21
    DataField = 'rate_margin'
    DataSource = frmMain_167.dsMaster
    TabOrder = 14
  end
  object adsUpdate_Sub: TADODataSet
    Connection = frmMain_167.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0430 where source_ptr=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 48
    Top = 507
  end
  object ADOQuery1: TADOQuery
    Connection = frmMain_167.ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT * from data0278')
    Left = 80
    Top = 507
  end
  object dsParamList: TDataSource
    DataSet = adsParamList
    Left = 112
    Top = 507
  end
  object adsParamList: TADODataSet
    Connection = frmMain_167.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select m.Unit_ptr,D.Parameter_name,D.Parameter_Desc,U.Unit_Code,' +
      'case d.data_Type when 2 then '#39#23383#31526#22411#39' when 1 then '#39#25968#23383#22411#39' end as Data' +
      '_Type from data0430 m inner join data0278 d on m.unit_ptr=d.rkey' +
      ' '#13#10'inner join Data0002 U on U.rkey=d.unit_ptr'#13#10'where m.source_pt' +
      'r=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 16
    Top = 507
  end
end

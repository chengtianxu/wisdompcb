object Form_supp: TForm_supp
  Left = 459
  Top = 192
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#25628#32034
  ClientHeight = 450
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    436
    450)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 11
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830#20195#30721':'
  end
  object Edit1: TEdit
    Left = 89
    Top = 6
    Width = 213
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 130
    Top = 422
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 211
    Top = 422
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 32
    Width = 436
    Height = 384
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Title.Caption = #20379#24212#21830#20195#30721
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'SUPPLIER_NAME'
        Footers = <>
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 205
      end
      item
        EditButtons = <>
        FieldName = 'supper_status'
        Footers = <>
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 68
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 304
    Top = 401
  end
  object ADOQuery1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT'#13#10'  Data0023.RKEY,  Data0023.CODE,'#13#10'  Data0023.SUPPLIER_NA' +
      'ME,'#13#10'case data0023.status when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' end ' +
      'as supper_status, data0023.currency_ptr,data0023.ABBR_NAME'#13#10#13#10'FR' +
      'OM  Data0023'#13#10
    IndexFieldNames = 'CODE'
    Parameters = <>
    Left = 336
    Top = 400
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOQuery1supper_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'supper_status'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
  end
end

object FrmInvSearch2: TFrmInvSearch2
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#21407#26448#26009#25628#32034
  ClientHeight = 453
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 623
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 80
    Top = 13
    Width = 121
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29289#26009#25551#36848
  end
  object Edit1: TEdit
    Left = 209
    Top = 9
    Width = 210
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 425
    Top = 6
    Width = 25
    Height = 25
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
    Width = 623
    Height = 379
    Align = alClient
    DataSource = DataSource1
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
    Columns = <
      item
        Expanded = False
        FieldName = 'description'
        Title.Caption = #29289#26009#25551#36848
        Width = 303
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_code'
        Title.Caption = #21333#20301
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_code'
        Title.Caption = #36135#24065
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        Title.Alignment = taRightJustify
        Title.Caption = #21333#20215
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Recd'
        Title.Caption = #20837#24211#26085#26399
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_on_hand'
        Title.Alignment = taRightJustify
        Title.Caption = #24211#23384#25968#37327
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 623
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 243
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 323
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select data0072.description,Data0002.unit_code,'
      'data0001.curr_code,data0072.unit_price,'
      'data0235.rkey,data0235.quan_on_hand,data0235.Date_Recd'
      'from data0235,data0072,data0002,data0070,data0001'
      'where data0235.d0072_ptr=data0072.rkey'
      'and data0235.quan_on_hand >0'
      'and data0072.unit_ptr=data0002.rkey'
      'and data0072.poptr=data0070.rkey'
      'and data0070.currency_ptr=data0001.rkey')
    Left = 440
    Top = 416
    object ADOQuery1description: TStringField
      FieldName = 'description'
      Size = 60
    end
    object ADOQuery1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOQuery1curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADOQuery1unit_price: TFloatField
      FieldName = 'unit_price'
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1quan_on_hand: TFloatField
      FieldName = 'quan_on_hand'
    end
    object ADOQuery1Date_Recd: TDateTimeField
      FieldName = 'Date_Recd'
      DisplayFormat = 'yyyy-mm-dd'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 416
  end
end

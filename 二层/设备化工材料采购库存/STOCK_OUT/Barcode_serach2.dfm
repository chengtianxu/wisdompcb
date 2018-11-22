object FrmBCSearch2: TFrmBCSearch2
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Barcode'#21495#25628#32034
  ClientHeight = 453
  ClientWidth = 739
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
    Width = 739
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 136
    Top = 13
    Width = 112
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#20195#21495':'
  end
  object Edit1: TEdit
    Left = 256
    Top = 9
    Width = 210
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 470
    Top = 8
    Width = 24
    Height = 23
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
    Width = 739
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
        FieldName = 'gon_number'
        Title.Caption = #20986#20179#21333#21495
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ref_number'
        Title.Caption = #39046#26009#21333#21495
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'create_date'
        Title.Caption = #20986#20179#26085#26399
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = #26448#26009#20195#21495
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_code'
        Title.Caption = #21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'barcode_id'
        Title.Caption = #22791#27880
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #20379#24212#21830
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Title.Alignment = taRightJustify
        Title.Caption = #21457#25918#25968#37327
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_description'
        Title.Caption = #26448#26009#25551#36848
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_date'
        Title.Caption = #26469#36135#26085#26399
        Width = 68
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 739
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 291
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 371
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = FrmMain4.ADOQuery1
    Left = 120
    Top = 408
  end
end

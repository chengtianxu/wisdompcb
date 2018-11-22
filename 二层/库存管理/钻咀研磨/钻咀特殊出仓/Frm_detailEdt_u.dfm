object Frm_detailEdt: TFrm_detailEdt
  Left = 609
  Top = 127
  BorderStyle = bsDialog
  Caption = #21487#29992#24211#23384
  ClientHeight = 439
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 240
    Top = 409
    Width = 75
    Height = 25
    Caption = #21457#25918
    Default = True
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 384
    Top = 409
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    Kind = bkClose
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 34
    Width = 674
    Height = 367
    Align = alTop
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = BitBtn1Click
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'grn_number'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'create_date'
        Footers = <>
        Title.Alignment = taCenter
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'location_code'
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'location_name'
        Footers = <>
        Title.Alignment = taCenter
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'inv_part_description'
        Footers = <>
        Title.Alignment = taCenter
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'Quan_valid'
        Footer.FieldName = 'Quan_valid'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'oh_degree'
        Footers = <>
        Title.Alignment = taCenter
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'Type_c'
        Footers = <>
        Title.Alignment = taCenter
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 34
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 52
      Height = 13
      Caption = #20837#24211#21333#21495
    end
    object Label2: TLabel
      Left = 295
      Top = 9
      Width = 52
      Height = 13
      Caption = #30740#30952#27425#25968
    end
    object Label3: TLabel
      Left = 416
      Top = 10
      Width = 52
      Height = 13
      Caption = #21457#25918#25968#37327
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 80
      Top = 6
      Width = 143
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 352
      Top = 5
      Width = 49
      Height = 21
      TabOrder = 1
      OnChange = Edit2Change
    end
    object Edit3: TEdit
      Left = 472
      Top = 6
      Width = 89
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Button1: TButton
      Left = 568
      Top = 4
      Width = 49
      Height = 25
      Caption = #21457#25918
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO160
    Left = 552
    Top = 240
  end
end

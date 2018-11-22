object FrmWIPStkDetail: TFrmWIPStkDetail
  Left = 246
  Top = 287
  Width = 663
  Height = 280
  Caption = #26597#30475#25209#21495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 655
    Height = 201
    Align = alClient
    DataSource = FrmMain.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'barcode_id'
        Title.Caption = 'Barcode'#21495
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_on_hand'
        Title.Alignment = taRightJustify
        Title.Caption = #24211#23384#25968#37327
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        Title.Alignment = taRightJustify
        Title.Caption = #20215#26684
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'expire_date'
        Title.Alignment = taCenter
        Title.Caption = #26377#25928#26399
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #20379#24212#21830
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ref_number'
        Title.Caption = #21442#32771#21495
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tdate'
        Title.Caption = #26469#36135#26085#26399
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'po_number'
        Title.Caption = #37319#36141#21333#21495
        Width = 98
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 201
    Width = 655
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 232
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
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
      Left = 344
      Top = 7
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
end

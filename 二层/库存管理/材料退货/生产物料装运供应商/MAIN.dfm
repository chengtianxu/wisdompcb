object Form1: TForm1
  Left = 316
  Top = 135
  Width = 705
  Height = 534
  Caption = #35013#36816#21040#20379#24212#21830
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
    Top = 329
    Width = 697
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      697
      37)
    object Label1: TLabel
      Left = 55
      Top = 12
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #36864#36135#24037#21378':'
    end
    object Label2: TLabel
      Left = 233
      Top = 15
      Width = 7
      Height = 13
    end
    object BitBtn1: TBitBtn
      Left = 620
      Top = 5
      Width = 57
      Height = 25
      Cursor = crHandPoint
      Hint = #36864#20986
      Anchors = [akTop, akRight]
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object Edit1: TEdit
      Left = 117
      Top = 8
      Width = 77
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 201
      Top = 6
      Width = 25
      Height = 25
      TabOrder = 2
      OnClick = BitBtn2Click
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
    object Button1: TButton
      Left = 557
      Top = 5
      Width = 61
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #35013#36816#26597#35810
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 493
      Top = 5
      Width = 61
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #25253#34920#23450#20041
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object Memo1: TMemo
    Left = 40
    Top = 248
    Width = 633
    Height = 161
    Lines.Strings = (
      'select data0022.rkey,data0022.source_ptr,data0022.inventory_ptr,'
      '       data0017.inv_part_number,data0017.inv_part_description,'
      
        '       data0023.code,data0023.supplier_name,data0023.CONTACT_NAM' +
        'E_1,'
      
        '       data0023.BILLING_ADDRESS_1,data0456.ship_date,data0022.pr' +
        'ice,'
      '       data0015.warehouse_code,data0015.warehouse_name,'
      '       data0022.quan_to_be_shipped,data0022.quan_returned,'
      '       data0022.barcode_id,data0456.ttype,data0022.quantity,'
      
        '      data0002.unit_name,data0022.rohs,data0022.SUPPLIER2,data00' +
        '22.quan_on_hand'
      'from data0022,data0017,data0023,data0015,data0456,data0002'
      'where data0022.grn_ptr=data0456.rkey and'
      '      data0022.inventory_ptr=data0017.rkey and'
      '      data0456.supp_ptr=data0023.rkey and'
      '      data0456.warehouse_ptr=data0015.rkey   and'
      '      data0456.warehouse_ptr=@rkey and'
      '      data0022.LOCATION_PTR_FROM=data0002.rkey  and '
      '      data0022.quan_to_be_shipped>0')
    ReadOnly = True
    TabOrder = 1
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 37
    Width = 697
    Height = 292
    Align = alTop
    DataSource = DM.DS1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'inv_part_number'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26448#26009#32534#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Title.TitleButton = True
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'inv_part_description'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 171
      end
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20379#24212#21830#20195#30721
        Title.TitleButton = True
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'quan_to_be_shipped'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24453#35013#36816#25968#37327
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'unit_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'rohs'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'barcode_id'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Title.TitleButton = True
        Width = 112
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 332
    Width = 697
    Height = 168
    Align = alClient
    DataSource = DM.DS2
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TDATE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_REJD'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'reject_description'
        Footers = <>
        Title.Alignment = taCenter
        Width = 167
      end
      item
        EditButtons = <>
        FieldName = 'user_full_name'
        Footers = <>
        Title.Alignment = taCenter
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'REFERENCE_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Width = 172
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 408
    Top = 104
    object N1: TMenuItem
      Caption = #35013#36816
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #36864#20179
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #21047#26032
      OnClick = N4Click
    end
  end
end

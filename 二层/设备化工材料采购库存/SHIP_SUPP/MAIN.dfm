object Form1: TForm1
  Left = 220
  Top = 125
  Width = 697
  Height = 494
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 46
    Width = 689
    Height = 418
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = #26448#26009#20195#30721
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #20379#24212#21830#20195#30721
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_to_be_shipped'
        Title.Caption = #24453#35013#36816#25968#37327
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'barcode_id'
        Title.Caption = #22791#27880
        Width = 145
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      689
      46)
    object Label1: TLabel
      Left = 55
      Top = 21
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #36864#36135#24037#21378':'
    end
    object Label2: TLabel
      Left = 233
      Top = 22
      Width = 7
      Height = 13
    end
    object csi_rkey: TLabel
      Left = 399
      Top = 6
      Width = 7
      Height = 13
      Caption = '1'
      Visible = False
    end
    object db_ptr: TLabel
      Left = 412
      Top = 6
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object vprev: TLabel
      Left = 428
      Top = 6
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object user_ptr: TLabel
      Left = 24
      Top = 24
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 612
      Top = 12
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
      Top = 17
      Width = 77
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 201
      Top = 15
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
      Left = 549
      Top = 12
      Width = 61
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #35013#36816#26597#35810
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 485
      Top = 12
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
    Left = 2
    Top = 224
    Width = 532
    Height = 235
    Lines.Strings = (
      'select data0022.rkey,data0022.source_ptr,data0022.inventory_ptr,'
      '       data0017.inv_part_number,data0017.inv_part_description,'
      
        '       data0023.code,data0023.supplier_name,data0023.CONTACT_NAM' +
        'E_1,'
      '       data0023.BILLING_ADDRESS_1,data0023.BILLING_ADDRESS_2,'
      
        '       data0023.BILLING_ADDRESS_3,data0456.ship_date,data0022.pr' +
        'ice,'
      '       data0015.warehouse_code,data0015.warehouse_name,'
      '       data0022.quan_to_be_shipped,data0022.quan_returned,'
      '       data0022.barcode_id,data0456.ttype,data0022.quantity'
      'from data0022,data0017,data0023,data0015,data0456'
      'where data0022.grn_ptr=data0456.rkey and'
      '      data0022.inventory_ptr=data0017.rkey and'
      '      data0456.supp_ptr=data0023.rkey and'
      '      data0456.warehouse_ptr=data0015.rkey   and'
      '      data0456.warehouse_ptr=@rkey and'
      '      data0022.quan_to_be_shipped>0')
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 648
    Top = 232
    object N1: TMenuItem
      Caption = #35013#36816
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21047#26032
      OnClick = N2Click
    end
  end
end

object Form_invser: TForm_invser
  Left = 68
  Top = 167
  Width = 1290
  Height = 572
  Caption = #24211#23384#26448#26009#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1274
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 272
      Top = 13
      Width = 52
      Height = 13
      Caption = #26448#26009#32534#21495
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 4
      Width = 60
      Height = 29
      Caption = #36864#20986
      TabOrder = 0
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 72
      Top = 4
      Width = 60
      Height = 29
      Caption = #21457#25918
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000777770FFFFFFFFF0777770F8888888F0777770FFFFFFFFF0
        777770F888888FF0777770FFFFFFFFF0777770F8888888F0777770FFFFFFFFF0
        7777744444444444777774444444444477177777777777777717777777777771
        7177777777777771177777777777777111777777777777777777}
    end
    object Edit1: TEdit
      Left = 328
      Top = 9
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 2
      OnChange = Edit1Change
    end
    object BitBtn3: TBitBtn
      Left = 464
      Top = 7
      Width = 25
      Height = 25
      TabOrder = 3
      OnClick = BitBtn3Click
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 1274
    Height = 497
    Align = alClient
    DataSource = DM.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = BitBtn2Click
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Alignment = taCenter
        Title.Color = clRed
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Alignment = taCenter
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Alignment = taCenter
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Title.Alignment = taCenter
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Title.Alignment = taCenter
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supplier2'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Images = DM.ImageList1
    Left = 223
    Top = 5
    object N1: TMenuItem
      Caption = #21457#36865
      ImageIndex = 0
      OnClick = BitBtn2Click
    end
  end
end

object Frm_Customer: TFrm_Customer
  Left = 398
  Top = 147
  Width = 486
  Height = 592
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26597#25214#23458#25143
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      478
      41)
    object Label1: TLabel
      Left = 129
      Top = 14
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 192
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 320
      Top = 8
      Width = 25
      Height = 22
      TabOrder = 1
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
  object DBGrd: TDBGridEh
    Left = 0
    Top = 41
    Width = 478
    Height = 483
    Align = alClient
    DataSource = DM.DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    HorzScrollBar.Visible = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrdDblClick
    OnTitleClick = DBGrdTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'cust_code'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'customer_name'
        Footers = <>
        Title.Caption = #23458#25143#21517#31216
        Width = 352
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 524
    Width = 478
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830' '#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462' '#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end

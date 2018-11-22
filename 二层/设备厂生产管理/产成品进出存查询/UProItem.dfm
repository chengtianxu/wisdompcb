object Item_Form: TItem_Form
  Left = 372
  Top = 113
  Width = 406
  Height = 502
  Caption = #20135#21697#31867#22411#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 59
      Top = 13
      Width = 97
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
    end
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object Edit1: TEdit
      Left = 165
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = Edit1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 295
      Top = 7
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
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
  object Panel2: TPanel
    Left = 0
    Top = 409
    Width = 398
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 102
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 214
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 398
    Height = 368
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        Footers = <>
        Width = 114
      end
      item
        EditButtons = <>
        Footers = <>
        Width = 180
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOQuery1
    Left = 344
    Top = 8
  end
end

object FrmProdStock: TFrmProdStock
  Left = 247
  Top = 111
  Width = 670
  Height = 620
  Caption = #20135#21697#20998#20179#24211#23384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 545
    Width = 662
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 230
      Top = 8
      Width = 75
      Height = 25
      Caption = #21457#25918
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 662
    Height = 545
    Align = alClient
    DataSource = DM.ds08
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_DESC'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_on_hand_01'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_onhand_08'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 33
        Visible = True
      end>
  end
end

object frmFindShip: TfrmFindShip
  Left = 239
  Top = 174
  Width = 773
  Height = 480
  Caption = #20986#20179#21333#25628#32034
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      765
      40)
    object Label1: TLabel
      Left = 35
      Top = 17
      Width = 54
      Height = 12
      Alignment = taRightJustify
      Caption = #20986#20179#21333#21495':'
    end
    object Edit1: TEdit
      Left = 98
      Top = 13
      Width = 197
      Height = 20
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 300
      Top = 11
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
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
    object RadioGroup1: TRadioGroup
      Left = 397
      Top = 2
      Width = 323
      Height = 35
      Anchors = [akTop]
      Caption = #25628#32034#26465#20214#13#10
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        #20986#20179#21333#21495
        #20135#21697#32534#21495
        #20135#21697#21517#31216
        #20135#21697#35268#26684)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 765
    Height = 360
    Align = alClient
    DataSource = dm.dsFindShip
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'rkey'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sales_order'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OUTNUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_DESC'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'returen_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TStatus'
        Width = 53
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 400
    Width = 765
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      765
      46)
    object Label2: TLabel
      Left = 12
      Top = 7
      Width = 24
      Height = 12
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = ' '#20174':'
    end
    object Label3: TLabel
      Left = 12
      Top = 29
      Width = 24
      Height = 12
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = ' '#21040':'
    end
    object Button1: TButton
      Left = 184
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 308
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object dtpk1: TDateTimePicker
      Left = 41
      Top = 2
      Width = 98
      Height = 20
      Anchors = [akTop]
      Date = 40909.000000000000000000
      Time = 40909.000000000000000000
      TabOrder = 2
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 41
      Top = 25
      Width = 98
      Height = 20
      Anchors = [akTop]
      Date = 41274.000000000000000000
      Time = 41274.000000000000000000
      TabOrder = 3
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object rdgStatus: TRadioGroup
      Left = 384
      Top = 6
      Width = 375
      Height = 35
      Anchors = [akTop]
      Columns = 6
      ItemIndex = 0
      Items.Strings = (
        #20840#37096
        #26410#25552#20132
        #24453#23457#26680
        #24050#23457#26680
        #24050#20837#36134
        #34987#36864#22238)
      TabOrder = 4
      Visible = False
      OnClick = rdgStatusClick
    end
  end
end

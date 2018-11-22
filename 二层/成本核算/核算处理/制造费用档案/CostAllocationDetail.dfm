object frm_CostAllocationDetail: Tfrm_CostAllocationDetail
  Left = 233
  Top = 189
  Width = 824
  Height = 501
  Caption = #25104#26412#20998#37197#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 816
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 208
      Top = 11
      Width = 46
      Height = 13
      Caption = #20316#19994#21333':'
    end
    object BitBtn4: TBitBtn
      Left = 59
      Top = 4
      Width = 60
      Height = 29
      Hint = #23548#20986'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object Edit1: TEdit
      Left = 272
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
    object BitBtn3: TBitBtn
      Left = 1
      Top = 4
      Width = 60
      Height = 29
      Hint = #21462#28040#36864#20986
      Caption = #21462#28040
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 37
    Width = 816
    Height = 411
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 138
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 191
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Width = 122
      end
      item
        EditButtons = <>
        FieldName = 'STEP'
        Footers = <>
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'QTY'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'WTYPE'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'sq_total'
        Footer.FieldName = 'sq_total'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'matl_total'
        Footer.FieldName = 'matl_total'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 157
      end
      item
        EditButtons = <>
        FieldName = 'ovhd_total'
        Footer.FieldName = 'ovhd_total'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 163
      end
      item
        EditButtons = <>
        FieldName = 'ovhd1_total'
        Footer.FieldName = 'ovhd1_total'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 154
      end
      item
        EditButtons = <>
        FieldName = 'outsource_total'
        Footer.FieldName = 'outsource_total'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 147
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 448
    Width = 816
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = dm.ADOD410
    Left = 280
    Top = 128
  end
end

object Frm_YCB: TFrm_YCB
  Left = 188
  Top = 178
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24322#24120#26495
  ClientHeight = 502
  ClientWidth = 747
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
  object Label1: TLabel
    Left = 8
    Top = 465
    Width = 114
    Height = 19
    Caption = #36229#26399#26495#24635#37329#39069
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 747
    Height = 129
    Align = alTop
    Caption = #36873#25321#20179#24211
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 129
    Width = 747
    Height = 315
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #26222#36890#26495
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 739
        Height = 288
        Align = alClient
        DataSource = DataSource1
        Flat = True
        FooterColor = clInfoBk
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'MFG_DATE'
            Footer.FieldName = 'mfg_date'
            Footer.Value = #21512#35745
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20837#24211#26085#26399
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Width = 127
          end
          item
            EditButtons = <>
            FieldName = 'QTY_ON_HAND'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24211#23384#25968
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'LATEST_PRICE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20215#26684
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = 'AllVal'
            Footer.FieldName = 'AllVal'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24635#20215
          end
          item
            EditButtons = <>
            FieldName = 'WAREHOUSE_NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24037#21378
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20179#24211#20195#30721
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20179#24211#21517#31216
            Width = 97
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #29305#27530#26495
      ImageIndex = 1
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 739
        Height = 288
        Align = alClient
        DataSource = DataSource2
        Flat = True
        FooterColor = clInfoBk
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGridEh2KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'MFG_DATE'
            Footer.FieldName = 'mfg_date'
            Footer.Value = #21512#35745
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20837#24211#26085#26399
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Width = 127
          end
          item
            EditButtons = <>
            FieldName = 'QTY_ON_HAND'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24211#23384#25968
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'LATEST_PRICE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20215#26684
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = 'AllVal'
            Footer.FieldName = 'AllVal'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24635#20215
          end
          item
            EditButtons = <>
            FieldName = 'WAREHOUSE_NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24037#21378
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20179#24211#20195#30721
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20179#24211#21517#31216
            Width = 97
          end>
      end
    end
  end
  object Button1: TButton
    Left = 328
    Top = 460
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 448
    Top = 460
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 128
    Top = 461
    Width = 169
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADO53_1
    Left = 240
    Top = 240
  end
  object ADO53_1: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 328
    Top = 240
  end
  object ADO53_2: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Parameters = <>
    Left = 328
    Top = 288
  end
  object DataSource2: TDataSource
    DataSet = ADO53_2
    Left = 240
    Top = 288
  end
end

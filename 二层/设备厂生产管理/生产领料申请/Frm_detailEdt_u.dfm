object Frm_detailEdt: TFrm_detailEdt
  Left = 376
  Top = 96
  BorderStyle = bsDialog
  Caption = 'BOM'#28165#21333
  ClientHeight = 586
  ClientWidth = 884
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
  object BitBtn1: TBitBtn
    Left = 318
    Top = 555
    Width = 75
    Height = 25
    Caption = #30830#23450
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
    Left = 462
    Top = 555
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    Kind = bkClose
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 34
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 88
      Top = 11
      Width = 47
      Height = 13
      Caption = 'BOM'#21517#31216
    end
    object Edit1: TEdit
      Left = 153
      Top = 6
      Width = 152
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 22
      Top = 7
      Width = 54
      Height = 25
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 34
    Width = 884
    Height = 511
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 3
    object Grd1: TDBGridEh
      Left = 1
      Top = 1
      Width = 694
      Height = 509
      Align = alClient
      DataSource = DataSource1
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = Grd1KeyDown
      OnTitleClick = Grd1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Sel'
          Footers = <>
          Title.Caption = #36873#25321
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'part_name'
          Footers = <>
          Title.Caption = 'BOM'#21517#31216
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26448#26009#32534#30721
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'inv_name'
          Footers = <>
          ReadOnly = True
          Title.Caption = #29289#26009#21517#31216
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'INV_DESCRIPTION'
          Footers = <>
          ReadOnly = True
          Title.Caption = #29289#26009#35268#26684
          Width = 121
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #21333#20301
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'TotalQty'
          Footers = <>
          ReadOnly = True
          Title.Caption = #24635#38656#27714
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'valQty'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26377#25928#24211#23384
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'employee_name'
          Footers = <>
          Title.Caption = 'BOM'#23457#26680#21592
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'STD_COST'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26631#20934#25104#26412
          Width = 55
        end>
    end
    object Panel3: TPanel
      Left = 695
      Top = 1
      Width = 188
      Height = 509
      Align = alRight
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 78
        Height = 13
        Caption = #20195#26367#29289#26009#32534#30721
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 78
        Height = 13
        Caption = #20195#26367#29289#26009#21517#31216
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 8
        Top = 88
        Width = 78
        Height = 13
        Caption = #20195#26367#29289#26009#35268#26684
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 14
        Top = 128
        Width = 104
        Height = 13
        Caption = #20195#26367#29289#26009#26377#25928#24211#23384
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 3
        Top = 214
        Width = 91
        Height = 13
        Caption = #29983#20135#21333#24635#38656#27714#25968
      end
      object Label7: TLabel
        Left = 3
        Top = 242
        Width = 91
        Height = 13
        Caption = #29983#20135#21333#24050#30003#39046#25968
      end
      object Label9: TLabel
        Left = 12
        Top = 271
        Width = 78
        Height = 13
        Caption = #29983#20135#21333#24635#27424#25968
      end
      object Label10: TLabel
        Left = 6
        Top = 343
        Width = 52
        Height = 13
        Caption = #26412#27425#30003#39046
      end
      object Label11: TLabel
        Left = 6
        Top = 374
        Width = 26
        Height = 13
        Caption = #22791#27880
      end
      object DBEdit1: TDBEdit
        Left = 10
        Top = 24
        Width = 140
        Height = 21
        Color = clGradientInactiveCaption
        DataField = 'inv_part_number_r'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 64
        Width = 140
        Height = 21
        Color = clGradientInactiveCaption
        DataField = 'inv_name_r'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 10
        Top = 104
        Width = 140
        Height = 21
        Color = clGradientInactiveCaption
        DataField = 'INV_DESCRIPTION_r'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 13
        Top = 144
        Width = 81
        Height = 21
        Color = clGradientInactiveCaption
        DataField = 'valQty_r'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 100
        Top = 210
        Width = 83
        Height = 21
        Color = clMenuBar
        Enabled = False
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 97
        Top = 238
        Width = 86
        Height = 21
        Color = clMenuBar
        Enabled = False
        TabOrder = 5
      end
      object Edit4: TEdit
        Left = 97
        Top = 267
        Width = 86
        Height = 21
        Color = clMenuBar
        Enabled = False
        TabOrder = 6
      end
      object DBEdit5: TDBEdit
        Left = 64
        Top = 339
        Width = 81
        Height = 21
        Color = clHighlightText
        DataField = 'Qty'
        DataSource = DataSource1
        TabOrder = 7
        OnKeyPress = DBEdit5KeyPress
      end
      object DBEdit6: TDBEdit
        Left = 35
        Top = 371
        Width = 150
        Height = 21
        Color = clHighlightText
        DataField = 'remark'
        DataSource = DataSource1
        TabOrder = 8
      end
      object DBCheckBox1: TDBCheckBox
        Left = 48
        Top = 402
        Width = 97
        Height = 17
        Caption = #20351#29992#20195#26367#29289#26009
        DataField = 'TD'
        DataSource = DataSource1
        TabOrder = 9
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS
    Left = 328
    Top = 233
  end
  object CDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = CDSBeforeInsert
    BeforeDelete = CDSBeforeInsert
    AfterScroll = CDSAfterScroll
    OnFilterRecord = CDSFilterRecord
    Left = 280
    Top = 234
  end
  object DSP: TDataSetProvider
    DataSet = DM.ADO17
    Left = 240
    Top = 234
  end
end

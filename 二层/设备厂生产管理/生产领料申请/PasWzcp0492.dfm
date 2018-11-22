object Form1: TForm1
  Left = 231
  Top = 137
  Width = 1090
  Height = 604
  Caption = #29289#26009#38656#27714#34920
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
    Width = 1082
    Height = 34
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 11
      Width = 52
      Height = 13
      Caption = #26448#26009#32534#30721
    end
    object Label2: TLabel
      Left = 341
      Top = 11
      Width = 47
      Height = 13
      Caption = 'BOM'#21517#31216
    end
    object Edit1: TEdit
      Left = 132
      Top = 6
      Width = 150
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 9
      Width = 46
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object ComboBox1: TComboBox
      Left = 391
      Top = 7
      Width = 210
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 34
    Width = 1082
    Height = 495
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 896
      Top = 1
      Width = 185
      Height = 493
      Align = alRight
      TabOrder = 0
      object Label6: TLabel
        Left = 6
        Top = 292
        Width = 91
        Height = 13
        Caption = #29983#20135#21333#24635#38656#27714#25968
      end
      object Label7: TLabel
        Left = 6
        Top = 320
        Width = 91
        Height = 13
        Caption = #29983#20135#21333#24050#30003#39046#25968
      end
      object Label9: TLabel
        Left = 15
        Top = 349
        Width = 78
        Height = 13
        Caption = #29983#20135#21333#24635#27424#25968
      end
      object Label10: TLabel
        Left = 6
        Top = 403
        Width = 52
        Height = 13
        Caption = #26412#27425#30003#39046
      end
      object Label11: TLabel
        Left = 6
        Top = 434
        Width = 26
        Height = 13
        Caption = #22791#27880
      end
      object Edit2: TEdit
        Left = 99
        Top = 288
        Width = 81
        Height = 21
        Color = clMenuBar
        Enabled = False
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 98
        Top = 316
        Width = 82
        Height = 21
        Color = clMenuBar
        Enabled = False
        TabOrder = 1
      end
      object Edit4: TEdit
        Left = 98
        Top = 345
        Width = 82
        Height = 21
        Color = clMenuBar
        Enabled = False
        TabOrder = 2
      end
      object Edit5: TEdit
        Left = 60
        Top = 399
        Width = 121
        Height = 21
        TabOrder = 3
        OnExit = Edit5Exit
        OnKeyPress = Edit5KeyPress
      end
      object Edit6: TEdit
        Left = 34
        Top = 430
        Width = 147
        Height = 21
        TabOrder = 4
        OnExit = Edit6Exit
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 895
      Height = 493
      Align = alClient
      TabOrder = 1
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 893
        Height = 491
        Align = alClient
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnCellClick = DBGridEh1CellClick
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Sel'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #36873#25321
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'INV_PART_NUMBER'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #26448#26009#20195#30721
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'INV_NAME'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #26448#26009#21517#31216
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'INV_DESCRIPTION'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #26448#26009#35215#26684
            Width = 200
          end
          item
            EditButtons = <>
            FieldName = 'part_name'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'BOM'#21517#31216
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'QUAN_ON_HAND'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #24403#21069#24211#23384
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'STD_QTY'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #26631#20934#25968#37327
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'App_QTY'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24050#30003#39046#25968
          end
          item
            EditButtons = <>
            FieldName = 'dQUAN_BOM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#27425#30003#39046#25968
            Visible = False
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'Con_QTY'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #28040#32791#25968
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'QUAN_ASSIGN'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #24050#20998#37197#25968#37327
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'CUT_NO'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #37197#26009#21333#21495
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'SO_NO'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #38144#21806#35746#21333
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'vendor'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'inv_part_number_r'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26367#20195#26448#26009#20195#30721
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'inv_name_r'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26367#20195#26448#26009#21517#31216
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'INV_DESCRIPTION_r'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26367#20195#26448#26009#35215#26684
            Width = 200
          end
          item
            EditButtons = <>
            FieldName = 'QUAN_ON_HAND_r'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26367#20195#24403#21069#24211#23384
            Width = 70
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 529
    Width = 1082
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 240
      Top = 8
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
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkClose
    end
  end
  object DSP: TDataSetProvider
    DataSet = DM.AdoWzcp492
    Left = 240
    Top = 234
  end
  object CDS: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    BeforeClose = CDSBeforeClose
    AfterScroll = CDSAfterScroll
    OnFilterRecord = CDSFilterRecord
    Left = 280
    Top = 234
  end
  object DataSource1: TDataSource
    DataSet = CDS
    Left = 328
    Top = 233
  end
  object PopupMenu1: TPopupMenu
    Left = 409
    Top = 123
    object N1: TMenuItem
      Caption = #20351#29992#26367#20195#29289#26009
      OnClick = N1Click
    end
  end
end

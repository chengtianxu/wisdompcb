object frm_emp_choose: Tfrm_emp_choose
  Left = 125
  Top = 97
  BorderStyle = bsSingle
  Caption = #21592#24037#36873#25321#22120
  ClientHeight = 537
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    879
    537)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 42
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = #37096#38376
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 451
    Top = 5
    Width = 38
    Height = 13
    AutoSize = False
    Caption = #29677#32452':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlBottom
  end
  object Label3: TLabel
    Left = 451
    Top = 25
    Width = 52
    Height = 13
    AutoSize = False
    Caption = #29677#27425#38142':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlBottom
  end
  object Label4: TLabel
    Left = 485
    Top = 4
    Width = 125
    Height = 19
    Anchors = [akLeft, akTop, akBottom]
    AutoSize = False
    Layout = tlBottom
  end
  object Label5: TLabel
    Left = 493
    Top = 23
    Width = 519
    Height = 19
    Anchors = [akLeft, akTop, akBottom]
    AutoSize = False
    Layout = tlBottom
  end
  object Label6: TLabel
    Left = 247
    Top = 512
    Width = 60
    Height = 15
    AutoSize = False
    Caption = #24453#36873#20154#25968':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlBottom
  end
  object StringGrid1: TStringGrid
    Left = 496
    Top = 42
    Width = 369
    Height = 444
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnKeyUp = StringGrid1KeyUp
    OnMouseUp = StringGrid1MouseUp
    ColWidths = (
      14
      132
      64
      64
      12)
  end
  object BitBtn1: TBitBtn
    Left = 496
    Top = 499
    Width = 75
    Height = 25
    Caption = #20445#23384
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 684
    Top = 499
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Button2: TButton
    Left = 434
    Top = 177
    Width = 55
    Height = 25
    Caption = '>>'
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 434
    Top = 237
    Width = 55
    Height = 25
    Caption = '<'
    Enabled = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 434
    Top = 313
    Width = 55
    Height = 25
    Caption = '<<'
    Enabled = False
    TabOrder = 5
    OnClick = Button4Click
  end
  object Grd1: TDBGridEh
    Left = 1
    Top = 42
    Width = 424
    Height = 464
    DataSource = DM.DataSource4
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    RowHeight = 20
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = Grd1CellClick
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'departmentname'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #37096#38376
        Width = 100
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'employeecode'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'chinesename'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'position_item'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #32844#21153
        Width = 60
      end
      item
        Alignment = taCenter
        DisplayFormat = 'yyyy-MM-dd'
        EditButtons = <>
        FieldName = 'ondutytime'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #20837#32844#26085#26399
        Visible = False
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'rkey'
        Footers = <>
        ReadOnly = True
        Title.Caption = 'k'
        Visible = False
        Width = 0
      end
      item
        EditButtons = <>
        FieldName = 'classgroupcode'
        Footers = <>
        Title.Caption = #29677#32452
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'accountname'
        Footers = <>
        Title.Caption = #24080#22871
        Width = 70
      end>
  end
  object Edit1: TEdit
    Left = 57
    Top = 15
    Width = 113
    Height = 21
    TabOrder = 7
    OnChange = Edit1Change
  end
  object CheckBox1: TCheckBox
    Left = 2
    Top = 512
    Width = 153
    Height = 17
    Caption = #21253#25324#27492#26085#26399#21518#31163#32844#30340#21592#24037
    TabOrder = 8
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 247
    Top = 24
    Width = 133
    Height = 17
    Caption = #21253#25324#24050#26377#29677#32452#30340#21592#24037
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = CheckBox1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 158
    Top = 512
    Width = 89
    Height = 19
    Date = 40871.000000000000000000
    Format = 'yyyy-MM-dd'
    Time = 40871.000000000000000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object StaticText1: TStaticText
    Left = 306
    Top = 512
    Width = 105
    Height = 17
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object BitBtn3: TBitBtn
    Left = 673
    Top = 0
    Width = 99
    Height = 25
    Caption = #23548#20986#29677#32452
    TabOrder = 12
    OnClick = BitBtn3Click
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
  object BitBtn4: TBitBtn
    Left = 279
    Top = 0
    Width = 99
    Height = 25
    Caption = #23548#20986#26080#29677#32452
    TabOrder = 13
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
end

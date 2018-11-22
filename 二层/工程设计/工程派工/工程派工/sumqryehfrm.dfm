object frmqrysumeh: Tfrmqrysumeh
  Left = 284
  Top = 161
  Width = 979
  Height = 563
  Caption = #27719#24635#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 39
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 226
      Top = 14
      Width = 65
      Height = 13
      Caption = #20998#32452#31867#22411#65306
    end
    object lbl3: TLabel
      Left = 437
      Top = 15
      Width = 39
      Height = 13
      Caption = #26102#38388#65306
    end
    object lbl2: TLabel
      Left = 596
      Top = 14
      Width = 13
      Height = 13
      Caption = #33267
    end
    object btn1: TBitBtn
      Left = 74
      Top = 3
      Width = 66
      Height = 31
      Caption = #23548#20986
      TabOrder = 0
      OnClick = btn1Click
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
    object btn2: TBitBtn
      Left = 3
      Top = 3
      Width = 66
      Height = 31
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object cbbgptype: TComboBox
      Left = 293
      Top = 10
      Width = 113
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = #39044#23457#20154#21592
      OnChange = cbbgptypeChange
      Items.Strings = (
        #39044#23457#20154#21592
        'CAM'#20154#21592
        'QAE'#20154#21592)
    end
    object dtp1: TDateTimePicker
      Left = 482
      Top = 10
      Width = 103
      Height = 21
      Date = 42419.375423657410000000
      Time = 42419.375423657410000000
      TabOrder = 3
      OnChange = cbbgptypeChange
    end
    object dtp2: TDateTimePicker
      Left = 619
      Top = 10
      Width = 103
      Height = 21
      Date = 42419.375423657410000000
      Time = 42419.375423657410000000
      TabOrder = 4
      OnChange = cbbgptypeChange
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 39
    Width = 963
    Height = 485
    ActivePage = ts1
    Align = alClient
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #34920#26684
      object eh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 955
        Height = 457
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnTitleClick = eh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME'
            Footers = <>
            Title.Caption = #22995#21517
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'CountNum'
            Footers = <>
            Title.Caption = #25968#37327
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'SumXiShu'
            Footers = <>
            Title.Caption = #24635#31995#25968
            Width = 80
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #22270#24418
      ImageIndex = 1
      object dbcht1: TDBChart
        Left = 0
        Top = 0
        Width = 955
        Height = 457
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          '')
        View3D = False
        Align = alClient
        TabOrder = 0
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = ads1
          SeriesColor = clRed
          Title = #25968#37327
          XLabelsSource = 'EMPLOYEE_NAME'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CountNum'
        end
        object Series2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = ads1
          SeriesColor = clGreen
          Title = #24635#31995#25968
          XLabelsSource = 'EMPLOYEE_NAME'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'SumXiShu'
        end
      end
    end
  end
  object ads1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT d05.EMPLOYEE_NAME,COUNT(*) as CountNum, SUM(d538.QAE_XiSh' +
      'u) AS SumXiShu FROM DATA0538 d538'#13#10'INNER JOIN data0005 d05 ON d5' +
      '38.YSZP_USER_PTR = d05.RKEY'#13#10'GROUP BY d05.EMPLOYEE_NAME'#13#10'order b' +
      'y d05.EMPLOYEE_NAME'
    Parameters = <>
    Left = 284
    Top = 295
    object strngfldads1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object intgrfldads1CountNum: TIntegerField
      FieldName = 'CountNum'
      ReadOnly = True
    end
    object ads1SumXiShu: TFloatField
      FieldName = 'SumXiShu'
      ReadOnly = True
    end
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 348
    Top = 295
  end
end

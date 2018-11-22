object Form1: TForm1
  Left = 234
  Top = 162
  Width = 764
  Height = 566
  Caption = #25968#25454#23548#20986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 748
    Height = 510
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #21333#34920#36755#20986
      object DBGrid1: TDBGrid
        Left = 0
        Top = 219
        Width = 740
        Height = 263
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = DBGrid1TitleClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 740
        Height = 219
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 0
          Top = 14
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = '   '#21333#34920
        end
        object Label2: TLabel
          Left = 134
          Top = 14
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = '   '#23383#27573
        end
        object Label3: TLabel
          Left = 282
          Top = 16
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = '  '#32034#24341
        end
        object ListBox1: TListBox
          Left = 0
          Top = 32
          Width = 121
          Height = 185
          ItemHeight = 13
          TabOrder = 0
          OnClick = ListBox1Click
        end
        object ListBox2: TListBox
          Left = 133
          Top = 32
          Width = 121
          Height = 185
          ItemHeight = 13
          TabOrder = 1
        end
        object ListBox3: TListBox
          Left = 267
          Top = 32
          Width = 211
          Height = 185
          ItemHeight = 13
          TabOrder = 2
        end
        object DBNavigator1: TDBNavigator
          Left = 488
          Top = 192
          Width = 224
          Height = 25
          DataSource = DataSource1
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 3
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #22810#34920#36755#20986
      ImageIndex = 1
      DesignSize = (
        740
        482)
      object SpeedButton1: TSpeedButton
        Left = 4
        Top = 4
        Width = 31
        Height = 32
        Hint = #36816#34892'(F5)'
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F0000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
          FF4FFFFFFFFFFFFFC0C0FFFFFF44FFFFFFFFFFFFC0C0FFFFFF444FFFFFFFFFFF
          C0C0FFFFFF4444FFFFFFFFFFC0C0FFFFFF44444FFFFFFFFFC0C0FFFFFF444444
          FFFFFFFFC0C0FFFFFF4444444FFFFFFFC0C0FFFFFF444444FFFFFFFFC0C0FFFF
          FF44444FFFFFFFFFC0C0FFFFFF4444FFFFFFFFFFC0C0FFFFFF444FFFFFFFFFFF
          C0C0FFFFFF44FFFFFFFFFFFFC0C0FFFFFF4FFFFFFFFFFFFFC0C0FFFFFFFFFFFF
          FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
          FFFFFFFFFFFFFFFFC0C0}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 36
        Top = 4
        Width = 31
        Height = 32
        Hint = #19978#19968#26465#35821#21477
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADADADADAADADAD0DADADADADDADAD00ADADA
          DADAADAD0E0DADADADADDAD0EE00000000DAAD0EEEEEEEEEE0ADDA0EEEEEEEEE
          E0DAADA0EE00000000ADDADA0E0ADADADADAADADA00DADADADADDADADA0ADADA
          DADAADADADADADADADADDADADADADADADADAADADADADADADADAD}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 68
        Top = 4
        Width = 31
        Height = 32
        Hint = #35821#21477#36873#25321
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADAD000000000ADADADA0FFFFFFF0DADA0000F00F
          00F0ADAD0FF0FFFFFFF0D0000F00F00F00F0A0FF0FF0FFFFFFF0D0F00F00F00F
          00F0A0FF0FF0FFFFFFF0D0F00F0000000000A0FF0FFFFFFF0DADD0F000000000
          0ADAA0FFFFFFF0ADADADD000000000DADADAADADADADADADADAD}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 100
        Top = 4
        Width = 31
        Height = 32
        Hint = #19979#19968#26465#35821#21477
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADADADADAADADADADA0ADADADDADADADAD00A
          DADAADADADADA0E0ADADDA00000000EE0ADAAD0EEEEEEEEEE0ADDA0EEEEEEEEE
          E0DAAD00000000EE0DADDADADADAD0E0DADAADADADADA00DADADDADADADAD0DA
          DADAADADADADADADADADDADADADADADADADAADADADADADADADAD}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 132
        Top = 4
        Width = 31
        Height = 32
        Hint = #21024#38500#21382#21490#35760#24405
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F0000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
          FFFFFF99FFFFF9FFC0C0FFFFFFFFFF999FFF9FFFC0C0FFFFFFFFFFF99FF99FFF
          C0C0FF00000000000999FFFFC0C0FF0FFFFFFFFF999FFFFFC0C0FF0F00F00F08
          9999FFFFC0C0FF0FFFFFFFF998899FFFC0C0FF0CCCCCC79CCCCFF9FFC0C0FFFC
          FFFFF97FFFCFFFFFC0C0FFFCF00F00F00FCFFFFFC0C0FFFCFFFFFFFFFFCFFFFF
          C0C0FFFCCCCCCCCCCCCFFFFFC0C0FFFC8CC8CC8CC8CFFFFFC0C0FFFCCCCCCCCC
          CCCFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
          FFFFFFFFFFFFFFFFC0C0}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton5Click
      end
      object SpeedButton6: TSpeedButton
        Left = 180
        Top = 5
        Width = 31
        Height = 32
        Hint = #25171#24320#24050#23384'SQL'#35821#21477
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADAD00000000000ADADA003333333330ADAD0B0333333333
          0ADA0FB03333333330AD0BFB03333333330A0FBFB000000000000BFBFBFBFB0A
          DADA0FBFBFBFBF0DADAD0BFB0000000ADADAA000ADADADAD000DDADADADADADA
          D00AADADADAD0DAD0D0DDADADADAD000DADAADADADADADADADAD}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton6Click
      end
      object SpeedButton7: TSpeedButton
        Left = 212
        Top = 5
        Width = 31
        Height = 32
        Hint = #20445#23384'SQL'#35821#21477
        Flat = True
        Glyph.Data = {
          26050000424D26050000000000003604000028000000100000000F0000000100
          080000000000F0000000CE0E0000C40E00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
          A400000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF00000000
          000000000000000000FFFF0003030000000000000707000300FFFF0003030000
          000000000707000300FFFF0003030000000000000707000300FFFF0003030000
          000000000000000300FFFF0003030303030303030303030300FFFF0003030000
          000000000000030300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
          FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000300FFFF000300FFFF
          FFFFFFFFFFFF000300FFFF000300FFFFFFFFFFFFFFFF000000FFFF000300FFFF
          FFFFFFFFFFFF000700FFFF0000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton7Click
      end
      object SpeedButton8: TSpeedButton
        Left = 244
        Top = 6
        Width = 31
        Height = 32
        Hint = #32534#36753'SQL'#35821#21477
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFF0000FFF0F0F0F0FFFFFFFFFF0000FFFFFFFFF00FFFFFFFFF
          0000FFFFFFFFF000FFFFFFFF0000FFFFFFFFF0B80FFFFFFF0000FFFFFFFFF0B7
          0FFFFFFF0000FFFFFFFFF00B80FFFFFF0000FFFFFFFFFF0B70FFFFFF0000FFCC
          CCCCCCC0B80FFFFF0000FFCFFFFFFFF0B00FFFFF0000FFCF00F00F000110FFFF
          0000FFCFFFFFFFFF000FFFFF0000FFCCCCCCCCCCCCFFFFFF0000FFC7CC7CC7CC
          7CFFFFFF0000FFCCCCCCCCCCCCFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFF0000}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton8Click
      end
      object ListBox4: TListBox
        Left = 645
        Top = 48
        Width = 100
        Height = 185
        Anchors = [akTop, akRight]
        DragMode = dmAutomatic
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox4Click
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 233
        Width = 740
        Height = 249
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Memo1: TMemo
        Left = 0
        Top = 48
        Width = 483
        Height = 185
        Cursor = crArrow
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 2
        OnDragDrop = Memo1DragDrop
        OnDragOver = Memo1DragOver
        OnKeyDown = Memo1KeyDown
      end
      object ListBox5: TListBox
        Left = 488
        Top = 48
        Width = 152
        Height = 185
        Style = lbOwnerDrawFixed
        Anchors = [akTop, akRight]
        DragMode = dmAutomatic
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 3
      end
      object DBNavigator2: TDBNavigator
        Left = 519
        Top = 5
        Width = 224
        Height = 31
        DataSource = DataSource2
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Anchors = [akTop, akRight]
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 113
        Width = 740
        Height = 120
        Align = alBottom
        ColCount = 1
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        TabOrder = 5
        Visible = False
        ColWidths = (
          714)
      end
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 680
    Top = 444
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 34
    object N1: TMenuItem
      Caption = #25991#20214
      object N4: TMenuItem
        Caption = #25171#24320
        Enabled = False
        OnClick = SpeedButton6Click
      end
      object N5: TMenuItem
        Caption = #20445#23384
        Enabled = False
        ShortCut = 16467
        OnClick = SpeedButton7Click
      end
      object N7: TMenuItem
        Caption = #32534#36753
        Enabled = False
        OnClick = SpeedButton8Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #36864#20986
        ShortCut = 16465
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #23548#20986
      object Excel1: TMenuItem
        Caption = #23548#20986'Excel'
        ShortCut = 16471
        OnClick = Excel1Click
      end
      object ODBC1: TMenuItem
        Caption = #23548#20986#21040#31995#32479#25968#25454#28304'ODBC'
        ShortCut = 16463
        OnClick = ODBC1Click
      end
    end
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Left = 712
    Top = 476
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 680
    Top = 476
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 647
    Top = 476
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 615
    Top = 477
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    MaxRecords = 1
    Left = 647
    Top = 444
  end
end

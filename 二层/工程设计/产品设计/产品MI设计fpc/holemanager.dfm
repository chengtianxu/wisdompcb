object Form4: TForm4
  Left = 263
  Top = 180
  BorderStyle = bsSingle
  Caption = #22266#23450#24037#20855#23380#25554#20837
  ClientHeight = 512
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object pM: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 512
    Align = alClient
    TabOrder = 0
    object PMEDIT: TPanel
      Left = 534
      Top = 1
      Width = 246
      Height = 510
      Align = alRight
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 52
        Height = 13
        Caption = #38075#23380#20195#31216
      end
      object Label2: TLabel
        Left = 8
        Top = 32
        Width = 52
        Height = 13
        Caption = #25104#21697#23380#24452
      end
      object Label3: TLabel
        Left = 128
        Top = 32
        Width = 52
        Height = 13
        Caption = #38075#21632#30452#24452
      end
      object Label4: TLabel
        Left = 8
        Top = 80
        Width = 26
        Height = 13
        Caption = #20844#24046
      end
      object Label5: TLabel
        Left = 8
        Top = 104
        Width = 47
        Height = 13
        Caption = 'PCS'#23380#25968
      end
      object Label6: TLabel
        Left = 128
        Top = 104
        Width = 47
        Height = 13
        Caption = 'SET'#23380#25968
      end
      object Label7: TLabel
        Left = 8
        Top = 128
        Width = 46
        Height = 13
        Caption = 'A'#26495#23380#25968
      end
      object Label8: TLabel
        Left = 128
        Top = 128
        Width = 46
        Height = 13
        Caption = 'B'#26495#23380#25968
      end
      object Label9: TLabel
        Left = 8
        Top = 152
        Width = 26
        Height = 13
        Caption = #22791#27880
      end
      object Label10: TLabel
        Left = 8
        Top = 180
        Width = 26
        Height = 13
        Caption = #27169#26495
      end
      object Label11: TLabel
        Left = 128
        Top = 80
        Width = 52
        Height = 13
        Caption = #20840#23616#24207#21495
      end
      object Button1: TButton
        Left = 40
        Top = 208
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 64
        Top = 5
        Width = 169
        Height = 21
        TabOrder = 1
        OnClick = showinfo
      end
      object CheckBox1: TCheckBox
        Left = 128
        Top = 57
        Width = 81
        Height = 17
        Caption = #40664#35748#28608#27963
        TabOrder = 2
        OnClick = showinfo
      end
      object Edit2: TEdit
        Left = 64
        Top = 30
        Width = 57
        Height = 21
        Color = clScrollBar
        TabOrder = 3
        OnClick = showinfo
      end
      object Memo1: TMemo
        Left = 8
        Top = 272
        Width = 225
        Height = 41
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          #24213#33394#28145#33394#30340#21487#20197#19981#22635
          #20854#20182#24517#39035#22635#20889#21644#36873#25321)
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 184
        Top = 30
        Width = 57
        Height = 21
        TabOrder = 5
        OnClick = showinfo
      end
      object Edit4: TEdit
        Left = 40
        Top = 78
        Width = 81
        Height = 21
        Color = clScrollBar
        TabOrder = 6
        OnClick = showinfo
      end
      object Edit5: TEdit
        Left = 56
        Top = 102
        Width = 65
        Height = 21
        Color = clScrollBar
        TabOrder = 7
        OnClick = showinfo
      end
      object Edit6: TEdit
        Left = 176
        Top = 102
        Width = 65
        Height = 21
        Color = clScrollBar
        TabOrder = 8
        OnClick = showinfo
      end
      object Edit7: TEdit
        Left = 56
        Top = 126
        Width = 65
        Height = 21
        Color = clScrollBar
        TabOrder = 9
        OnClick = showinfo
      end
      object Edit8: TEdit
        Left = 176
        Top = 126
        Width = 65
        Height = 21
        Color = clScrollBar
        TabOrder = 10
        OnClick = showinfo
      end
      object Edit9: TEdit
        Left = 40
        Top = 150
        Width = 201
        Height = 21
        Color = clScrollBar
        TabOrder = 11
        OnClick = showinfo
      end
      object ComboBox1: TComboBox
        Left = 40
        Top = 176
        Width = 137
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 12
        Text = #20840#23616#26174#31034
        OnClick = ComboBox1Click
        OnDropDown = showinfo
        Items.Strings = (
          #26032#27169#26495'..'
          #20840#23616#26174#31034)
      end
      object ComboBox2: TComboBox
        Left = 176
        Top = 176
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 13
        Text = #24320#22836
        OnDropDown = showinfo
        Items.Strings = (
          #24320#22836
          #20013#38388
          #26411#23614)
      end
      object Button2: TButton
        Left = 128
        Top = 208
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 14
        OnClick = Button2Click
      end
      object Edit10: TEdit
        Left = 184
        Top = 78
        Width = 57
        Height = 21
        MaxLength = 2
        TabOrder = 15
        OnClick = showinfo
      end
      object ComboBox3: TComboBox
        Left = 8
        Top = 56
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 16
        Text = #30005#38208#23380'?'
        OnDropDown = showinfo
        Items.Strings = (
          #30005#38208#23380'?'
          'Y'
          'N'
          '/')
      end
    end
    object StringGrid2: TStringGrid
      Left = 1
      Top = 1
      Width = 533
      Height = 510
      Align = alClient
      ColCount = 14
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      PopupMenu = PopupMenu1
      ScrollBars = ssVertical
      TabOrder = 1
      OnDrawCell = StringGrid2DrawCell
      OnMouseDown = StringGrid2MouseDown
      OnSelectCell = StringGrid2SelectCell
      ColWidths = (
        25
        96
        71
        27
        79
        64
        64
        64
        64
        64
        147
        2
        2
        2)
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 496
    Top = 48
    object N3: TMenuItem
      Caption = #26032#22686
      Visible = False
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = #20462#25913
      Visible = False
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #21024#38500
      Visible = False
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #36807#28388' ->'
      object N5: TMenuItem
        Caption = #26174#31034#20840#37096
      end
    end
    object N7: TMenuItem
      Caption = #21333#34892#27169#24335
      OnClick = N7Click
    end
    object N6: TMenuItem
      Caption = #36861#21152
      Default = True
      OnClick = N6Click
    end
  end
end

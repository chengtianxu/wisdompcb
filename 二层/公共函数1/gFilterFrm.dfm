object frmFilter: TfrmFilter
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214
  ClientHeight = 281
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 281
    Align = alClient
    TabOrder = 0
    object rgSign: TRadioGroup
      Left = 135
      Top = 153
      Width = 194
      Height = 54
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        #31561#20110
        #22823#20110
        #23567#20110
        #19981#31561)
      TabOrder = 0
      Visible = False
    end
    object btnAdd: TButton
      Left = 197
      Top = 226
      Width = 84
      Height = 28
      Caption = #28155#21152
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAddClick
    end
    object pnl1: TPanel
      Left = 538
      Top = 1
      Width = 102
      Height = 279
      Align = alRight
      TabOrder = 2
      object btn1: TSpeedButton
        Left = 14
        Top = 42
        Width = 78
        Height = 33
        Caption = #26597#25214
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
        OnClick = btn1Click
      end
      object btn2: TSpeedButton
        Left = 14
        Top = 94
        Width = 78
        Height = 33
        Caption = #21024#38500
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        OnClick = btn2Click
      end
      object btn3: TSpeedButton
        Left = 14
        Top = 146
        Width = 78
        Height = 33
        Caption = #37325#32622
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        OnClick = btn3Click
      end
      object btn4: TSpeedButton
        Left = 14
        Top = 199
        Width = 78
        Height = 33
        Caption = #36864#20986
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
        OnClick = btn4Click
      end
    end
    object pnl3: TPanel
      Left = 334
      Top = 1
      Width = 204
      Height = 279
      Align = alRight
      TabOrder = 3
      object lbl1: TLabel
        Left = 1
        Top = 1
        Width = 119
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = #24050#32463#23450#20041#30340#26465#20214
        Color = clPurple
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #40657#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lvRet: TListView
        Left = 1
        Top = 17
        Width = 202
        Height = 261
        Align = alClient
        Columns = <
          item
            Caption = #23383#27573#21517
            Width = 70
          end
          item
            Caption = #26465#20214#20540
            Width = 180
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDeletion = lvRetDeletion
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 1
      Width = 128
      Height = 279
      Align = alLeft
      TabOrder = 4
      object lbl2: TLabel
        Left = 1
        Top = 1
        Width = 85
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = #21487#26597#25214#39033#30446
        Color = clPurple
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #40657#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lvField: TListView
        Left = 1
        Top = 17
        Width = 126
        Height = 261
        Align = alClient
        Columns = <
          item
            Caption = #23383#27573
            Width = 160
          end>
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        TabOrder = 0
        ViewStyle = vsReport
        OnChange = lvFieldChange
        OnDeletion = lvFieldDeletion
      end
    end
    object grp1: TGroupBox
      Left = 135
      Top = 2
      Width = 194
      Height = 151
      TabOrder = 5
      object lbl4: TLabel
        Left = 2
        Top = 15
        Width = 190
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = #26465#20214#20540
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = #40657#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitWidth = 51
      end
      object pgc1: TPageControl
        Left = 2
        Top = 31
        Width = 190
        Height = 118
        ActivePage = tsDate
        Align = alClient
        MultiLine = True
        Style = tsButtons
        TabOrder = 0
        object tsInt: TTabSheet
          Caption = 'tsInt'
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object edtInt: TLabeledEdit
            Left = 19
            Top = 48
            Width = 121
            Height = 21
            EditLabel.Width = 30
            EditLabel.Height = 13
            EditLabel.Caption = 'edtInt'
            TabOrder = 0
            OnKeyPress = edtIntKeyPress
          end
        end
        object tsStr: TTabSheet
          Caption = 'tsStr'
          ImageIndex = 1
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object edtStr: TLabeledEdit
            Left = 19
            Top = 48
            Width = 121
            Height = 21
            EditLabel.Width = 30
            EditLabel.Height = 13
            EditLabel.Caption = 'edtStr'
            TabOrder = 0
          end
        end
        object tsFloat: TTabSheet
          Caption = 'tsFloat'
          ImageIndex = 2
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object edtFLoat: TLabeledEdit
            Left = 19
            Top = 48
            Width = 121
            Height = 21
            EditLabel.Width = 43
            EditLabel.Height = 13
            EditLabel.Caption = 'edtFLoat'
            TabOrder = 0
          end
        end
        object tsDate: TTabSheet
          Caption = 'tsDate'
          ImageIndex = 3
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lbl3: TLabel
            Left = 3
            Top = 33
            Width = 24
            Height = 13
            Caption = #20174#65306
          end
          object lbl5: TLabel
            Left = 3
            Top = 72
            Width = 24
            Height = 13
            Caption = #21040#65306
          end
          object lblData: TLabel
            Left = 3
            Top = 1
            Width = 24
            Height = 13
            Caption = #26085#26399
          end
          object dtpFromData: TDateTimePicker
            Left = 23
            Top = 28
            Width = 81
            Height = 21
            Date = 41131.713965648150000000
            Time = 41131.713965648150000000
            TabOrder = 0
          end
          object dtpFromTime: TDateTimePicker
            Left = 105
            Top = 28
            Width = 65
            Height = 21
            Date = 41131.713965648150000000
            Time = 41131.713965648150000000
            Kind = dtkTime
            TabOrder = 1
          end
          object dtpToDate: TDateTimePicker
            Left = 23
            Top = 68
            Width = 81
            Height = 21
            Date = 41131.713965648150000000
            Time = 41131.713965648150000000
            TabOrder = 2
          end
          object dtpToTime: TDateTimePicker
            Left = 105
            Top = 68
            Width = 65
            Height = 21
            Date = 41131.713965648150000000
            Time = 41131.713965648150000000
            Kind = dtkTime
            TabOrder = 3
          end
        end
      end
    end
  end
end

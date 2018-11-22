inherited frmSPCText_mod711: TfrmSPCText_mod711
  Caption = 'SPC'#26816#27979#35760#24405
  ClientHeight = 452
  ClientWidth = 1087
  OnClose = FormClose
  ExplicitWidth = 1095
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1087
    Height = 452
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1087
    ExplicitHeight = 452
    inherited pnl1: TPanel
      Width = 1085
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1085
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 1085
      Height = 417
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 1085
      ExplicitHeight = 417
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 264
        Height = 415
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 14
          Top = 204
          Width = 60
          Height = 13
          Caption = #20108#32423#24037#24207#65306
        end
        object Label4: TLabel
          Left = 14
          Top = 236
          Width = 60
          Height = 13
          Caption = #20027#35201#35774#22791#65306
        end
        object Label2: TLabel
          Left = 14
          Top = 171
          Width = 60
          Height = 13
          Caption = #19968#32423#24037#24207#65306
        end
        object Label3: TLabel
          Left = 168
          Top = 171
          Width = 3
          Height = 13
        end
        object Label5: TLabel
          Left = 14
          Top = 141
          Width = 60
          Height = 13
          Caption = #20998#26512#29677#27425#65306
        end
        object Label6: TLabel
          Left = 73
          Top = 234
          Width = 3
          Height = 13
          Visible = False
        end
        object Label7: TLabel
          Left = 14
          Top = 81
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #20998#26512#26085#26399#65306
        end
        object Label8: TLabel
          Left = 14
          Top = 110
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #20998#26512#26102#38388#65306
        end
        object Label9: TLabel
          Left = 14
          Top = 17
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #20379#24212#21830#21517#65306
        end
        object Label10: TLabel
          Left = 14
          Top = 48
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #24037#21378#21517#31216#65306
        end
        object Edit2: TEdit
          Left = 73
          Top = 199
          Width = 145
          Height = 21
          TabOrder = 0
        end
        object Edit3: TEdit
          Left = 73
          Top = 232
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object Edit1: TEdit
          Left = 73
          Top = 167
          Width = 68
          Height = 21
          TabOrder = 2
        end
        object BitBtn2: TBitBtn
          Tag = 1
          Left = 139
          Top = 163
          Width = 26
          Height = 25
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
          TabOrder = 3
          OnClick = BitBtn2Click
        end
        object BitBtn1: TBitBtn
          Tag = 1
          Left = 216
          Top = 197
          Width = 26
          Height = 25
          Enabled = False
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
          TabOrder = 4
          OnClick = BitBtn1Click
        end
        object ComboBox1: TComboBox
          Left = 73
          Top = 136
          Width = 93
          Height = 21
          ItemIndex = 0
          TabOrder = 5
          Text = #30333#29677
          Items.Strings = (
            #30333#29677
            #26202#29677)
        end
        object BitBtn3: TBitBtn
          Tag = 1
          Left = 216
          Top = 229
          Width = 26
          Height = 25
          Enabled = False
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            04000000000078000000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888800000888880000080F000888880F00080F000888880F0008000000080000
            000800F000000F00000800F000800F00000800F000800F000008800000000000
            0088880F00080F000888880000080000088888800088800088888880F08880F0
            888888800088800088888888888888888888}
          TabOrder = 6
          OnClick = BitBtn3Click
        end
        object dtpReqDate: TDateTimePicker
          Left = 73
          Top = 75
          Width = 92
          Height = 21
          Date = 42626.476985127320000000
          Time = 42626.476985127320000000
          Color = clWhite
          TabOrder = 7
        end
        object DateTimePicker1: TDateTimePicker
          Left = 73
          Top = 105
          Width = 92
          Height = 21
          Date = 42626.476985127320000000
          Time = 42626.476985127320000000
          Color = clWhite
          Kind = dtkTime
          TabOrder = 8
        end
        object Edit4: TEdit
          Left = 71
          Top = 11
          Width = 121
          Height = 21
          TabOrder = 9
          Text = #20116#26666
        end
        object ComboBox2: TComboBox
          Left = 72
          Top = 43
          Width = 93
          Height = 21
          ItemIndex = 0
          TabOrder = 10
          Text = #19996#33694#19968#21378
          Items.Strings = (
            #19996#33694#19968#21378
            #19996#33694#20108#21378)
        end
      end
      object Panel2: TPanel
        Left = 265
        Top = 1
        Width = 819
        Height = 415
        Align = alClient
        TabOrder = 1
        object SGrid1: TStringGrid
          Left = 1
          Top = 1
          Width = 817
          Height = 413
          Align = alClient
          ColCount = 11
          Ctl3D = False
          FixedColor = clMoneyGreen
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = SGrid1KeyPress
          OnSelectCell = SGrid1SelectCell
          ColWidths = (
            34
            108
            53
            48
            96
            47
            63
            64
            64
            64
            64)
          RowHeights = (
            19
            24)
        end
      end
    end
  end
  object cdsSPCMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 168
  end
  object cdsSPCDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 168
  end
end

inherited frmVMIrucang_mod33: TfrmVMIrucang_mod33
  Caption = 'VMI'#20837#20179#26126#32454
  ClientHeight = 508
  ClientWidth = 1154
  WindowState = wsMaximized
  ExplicitWidth = 1170
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1154
    Height = 508
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1154
    ExplicitHeight = 508
    inherited pnl1: TPanel
      Width = 1152
      AutoSize = True
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1152
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 1152
      Height = 473
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 1152
      ExplicitHeight = 473
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 1150
        Height = 202
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 27
          Top = 15
          Width = 42
          Height = 13
          Caption = 'VMI'#26126#32454
        end
        object Label1: TLabel
          Left = 21
          Top = 49
          Width = 48
          Height = 13
          Caption = #20837#20179#21333#21495
        end
        object Label5: TLabel
          Left = 7
          Top = 79
          Width = 66
          Height = 13
          Caption = 'VMI'#20986#24211#21333#21495
        end
        object Label2: TLabel
          Left = 239
          Top = 110
          Width = 36
          Height = 13
          Caption = #20379#24212#21830
        end
        object Label12: TLabel
          Left = 251
          Top = 142
          Width = 24
          Height = 13
          Caption = #24037#21378
        end
        object Label6: TLabel
          Left = 23
          Top = 110
          Width = 48
          Height = 13
          Caption = #36865#36135#26085#26399
        end
        object Label11: TLabel
          Left = 227
          Top = 15
          Width = 48
          Height = 13
          Caption = #37319#36141#21333#21495
        end
        object Label9: TLabel
          Left = 25
          Top = 141
          Width = 48
          Height = 13
          Caption = #36865#36135#21333#21495
        end
        object Label3: TLabel
          Left = 251
          Top = 47
          Width = 24
          Height = 13
          Caption = #36135#24065
        end
        object Label7: TLabel
          Left = 251
          Top = 78
          Width = 24
          Height = 13
          Caption = #27719#29575
        end
        object Label8: TLabel
          Left = 25
          Top = 172
          Width = 48
          Height = 13
          Caption = #36865#36135#20154#21592
        end
        object Label10: TLabel
          Left = 251
          Top = 172
          Width = 24
          Height = 13
          Caption = #22791#27880
        end
        object Label13: TLabel
          Left = 402
          Top = 110
          Width = 3
          Height = 13
        end
        object Label14: TLabel
          Left = 402
          Top = 142
          Width = 3
          Height = 13
        end
        object Label15: TLabel
          Left = 402
          Top = 47
          Width = 3
          Height = 13
        end
        object Edit1: TEdit
          Left = 72
          Top = 13
          Width = 101
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object BitBtn3: TBitBtn
          Tag = 1
          Left = 173
          Top = 11
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
          TabOrder = 1
          OnClick = BitBtn3Click
        end
        object Edit2: TEdit
          Left = 72
          Top = 44
          Width = 120
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object Edit3: TEdit
          Left = 73
          Top = 75
          Width = 119
          Height = 21
          AutoSelect = False
          ReadOnly = True
          TabOrder = 3
        end
        object Edit5: TEdit
          Left = 72
          Top = 136
          Width = 119
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object Edit6: TEdit
          Left = 73
          Top = 167
          Width = 119
          Height = 21
          TabOrder = 5
        end
        object Edit7: TEdit
          Left = 277
          Top = 13
          Width = 119
          Height = 21
          ReadOnly = True
          TabOrder = 6
        end
        object Edit8: TEdit
          Left = 277
          Top = 44
          Width = 119
          Height = 21
          ReadOnly = True
          TabOrder = 7
        end
        object Edit9: TEdit
          Left = 278
          Top = 75
          Width = 119
          Height = 21
          ReadOnly = True
          TabOrder = 8
        end
        object Edit10: TEdit
          Left = 278
          Top = 106
          Width = 119
          Height = 21
          ReadOnly = True
          TabOrder = 9
        end
        object Edit11: TEdit
          Left = 277
          Top = 137
          Width = 119
          Height = 21
          ReadOnly = True
          TabOrder = 10
        end
        object Edit12: TEdit
          Left = 277
          Top = 167
          Width = 325
          Height = 21
          TabOrder = 11
        end
        object CheckBox2: TCheckBox
          Left = 470
          Top = 14
          Width = 132
          Height = 17
          Caption = #20445#23384#21518#25171#21360#20837#20179#21333
          TabOrder = 12
        end
        object CheckBox3: TCheckBox
          Left = 470
          Top = 46
          Width = 145
          Height = 17
          Caption = #23384#20179#20301#32622#25353#24037#21378#36807#28388
          TabOrder = 13
        end
        object dtpReqDate: TDateTimePicker
          Left = 73
          Top = 105
          Width = 122
          Height = 21
          Date = 42626.476985127320000000
          Time = 42626.476985127320000000
          Color = clWhite
          TabOrder = 14
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 203
        Width = 1150
        Height = 269
        Align = alClient
        TabOrder = 1
        object StringGrid1: TStringGrid
          Left = 1
          Top = 1
          Width = 1148
          Height = 267
          Align = alClient
          ColCount = 2
          Ctl3D = False
          DefaultColWidth = 80
          DoubleBuffered = True
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          ParentCtl3D = False
          ParentDoubleBuffered = False
          TabOrder = 0
          OnKeyDown = StringGrid1KeyDown
          OnKeyPress = StringGrid1KeyPress
          OnKeyUp = StringGrid1KeyUp
          OnSelectCell = StringGrid1SelectCell
        end
        object CBloc: TComboBox
          Left = 470
          Top = 84
          Width = 84
          Height = 21
          Style = csDropDownList
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          Visible = False
          OnExit = CBlocExit
          OnKeyDown = CBlocKeyDown
        end
        object ComboBox3: TComboBox
          Left = 608
          Top = 84
          Width = 105
          Height = 21
          TabOrder = 2
          Visible = False
          OnExit = ComboBox3Exit
          OnKeyDown = ComboBox3KeyDown
        end
      end
    end
  end
  object cds456: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 288
  end
  object cds22: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 288
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 288
  end
  object cds16: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 288
  end
  object cds17: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 288
  end
  object cds724: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 248
  end
  object cds149: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 248
  end
  object cds134: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 248
  end
  object cds04_724: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 248
  end
  object cds04_456: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 248
  end
end

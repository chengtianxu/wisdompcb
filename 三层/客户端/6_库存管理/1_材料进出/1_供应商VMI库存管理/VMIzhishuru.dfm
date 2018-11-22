inherited frmVMIzhishuru: TfrmVMIzhishuru
  Caption = #20379#24212#21830#26448#26009#30452#25509#20837#24211
  ClientHeight = 372
  ClientWidth = 416
  ExplicitWidth = 424
  ExplicitHeight = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 416
    Height = 372
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 416
    ExplicitHeight = 372
    inherited pnl1: TPanel
      Width = 414
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 414
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 414
      Height = 337
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 414
      ExplicitHeight = 337
      object Label1: TLabel
        Left = 25
        Top = 15
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #26448#26009#32534#30721':'
      end
      object Label8: TLabel
        Left = 25
        Top = 43
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #26448#26009#21517#31216':'
      end
      object Label10: TLabel
        Left = 25
        Top = 71
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #26448#26009#35268#26684':'
      end
      object Label2: TLabel
        Left = 25
        Top = 99
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #23384#20179#20301#32622':'
      end
      object Label3: TLabel
        Left = 25
        Top = 127
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #23384#36135#21333#20301':'
      end
      object Label4: TLabel
        Left = 48
        Top = 154
        Width = 31
        Height = 13
        AutoSize = False
        Caption = #25968#37327': '
      end
      object Label5: TLabel
        Left = 25
        Top = 182
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #21547#31246#20215#26684':'
      end
      object Label6: TLabel
        Left = 38
        Top = 210
        Width = 41
        Height = 13
        AutoSize = False
        Caption = #31246#29575'%:'
      end
      object Label7: TLabel
        Left = 49
        Top = 238
        Width = 30
        Height = 13
        AutoSize = False
        Caption = #22791#27880':'
      end
      object Label11: TLabel
        Left = 26
        Top = 266
        Width = 54
        Height = 13
        AutoSize = False
        Caption = #29615#20445#26631#35782':'
      end
      object Label12: TLabel
        Left = 28
        Top = 294
        Width = 52
        Height = 13
        Caption = #21046#36896#26085#26399':'
      end
      object dtpReqDate: TDateTimePicker
        Left = 79
        Top = 289
        Width = 114
        Height = 21
        Date = 42626.476985127320000000
        Time = 42626.476985127320000000
        Color = clWhite
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 78
        Top = 12
        Width = 195
        Height = 21
        TabOrder = 1
        OnChange = Edit1Change
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 78
        Top = 39
        Width = 219
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 78
        Top = 66
        Width = 219
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 78
        Top = 123
        Width = 195
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 78
        Top = 150
        Width = 115
        Height = 21
        TabOrder = 5
        OnKeyPress = Edit6KeyPress
      end
      object Edit7: TEdit
        Left = 78
        Top = 179
        Width = 115
        Height = 21
        TabOrder = 6
        OnKeyPress = Edit6KeyPress
      end
      object Edit8: TEdit
        Left = 78
        Top = 206
        Width = 115
        Height = 21
        TabOrder = 7
        OnKeyPress = Edit6KeyPress
      end
      object Edit9: TEdit
        Left = 78
        Top = 234
        Width = 219
        Height = 21
        TabOrder = 8
      end
      object ComboBox2: TComboBox
        Left = 78
        Top = 262
        Width = 115
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 9
        Text = 'ROSH'
        Items.Strings = (
          'ROSH'
          #38750'ROSH')
      end
      object BitBtn2: TBitBtn
        Tag = 1
        Left = 272
        Top = 10
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
        TabOrder = 10
        OnClick = BitBtn1Click
      end
      object BitBtn3: TBitBtn
        Tag = 1
        Left = 271
        Top = 122
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
        TabOrder = 11
        OnClick = BitBtn3Click
      end
      object ComboBox1: TComboBox
        Left = 80
        Top = 94
        Width = 217
        Height = 21
        Style = csDropDownList
        TabOrder = 12
      end
    end
  end
  object cds134: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 56
  end
end

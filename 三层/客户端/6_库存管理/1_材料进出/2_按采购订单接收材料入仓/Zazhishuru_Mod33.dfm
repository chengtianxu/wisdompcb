inherited frmZazhishuru_Mod33: TfrmZazhishuru_Mod33
  Caption = #26434#39033#29289#26009#30452#25509#20837#20179#26126#32454
  ClientHeight = 378
  ClientWidth = 375
  ExplicitWidth = 383
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 375
    Height = 378
    ExplicitWidth = 375
    ExplicitHeight = 378
    inherited pnl1: TPanel
      Width = 373
      ExplicitWidth = 373
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 373
      Height = 343
      ExplicitWidth = 373
      ExplicitHeight = 343
      object Label1: TLabel
        Left = 22
        Top = 19
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #29289#26009#21517#31216':'
      end
      object Label8: TLabel
        Left = 22
        Top = 47
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #29289#26009#35268#26684':'
      end
      object Label10: TLabel
        Left = 22
        Top = 75
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #29289#26009#31867#21035':'
      end
      object Label2: TLabel
        Left = 22
        Top = 103
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #23384#20179#20301#32622':'
      end
      object Label3: TLabel
        Left = 22
        Top = 131
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #23384#36135#21333#20301':'
      end
      object Label4: TLabel
        Left = 45
        Top = 158
        Width = 31
        Height = 13
        AutoSize = False
        Caption = #25968#37327': '
      end
      object Label5: TLabel
        Left = 22
        Top = 186
        Width = 55
        Height = 13
        AutoSize = False
        Caption = #21547#31246#20215#26684':'
      end
      object Label6: TLabel
        Left = 35
        Top = 214
        Width = 41
        Height = 13
        AutoSize = False
        Caption = #31246#29575'%:'
      end
      object Label7: TLabel
        Left = 46
        Top = 242
        Width = 30
        Height = 13
        AutoSize = False
        Caption = #22791#27880':'
      end
      object Label11: TLabel
        Left = 23
        Top = 270
        Width = 54
        Height = 13
        AutoSize = False
        Caption = #29615#20445#26631#35782':'
      end
      object Label12: TLabel
        Left = 25
        Top = 298
        Width = 52
        Height = 13
        Caption = #21046#36896#26085#26399':'
      end
      object dtpReqDate: TDateTimePicker
        Left = 76
        Top = 293
        Width = 114
        Height = 21
        Date = 42626.476985127320000000
        Time = 42626.476985127320000000
        Color = clWhite
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 75
        Top = 16
        Width = 219
        Height = 21
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 75
        Top = 43
        Width = 219
        Height = 21
        TabOrder = 2
      end
      object Edit5: TEdit
        Left = 75
        Top = 127
        Width = 195
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object Edit6: TEdit
        Left = 75
        Top = 154
        Width = 115
        Height = 21
        TabOrder = 4
        OnKeyPress = Edit6KeyPress
      end
      object Edit7: TEdit
        Left = 75
        Top = 183
        Width = 115
        Height = 21
        TabOrder = 5
        OnKeyPress = Edit7KeyPress
      end
      object Edit8: TEdit
        Left = 75
        Top = 210
        Width = 115
        Height = 21
        TabOrder = 6
        OnKeyPress = Edit8KeyPress
      end
      object Edit9: TEdit
        Left = 75
        Top = 238
        Width = 219
        Height = 21
        TabOrder = 7
      end
      object ComboBox2: TComboBox
        Left = 75
        Top = 266
        Width = 115
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 8
        Text = 'ROSH'
        Items.Strings = (
          'ROSH'
          #38750'ROSH')
      end
      object BitBtn3: TBitBtn
        Tag = 1
        Left = 268
        Top = 126
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
        TabOrder = 9
        OnClick = BitBtn3Click
      end
      object ComboBox1: TComboBox
        Left = 77
        Top = 98
        Width = 217
        Height = 21
        Style = csDropDownList
        TabOrder = 10
      end
      object ComboBox3: TComboBox
        Left = 76
        Top = 71
        Width = 217
        Height = 21
        Style = csDropDownList
        TabOrder = 11
      end
    end
  end
end

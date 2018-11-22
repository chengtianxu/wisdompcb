inherited frmMulti_so: TfrmMulti_so
  Caption = #24314#31435#22810#26465'SO'#20449#24687#36755#20837
  ClientHeight = 250
  ClientWidth = 354
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 209
    Width = 354
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 112
      Top = 6
      Width = 67
      Height = 27
      Caption = #30830' '#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 185
      Top = 6
      Width = 67
      Height = 27
      Caption = #21462' '#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 209
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 46
      Top = 30
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = #24320#22987#23458#25143#20132#36135#26399':'
    end
    object Label2: TLabel
      Left = 103
      Top = 59
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#38388#38548':'
    end
    object Label3: TLabel
      Left = 103
      Top = 91
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#27425#25968':'
    end
    object Label4: TLabel
      Left = 76
      Top = 123
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#25968#37327'(Set):'
    end
    object Label5: TLabel
      Left = 221
      Top = 63
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#22825#25968
    end
    object Label6: TLabel
      Left = 76
      Top = 151
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#25968#37327'(Pcs):'
    end
    object Label7: TLabel
      Left = 82
      Top = 176
      Width = 165
      Height = 14
      AutoSize = False
    end
    object MaskEdit1: TMaskEdit
      Left = 137
      Top = 27
      Width = 86
      Height = 21
      EditMask = '!0000-!90-90;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
    end
    object Edit1: TEdit
      Left = 137
      Top = 57
      Width = 87
      Height = 21
      MaxLength = 3
      TabOrder = 1
      Text = '0'
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 137
      Top = 88
      Width = 86
      Height = 21
      MaxLength = 2
      TabOrder = 2
      Text = '1'
      OnExit = Edit2Exit
      OnKeyPress = Edit1KeyPress
    end
    object Edit3: TEdit
      Left = 137
      Top = 120
      Width = 87
      Height = 21
      TabOrder = 3
      Text = '0'
      OnExit = Edit3Exit
      OnKeyPress = Edit1KeyPress
    end
    object Edit4: TEdit
      Left = 137
      Top = 148
      Width = 87
      Height = 21
      TabOrder = 4
      Text = '0'
      OnExit = Edit4Exit
      OnKeyPress = Edit1KeyPress
    end
  end
end

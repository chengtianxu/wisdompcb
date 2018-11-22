object Form_edit: TForm_edit
  Left = 480
  Top = 187
  Width = 542
  Height = 342
  Caption = #22791#27880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 41
    Align = alTop
    TabOrder = 0
    object btn1: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 85
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 534
    Height = 274
    Align = alClient
    TabOrder = 1
    object lbl1: TLabel
      Left = 16
      Top = 14
      Width = 41
      Height = 13
      AutoSize = False
      Caption = #37096#38376':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 179
      Top = 14
      Width = 36
      Height = 17
      AutoSize = False
      Caption = #32844#21153':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 16
      Top = 43
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #24037#21495':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 179
      Top = 43
      Width = 37
      Height = 13
      AutoSize = False
      Caption = #22995#21517':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lab_emp_id: TLabel
      Left = 14
      Top = 163
      Width = 73
      Height = 13
      AutoSize = False
      Visible = False
    end
    object lab_remark_rkey: TLabel
      Left = 14
      Top = 200
      Width = 73
      Height = 13
      AutoSize = False
      Visible = False
    end
    object lbl7: TLabel
      Left = 177
      Top = 73
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #20219#28385#26085#26399':'
    end
    object lbl8: TLabel
      Left = 310
      Top = 40
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #23601#20219#26085#26399':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 310
      Top = 14
      Width = 91
      Height = 13
      AutoSize = False
      Caption = #39044#23450#23703#20301#26376#25968':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 17
      Top = 73
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #24310#20219#26376#25968':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 11
      Top = 102
      Width = 38
      Height = 13
      AutoSize = False
      Caption = #22791#27880
    end
    object Lab_departmentname: TLabel
      Left = 54
      Top = 14
      Width = 114
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lab_employeecode: TLabel
      Left = 54
      Top = 43
      Width = 78
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lab_zhiwu: TLabel
      Left = 221
      Top = 14
      Width = 73
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lab_chinesename: TLabel
      Left = 219
      Top = 43
      Width = 73
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lab_circle: TLabel
      Left = 409
      Top = 14
      Width = 72
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lab_begindate: TLabel
      Left = 376
      Top = 40
      Width = 73
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lab_departmentid: TLabel
      Left = 14
      Top = 176
      Width = 86
      Height = 13
      AutoSize = False
      Visible = False
    end
    object lab_zhiwuid: TLabel
      Left = 14
      Top = 189
      Width = 73
      Height = 13
      AutoSize = False
      Visible = False
    end
    object Lab_enddate: TLabel
      Left = 246
      Top = 71
      Width = 73
      Height = 13
      AutoSize = False
    end
    object mmo1: TMemo
      Left = 16
      Top = 128
      Width = 505
      Height = 121
      Lines.Strings = (
        '')
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 84
      Top = 70
      Width = 44
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
  end
end

object frmSigne: TfrmSigne
  Left = 500
  Top = 169
  Width = 623
  Height = 535
  Caption = #22521#35757#31614#21040
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 504
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 613
      Height = 264
      Align = alTop
      TabOrder = 0
      object Label8: TLabel
        Left = 42
        Top = 154
        Width = 52
        Height = 13
        Caption = #22521#35757#22320#28857
      end
      object Label1: TLabel
        Left = 42
        Top = 120
        Width = 52
        Height = 13
        Caption = #22521#35757#35762#24072
      end
      object Label4: TLabel
        Left = 42
        Top = 92
        Width = 52
        Height = 13
        Caption = #24320#22987#26102#38388
      end
      object lbl4: TLabel
        Left = 42
        Top = 58
        Width = 52
        Height = 13
        Caption = #22521#35757#20027#39064
      end
      object lbl3: TLabel
        Left = 42
        Top = 28
        Width = 52
        Height = 13
        Caption = #22521#35757#32534#21495
      end
      object Label15: TLabel
        Left = 305
        Top = 121
        Width = 52
        Height = 13
        Caption = #22521#35757#36153#29992
        Visible = False
      end
      object Label5: TLabel
        Left = 305
        Top = 90
        Width = 52
        Height = 13
        Caption = #32467#26463#26102#38388
      end
      object lbl5: TLabel
        Left = 305
        Top = 154
        Width = 52
        Height = 13
        Caption = #22521#35757#26102#38271
      end
      object Label2: TLabel
        Left = 311
        Top = 26
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #22521#35757#31867#22411
        Visible = False
      end
      object lbl6: TLabel
        Left = 42
        Top = 183
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #35838#31243#31867#21035
      end
      object lbl9: TLabel
        Left = 42
        Top = 209
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #22521#35757#26041#24335
      end
      object lbl8: TLabel
        Left = 42
        Top = 238
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #32771#26680#26041#24335
      end
      object edt_ccode: TEdit
        Left = 109
        Top = 24
        Width = 177
        Height = 21
        Enabled = False
        MaxLength = 50
        TabOrder = 1
      end
      object edt_CName: TEdit
        Left = 109
        Top = 54
        Width = 445
        Height = 21
        Enabled = False
        MaxLength = 50
        TabOrder = 2
      end
      object BDate: TDateTimePicker
        Left = 108
        Top = 88
        Width = 97
        Height = 21
        Date = 41204.484723900460000000
        Time = 41204.484723900460000000
        TabOrder = 5
      end
      object BTime: TDateTimePicker
        Left = 199
        Top = 88
        Width = 81
        Height = 21
        Date = 41205.333333333340000000
        Time = 41205.333333333340000000
        Kind = dtkTime
        TabOrder = 6
      end
      object edt_TTeacher: TEdit
        Left = 108
        Top = 118
        Width = 165
        Height = 21
        TabOrder = 7
      end
      object edt_TPlace: TEdit
        Left = 108
        Top = 150
        Width = 165
        Height = 21
        MaxLength = 20
        TabOrder = 9
      end
      object edt_THOurs: TEdit
        Left = 365
        Top = 150
        Width = 182
        Height = 21
        MaxLength = 50
        TabOrder = 10
      end
      object EDate: TDateTimePicker
        Left = 367
        Top = 86
        Width = 97
        Height = 21
        Date = 41204.484830057870000000
        Time = 41204.484830057870000000
        TabOrder = 3
      end
      object ETime: TDateTimePicker
        Left = 463
        Top = 86
        Width = 81
        Height = 21
        Date = 41205.333333333340000000
        Time = 41205.333333333340000000
        Kind = dtkTime
        TabOrder = 4
      end
      object edt_TCost: TEdit
        Left = 365
        Top = 118
        Width = 176
        Height = 21
        TabOrder = 8
        Text = '0'
        Visible = False
      end
      object btn_begin: TButton
        Left = 400
        Top = 208
        Width = 75
        Height = 25
        Caption = #24320#22987#31614#21040
        TabOrder = 13
        OnClick = btn_beginClick
      end
      object cbb_TType: TComboBox
        Left = 368
        Top = 22
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Visible = False
        Items.Strings = (
          ' ')
      end
      object cbb_ETYpe: TComboBox
        Left = 110
        Top = 236
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 14
        Text = #21475#35797#32771#26680
        Items.Strings = (
          #21475#35797#32771#26680
          #31508#35797#32771#26680
          #23454#25805#32771#26680
          #22312#32447#32771#26680)
      end
      object cbb_TType2: TComboBox
        Left = 110
        Top = 207
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 12
        Text = #35838#31243#38754#25480
        Items.Strings = (
          #35838#31243#38754#25480
          #23454#25805#22521#35757
          #22312#32447#22521#35757)
      end
      object cbb_CType: TComboBox
        Left = 110
        Top = 179
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 11
        Text = #20837#32844#22521#35757
        Items.Strings = (
          #20837#32844#22521#35757
          #23703#21069#22521#35757
          #22312#23703#22521#35757)
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 265
      Width = 613
      Height = 238
      Align = alClient
      TabOrder = 1
      object lbl1: TLabel
        Left = 172
        Top = 37
        Width = 76
        Height = 19
        Caption = #31614#21040#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl_result: TLabel
        Left = 254
        Top = 67
        Width = 28
        Height = 27
        Caption = '..'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -27
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object edt_emp: TEdit
        Left = 246
        Top = 34
        Width = 185
        Height = 21
        TabOrder = 0
        OnExit = edt_empExit
        OnKeyDown = edt_empKeyDown
      end
    end
  end
end

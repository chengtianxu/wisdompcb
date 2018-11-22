object Form16: TForm16
  Left = 216
  Top = 147
  Width = 754
  Height = 536
  Caption = #21457#36865#30005#23376#37038#20214
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 746
    Height = 139
    Align = alTop
    Caption = #37038#20214#21457#36865#35774#32622
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 23
      Width = 62
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'SMTP'#20027#26426':'
    end
    object Label2: TLabel
      Left = 271
      Top = 78
      Width = 80
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21457#20214#20154#22995#21517':'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 8
      Top = 51
      Width = 78
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21457#20214#20154#22320#22336':'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 49
      Top = 106
      Width = 37
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20027#39064':'
    end
    object Label4: TLabel
      Left = 305
      Top = 22
      Width = 47
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '  '#29992#25143#21517':'
    end
    object Label6: TLabel
      Left = 315
      Top = 52
      Width = 35
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #23494#30721':'
    end
    object Label7: TLabel
      Left = 6
      Top = 79
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = ' '#25910#20214#20154#22320#22336':'
    end
    object SpeedButton1: TSpeedButton
      Left = 384
      Top = 104
      Width = 105
      Height = 27
      Caption = #22686#21152#38468#20214
      Flat = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFF2222FFFFFFFFFFFFFFFFFFFF1111FFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFF8888FFF0000000000000FFFF0000FFF0B8B8B8B8B8B0FFFF
        0000FFF08B8B8B8B8B80FFFF0000FFF0B8B8B8B8B8B0FFFF0000FFF08B8B8B8B
        8B80FFFF0000FFF0B8B8B8B8B8B0FFFF5555FFF08B8B8B8B8B80FFFF0000FFF0
        B8B8B8B8B8B0FFFF8888FFFB00000000000BFFFF0000FFFF0FFF0FFFFFFFFCFF
        0000FFFFF000FFFFFFFFFCFF0000FFFFFFFFFFFFFFCFCFFF0000FFFFFFFFFFFF
        FFCCFFFF0000FFFFFFFFFFFFFFCCCFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFF1111}
      OnClick = SpeedButton1Click
    end
    object Edit1: TEdit
      Left = 92
      Top = 19
      Width = 191
      Height = 21
      Color = 12182499
      TabOrder = 0
      Text = 'smtp.163.com'
    end
    object Edit2: TEdit
      Left = 357
      Top = 75
      Width = 130
      Height = 21
      Color = 16579527
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 92
      Top = 48
      Width = 191
      Height = 21
      Color = 12182499
      TabOrder = 1
      Text = 'cowboy738@163.com'
    end
    object Edit5: TEdit
      Left = 92
      Top = 102
      Width = 193
      Height = 21
      Color = 16579527
      TabOrder = 6
      Text = #37319#36141#35746#21333
    end
    object Edit4: TEdit
      Left = 357
      Top = 19
      Width = 129
      Height = 21
      Color = 12182499
      TabOrder = 2
    end
    object Edit6: TEdit
      Left = 357
      Top = 48
      Width = 130
      Height = 21
      Color = 12182499
      PasswordChar = '*'
      TabOrder = 3
    end
    object Edit7: TEdit
      Left = 92
      Top = 75
      Width = 192
      Height = 21
      Color = 16579527
      TabOrder = 4
    end
    object ListBox1: TListBox
      Left = 511
      Top = 15
      Width = 233
      Height = 122
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      PopupMenu = PopupMenu1
      TabOrder = 7
      OnKeyDown = ListBox1KeyDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 139
    Width = 746
    Height = 300
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object RichEdit1: TRichEdit
      Left = 0
      Top = 0
      Width = 746
      Height = 300
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 439
    Width = 746
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      746
      70)
    object Button3: TButton
      Left = 280
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21457#36865
      TabOrder = 0
      OnClick = Button3Click
      OnEnter = Button3Enter
    end
    object Button4: TButton
      Left = 361
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #36864#20986
      TabOrder = 1
      OnClick = Button4Click
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 51
      Width = 746
      Height = 19
      Panels = <>
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 9
    Top = 170
  end
  object NMSMTP1: TNMSMTP
    Port = 25
    ReportLevel = 0
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'us-ascii'
    OnRecipientNotFound = NMSMTP1RecipientNotFound
    OnHeaderIncomplete = NMSMTP1HeaderIncomplete
    OnAuthenticationFailed = NMSMTP1AuthenticationFailed
    Left = 42
    Top = 171
  end
  object PopupMenu1: TPopupMenu
    Left = 552
    Top = 64
    object N1: TMenuItem
      Caption = #21024#38500
      ShortCut = 16452
      OnClick = N1Click
    end
  end
end

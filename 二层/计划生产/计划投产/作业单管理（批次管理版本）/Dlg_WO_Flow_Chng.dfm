object frmDlg_WO_Flow_Chng: TfrmDlg_WO_Flow_Chng
  Left = 376
  Top = 127
  BorderStyle = bsDialog
  Caption = #20316#19994#21333#20449#24687
  ClientHeight = 471
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 16
    Top = 232
    Width = 78
    Height = 13
    Caption = #21382#21490#21464#26356#35760#24405
  end
  object Label10: TLabel
    Left = 16
    Top = 348
    Width = 78
    Height = 13
    Caption = #26412#27425#21464#26356#22791#27880
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 8
    Width = 549
    Height = 145
    Caption = #20316#19994#21333#20449#24687
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 59
      Height = 13
      Caption = #20316#19994#21333#21495':'
    end
    object Label16: TLabel
      Left = 40
      Top = 47
      Width = 59
      Height = 13
      Caption = #25237#20135#25968#37327':'
    end
    object Label17: TLabel
      Left = 296
      Top = 70
      Width = 59
      Height = 13
      Caption = #25253#24223#25968#37327':'
    end
    object Label18: TLabel
      Left = 296
      Top = 47
      Width = 59
      Height = 13
      Caption = #23436#24037#25968#37327':'
    end
    object Label2: TLabel
      Left = 19
      Top = 93
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = #22312#32447#25968#37327'PCS:'
    end
    object Label12: TLabel
      Left = 275
      Top = 93
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = #22312#32447#25968#37327'PNL:'
    end
    object Label3: TLabel
      Left = 14
      Top = 70
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = #35745#21010#20837#20179#26085#26399':'
    end
    object Label4: TLabel
      Left = 309
      Top = 117
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #20248#20808#32423':'
    end
    object Label5: TLabel
      Left = 40
      Top = 116
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #22312#32447#24037#24207':'
    end
    object Label19: TLabel
      Left = 296
      Top = 24
      Width = 59
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = #26412#21378#32534#21495':'
      ParentBiDiMode = False
    end
    object edtWONO: TEdit
      Left = 104
      Top = 16
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 0
    end
    object edtProdNo: TEdit
      Left = 361
      Top = 16
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 1
    end
    object edtQty: TEdit
      Left = 104
      Top = 40
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 2
    end
    object edtFinQty: TEdit
      Left = 361
      Top = 40
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 3
    end
    object edtPlanDate: TEdit
      Left = 104
      Top = 64
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 4
    end
    object edtDiscardQty: TEdit
      Left = 361
      Top = 64
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 5
    end
    object edtONlinePCS: TEdit
      Left = 104
      Top = 88
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 6
    end
    object edtOnlinePNL: TEdit
      Left = 361
      Top = 88
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 7
    end
    object edtWorkStep: TEdit
      Left = 104
      Top = 113
      Width = 153
      Height = 21
      Color = clScrollBar
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtPriority: TEdit
      Left = 361
      Top = 113
      Width = 153
      Height = 21
      Color = clScrollBar
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20013#25991
      ReadOnly = True
      TabOrder = 9
    end
  end
  object Memo1: TMemo
    Left = 12
    Top = 248
    Width = 548
    Height = 89
    Color = clScrollBar
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 12
    Top = 160
    Width = 549
    Height = 65
    Caption = #26356#25913#20869#23481
    TabOrder = 2
    object Label8: TLabel
      Left = 40
      Top = 32
      Width = 59
      Height = 13
      Caption = #35843#25972#24037#24207':'
    end
    object Label9: TLabel
      Left = 309
      Top = 32
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #20248#20808#32423':'
    end
    object comboxStepNew: TComboBox
      Left = 104
      Top = 26
      Width = 153
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      TabOrder = 0
      OnClick = comboxStepNewClick
    end
    object edtPriorityNew: TSpinEdit
      Left = 360
      Top = 26
      Width = 153
      Height = 22
      MaxValue = 9
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnExit = edtPriorityNewExit
    end
  end
  object Memo2: TMemo
    Left = 12
    Top = 366
    Width = 549
    Height = 48
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 3
  end
  object Button1: TButton
    Left = 168
    Top = 434
    Width = 75
    Height = 21
    Caption = #30830#23450'(&Y)'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 312
    Top = 429
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 5
  end
end

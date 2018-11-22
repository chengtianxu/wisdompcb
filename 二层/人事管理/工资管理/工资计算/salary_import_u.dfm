object frm_salary_import: Tfrm_salary_import
  Left = 377
  Top = 179
  Width = 891
  Height = 551
  Caption = #24037#36164#25968#25454#23548#20837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    883
    524)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 169
    Top = 1
    Width = 609
    Height = 31
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label_accountid: TLabel
    Left = 792
    Top = 8
    Width = 3
    Height = 13
    Visible = False
  end
  object Label_rowcount: TLabel
    Left = 408
    Top = 501
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label2: TLabel
    Left = 15
    Top = 479
    Width = 810
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #27880': '#21464#20540#38145#23450#21518#65292#12304#24037#36164#22788#29702#12305#23558#19981#20877#20174#21518#21488#25910#38598#21644#26356#26032#24037#26102#12289#22870#24809#12289#20249#39135#31561#65288#25968#20540#39033#30446#65289#30340#25968#25454#12290
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 16
    Top = 496
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #25171#24320#25991#20214
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 496
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #26816#26597
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 192
    Top = 496
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #23548#20837
    TabOrder = 2
    OnClick = Button3Click
  end
  object StringGrid1: TStringGrid
    Left = 5
    Top = 40
    Width = 871
    Height = 434
    Anchors = [akLeft, akTop, akRight, akBottom]
    DefaultColWidth = 80
    DefaultRowHeight = 18
    FixedCols = 0
    FixedRows = 2
    TabOrder = 3
  end
  object Button4: TButton
    Left = 280
    Top = 496
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #23548#20986
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 0
    Width = 75
    Height = 33
    Caption = #23548#20986#27169#26495
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 88
    Top = 0
    Width = 75
    Height = 33
    Caption = #36864#20986
    TabOrder = 6
    OnClick = Button6Click
  end
  object CheckBox1: TCheckBox
    Left = 582
    Top = 494
    Width = 145
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #26356#26032#23436#21518#38145#23450#21464#20540
    TabOrder = 7
  end
  object CheckBox2: TCheckBox
    Left = 730
    Top = 494
    Width = 134
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #20165#29992#20110#24403#21069#24080#22871#21592#24037
    TabOrder = 8
  end
  object OpenDialog1: TOpenDialog
    Left = 832
    Top = 8
  end
end

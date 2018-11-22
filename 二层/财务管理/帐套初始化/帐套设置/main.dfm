object FrmMain: TFrmMain
  Left = 328
  Top = 158
  Width = 474
  Height = 394
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #24080#22871#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 108
    Top = 288
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #24080#22871#21551#29992#26085#26399':'
  end
  object BitBtn1: TBitBtn
    Left = 115
    Top = 320
    Width = 92
    Height = 25
    Caption = #21019#24314#24080#22871
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 267
    Top = 320
    Width = 92
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 16
    Width = 417
    Height = 260
    Caption = #31185#30446#32534#30721#35268#21017
    TabOrder = 2
    object Panel1: TPanel
      Left = 16
      Top = 24
      Width = 393
      Height = 225
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 80
        Height = 13
        AutoSize = False
        Caption = #19968#32423#38271#24230
      end
      object Label2: TLabel
        Left = 16
        Top = 65
        Width = 80
        Height = 13
        AutoSize = False
        Caption = #20108#32423#38271#24230
      end
      object Label3: TLabel
        Left = 16
        Top = 98
        Width = 80
        Height = 13
        AutoSize = False
        Caption = #19977#32423#38271#24230
      end
      object Label4: TLabel
        Left = 16
        Top = 131
        Width = 80
        Height = 13
        AutoSize = False
        Caption = #22235#32423#38271#24230
      end
      object Label5: TLabel
        Left = 16
        Top = 164
        Width = 80
        Height = 13
        AutoSize = False
        Caption = #20116#32423#38271#24230
      end
      object Label6: TLabel
        Left = 16
        Top = 198
        Width = 80
        Height = 13
        AutoSize = False
        Caption = #20845#32423#38271#24230
      end
      object SpinEdit1: TSpinEdit
        Left = 104
        Top = 27
        Width = 41
        Height = 22
        Enabled = False
        MaxValue = 4
        MinValue = 4
        TabOrder = 0
        Value = 4
      end
      object SpinEdit2: TSpinEdit
        Left = 104
        Top = 60
        Width = 41
        Height = 22
        Enabled = False
        MaxValue = 8
        MinValue = 1
        TabOrder = 1
        Value = 4
      end
      object SpinEdit3: TSpinEdit
        Left = 104
        Top = 93
        Width = 41
        Height = 22
        MaxValue = 8
        MinValue = 1
        TabOrder = 2
        Value = 2
      end
      object SpinEdit4: TSpinEdit
        Left = 104
        Top = 126
        Width = 41
        Height = 22
        MaxValue = 8
        MinValue = 1
        TabOrder = 3
        Value = 2
      end
      object SpinEdit5: TSpinEdit
        Left = 104
        Top = 159
        Width = 41
        Height = 22
        MaxValue = 8
        MinValue = 1
        TabOrder = 4
        Value = 2
      end
      object SpinEdit6: TSpinEdit
        Left = 104
        Top = 192
        Width = 41
        Height = 22
        MaxValue = 8
        MinValue = 1
        TabOrder = 5
        Value = 2
      end
      object Memo1: TMemo
        Left = 166
        Top = 32
        Width = 223
        Height = 180
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        Lines.Strings = (
          #26412#31995#32479#25552#20379#26368#22810#20845#32423#30340#20250#35745#31185
          ''
          #30446#65292#38500#31532#19968','#31532#20108#32423#31185#30446#38271#24230#30001
          ''
          #31995#32479#23450#20041#22806#65292#20854#20182#21508#32423#31185#30446#38271
          ''
          #24230#22343#21487#20197#30001#29992#25143#26681#25454#21333#20301#30340#23454
          ''
          #38469#24773#20917#26469#23450#20041#65292#20294#31185#30446#32534#30721#24635
          ''
          #38271#24230#19981#24471#36229#36807'18'#20301#12290)
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 208
    Top = 283
    Width = 129
    Height = 21
    Date = 37546.000000000000000000
    Time = 37546.000000000000000000
    TabOrder = 3
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=WISDOMPCB;Data Source=172.16.1.57'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 15
  end
  object ADOData0508: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from data0508')
    Left = 48
    Top = 15
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 80
    Top = 16
  end
end

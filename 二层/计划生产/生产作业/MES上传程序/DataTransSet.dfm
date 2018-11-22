object FrmDataTransSet: TFrmDataTransSet
  Left = 368
  Top = 119
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25968#25454#20256#36755#35774#23450
  ClientHeight = 533
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 481
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 33
      Top = 14
      Width = 66
      Height = 13
      Caption = #25968#25454#24211'IP'#65306
    end
    object Bevel1: TBevel
      Left = 3
      Top = 40
      Width = 518
      Height = 1
      Shape = bsTopLine
    end
    object Edit1: TEdit
      Left = 106
      Top = 9
      Width = 159
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 48
      Width = 545
      Height = 433
      ActivePage = TabSheet1
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #25968#25454#19978#20256#35774#23450
        object Label2: TLabel
          Left = 25
          Top = 361
          Width = 65
          Height = 13
          Caption = #29983#25928#26085#26399#65306
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 8
          Width = 489
          Height = 273
          Caption = #35774#23450#19978#20256#26102#38388#27573
          TabOrder = 0
          object CheckBox1: TCheckBox
            Left = 16
            Top = 24
            Width = 65
            Height = 17
            Caption = '00:00'
            TabOrder = 0
          end
          object CheckBox2: TCheckBox
            Tag = 1
            Left = 16
            Top = 55
            Width = 65
            Height = 17
            Caption = '00:30'
            TabOrder = 1
          end
          object CheckBox3: TCheckBox
            Tag = 2
            Left = 16
            Top = 86
            Width = 65
            Height = 17
            Caption = '01:00'
            TabOrder = 2
          end
          object CheckBox4: TCheckBox
            Tag = 3
            Left = 16
            Top = 118
            Width = 65
            Height = 17
            Caption = '01:30'
            TabOrder = 3
          end
          object CheckBox5: TCheckBox
            Tag = 4
            Left = 16
            Top = 149
            Width = 65
            Height = 17
            Caption = '02:00'
            TabOrder = 4
          end
          object CheckBox6: TCheckBox
            Tag = 5
            Left = 16
            Top = 181
            Width = 65
            Height = 17
            Caption = '02:30'
            TabOrder = 5
          end
          object CheckBox7: TCheckBox
            Tag = 6
            Left = 16
            Top = 212
            Width = 65
            Height = 17
            Caption = '03:00'
            TabOrder = 6
          end
          object CheckBox8: TCheckBox
            Tag = 7
            Left = 16
            Top = 244
            Width = 65
            Height = 17
            Caption = '03:30'
            TabOrder = 7
          end
          object CheckBox9: TCheckBox
            Tag = 8
            Left = 91
            Top = 24
            Width = 65
            Height = 17
            Caption = '04:00'
            TabOrder = 8
          end
          object CheckBox10: TCheckBox
            Tag = 9
            Left = 91
            Top = 55
            Width = 65
            Height = 17
            Caption = '04:30'
            TabOrder = 9
          end
          object CheckBox11: TCheckBox
            Tag = 10
            Left = 91
            Top = 86
            Width = 65
            Height = 17
            Caption = '05:00'
            TabOrder = 10
          end
          object CheckBox12: TCheckBox
            Tag = 11
            Left = 91
            Top = 118
            Width = 65
            Height = 17
            Caption = '05:30'
            TabOrder = 11
          end
          object CheckBox13: TCheckBox
            Tag = 12
            Left = 91
            Top = 149
            Width = 65
            Height = 17
            Caption = '06:00'
            TabOrder = 12
          end
          object CheckBox14: TCheckBox
            Tag = 13
            Left = 91
            Top = 181
            Width = 65
            Height = 17
            Caption = '06:30'
            TabOrder = 13
          end
          object CheckBox15: TCheckBox
            Tag = 14
            Left = 91
            Top = 212
            Width = 65
            Height = 17
            Caption = '07:00'
            TabOrder = 14
          end
          object CheckBox16: TCheckBox
            Tag = 15
            Left = 91
            Top = 244
            Width = 65
            Height = 17
            Caption = '07:30'
            TabOrder = 15
          end
          object CheckBox17: TCheckBox
            Tag = 16
            Left = 166
            Top = 24
            Width = 65
            Height = 17
            Caption = '08:00'
            TabOrder = 16
          end
          object CheckBox18: TCheckBox
            Tag = 17
            Left = 166
            Top = 55
            Width = 65
            Height = 17
            Caption = '08:30'
            TabOrder = 17
          end
          object CheckBox19: TCheckBox
            Tag = 18
            Left = 166
            Top = 86
            Width = 65
            Height = 17
            Caption = '09:00'
            TabOrder = 18
          end
          object CheckBox20: TCheckBox
            Tag = 19
            Left = 166
            Top = 118
            Width = 65
            Height = 17
            Caption = '09:30'
            TabOrder = 19
          end
          object CheckBox21: TCheckBox
            Tag = 20
            Left = 166
            Top = 149
            Width = 65
            Height = 17
            Caption = '10:00'
            TabOrder = 20
          end
          object CheckBox22: TCheckBox
            Tag = 21
            Left = 166
            Top = 181
            Width = 65
            Height = 17
            Caption = '10:30'
            TabOrder = 21
          end
          object CheckBox23: TCheckBox
            Tag = 22
            Left = 166
            Top = 212
            Width = 65
            Height = 17
            Caption = '11:00'
            TabOrder = 22
          end
          object CheckBox24: TCheckBox
            Tag = 23
            Left = 166
            Top = 244
            Width = 65
            Height = 17
            Caption = '11:30'
            TabOrder = 23
          end
          object CheckBox25: TCheckBox
            Tag = 24
            Left = 241
            Top = 24
            Width = 65
            Height = 17
            Caption = '12:00'
            TabOrder = 24
          end
          object CheckBox26: TCheckBox
            Tag = 25
            Left = 241
            Top = 55
            Width = 65
            Height = 17
            Caption = '12:30'
            TabOrder = 25
          end
          object CheckBox27: TCheckBox
            Tag = 26
            Left = 241
            Top = 86
            Width = 65
            Height = 17
            Caption = '13:00'
            TabOrder = 26
          end
          object CheckBox28: TCheckBox
            Tag = 27
            Left = 241
            Top = 118
            Width = 65
            Height = 17
            Caption = '13:30'
            TabOrder = 27
          end
          object CheckBox29: TCheckBox
            Tag = 28
            Left = 241
            Top = 149
            Width = 65
            Height = 17
            Caption = '14:00'
            TabOrder = 28
          end
          object CheckBox30: TCheckBox
            Tag = 29
            Left = 241
            Top = 181
            Width = 65
            Height = 17
            Caption = '14:30'
            TabOrder = 29
          end
          object CheckBox31: TCheckBox
            Tag = 30
            Left = 241
            Top = 212
            Width = 65
            Height = 17
            Caption = '15:00'
            TabOrder = 30
          end
          object CheckBox32: TCheckBox
            Tag = 31
            Left = 241
            Top = 244
            Width = 65
            Height = 17
            Caption = '15:30'
            TabOrder = 31
          end
          object CheckBox33: TCheckBox
            Tag = 32
            Left = 316
            Top = 24
            Width = 65
            Height = 17
            Caption = '16:00'
            TabOrder = 32
          end
          object CheckBox34: TCheckBox
            Tag = 33
            Left = 316
            Top = 55
            Width = 65
            Height = 17
            Caption = '16:30'
            TabOrder = 33
          end
          object CheckBox35: TCheckBox
            Tag = 34
            Left = 316
            Top = 86
            Width = 65
            Height = 17
            Caption = '17:00'
            TabOrder = 34
          end
          object CheckBox36: TCheckBox
            Tag = 35
            Left = 316
            Top = 118
            Width = 65
            Height = 17
            Caption = '17:30'
            TabOrder = 35
          end
          object CheckBox37: TCheckBox
            Tag = 36
            Left = 316
            Top = 149
            Width = 65
            Height = 17
            Caption = '18:00'
            TabOrder = 36
          end
          object CheckBox38: TCheckBox
            Tag = 37
            Left = 316
            Top = 181
            Width = 65
            Height = 17
            Caption = '18:30'
            TabOrder = 37
          end
          object CheckBox39: TCheckBox
            Tag = 38
            Left = 316
            Top = 212
            Width = 65
            Height = 17
            Caption = '19:00'
            TabOrder = 38
          end
          object CheckBox40: TCheckBox
            Tag = 39
            Left = 316
            Top = 244
            Width = 65
            Height = 17
            Caption = '19:30'
            TabOrder = 39
          end
          object CheckBox41: TCheckBox
            Tag = 40
            Left = 392
            Top = 24
            Width = 65
            Height = 17
            Caption = '20:00'
            TabOrder = 40
          end
          object CheckBox42: TCheckBox
            Tag = 41
            Left = 392
            Top = 55
            Width = 65
            Height = 17
            Caption = '20:30'
            TabOrder = 41
          end
          object CheckBox43: TCheckBox
            Tag = 42
            Left = 392
            Top = 81
            Width = 65
            Height = 25
            Caption = '21:00'
            TabOrder = 42
          end
          object CheckBox44: TCheckBox
            Tag = 43
            Left = 392
            Top = 118
            Width = 65
            Height = 17
            Caption = '21:30'
            TabOrder = 43
          end
          object CheckBox45: TCheckBox
            Tag = 44
            Left = 392
            Top = 149
            Width = 65
            Height = 17
            Caption = '22:00'
            TabOrder = 44
          end
          object CheckBox46: TCheckBox
            Tag = 45
            Left = 392
            Top = 181
            Width = 65
            Height = 17
            Caption = '22:30'
            TabOrder = 45
          end
          object CheckBox47: TCheckBox
            Tag = 46
            Left = 392
            Top = 212
            Width = 65
            Height = 17
            Caption = '23:00'
            TabOrder = 46
          end
          object CheckBox48: TCheckBox
            Tag = 47
            Left = 392
            Top = 244
            Width = 65
            Height = 17
            Caption = '23:30'
            TabOrder = 47
          end
        end
        object DateTimePicker1: TDateTimePicker
          Left = 104
          Top = 357
          Width = 129
          Height = 21
          Date = 42319.377848437500000000
          Time = 42319.377848437500000000
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
        object RadioGroup1: TRadioGroup
          Left = 18
          Top = 293
          Width = 487
          Height = 56
          Caption = #25968#25454#19978#20256#35774#23450
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #21487#20197#19978#20256
            #31105#27490#19978#20256)
          TabOrder = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = #25968#25454#22791#20221#35774#23450
        ImageIndex = 1
        object Label3: TLabel
          Left = 16
          Top = 18
          Width = 65
          Height = 13
          Caption = #22791#20221#36335#24452#65306
        end
        object Label5: TLabel
          Left = 27
          Top = 51
          Width = 52
          Height = 13
          Caption = #24320#22987#20110#65306
        end
        object Edit2: TEdit
          Left = 83
          Top = 15
          Width = 188
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 83
          Top = 47
          Width = 110
          Height = 21
          Date = 42326.671263425910000000
          Time = 42326.671263425910000000
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
        object CheckBox49: TCheckBox
          Tag = 101
          Left = 277
          Top = 353
          Width = 121
          Height = 17
          Caption = #21024#38500#24050#19978#20256#25968#25454
          TabOrder = 2
        end
        object GroupBox2: TGroupBox
          Left = 15
          Top = 80
          Width = 425
          Height = 249
          Caption = #35774#23450#22791#20221#21608#26399
          TabOrder = 3
          object Label6: TLabel
            Left = 123
            Top = 29
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label7: TLabel
            Left = 123
            Top = 57
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label8: TLabel
            Left = 123
            Top = 86
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label9: TLabel
            Left = 123
            Top = 115
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label10: TLabel
            Left = 123
            Top = 145
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label11: TLabel
            Left = 123
            Top = 174
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label12: TLabel
            Left = 361
            Top = 28
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label13: TLabel
            Left = 361
            Top = 57
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label14: TLabel
            Left = 361
            Top = 86
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label15: TLabel
            Left = 361
            Top = 115
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label16: TLabel
            Left = 361
            Top = 144
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label17: TLabel
            Left = 361
            Top = 173
            Width = 13
            Height = 13
            Caption = #26085
          end
          object Label4: TLabel
            Left = 24
            Top = 207
            Width = 65
            Height = 13
            Caption = #22791#20221#26102#38388#65306
          end
          object CheckBox50: TCheckBox
            Tag = 48
            Left = 26
            Top = 24
            Width = 49
            Height = 22
            Caption = '1'#26376
            TabOrder = 0
          end
          object SpinEdit1: TSpinEdit
            Left = 71
            Top = 24
            Width = 39
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 1
            Value = 1
          end
          object CheckBox51: TCheckBox
            Tag = 49
            Left = 26
            Top = 53
            Width = 49
            Height = 22
            Caption = '2'#26376
            TabOrder = 2
          end
          object CheckBox52: TCheckBox
            Tag = 50
            Left = 26
            Top = 82
            Width = 49
            Height = 22
            Caption = '3'#26376
            TabOrder = 3
          end
          object CheckBox53: TCheckBox
            Tag = 51
            Left = 26
            Top = 111
            Width = 49
            Height = 22
            Caption = '4'#26376
            TabOrder = 4
          end
          object CheckBox54: TCheckBox
            Tag = 52
            Left = 26
            Top = 140
            Width = 49
            Height = 22
            Caption = '5'#26376
            TabOrder = 5
          end
          object CheckBox55: TCheckBox
            Tag = 53
            Left = 26
            Top = 169
            Width = 49
            Height = 22
            Caption = '6'#26376
            TabOrder = 6
          end
          object CheckBox56: TCheckBox
            Tag = 54
            Left = 264
            Top = 24
            Width = 49
            Height = 22
            Caption = '7'#26376
            TabOrder = 7
          end
          object CheckBox57: TCheckBox
            Tag = 55
            Left = 264
            Top = 52
            Width = 49
            Height = 22
            Caption = '8'#26376
            TabOrder = 8
          end
          object CheckBox58: TCheckBox
            Tag = 56
            Left = 264
            Top = 81
            Width = 49
            Height = 22
            Caption = '9'#26376
            TabOrder = 9
          end
          object CheckBox59: TCheckBox
            Tag = 57
            Left = 264
            Top = 110
            Width = 49
            Height = 22
            Caption = '10'#26376
            TabOrder = 10
          end
          object CheckBox60: TCheckBox
            Tag = 58
            Left = 264
            Top = 139
            Width = 49
            Height = 22
            Caption = '11'#26376
            TabOrder = 11
          end
          object CheckBox61: TCheckBox
            Tag = 59
            Left = 264
            Top = 168
            Width = 49
            Height = 22
            Caption = '12'#26376
            TabOrder = 12
          end
          object SpinEdit2: TSpinEdit
            Left = 71
            Top = 53
            Width = 39
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 13
            Value = 1
          end
          object SpinEdit3: TSpinEdit
            Left = 71
            Top = 82
            Width = 39
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 14
            Value = 1
          end
          object SpinEdit4: TSpinEdit
            Left = 71
            Top = 112
            Width = 39
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 15
            Value = 1
          end
          object SpinEdit5: TSpinEdit
            Left = 71
            Top = 141
            Width = 39
            Height = 22
            MaxValue = 30
            MinValue = 1
            TabOrder = 16
            Value = 1
          end
          object SpinEdit6: TSpinEdit
            Left = 71
            Top = 171
            Width = 39
            Height = 22
            MaxValue = 30
            MinValue = 1
            TabOrder = 17
            Value = 1
          end
          object SpinEdit7: TSpinEdit
            Left = 314
            Top = 24
            Width = 39
            Height = 22
            MaxValue = 29
            MinValue = 1
            TabOrder = 18
            Value = 1
          end
          object SpinEdit8: TSpinEdit
            Left = 314
            Top = 52
            Width = 39
            Height = 22
            MaxValue = 30
            MinValue = 1
            TabOrder = 19
            Value = 1
          end
          object SpinEdit9: TSpinEdit
            Left = 314
            Top = 81
            Width = 39
            Height = 22
            MaxValue = 30
            MinValue = 1
            TabOrder = 20
            Value = 1
          end
          object SpinEdit10: TSpinEdit
            Left = 314
            Top = 110
            Width = 39
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 21
            Value = 1
          end
          object SpinEdit11: TSpinEdit
            Left = 314
            Top = 139
            Width = 39
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 22
            Value = 1
          end
          object SpinEdit12: TSpinEdit
            Left = 314
            Top = 168
            Width = 39
            Height = 22
            MaxValue = 31
            MinValue = 1
            TabOrder = 23
            Value = 1
          end
          object DateTimePicker4: TDateTimePicker
            Left = 88
            Top = 204
            Width = 97
            Height = 21
            Date = 42332.333333333340000000
            Format = 'HH:mm:ss'
            Time = 42332.333333333340000000
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
            Kind = dtkTime
            TabOrder = 24
          end
        end
        object CheckBox62: TCheckBox
          Tag = 100
          Left = 16
          Top = 352
          Width = 73
          Height = 17
          Caption = #22791#20221#21551#29992
          TabOrder = 4
        end
        object BitBtn3: TBitBtn
          Left = 272
          Top = 12
          Width = 75
          Height = 25
          Caption = #36873#25321#36335#24452
          TabOrder = 5
          OnClick = BitBtn3Click
        end
      end
    end
    object BitBtn4: TBitBtn
      Left = 368
      Top = 8
      Width = 113
      Height = 25
      Caption = #31995#32479#33258#21160#21551#21160
      TabOrder = 2
      OnClick = BitBtn4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 481
    Width = 533
    Height = 52
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 80
      Top = 14
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 255
      Top = 15
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkCancel
    end
  end
end

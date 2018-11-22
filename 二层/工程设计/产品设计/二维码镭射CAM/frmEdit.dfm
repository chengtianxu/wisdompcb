object Form2: TForm2
  Left = 329
  Top = 135
  Width = 1279
  Height = 758
  Caption = #26032#22686
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 719
    Align = alLeft
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 24
      Width = 64
      Height = 16
      Caption = #26412#21378#32534#21495
    end
    object lbl2: TLabel
      Left = 17
      Top = 121
      Width = 48
      Height = 16
      Caption = #35774#22791'ID'
    end
    object lbl3: TLabel
      Left = 16
      Top = 180
      Width = 56
      Height = 16
      Caption = 'CAM'#29256#26412
    end
    object lbl4: TLabel
      Left = 16
      Top = 236
      Width = 56
      Height = 16
      Caption = 'CAM'#25551#36848
    end
    object btn1: TSpeedButton
      Left = 144
      Top = 40
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btn1Click
    end
    object lbl5: TLabel
      Left = 9
      Top = 336
      Width = 144
      Height = 16
      Caption = #26597#30475#22352#26631'Type'#23450#20041#65306
    end
    object lbl6: TLabel
      Left = 17
      Top = 70
      Width = 56
      Height = 16
      Caption = 'CAM'#21517#23383
    end
    object edtBCBH: TEdit
      Left = 16
      Top = 41
      Width = 121
      Height = 24
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object edtCAMVer: TDBEdit
      Left = 17
      Top = 196
      Width = 49
      Height = 24
      DataField = 'CAMVer'
      DataSource = Form1.ds1
      TabOrder = 1
    end
    object edtCAMVer1: TDBEdit
      Left = 16
      Top = 254
      Width = 177
      Height = 24
      DataField = 'CAMDesc'
      DataSource = Form1.ds1
      TabOrder = 2
    end
    object btnSave: TButton
      Left = 109
      Top = 600
      Width = 73
      Height = 49
      Caption = #20445#23384
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object btn3: TButton
      Left = 109
      Top = 664
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 4
      OnClick = btn3Click
    end
    object mmoTypeInfo: TMemo
      Left = 8
      Top = 392
      Width = 273
      Height = 145
      ReadOnly = True
      TabOrder = 5
      OnKeyDown = mmoTypeInfoKeyDown
    end
    object cbxTypeDef: TComboBox
      Left = 8
      Top = 360
      Width = 273
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 6
      OnChange = cbxTypeDefChange
    end
    object edtCAMDesc: TDBEdit
      Left = 16
      Top = 142
      Width = 177
      Height = 24
      DataField = 'MatchID'
      DataSource = Form1.ds1
      TabOrder = 7
    end
    object edtMatchID: TDBEdit
      Left = 16
      Top = 91
      Width = 177
      Height = 24
      DataField = 'CAMName'
      DataSource = Form1.ds1
      TabOrder = 8
    end
  end
  object pnl2: TPanel
    Left = 297
    Top = 0
    Width = 966
    Height = 719
    Align = alClient
    TabOrder = 1
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 964
      Height = 717
      ActivePage = ts1
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Caption = 'CAM'#25991#20214
        object dbmmoCAMTxt: TDBMemo
          Left = 0
          Top = 0
          Width = 956
          Height = 686
          Align = alClient
          DataField = 'CAMTxt'
          DataSource = Form1.ds1
          TabOrder = 0
        end
      end
      object ts2: TTabSheet
        Caption = #22270#29255
        ImageIndex = 1
        object imgCAMImg: TDBImage
          Left = 0
          Top = 0
          Width = 956
          Height = 686
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
end

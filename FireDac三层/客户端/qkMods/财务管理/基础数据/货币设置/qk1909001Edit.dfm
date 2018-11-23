inherited frmqk1909001Edit: Tfrmqk1909001Edit
  Caption = 'frmqk1909001Edit'
  ClientHeight = 419
  ClientWidth = 612
  ExplicitWidth = 628
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 612
    Height = 419
    ExplicitWidth = 612
    ExplicitHeight = 370
    object lbl3: TLabel [0]
      Left = 109
      Top = 77
      Width = 65
      Height = 13
      Caption = #36135#24065#20195#30721#65306
    end
    object lbl4: TLabel [1]
      Left = 109
      Top = 111
      Width = 65
      Height = 13
      Caption = #36135#24065#21517#31216#65306
    end
    object lbl6: TLabel [2]
      Left = 109
      Top = 145
      Width = 65
      Height = 13
      Caption = #35760#36134#27719#29575#65306
    end
    object lbl7: TLabel [3]
      Left = 109
      Top = 179
      Width = 65
      Height = 13
      Caption = #35760#36134#27719#29575#65306
    end
    object lbl8: TLabel [4]
      Left = 109
      Top = 213
      Width = 65
      Height = 13
      Caption = #25253#20215#27719#29575#65306
    end
    object lbl9: TLabel [5]
      Left = 109
      Top = 247
      Width = 65
      Height = 13
      Caption = #25253#20215#27719#29575#65306
    end
    object lbl5: TLabel [6]
      Left = 109
      Top = 281
      Width = 65
      Height = 13
      Caption = #26356#26032#26102#38388#65306
    end
    inherited pnlTop: TPanel
      Width = 610
      ExplicitWidth = 610
      inherited pnlTopTool: TPanel
        Width = 608
        ExplicitWidth = 608
        inherited btnSave: TRzBitBtn
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitHeight = 23
        end
        inherited btnClose: TRzBitBtn
          ExplicitLeft = 75
          ExplicitTop = 0
          ExplicitHeight = 23
        end
      end
    end
    object edtCurr_Code: TDBEdit
      Left = 189
      Top = 74
      Width = 150
      Height = 21
      DataField = 'Curr_Code'
      DataSource = ds1
      TabOrder = 1
      OnChange = edtCurr_CodeChange
    end
    object edtCurr_ChsName: TDBEdit
      Left = 189
      Top = 108
      Width = 150
      Height = 21
      DataField = 'Curr_ChsName'
      DataSource = ds1
      TabOrder = 2
    end
    object edt1: TRzEdit
      Left = 345
      Top = 142
      Width = 139
      Height = 21
      Text = ''
      Color = clInfoBk
      FocusColor = clWhite
      ReadOnly = True
      TabOrder = 3
    end
    object edt3: TRzEdit
      Left = 345
      Top = 176
      Width = 139
      Height = 21
      Text = ''
      Color = clInfoBk
      FocusColor = clWhite
      ReadOnly = True
      TabOrder = 4
    end
    object edt4: TRzEdit
      Left = 345
      Top = 210
      Width = 139
      Height = 21
      Text = ''
      Color = clInfoBk
      FocusColor = clWhite
      ReadOnly = True
      TabOrder = 5
    end
    object edt5: TRzEdit
      Left = 345
      Top = 244
      Width = 139
      Height = 21
      Text = ''
      Color = clInfoBk
      FocusColor = clWhite
      ReadOnly = True
      TabOrder = 6
    end
    object dtpTDate: TRzDBDateTimeEdit
      Left = 189
      Top = 278
      Width = 150
      Height = 21
      DataSource = ds1
      DataField = 'TDate'
      TabOrder = 7
      EditType = etDate
    end
    object cbxIsBase: TRzDBCheckBox
      Left = 348
      Top = 282
      Width = 124
      Height = 15
      DataField = 'IsBaseCurr'
      DataSource = ds1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = #22522#20934#36135#24065'('#26412#20301#24065')'
      TabOrder = 8
    end
    object edtRateTobase: TEdit
      Left = 189
      Top = 142
      Width = 150
      Height = 21
      TabOrder = 9
      OnChange = edtRateTobaseChange
    end
    object edtBaseToRate: TEdit
      Left = 189
      Top = 176
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 10
    end
    object edtPrice_RateToBase: TEdit
      Left = 189
      Top = 210
      Width = 150
      Height = 21
      TabOrder = 11
      OnChange = edtPrice_RateToBaseChange
    end
    object edtPrice_basetoRate: TEdit
      Left = 189
      Top = 244
      Width = 150
      Height = 21
      ReadOnly = True
      TabOrder = 12
    end
  end
  object ds1: TDataSource
    DataSet = mt1
    Left = 392
    Top = 344
  end
  object mt1: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 344
  end
end

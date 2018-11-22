inherited frmEditchukushu: TfrmEditchukushu
  Caption = #20462#25913#25968#37327#20215#26684
  ClientHeight = 231
  ClientWidth = 259
  ExplicitWidth = 267
  ExplicitHeight = 258
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 259
    Height = 231
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 259
    ExplicitHeight = 231
    inherited pnl1: TPanel
      Width = 257
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 257
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 257
      Height = 196
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 257
      ExplicitHeight = 196
      object Label4: TLabel
        Left = 29
        Top = 20
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #25509#25910#25968#37327
      end
      object Label1: TLabel
        Left = 29
        Top = 54
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #21457#25918#25968#37327
      end
      object Label2: TLabel
        Left = 29
        Top = 87
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #36864#20179#25968#37327
      end
      object Label3: TLabel
        Left = 29
        Top = 121
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #21547#31246#20215#26684
      end
      object Label5: TLabel
        Left = 29
        Top = 155
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #24211#23384#25968#37327
      end
      object Label6: TLabel
        Left = 209
        Top = 88
        Width = 36
        Height = 13
        Caption = #36864#20179#25968
        Visible = False
      end
      object Edit1: TEdit
        Left = 80
        Top = 16
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 80
        Top = 51
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 80
        Top = 85
        Width = 121
        Height = 21
        TabOrder = 2
        OnExit = Edit3Exit
        OnKeyPress = Edit3KeyPress
      end
      object Edit4: TEdit
        Left = 80
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 3
        OnKeyPress = Edit4KeyPress
      end
      object Edit5: TEdit
        Left = 80
        Top = 155
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object cds134: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 40
  end
  object cds149: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 136
  end
end

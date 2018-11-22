inherited FrmReturn_Mod01: TFrmReturn_Mod01
  Caption = 'FrmReturn_Mod01'
  ClientHeight = 393
  ClientWidth = 464
  Font.Charset = GB2312_CHARSET
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  ExplicitWidth = 472
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 464
    Height = 393
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 464
    ExplicitHeight = 393
    inherited pnl1: TPanel
      Width = 462
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 462
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 462
      Height = 358
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 462
      ExplicitHeight = 358
      object Label1: TLabel
        Left = 121
        Top = 44
        Width = 59
        Height = 13
        Caption = #36135#24065#20195#30721':'
      end
      object Label2: TLabel
        Left = 121
        Top = 90
        Width = 59
        Height = 13
        Caption = #36135#24065#21517#31216':'
      end
      object Label3: TLabel
        Left = 48
        Top = 130
        Width = 132
        Height = 13
        Caption = #35760#24080#27719#29575'('#26412#24065':'#22806#24065'):'
      end
      object Label4: TLabel
        Left = 48
        Top = 175
        Width = 132
        Height = 13
        Caption = #35760#24080#27719#29575'('#22806#24065':'#26412#24065'):'
      end
      object Label5: TLabel
        Left = 48
        Top = 218
        Width = 132
        Height = 13
        Caption = #25253#20215#27719#29575'('#26412#24065':'#22806#24065'):'
      end
      object Label6: TLabel
        Left = 48
        Top = 266
        Width = 132
        Height = 13
        Caption = #25253#20215#27719#29575'('#22806#24065':'#26412#24065'):'
      end
      object Label7: TLabel
        Left = 147
        Top = 306
        Width = 33
        Height = 13
        Caption = #26085#26399':'
      end
      object Edit1: TEdit
        Left = 192
        Top = 83
        Width = 245
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 192
        Top = 125
        Width = 121
        Height = 21
        TabOrder = 1
        OnClick = Edit2Click
        OnKeyPress = Edit2KeyPress
        OnKeyUp = Edit2KeyUp
      end
      object Edit3: TEdit
        Left = 192
        Top = 169
        Width = 121
        Height = 21
        TabOrder = 2
        OnClick = Edit2Click
        OnKeyPress = Edit2KeyPress
        OnKeyUp = Edit3KeyUp
      end
      object Edit4: TEdit
        Left = 192
        Top = 213
        Width = 121
        Height = 21
        TabOrder = 3
        OnClick = Edit2Click
        OnKeyPress = Edit2KeyPress
        OnKeyUp = Edit4KeyUp
      end
      object Edit5: TEdit
        Left = 192
        Top = 261
        Width = 121
        Height = 21
        TabOrder = 4
        OnClick = Edit2Click
        OnKeyPress = Edit2KeyPress
        OnKeyUp = Edit5KeyUp
      end
      object MaskEdit1: TMaskEdit
        Left = 192
        Top = 300
        Width = 121
        Height = 21
        TabOrder = 5
        Text = '    -  -  '
        OnExit = MaskEdit1Exit
      end
      object bar1: TStatusBar
        Left = 1
        Top = 338
        Width = 460
        Height = 19
        Panels = <>
      end
      object Edit6: TEdit
        Left = 192
        Top = 37
        Width = 121
        Height = 21
        TabOrder = 7
        OnExit = Edit6Exit
      end
      object Edit7: TEdit
        Left = 316
        Top = 125
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 8
      end
      object Edit8: TEdit
        Left = 316
        Top = 169
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 9
      end
      object Edit9: TEdit
        Left = 316
        Top = 213
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 10
      end
      object Edit10: TEdit
        Left = 316
        Top = 261
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 11
      end
    end
  end
  object cds_01: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 48
  end
end

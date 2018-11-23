object frmqkMainApp: TfrmqkMainApp
  Left = 0
  Top = 0
  Caption = 'frmqkMainApp'
  ClientHeight = 741
  ClientWidth = 1884
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 1884
    Height = 722
    ActivePage = tsHomePage
    Align = alClient
    TabOrder = 0
    object tsHomePage: TTabSheet
      Caption = #20027#39029
      object pnl1: TPanel
        Left = 113
        Top = 0
        Width = 1763
        Height = 693
        Align = alClient
        TabOrder = 1
        object pgcWorkSpace: TPageControl
          Left = 1
          Top = 1
          Width = 1761
          Height = 691
          ActivePage = tsMod
          Align = alClient
          TabOrder = 0
          object tsMod: TTabSheet
            Caption = 'tsMod'
            TabVisible = False
            object spl1: TSplitter
              Left = 0
              Top = 396
              Width = 1753
              Height = 8
              Cursor = crVSplit
              Align = alBottom
              Beveled = True
              ExplicitTop = 273
              ExplicitWidth = 637
            end
            object lbl2: TRzLabel
              Left = 0
              Top = 383
              Width = 1753
              Height = 13
              Align = alBottom
              Caption = '<'#25910#34255#30340#27169#22359'>'
              ExplicitWidth = 79
            end
            object lv1: TRzListView
              Left = 0
              Top = 0
              Width = 1753
              Height = 383
              Align = alClient
              BorderStyle = bsNone
              Columns = <>
              FrameColor = clWhite
              HotTrackStyles = [htHandPoint]
              LargeImages = ilMod
              ReadOnly = True
              TabOrder = 0
              OnDblClick = lv1DblClick
              OnMouseDown = lv1MouseDown
            end
            object lv2: TRzListView
              Left = 0
              Top = 404
              Width = 1753
              Height = 277
              Align = alBottom
              BorderStyle = bsNone
              Columns = <>
              HotTrackStyles = [htHandPoint]
              LargeImages = ilLike
              ReadOnly = True
              TabOrder = 1
              OnDblClick = lv1DblClick
              OnMouseDown = lv2MouseDown
            end
          end
          object tsView: TTabSheet
            Caption = 'tsView'
            TabVisible = False
            object lbl1: TLabel
              Left = 24
              Top = 16
              Width = 39
              Height = 13
              Caption = #27969#31243#22270
            end
          end
        end
      end
      object gpLeftTree: TRzGroupBar
        Left = 0
        Top = 0
        Width = 113
        Height = 693
        BorderShadow = clWhite
        GradientColorStyle = gcsCustom
        GradientColorStart = 10526303
        GradientColorStop = 10526303
        FlatColor = 10526303
        LargeImages = il2
        Style = gbsOutlook
        GroupBorderSize = 0
        UniqueItemSelection = True
        Color = 10526303
        ParentColor = False
        TabOrder = 0
      end
    end
    object tsWorkSpace: TTabSheet
      Caption = #24037#20316#21488
      object pgc2: TPageControl
        Left = 0
        Top = 0
        Width = 1876
        Height = 693
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 722
    Width = 1884
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 250
      end>
  end
  object il2: TImageList
    Height = 32
    Width = 32
    Left = 72
    Top = 384
  end
  object ilMod: TImageList
    Height = 32
    Width = 32
    Left = 280
    Top = 168
  end
  object mtMod: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 330
    Top = 167
  end
  object mtLike: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 330
    Top = 359
  end
  object ilLike: TImageList
    Height = 32
    Width = 32
    Left = 272
    Top = 360
  end
  object pm1: TPopupMenu
    Left = 386
    Top = 167
    object N1: TMenuItem
      Caption = #25910#34255
      OnClick = N1Click
    end
  end
  object pm2: TPopupMenu
    Left = 386
    Top = 359
    object MenuItem1: TMenuItem
      Tag = 1
      Caption = #19981#25910#34255
      OnClick = N1Click
    end
  end
  object mm1: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 241
    Top = 38
    object mniN2: TMenuItem
      Caption = #25805#20316
      object mniChangeDB: TMenuItem
        Caption = #20999#25442#36134#22871
      end
      object mniChangePsw: TMenuItem
        Caption = #20462#25913#23494#30721
        OnClick = mniChangePswClick
      end
      object mniChangeSkin: TMenuItem
        Caption = #26356#25913#37197#33394
        OnClick = mniChangeSkinClick
      end
      object mniRefreshSvrBuffer: TMenuItem
        Caption = #21047#26032#26381#21153
        OnClick = mniRefreshSvrBufferClick
      end
    end
  end
end

object Form1: TForm1
  Left = 273
  Top = 242
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20973#35777#25688#35201#23383#20856
  ClientHeight = 381
  ClientWidth = 503
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 503
    Height = 340
    ActivePage = Tabsheet1
    Align = alClient
    TabOrder = 0
    object Tabsheet1: TTabSheet
      Caption = #25688#35201#31867#21035
      object DBGrid1: TDBGrid
        Left = 9
        Top = 8
        Width = 224
        Height = 282
        DataSource = DM.DataSource1
        DragKind = dkDock
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DICT_GRP'
            Title.Alignment = taCenter
            Title.Caption = #25688#35201#31867#21035
            Width = 221
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 320
        Top = 40
        Width = 75
        Height = 25
        Caption = #22686#21152
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 320
        Top = 140
        Width = 75
        Height = 25
        Caption = #32534#36753
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 320
        Top = 240
        Width = 75
        Height = 25
        Caption = #21024#38500
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button3Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20973#35777#25688#35201
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 9
        Top = 8
        Width = 224
        Height = 282
        DataSource = DM.DataSource2
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRIPTION'
            Title.Alignment = taCenter
            Title.Caption = #25688#35201
            Width = 226
            Visible = True
          end>
      end
      object Button4: TButton
        Left = 320
        Top = 40
        Width = 75
        Height = 25
        Caption = #22686#21152
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 320
        Top = 140
        Width = 75
        Height = 25
        Caption = #32534#36753
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 320
        Top = 240
        Width = 75
        Height = 25
        Caption = #21024#38500
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button6Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 503
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 57
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
  end
end

object Form1: TForm1
  Left = 224
  Top = 145
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23450#36164#20135#21464#21160#26041#24335
  ClientHeight = 347
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 34
    Top = 16
    Width = 249
    Height = 313
    Caption = #22266#23450#36164#20135#21464#21160
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 8
      Top = 24
      Width = 233
      Height = 273
      DataSource = DM.DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FASSET_ALT_TYPE'
          Title.Caption = #36164#20135#21464#21160#26041#24335#21517#31216
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'type'
          Title.Caption = #21464#21160#26041#24335
          Width = 86
          Visible = True
        end>
    end
  end
  object BitBtn1: TBitBtn
    Left = 320
    Top = 61
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    Kind = bkClose
  end
  object Button1: TButton
    Left = 320
    Top = 141
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 201
    Width = 75
    Height = 25
    Caption = #32534#36753
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 320
    Top = 261
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 4
    OnClick = Button3Click
  end
end

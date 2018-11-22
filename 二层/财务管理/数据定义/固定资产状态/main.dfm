object Form1: TForm1
  Left = 217
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22266#23450#36164#20135#29366#24577
  ClientHeight = 331
  ClientWidth = 456
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
    Left = 8
    Top = 16
    Width = 321
    Height = 289
    Caption = #22266#23450#36164#20135#29366#24577
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 8
      Top = 24
      Width = 305
      Height = 265
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
          FieldName = 'FASSET_STATUS'
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'v_status'
          Width = 151
          Visible = True
        end>
    end
  end
  object Button1: TButton
    Left = 368
    Top = 136
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 192
    Width = 75
    Height = 25
    Caption = #32534#36753
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 368
    Top = 248
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 3
    OnClick = Button3Click
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 56
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    Kind = bkClose
  end
end

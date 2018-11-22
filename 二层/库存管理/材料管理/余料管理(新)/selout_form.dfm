object Form_selout: TForm_selout
  Left = 235
  Top = 242
  Width = 812
  Height = 560
  Caption = #20986#20179#24211#23384#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 796
    Height = 482
    Align = alClient
    DataSource = dm.DataSource3
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MAT_CODE'
        Title.Color = clRed
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mat_desc'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEN_SIZE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WEI_SIZE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rema_number'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMBER'
        ReadOnly = False
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        ReadOnly = False
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 40
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      796
      40)
    object Label1: TLabel
      Left = 250
      Top = 13
      Width = 52
      Height = 13
      Caption = #20313#26009#32534#21495
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 6
      Width = 60
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 64
      Top = 6
      Width = 60
      Height = 30
      Caption = #21047#26032
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object BitBtn3: TBitBtn
      Left = 124
      Top = 6
      Width = 60
      Height = 30
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object Edit1: TEdit
      Left = 320
      Top = 9
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 3
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 498
      Top = 0
      Width = 259
      Height = 38
      Anchors = [akTop, akRight]
      Caption = #26085#26399#33539#22260
      TabOrder = 4
      object Label2: TLabel
        Left = 6
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label3: TLabel
        Left = 134
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object dt1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        TabOrder = 0
        OnExit = dt1Exit
      end
      object dt2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        TabOrder = 1
        OnExit = dt1Exit
      end
    end
  end
end

object Form1: TForm1
  Left = 433
  Top = 191
  Width = 1139
  Height = 708
  Caption = #20108#32500#30721#38253#23556'CAM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1123
    Height = 33
    Align = alTop
    TabOrder = 0
    object btnExit: TBitBtn
      Left = 0
      Top = 1
      Width = 69
      Height = 31
      Caption = #36864#20986
      TabOrder = 0
      OnClick = btnExitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnRefresh: TBitBtn
      Left = 68
      Top = 1
      Width = 65
      Height = 31
      Caption = #21047#26032
      TabOrder = 1
      OnClick = btnRefreshClick
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
    object edtFilter: TLabeledEdit
      Left = 405
      Top = 6
      Width = 121
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 15
      EditLabel.Caption = #26412#21378#32534#21495
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = #40657#20307
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      LabelPosition = lpLeft
      TabOrder = 2
      OnChange = edtFilterChange
    end
    object btn1: TBitBtn
      Left = 135
      Top = 2
      Width = 65
      Height = 31
      Caption = #26435#38480#35828#26126
      TabOrder = 3
      OnClick = btn1Click
    end
    object rb1: TRadioButton
      Left = 592
      Top = 8
      Width = 73
      Height = 17
      Caption = #26377#25928
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = rb2Click
    end
    object rb2: TRadioButton
      Left = 672
      Top = 8
      Width = 73
      Height = 17
      Caption = #26080#25928
      TabOrder = 5
      OnClick = rb2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 33
    Width = 1123
    Height = 636
    Align = alClient
    TabOrder = 1
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1121
      Height = 634
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      PopupMenu = pm1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = eh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          Title.Caption = #23458#25143#22411#21495
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'MatchID'
          Footers = <>
          Title.Caption = #35774#22791'ID'
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'CAMName'
          Footers = <>
          Title.Caption = 'CAM'#21517#23383
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'CAMVer'
          Footers = <>
          Title.Caption = 'CAM'#29256#26412
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'CAMDesc'
          Footers = <>
          Title.Caption = 'CAM'#25551#36848
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Caption = #20462#35746#20154
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'ModiyTime'
          Footers = <>
          Title.Caption = #25913#21160#26102#38388
          Width = 120
        end
        item
          ButtonStyle = cbsDropDown
          EditButtons = <>
          FieldName = 'Active'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1')
          PickList.Strings = (
            #26080#25928
            #26377#25928)
          Title.Caption = #26159#21542#26377#25928
          Width = 70
        end>
    end
  end
  object ads1: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    CommandText = 
      'SELECT cam.*,MANU_PART_NUMBER,MANU_PART_DESC,EMPLOYEE_NAME FROM ' +
      'Print2D_CAM cam'#13#10'inner JOIN Data0025 d25 ON d25.rkey = D25_Ptr'#13#10 +
      'inner JOIN data0005 d05 ON d05.rkey = cam.ModiyUser'#13#10'where activ' +
      'e = :p1'
    IndexFieldNames = 'ModiyTime'
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 488
    Top = 313
    object ads1IDkey: TGuidField
      FieldName = 'IDkey'
      FixedChar = True
      Size = 38
    end
    object ads1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads1D25_Ptr: TIntegerField
      FieldName = 'D25_Ptr'
    end
    object ads1MatchID: TStringField
      FieldName = 'MatchID'
      Size = 500
    end
    object ads1CAMName: TStringField
      FieldName = 'CAMName'
      Size = 550
    end
    object ads1CAMVer: TFloatField
      FieldName = 'CAMVer'
    end
    object ads1CAMDesc: TStringField
      FieldName = 'CAMDesc'
      Size = 550
    end
    object ads1CAMTxt: TMemoField
      FieldName = 'CAMTxt'
      BlobType = ftMemo
    end
    object ads1ModiyUser: TIntegerField
      FieldName = 'ModiyUser'
    end
    object ads1ModiyTime: TDateTimeField
      FieldName = 'ModiyTime'
    end
    object ads1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads1Active: TIntegerField
      FieldName = 'Active'
    end
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 560
    Top = 313
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 648
    Top = 209
    object mniN1: TMenuItem
      Caption = #26032#22686
      Visible = False
      OnClick = mniN1Click
    end
    object mniSetActive: TMenuItem
      Caption = #35774#20026#26377#25928
      Visible = False
      OnClick = mniSetActiveClick
    end
    object mniView: TMenuItem
      Caption = #26597#30475
      OnClick = mniViewClick
    end
    object mniUpImg: TMenuItem
      Caption = #19978#20256#22270#29255
      Visible = False
      OnClick = mniUpImgClick
    end
  end
  object qrytmp: TADOQuery
    Connection = dm1.con1
    Parameters = <>
    Left = 720
    Top = 281
  end
  object dlgOpen1: TOpenDialog
    Left = 624
    Top = 417
  end
end

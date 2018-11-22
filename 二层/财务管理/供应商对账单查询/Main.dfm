object Frm_Main: TFrm_Main
  Left = 455
  Top = 317
  Width = 649
  Height = 301
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Frm_Main'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Top = 8
    Width = 625
    Height = 97
    Caption = #20379#24212#21830#33539#22260
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 32
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel
      Left = 40
      Top = 64
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Label5: TLabel
      Left = 176
      Top = 32
      Width = 7
      Height = 13
    end
    object Label6: TLabel
      Left = 176
      Top = 64
      Width = 7
      Height = 13
    end
    object Edit1: TEdit
      Left = 64
      Top = 28
      Width = 65
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 64
      Top = 60
      Width = 65
      Height = 21
      TabOrder = 1
      OnExit = Edit2Exit
    end
    object BitBtn1: TBitBtn
      Left = 136
      Top = 28
      Width = 25
      Height = 21
      TabOrder = 2
      OnClick = BitBtn1Click
      OnExit = BitBtn1Exit
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object BitBtn2: TBitBtn
      Left = 136
      Top = 60
      Width = 25
      Height = 21
      TabOrder = 3
      OnClick = BitBtn2Click
      OnExit = BitBtn2Exit
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 625
    Height = 57
    Caption = #21457#31080#31867#22411
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 40
      Top = 24
      Width = 97
      Height = 17
      Caption = #26631#20934'PO'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 144
      Top = 24
      Width = 97
      Height = 17
      Caption = #26434#39033'PO'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 240
      Top = 24
      Width = 97
      Height = 17
      Caption = #20854#23427#36153#29992
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 344
      Top = 24
      Width = 97
      Height = 17
      Caption = #36864#36135#22791#24536
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 464
      Top = 24
      Width = 105
      Height = 17
      Caption = #20854#23427#25187#27454
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 176
    Width = 625
    Height = 57
    Caption = #25130#27490#26085#26399
    TabOrder = 2
    object Label3: TLabel
      Left = 40
      Top = 28
      Width = 65
      Height = 13
      Caption = #21457#31080#26085#26399#20174
    end
    object Label4: TLabel
      Left = 256
      Top = 28
      Width = 13
      Height = 13
      Caption = #21040
    end
    object dtpk1: TDateTimePicker
      Left = 120
      Top = 24
      Width = 120
      Height = 21
      Date = 41082.427958078710000000
      Time = 41082.427958078710000000
      TabOrder = 0
    end
    object dtpk2: TDateTimePicker
      Left = 284
      Top = 24
      Width = 120
      Height = 21
      Date = 41082.427958078710000000
      Time = 41082.427958078710000000
      TabOrder = 1
    end
  end
  object BitBtn3: TBitBtn
    Left = 240
    Top = 242
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 3
    OnClick = BitBtn3Click
    Kind = bkYes
  end
  object BitBtn4: TBitBtn
    Left = 344
    Top = 242
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = BitBtn4Click
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
  object qrySup: TADOQuery
    Connection = DM.ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0023'
      'where code = :code')
    Left = 256
    Top = 40
    object qrySupRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qrySupCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object qrySupSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object qrySupABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
  end
end

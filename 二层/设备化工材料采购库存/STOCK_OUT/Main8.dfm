object FrmMain8: TFrmMain8
  Left = 222
  Top = 165
  Width = 739
  Height = 503
  Caption = #21457#26009#21040#26469#26009#26816#26597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label6: TLabel
      Left = 178
      Top = 21
      Width = 68
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21378#25151':'
    end
    object Label3: TLabel
      Left = 297
      Top = 21
      Width = 119
      Height = 13
      AutoSize = False
    end
    object empl_ptr: TLabel
      Left = 416
      Top = 32
      Width = 38
      Height = 13
      AutoSize = False
      Caption = '0'
      Visible = False
    end
    object Label4: TLabel
      Left = 181
      Top = 48
      Width = 68
      Height = 12
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Barcode '#21495':'
    end
    object BitBtn1: TBitBtn
      Left = 14
      Top = 8
      Width = 25
      Height = 26
      Hint = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
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
    object Edit2: TEdit
      Left = 253
      Top = 17
      Width = 72
      Height = 21
      TabOrder = 0
      OnExit = Edit2Exit
    end
    object BitBtn4: TBitBtn
      Left = 328
      Top = 17
      Width = 22
      Height = 21
      TabOrder = 3
      TabStop = False
      OnMouseDown = BitBtn4MouseDown
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
    object Edit3: TEdit
      Left = 253
      Top = 44
      Width = 136
      Height = 21
      Enabled = False
      TabOrder = 1
      OnEnter = Edit3Enter
      OnExit = Edit3Exit
      OnKeyPress = Edit3KeyPress
    end
    object BitBtn5: TBitBtn
      Left = 393
      Top = 44
      Width = 22
      Height = 21
      Enabled = False
      TabOrder = 4
      TabStop = False
      OnEnter = BitBtn5Enter
      OnMouseDown = BitBtn5MouseDown
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
    object RadioGroup1: TRadioGroup
      Left = 84
      Top = 32
      Width = 97
      Height = 33
      Caption = #26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25195#25551
        #25163#24037)
      TabOrder = 5
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 74
    Width = 731
    Height = 396
    Align = alClient
    ColCount = 7
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    ColWidths = (
      162
      184
      40
      90
      63
      70
      64)
  end
  object DataSource1: TDataSource
    DataSet = ADOData0022
    Left = 88
    Top = 208
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 208
    object N7: TMenuItem
      Caption = #26448#26009#36864#22238
      OnClick = N7Click
    end
  end
  object ADOData0022: TADOStoredProc
    Connection = MainForm.ADOConnection1
    ProcedureName = 'EP017;16'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = 'aa'
      end>
    Left = 120
    Top = 208
  end
end

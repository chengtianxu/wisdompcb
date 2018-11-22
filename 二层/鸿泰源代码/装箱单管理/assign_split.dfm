object Form11: TForm11
  Left = 218
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#25351#27966#25286#20998
  ClientHeight = 477
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 78
    Top = 16
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#23458#25143':'
  end
  object Label2: TLabel
    Left = 59
    Top = 64
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#26412#21378#32534#21495':'
  end
  object Label3: TLabel
    Left = 73
    Top = 86
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#22411#21495':'
  end
  object Label5: TLabel
    Left = 60
    Top = 41
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#35746#21333#21495':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 238
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 73
    Top = 133
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35013#36816#25968#37327':'
  end
  object Label8: TLabel
    Left = 378
    Top = 133
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #26032#35013#36816#25968#37327':'
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 158
    Width = 300
    Height = 268
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssNone
    TabOrder = 0
    OnMouseDown = StringGrid1MouseDown
    ColWidths = (
      160
      68
      64
      24
      26)
  end
  object Button1: TButton
    Left = 261
    Top = 444
    Width = 75
    Height = 25
    Caption = #20445#23384
    Enabled = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 336
    Top = 444
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 136
    Top = 13
    Width = 93
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 136
    Top = 37
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 7
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 136
    Top = 60
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 8
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 136
    Top = 82
    Width = 162
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 9
    Text = 'Edit4'
  end
  object Edit6: TEdit
    Left = 136
    Top = 129
    Width = 96
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 10
    Text = 'Edit6'
  end
  object BitBtn1: TBitBtn
    Left = 314
    Top = 210
    Width = 41
    Height = 39
    Hint = #20174#24038#36793#25972#20010#31227#21160#21040#21491#36793
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F0000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FF4FFFFFFFFFFFFFC0C0FFFFFF44FFFFFFFFFFFFC0C0FFFFFF444FFFFFFFFFFF
      C0C0FFFFFF4444FFFFFFFFFFC0C0FFFFFF44444FFFFFFFFFC0C0FFFFFF444444
      FFFFFFFFC0C0FFFFFF4444444FFFFFFFC0C0FFFFFF444444FFFFFFFFC0C0FFFF
      FF44444FFFFFFFFFC0C0FFFFFF4444FFFFFFFFFFC0C0FFFFFF444FFFFFFFFFFF
      C0C0FFFFFF44FFFFFFFFFFFFC0C0FFFFFF4FFFFFFFFFFFFFC0C0FFFFFFFFFFFF
      FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FFFFFFFFFFFFFFFFC0C0}
  end
  object BitBtn2: TBitBtn
    Left = 314
    Top = 252
    Width = 41
    Height = 39
    Hint = #20174#21491#36793#25972#20010#31227#21160#21040#24038#36793
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F0000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FFFFFFFFF4FFFFFFC0C0FFFFFFFFFFFF44FFFFFFC0C0FFFFFFFFFFF444FFFFFF
      C0C0FFFFFFFFFF4444FFFFFFC0C0FFFFFFFFF44444FFFFFFC0C0FFFFFFFF4444
      44FFFFFFC0C0FFFFFFF4444444FFFFFFC0C0FFFFFFFF444444FFFFFFC0C0FFFF
      FFFFF44444FFFFFFC0C0FFFFFFFFFF4444FFFFFFC0C0FFFFFFFFFFF444FFFFFF
      C0C0FFFFFFFFFFFF44FFFFFFC0C0FFFFFFFFFFFFF4FFFFFFC0C0FFFFFFFFFFFF
      FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FFFFFFFFFFFFFFFFC0C0}
  end
  object StringGrid2: TStringGrid
    Left = 368
    Top = 159
    Width = 300
    Height = 268
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ScrollBars = ssNone
    TabOrder = 3
    ColWidths = (
      160
      68
      64
      32
      32
      64)
  end
  object Edit7: TEdit
    Left = 453
    Top = 130
    Width = 100
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
    Text = '0'
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 2
    Top = 432
    object N1: TMenuItem
      Caption = #20316#19994#21333#25968#37327#37325#26032#20998#37197
      OnClick = N1Click
    end
  end
  object ADO52: TADOStoredProc
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'ep022;3'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@rkey64'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 8
    Top = 8
    object ADO52WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADO52location: TStringField
      FieldName = 'location'
      Size = 10
    end
    object ADO52qty_on_hand: TFloatField
      FieldName = 'qty_on_hand'
    end
    object ADO52qty_alloc: TFloatField
      FieldName = 'qty_alloc'
    end
    object ADO52rkey53: TIntegerField
      FieldName = 'rkey53'
    end
    object ADO52quan_shp: TFloatField
      FieldName = 'quan_shp'
    end
    object ADO52rkey52: TAutoIncField
      FieldName = 'rkey52'
      ReadOnly = True
    end
    object ADO52qty_avail: TFloatField
      FieldName = 'qty_avail'
      ReadOnly = True
    end
  end
end

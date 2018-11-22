object frmEdit: TfrmEdit
  Left = 420
  Top = 234
  Width = 1009
  Height = 637
  Caption = #32534#36753
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 993
    Height = 33
    Align = alTop
    TabOrder = 0
    object btnSave: TBitBtn
      Left = 6
      Top = 3
      Width = 75
      Height = 25
      Caption = #20445#23384
      Default = True
      TabOrder = 0
      OnClick = btnSaveClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 84
      Top = 3
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
      Kind = bkCancel
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 33
    Width = 993
    Height = 565
    Align = alClient
    TabOrder = 1
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 991
      Height = 160
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 34
        Top = 56
        Width = 78
        Height = 13
        Caption = #29238#28165#21333#32534#21495#65306
      end
      object lbl2: TLabel
        Left = 52
        Top = 90
        Width = 60
        Height = 13
        Caption = 'BOM'#29256#26412#65306
      end
      object lbl3: TLabel
        Left = 47
        Top = 21
        Width = 65
        Height = 13
        Caption = #26412#21378#32534#21495#65306
      end
      object lbl4: TLabel
        Left = 291
        Top = 21
        Width = 78
        Height = 13
        Caption = #30828#20214#32852#31995#20154#65306
      end
      object lbl5: TLabel
        Left = 304
        Top = 56
        Width = 65
        Height = 13
        Caption = #21019#24314#20154#21592#65306
      end
      object lbl6: TLabel
        Left = 304
        Top = 90
        Width = 65
        Height = 13
        Caption = #21019#24314#26085#26399#65306
      end
      object lbl7: TLabel
        Left = 554
        Top = 21
        Width = 65
        Height = 13
        Caption = #23457#26680#20154#21592#65306
      end
      object lbl8: TLabel
        Left = 554
        Top = 56
        Width = 65
        Height = 13
        Caption = #23457#26680#26085#26399#65306
      end
      object lbl9: TLabel
        Left = 47
        Top = 125
        Width = 65
        Height = 13
        Caption = #22791#27880#35828#26126#65306
      end
      object dbedtListNumber: TDBEdit
        Left = 120
        Top = 51
        Width = 121
        Height = 21
        DataField = 'ListNumber'
        DataSource = ds800
        TabOrder = 0
      end
      object dbedtVersion: TDBEdit
        Left = 120
        Top = 86
        Width = 121
        Height = 21
        DataField = 'Version'
        DataSource = ds800
        TabOrder = 1
      end
      object dbedtmanu_part_number3: TDBEdit
        Left = 374
        Top = 86
        Width = 121
        Height = 21
        Color = clMoneyGreen
        DataField = 'CreateDate'
        DataSource = ds800
        ReadOnly = True
        TabOrder = 2
      end
      object dbedtmanu_part_number5: TDBEdit
        Left = 624
        Top = 51
        Width = 121
        Height = 21
        Color = clMoneyGreen
        DataField = 'AuditDate'
        DataSource = ds800
        ReadOnly = True
        TabOrder = 3
      end
      object dbedtRemark: TDBEdit
        Left = 120
        Top = 120
        Width = 633
        Height = 21
        DataField = 'Remark'
        DataSource = ds800
        TabOrder = 4
      end
      object btn1: TBitBtn
        Left = 245
        Top = 13
        Width = 25
        Height = 25
        TabOrder = 5
        TabStop = False
        OnClick = btn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
      end
      object btn2: TBitBtn
        Left = 500
        Top = 13
        Width = 25
        Height = 25
        TabOrder = 6
        TabStop = False
        OnClick = btn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
      end
      object edtManuPartNumber: TEdit
        Left = 120
        Top = 17
        Width = 121
        Height = 21
        TabOrder = 7
        OnExit = edtManuPartNumberExit
      end
      object edtHarLinkPeop: TEdit
        Left = 374
        Top = 17
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 8
      end
      object edtCreateUser: TEdit
        Left = 374
        Top = 51
        Width = 121
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 9
      end
      object edtAuitUser: TEdit
        Left = 624
        Top = 17
        Width = 121
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 10
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 161
      Width = 991
      Height = 403
      Align = alClient
      TabOrder = 1
      object eh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 989
        Height = 401
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = ds801
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        PopupMenu = pm1
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taLeftJustify
            Color = clMoneyGreen
            EditButtons = <>
            FieldName = 'Type'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1')
            PickList.Strings = (
              #20027#26009
              '    '#26367#26009)
            ReadOnly = True
            Title.Caption = #31867#21035
            Width = 60
          end
          item
            Color = clMoneyGreen
            EditButtons = <>
            FieldName = 'INV_PART_NUMBER'
            Footers = <>
            ReadOnly = True
            Title.Caption = #29289#26009#32534#30721
            Width = 130
          end
          item
            Color = clMoneyGreen
            EditButtons = <>
            FieldName = 'INV_DESCRIPTION'
            Footers = <>
            ReadOnly = True
            Title.Caption = #26448#26009#35268#26684
            Width = 140
          end
          item
            Color = clMoneyGreen
            EditButtons = <>
            FieldName = 'INV_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #26448#26009#21517#31216
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'VENDOR'
            Footers = <>
            Title.Caption = #21697#29260
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'Qty'
            Footers = <>
            Title.Caption = #21333#26495#29992#37327
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'FAILURE_RATE'
            Footers = <>
            Title.Caption = #25439#32791#29575'%'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'Param'
            Footers = <>
            Title.Caption = #25968#20540
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'Position'
            Footers = <>
            Title.Caption = #20301#21495
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 200
          end
          item
            EditButtons = <>
            FieldName = 'ListNumber'
            Footers = <>
            Visible = False
          end>
      end
    end
  end
  object qry800: TADOQuery
    Connection = dm1.con1
    LockType = ltBatchOptimistic
    MarshalOptions = moMarshalModifiedOnly
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * from data0800 where rkey = :p1')
    Left = 120
    Top = 240
  end
  object ds800: TDataSource
    DataSet = qry800
    Left = 201
    Top = 242
  end
  object ds801: TDataSource
    DataSet = ads801
    Left = 201
    Top = 298
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 515
    Top = 337
    object mniadd1: TMenuItem
      Caption = #28155#21152#20027#26009
      OnClick = mniadd1Click
    end
    object mniAdd2: TMenuItem
      Caption = #28155#21152#26367#26009
      OnClick = mniAdd2Click
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753#26448#26009
      OnClick = mniEditClick
    end
    object mniN3: TMenuItem
      Caption = '-'
    end
    object mniDele: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleClick
    end
  end
  object ads801: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ads801CalcFields
    CommandText = 'select * from data0801 where RKEY800 = :p1'#13#10
    FieldDefs = <
      item
        Name = 'RKEY'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'RKEY800'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'ListNumber'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Type'
        Attributes = [faFixed]
        DataType = ftWord
      end
      item
        Name = 'RKEY17'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'Qty'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'Param'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Position'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Remark'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FAILURE_RATE'
        Attributes = [faFixed]
        DataType = ftBCD
        Precision = 9
        Size = 6
      end
      item
        Name = 'VENDOR'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'MainPtr'
        Attributes = [faFixed]
        DataType = ftInteger
      end>
    IndexFieldNames = 'ListNumber'
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    StoreDefs = True
    Left = 121
    Top = 297
    object ads801RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads801RKEY800: TIntegerField
      FieldName = 'RKEY800'
    end
    object ads801Type: TWordField
      FieldName = 'Type'
    end
    object ads801RKEY17: TIntegerField
      FieldName = 'RKEY17'
    end
    object ads801Qty: TIntegerField
      FieldName = 'Qty'
    end
    object ads801Param: TStringField
      FieldName = 'Param'
      Size = 12
    end
    object ads801Position: TStringField
      FieldName = 'Position'
      Size = 100
    end
    object ads801Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
    object ads801FAILURE_RATE: TBCDField
      FieldName = 'FAILURE_RATE'
      Precision = 9
      Size = 6
    end
    object ads801VENDOR: TWideStringField
      FieldName = 'VENDOR'
      Size = 50
    end
    object ads801MainPtr: TIntegerField
      FieldName = 'MainPtr'
    end
    object ads801INV_PART_NUMBER: TStringField
      FieldKind = fkCalculated
      FieldName = 'INV_PART_NUMBER'
      Size = 100
      Calculated = True
    end
    object ads801INV_DESCRIPTION: TStringField
      FieldKind = fkCalculated
      FieldName = 'INV_DESCRIPTION'
      Size = 100
      Calculated = True
    end
    object ads801INV_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'INV_NAME'
      Size = 100
      Calculated = True
    end
    object ads801ListNumber: TIntegerField
      FieldName = 'ListNumber'
    end
  end
end

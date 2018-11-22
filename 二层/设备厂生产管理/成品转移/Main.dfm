object frmMain: TfrmMain
  Left = 243
  Top = 116
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#25104#21697#36716#31227
  ClientHeight = 473
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 728
      Height = 307
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object gbFrom: TGroupBox
        Left = 0
        Top = 0
        Width = 251
        Height = 307
        Align = alLeft
        Caption = #20174
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 27
          Width = 66
          Height = 12
          Caption = #20135#21697#32534#30721'(&O)'
          FocusControl = Edit1
        end
        object Label2: TLabel
          Left = 12
          Top = 59
          Width = 48
          Height = 12
          Caption = #21487#29992#25968#37327
          FocusControl = Edit2
        end
        object Edit1: TEdit
          Left = 96
          Top = 24
          Width = 121
          Height = 20
          Hint = #21407#20135#21697#32534#30721
          TabOrder = 0
          OnChange = Edit1Change
        end
        object Edit2: TEdit
          Tag = 100
          Left = 96
          Top = 56
          Width = 121
          Height = 20
          Hint = #21487#29992#25968#37327
          Color = clScrollBar
          Enabled = False
          TabOrder = 1
          OnChange = Edit2Change
        end
        object btnOrigProd: TBitBtn
          Left = 220
          Top = 21
          Width = 25
          Height = 25
          TabOrder = 2
          TabStop = False
          OnClick = btnOrigProdClick
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
      end
      object DBGridEh1: TDBGridEh
        Left = 251
        Top = 0
        Width = 477
        Height = 307
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbNeverShowEh
        OnExit = DBGridEh1Exit
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'sel'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'proc_ptr'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'location_ptr'
            Footers = <>
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'PROD_CODE'
            Footers = <>
            ReadOnly = True
            Width = 80
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'PRODUCT_NAME'
            Footers = <>
            ReadOnly = True
            Width = 90
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'PRODUCT_DESC'
            Footers = <>
            ReadOnly = True
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Visible = False
          end
          item
            Color = clScrollBar
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            ReadOnly = True
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'qty_on_hand'
            Footers = <>
            Width = 50
          end>
      end
    end
    object gbTo: TGroupBox
      Left = 0
      Top = 307
      Width = 728
      Height = 166
      Align = alBottom
      Caption = #21040
      TabOrder = 1
      object lblProdName: TLabel
        Tag = 100
        Left = 252
        Top = 27
        Width = 6
        Height = 12
      end
      object lblLocationName: TLabel
        Tag = 100
        Left = 252
        Top = 59
        Width = 6
        Height = 12
      end
      object Label3: TLabel
        Left = 12
        Top = 27
        Width = 66
        Height = 12
        Caption = #20135#21697#32534#30721'(&N)'
        FocusControl = Edit3
      end
      object Label4: TLabel
        Left = 12
        Top = 59
        Width = 24
        Height = 12
        Caption = #20179#24211
        FocusControl = Edit4
      end
      object Label5: TLabel
        Left = 12
        Top = 92
        Width = 24
        Height = 12
        Caption = #25968#37327
        FocusControl = Edit5
      end
      object Edit3: TEdit
        Tag = 100
        Left = 96
        Top = 24
        Width = 121
        Height = 20
        Hint = #26032#20135#21697#32534#30721
        TabOrder = 0
        OnChange = Edit3Change
      end
      object Edit4: TEdit
        Tag = 100
        Left = 96
        Top = 56
        Width = 121
        Height = 20
        Hint = #20179#24211
        TabOrder = 1
        OnChange = Edit4Change
      end
      object Edit5: TEdit
        Tag = 100
        Left = 96
        Top = 88
        Width = 121
        Height = 20
        Hint = #25968#37327
        Color = clScrollBar
        Enabled = False
        TabOrder = 2
        OnContextPopup = Edit5ContextPopup
        OnExit = Edit5Exit
        OnKeyPress = Edit5KeyPress
      end
      object btnOK: TBitBtn
        Left = 192
        Top = 125
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = btnOKClick
      end
      object btnReset: TBitBtn
        Left = 320
        Top = 125
        Width = 75
        Height = 25
        Caption = #37325#32622
        TabOrder = 6
        OnClick = btnResetClick
      end
      object btnCancel: TBitBtn
        Left = 448
        Top = 125
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 7
        OnClick = btnCancelClick
      end
      object btnNewProd: TBitBtn
        Tag = 1
        Left = 220
        Top = 21
        Width = 25
        Height = 25
        TabOrder = 3
        TabStop = False
        OnClick = btnOrigProdClick
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
      object btnNewLocation: TBitBtn
        Tag = 2
        Left = 220
        Top = 53
        Width = 25
        Height = 25
        TabOrder = 4
        TabStop = False
        OnClick = btnOrigProdClick
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
    end
  end
  object adoConn: TADOConnection
    ConnectionString = 'FILE NAME=D:\vss_work\172.18.12.2.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 625
    Top = 17
  end
  object aq1: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'proc_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'location_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'location_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Cast(0 as tinyint) sel,t1.*,t8.PROD_CODE,t8.PRODUCT_NAME,' +
        't8.PRODUCT_DESC,t16.CODE,t16.LOCATION'
      'FROM WZCP0001 t1 INNER JOIN'
      'Data0008 t8 ON t1.proc_ptr = t8.RKEY INNER JOIN'
      'Data0016 t16 ON t1.location_ptr = t16.RKEY'
      'WHERE t1.qty_on_hand <> 0'
      'AND t1.proc_ptr = :proc_ptr'
      'AND (( :location_ptr = 0) or (t1.location_ptr = :location_ptr ))'
      'AND t16.LOCATION_TYPE = 1')
    Left = 626
    Top = 66
    object aq1sel: TWordField
      DisplayLabel = #36873#25321
      FieldName = 'sel'
    end
    object aq1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq1proc_ptr: TIntegerField
      FieldName = 'proc_ptr'
    end
    object aq1location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object aq1qty_on_hand: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'qty_on_hand'
      Precision = 10
      Size = 3
    end
    object aq1PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object aq1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aq1PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object aq1CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object aq1LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 626
    Top = 210
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dp1'
    Left = 626
    Top = 162
    object cds1sel: TSmallintField
      DisplayLabel = #36873#25321
      FieldName = 'sel'
      OnChange = cds1selChange
    end
    object cds1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds1proc_ptr: TIntegerField
      FieldName = 'proc_ptr'
    end
    object cds1location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object cds1qty_on_hand: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'qty_on_hand'
      Precision = 10
      Size = 3
    end
    object cds1PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object cds1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object cds1PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object cds1CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object cds1LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
    end
  end
  object dp1: TDataSetProvider
    DataSet = aq1
    Left = 626
    Top = 114
  end
  object aqTmp: TADOQuery
    Connection = adoConn
    Parameters = <>
    Left = 685
    Top = 66
  end
end

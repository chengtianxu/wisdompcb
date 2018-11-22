inherited frmZxDetailEdit_Mod280: TfrmZxDetailEdit_Mod280
  Caption = #26434#39033#29289#26009#35831#36141#32534#36753
  ClientHeight = 282
  ClientWidth = 583
  ExplicitWidth = 591
  ExplicitHeight = 309
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 583
    Height = 282
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 574
    ExplicitHeight = 287
    inherited pnl1: TPanel
      Width = 581
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 572
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 581
      Height = 247
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 572
      ExplicitHeight = 252
      object Label1: TLabel
        Left = 52
        Top = 11
        Width = 52
        Height = 13
        Caption = #29289#26009#21517#31216
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 77
        Top = 45
        Width = 26
        Height = 13
        Caption = #35268#26684
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 52
        Top = 77
        Width = 52
        Height = 13
        Caption = #29289#21697#31867#21035
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 52
        Top = 110
        Width = 52
        Height = 13
        Caption = #37319#36141#21333#20301
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 77
        Top = 146
        Width = 26
        Height = 13
        Caption = #25968#37327
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 52
        Top = 179
        Width = 52
        Height = 13
        Caption = #38656#27714#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 51
        Top = 213
        Width = 52
        Height = 13
        Caption = #35831#36141#21407#22240
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 270
        Top = 146
        Width = 91
        Height = 13
        Caption = #35831#36141#26102#38656#27714#25968#37327
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RedtMaterGuige: TRKeyRzBtnEdit
        Left = 116
        Top = 42
        Width = 192
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'GUI_GE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtMaterName: TRKeyRzBtnEdit
        Left = 116
        Top = 7
        Width = 192
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'DESCRIPTION_1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtNeedQty: TRKeyRzBtnEdit
        Left = 373
        Top = 140
        Width = 129
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        FocusColor = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 2
        OnKeyPress = RedtNeedQtyKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'req_quantity'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtQuantity: TRKeyRzBtnEdit
        Left = 116
        Top = 140
        Width = 129
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 3
        OnChange = RedtQuantityChange
        OnExit = RedtQuantityExit
        OnKeyPress = RedtQuantityKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'QUANTITY_REQUIRED'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtRqReason: TRKeyRzBtnEdit
        Left = 116
        Top = 210
        Width = 338
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'reason'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtUnitName: TRKeyRzBtnEdit
        Left = 116
        Top = 107
        Width = 129
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 5
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = RedtUnitNameButtonClick
        DataSource = ds204
        DataSourceField = 'G_L_PTR'
        DispalyTableName = 'data0002'
        DisplaytextField = 'unit_code'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'unit_name'
        DisplayPickID = '6'
        DisplayModID = 29
        ForceOnFocus = True
      end
      object dbchkIF_urgency: TDBCheckBox
        Left = 354
        Top = 44
        Width = 97
        Height = 17
        Caption = #26159#21542#32039#24613#29289#26009
        DataField = 'IF_urgency'
        DataSource = ds204
        TabOrder = 6
      end
      object DtpkXqrq: TDBDateTimeEditEh
        Left = 116
        Top = 174
        Width = 146
        Height = 21
        DataField = 'REQ_DATE'
        DataSource = ds204
        DynProps = <>
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        TabOrder = 7
        Visible = True
      end
      object BtCan: TBitBtn
        Left = 303
        Top = 255
        Width = 75
        Height = 25
        Caption = #20851#38381
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 8
        Visible = False
      end
      object BtSave: TBitBtn
        Left = 156
        Top = 255
        Width = 75
        Height = 25
        Caption = #20445#23384
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
        TabOrder = 9
        Visible = False
        OnClick = BtSaveClick
      end
      object dbcbbDESCRIPTION_2: TDBComboBox
        Left = 116
        Top = 74
        Width = 129
        Height = 21
        DataField = 'DESCRIPTION_2'
        DataSource = ds204
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 10
      end
    end
  end
  object ds204: TDataSource
    DataSet = cds204
    Left = 512
    Top = 120
  end
  object cds204: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 417
    Top = 112
  end
end

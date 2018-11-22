inherited frmEdit_mod638: TfrmEdit_mod638
  Caption = #26032#22686
  ClientHeight = 295
  ClientWidth = 524
  ExplicitWidth = 540
  ExplicitHeight = 333
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 524
    Height = 295
    ExplicitWidth = 524
    ExplicitHeight = 295
    inherited pnl1: TPanel
      Width = 522
      ExplicitWidth = 522
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
        ExplicitLeft = -5
        ExplicitTop = -4
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 522
      Height = 260
      ExplicitWidth = 522
      ExplicitHeight = 260
      object Label2: TLabel
        Left = 57
        Top = 67
        Width = 84
        Height = 13
        Caption = #23458#25143#35746#21333#21495#30721#65306
      end
      object Label1: TLabel
        Left = 81
        Top = 95
        Width = 60
        Height = 13
        Caption = #35746#21333#26085#26399#65306
      end
      object Label4: TLabel
        Left = 58
        Top = 119
        Width = 76
        Height = 13
        Caption = #35746#21333#26126#32454#25968#30446':'
      end
      object Label5: TLabel
        Left = 82
        Top = 146
        Width = 52
        Height = 13
        Caption = #25991#26723#21517#31216':'
      end
      object Label6: TLabel
        Left = 102
        Top = 180
        Width = 28
        Height = 13
        Caption = #22791#27880':'
      end
      object Label7: TLabel
        Left = 338
        Top = 38
        Width = 3
        Height = 13
      end
      object Label3: TLabel
        Left = 105
        Top = 38
        Width = 36
        Height = 13
        Caption = #23458#25143#65306
      end
      object BtnUpload: TSpeedButton
        Left = 298
        Top = 142
        Width = 34
        Height = 22
        Caption = #19978#20256
        Visible = False
        OnClick = BtnUploadClick
      end
      object RKeyRzBtnEdit1: TRKeyRzBtnEdit
        Left = 140
        Top = 35
        Width = 123
        Height = 21
        Text = ''
        TabOrder = 0
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds97
        DataSourceField = 'CUSTOMER_PTR'
        DispalyTableName = 'data0010'
        DisplaytextField = 'CUST_CODE'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'CUSTOMER_NAME'
        DisplayPickID = '2'
        DisplayModID = 638
        ForceOnFocus = True
      end
      object Edit1: TEdit
        Left = 140
        Top = 116
        Width = 94
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 140
        Top = 62
        Width = 166
        Height = 21
        TabOrder = 2
      end
      object DtpReqDate: TDateTimePicker
        Left = 140
        Top = 89
        Width = 111
        Height = 21
        Date = 42626.476985127320000000
        Format = 'yyyy-MM-dd hh:MM:ss'
        Time = 42626.476985127320000000
        Color = clSilver
        TabOrder = 3
      end
      object RkyDocname: TRKeyRzBtnEdit
        Left = 140
        Top = 142
        Width = 148
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds97
        DataSourceField = 'filename'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
  end
  object Memo3: TMemo
    Left = 144
    Top = 211
    Width = 322
    Height = 61
    ImeMode = imChinese
    MaxLength = 800
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object cds97: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 167
  end
  object ds97: TDataSource
    DataSet = cds97
    Left = 368
    Top = 167
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 179
  end
end

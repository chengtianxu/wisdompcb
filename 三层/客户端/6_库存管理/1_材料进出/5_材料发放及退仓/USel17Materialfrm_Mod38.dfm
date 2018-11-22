inherited frmSel17Material_Mod38: TfrmSel17Material_Mod38
  Caption = 'frmSel17Material_Mod38'
  ClientHeight = 523
  ClientWidth = 1199
  OnCreate = FormCreate
  ExplicitWidth = 1215
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 1199
    ExplicitWidth = 1199
    object lbl1: TLabel [0]
      Left = 10
      Top = 14
      Width = 28
      Height = 13
      Caption = #24037#21378':'
    end
    inherited edtFilter: TLabeledEdit
      Left = 248
      EditLabel.ExplicitLeft = 205
      ExplicitLeft = 248
    end
    object cbbWH: TComboBox
      Left = 51
      Top = 11
      Width = 129
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbbWHChange
    end
  end
  inherited pnl2: TPanel
    Top = 482
    Width = 1199
    ExplicitTop = 482
    ExplicitWidth = 1199
    inherited btnOK: TButton
      Left = 135
      Top = 6
      ExplicitLeft = 135
      ExplicitTop = 6
    end
    inherited btnCancelPick: TButton
      Left = 248
      ExplicitLeft = 248
    end
  end
  inherited pnl3: TPanel
    Width = 1199
    Height = 441
    ExplicitWidth = 1199
    ExplicitHeight = 441
    inherited eh1: TDBGridEh
      Width = 1197
      Height = 439
    end
  end
  inherited cdsPick: TClientDataSet
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,     ' +
      '   '#13#10'dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION,   '#13#10'db' +
      'o.Data0002.UNIT_NAME,      (Data0022.QUAN_ON_HAND-data0022.QUAN_' +
      'TO_BE_STOCKED) as QUAN_ON_HAND,data0456.ship_date, '#13#10'dbo.Data002' +
      '2.EXPIRE_DATE, dbo.Data0022.rohs, dbo.Data0023.ABBR_NAME,     '#13#10 +
      'dbo.Data0022.SUPPLIER2, dbo.Data0017.STD_COST, data0456.warehous' +
      'e_ptr,   '#13#10'dbo.Data0022.INVENTORY_PTR, dbo.Data0022.RKEY,data002' +
      '2.barcode_id,data0456.GRN_NUMBER,data0456.DELIVER_NUMBER '#13#10'FROM ' +
      'dbo.Data0022 '#13#10'INNER JOIN   dbo.Data0016 ON dbo.Data0022.LOCATIO' +
      'N_PTR = dbo.Data0016.RKEY '#13#10'INNER JOIN   dbo.Data0017 ON dbo.Dat' +
      'a0022.INVENTORY_PTR = dbo.Data0017.RKEY '#13#10'INNER JOIN    dbo.Data' +
      '0002 ON   dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY '#13#10'I' +
      'NNER JOIN   dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.' +
      'RKEY INNER JOIN      '#13#10'dbo.Data0023 ON dbo.Data0456.SUPP_PTR = d' +
      'bo.Data0023.RKEY  WHERE (Data0022.QUAN_ON_HAND-data0022.QUAN_TO_' +
      'BE_STOCKED > 0)'
    Filtered = True
    ReadOnly = False
    Left = 288
    Top = 104
  end
  inherited dsPick: TDataSource
    Left = 344
    Top = 104
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 168
    Top = 136
  end
end

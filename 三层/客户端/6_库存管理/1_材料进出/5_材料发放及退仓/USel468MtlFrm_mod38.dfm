inherited frmSel468Mtl_mod38: TfrmSel468Mtl_mod38
  Caption = 'frmSel468Mtl_mod38'
  ClientHeight = 431
  ClientWidth = 697
  OnCreate = FormCreate
  ExplicitWidth = 713
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 697
    Height = 9
    ExplicitWidth = 697
    ExplicitHeight = 9
  end
  inherited pnl2: TPanel
    Top = 390
    Width = 697
    ExplicitTop = 390
    ExplicitWidth = 697
    object lbl1: TLabel [0]
      Left = 28
      Top = 12
      Width = 28
      Height = 13
      Caption = #24037#21378':'
    end
    inherited btnOK: TButton
      Left = 256
      Top = 6
      Caption = #21457#25918
      ExplicitLeft = 256
      ExplicitTop = 6
    end
    inherited btnCancelPick: TButton
      Left = 400
      TabOrder = 2
      ExplicitLeft = 400
    end
    object cbbWH: TComboBox
      Left = 69
      Top = 9
      Width = 129
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
      OnChange = cbbWHChange
    end
  end
  inherited pnl3: TPanel
    Top = 9
    Width = 697
    Height = 381
    ExplicitTop = 9
    ExplicitWidth = 697
    ExplicitHeight = 381
    inherited eh1: TDBGridEh
      Width = 695
      Height = 379
    end
  end
  inherited cdsPick: TClientDataSet
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'  ' +
      '    Data0017.INV_DESCRIPTION, Data0016.LOCATION, data0022.QUAN_T' +
      'O_BE_STOCKED,'#13#10'      Data0002.UNIT_NAME, Data0022.QUAN_ON_HAND, ' +
      'data0456.warehouse_ptr,'#13#10'      Data0022.EXPIRE_DATE,dbo.Data0456' +
      '.ship_DATE, Data0022.rohs, Data0023.ABBR_NAME, '#13#10'      Data0022.' +
      'SUPPLIER2, Data0017.STD_COST, data0002.unit_code,'#13#10'      dbo.Dat' +
      'a0022.INVENTORY_PTR, dbo.Data0022.RKEY,data0022.barcode_id,data0' +
      '456.GRN_NUMBER,data0456.DELIVER_NUMBER'#13#10'FROM dbo.Data0022 INNER ' +
      'JOIN'#13#10'      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data' +
      '0016.RKEY INNER JOIN'#13#10'      dbo.Data0017 ON dbo.Data0022.INVENTO' +
      'RY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON '#13#10' ' +
      '     dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JO' +
      'IN'#13#10'      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RK' +
      'EY INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo' +
      '.Data0023.RKEY'#13#10'WHERE (dbo.Data0022.QUAN_ON_HAND > 0) '
    Filtered = True
    ReadOnly = False
    Left = 328
    Top = 56
  end
  inherited dsPick: TDataSource
    Left = 384
    Top = 56
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 152
  end
end

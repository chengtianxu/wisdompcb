inherited frmSendDetail_mod38: TfrmSendDetail_mod38
  Caption = #21457#36135#26126#32454#26597#35810
  ClientHeight = 558
  ClientWidth = 1184
  OnCreate = FormCreate
  ExplicitTop = 8
  ExplicitWidth = 1200
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 1184
    ExplicitWidth = 1184
    inherited edtFilter: TLabeledEdit
      Left = 448
      EditLabel.ExplicitLeft = 405
      ExplicitLeft = 448
    end
    object btnClose: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnExport: TButton
      Left = 89
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      TabOrder = 2
      OnClick = btnExportClick
    end
    object GroupBox2: TGroupBox
      Left = 724
      Top = 3
      Width = 259
      Height = 38
      Anchors = [akTop, akRight]
      Caption = #26085#26399#33539#22260
      TabOrder = 3
      object Label8: TLabel
        Left = 8
        Top = 22
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 135
        Top = 17
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 32
        Top = 12
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Format = 'yyyy-MM-dd hh:mm:ss'
        Time = 37600.000000000000000000
        TabOrder = 0
        OnChange = dtpk1Change
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Format = 'yyyy-MM-dd hh:mm:ss'
        Time = 37600.000000000000000000
        TabOrder = 1
        OnChange = DTPk2Change
      end
    end
  end
  inherited pnl2: TPanel
    Top = 555
    Width = 1184
    Height = 3
    ExplicitTop = 555
    ExplicitWidth = 1184
    ExplicitHeight = 3
  end
  inherited pnl3: TPanel
    Width = 1184
    Height = 514
    ExplicitWidth = 1184
    ExplicitHeight = 514
    inherited eh1: TDBGridEh
      Width = 1182
      Height = 512
    end
  end
  inherited cdsPick: TClientDataSet
    CommandText = 
      'select     s.REF_NUMBER AS '#39046#26009#21333#21495', s.GON_NUMBER as '#20986#20179#21333#21495','#13#10'        ' +
      '   s.INV_PART_NUMBER as '#26448#26009#32534#30721', s.INV_NAME as '#26448#26009#21517#31216' , '#13#10#9#9'   s.INV_' +
      'DESCRIPTION as '#26448#26009#35268#26684', s.GROUP_DESC as '#26448#26009#31867#22411', '#13#10#9#9'   s.ABBR_NAME as' +
      ' '#20379#24212#21830', s.a_abbm as '#39046#26009#24037#21378' ,'#13#10#9#9'   s.DEPT_CODE as '#39046#26009#37096#38376#20195#30721', s.DEPT_NAM' +
      'E as '#39046#26009#37096#38376#21517#31216' ,'#13#10#9#9'   CASE s.ttype WHEN  '#39'1'#39' THEN '#39#24037#24207#39'  else '#39#38750#24037#24207#39 +
      ' END as '#37096#38376#31867#22411', '#13#10#9#9'   s.QUANTITY as '#21457#26009#25968#37327', s.UNIT_NAME as '#21333#20301' ,s.TD' +
      'ATE as '#21457#26009#26085#26399','#13#10#9#9'   s.SUPPLIER2 as '#21407#20379#24212#21830#25110#25209#21495', '#13#10#9#9'   s.EMPLOYEE_NAM' +
      'E as '#39046#26009#20154#21592', s.Cut_NO AS '#21457#26009#22791#27880', '#13#10#9#9'   s.LOCATION as '#21457#26009#20179#24211', '#13#10#9#9'   s' +
      '. a_EMPLOYEE_NAME as   '#21457#26009#20154#21592#13#10'from ('#13#10'                      '#13#10'SEL' +
      'ECT     dbo.Data0457.REF_NUMBER, dbo.Data0457.GON_NUMBER ,'#13#10'    ' +
      '       dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME , '#13#10' ' +
      '          dbo.Data0017.INV_DESCRIPTION , dbo.Data0496.GROUP_DESC' +
      ', '#13#10'           dbo.Data0023.ABBR_NAME , dbo.Data0015.ABBR_NAME a' +
      's a_abbm,'#13#10'           dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_' +
      'NAME ,'#13#10'           CASE dbo.Data0034.ttype WHEN  '#39'1'#39' THEN '#39#24037#24207#39' e' +
      'lse '#39#38750#24037#24207#39' END AS ttype, '#13#10'           dbo.Data0207.QUANTITY , dbo' +
      '.Data0002.UNIT_NAME ,dbo.Data0207.TDATE ,'#13#10'           dbo.Data00' +
      '22.SUPPLIER2 , '#13#10'           dbo.Data0005.EMPLOYEE_NAME , dbo.Dat' +
      'a0457.Cut_NO, '#13#10'           dbo.Data0016.LOCATION , '#13#10'           ' +
      'Data0005_1.EMPLOYEE_NAME as a_EMPLOYEE_NAME '#13#10'FROM       dbo.Dat' +
      'a0071 RIGHT OUTER JOIN'#13#10'           dbo.Data0207 INNER JOIN'#13#10'    ' +
      '       dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.RKEY ' +
      'INNER JOIN'#13#10'           dbo.Data0017 ON dbo.Data0207.INVENTORY_PT' +
      'R = dbo.Data0017.RKEY INNER JOIN'#13#10'           dbo.Data0496 ON dbo' +
      '.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10'           d' +
      'bo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY INNER ' +
      'JOIN'#13#10'           dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM ' +
      '= dbo.Data0002.RKEY INNER JOIN'#13#10'           dbo.Data0456 ON dbo.D' +
      'ata0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'           dbo.D' +
      'ata0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13 +
      #10'           dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034' +
      '.RKEY INNER JOIN'#13#10'           dbo.Data0005 ON dbo.Data0457.RECD_B' +
      'Y = dbo.Data0005.RKEY INNER JOIN'#13#10'           dbo.Data0016 ON dbo' +
      '.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10'         ' +
      '  dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKEY' +
      ' INNER JOIN'#13#10'           dbo.Data0005 AS Data0005_1 ON dbo.Data04' +
      '57.CREATE_BY = Data0005_1.RKEY ON dbo.Data0071.RKEY = dbo.Data00' +
      '22.SOURCE_PTR'#13#10'union '#13#10#13#10'SELECT     dbo.Data0457.REF_NUMBER, dbo' +
      '.Data0457.GON_NUMBER, '#13#10'           dbo.Data0235.goods_name, dbo.' +
      'Data0235.goods_guige, '#13#10'           null, dbo.Data0235.goods_type' +
      ', '#13#10'           dbo.Data0023.ABBR_NAME, dbo.Data0015.ABBR_NAME  a' +
      's a_abbm,'#13#10'           dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_' +
      'NAME, '#13#10'           CASE dbo.Data0034.ttype when '#39'1'#39' THEN '#39#24037#24207#39' el' +
      'se '#39#38750#24037#24207#39' END AS ttype, '#13#10'           dbo.DATA0208.QUANTITY, dbo.D' +
      'ata0002.UNIT_NAME, cast( dbo.DATA0208.TDATE as smalldatetime) as' +
      ' TDATE,  '#13#10'           dbo.Data0235.REF_NUMBER AS Expr2, dbo.Data' +
      '0005.EMPLOYEE_NAME, '#13#10'           dbo.Data0457.Cut_NO, dbo.Data00' +
      '16.LOCATION, Data0005_1.EMPLOYEE_NAME as a_EMPLOYEE_NAME '#13#10'FROM ' +
      '      dbo.DATA0208 INNER JOIN'#13#10'           dbo.Data0457 ON dbo.DA' +
      'TA0208.GON_PTR = dbo.Data0457.RKEY INNER JOIN'#13#10'           dbo.Da' +
      'ta0235 ON dbo.DATA0208.SOURCE_PTR = dbo.Data0235.RKEY INNER JOIN' +
      #13#10'           dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456' +
      '.RKEY INNER JOIN'#13#10'           dbo.Data0023 ON dbo.Data0456.SUPP_P' +
      'TR = dbo.Data0023.RKEY INNER JOIN'#13#10'           dbo.Data0016 ON db' +
      'o.Data0235.location_ptr = dbo.Data0016.RKEY INNER JOIN'#13#10'        ' +
      '   dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKE' +
      'Y INNER JOIN'#13#10'           dbo.Data0034 ON dbo.Data0457.dept_ptr =' +
      ' dbo.Data0034.RKEY INNER JOIN'#13#10'           dbo.Data0002 ON dbo.Da' +
      'ta0235.unit_ptr = dbo.Data0002.RKEY INNER JOIN'#13#10'           dbo.D' +
      'ata0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.RKEY INNER JOIN'#13#10 +
      '           dbo.Data0005 AS Data0005_1 ON dbo.Data0457.CREATE_BY ' +
      '= Data0005_1.RKEY'#13#10') as s'#13#10'WHERE    ( s.TDATE >=:dtpk1)  AND (s.' +
      'TDATE <=:dtpk2)'#13#10'order by s.GON_NUMBER'#13#10
    Params = <
      item
        DataType = ftUnknown
        Name = 'dtpk1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtpk2'
        ParamType = ptUnknown
      end>
    Left = 312
    Top = 216
  end
  inherited dsPick: TDataSource
    Left = 368
    Top = 216
  end
  object qry1: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select     s.REF_NUMBER AS '#39046#26009#21333#21495', s.GON_NUMBER as '#20986#20179#21333#21495','
      '           s.INV_PART_NUMBER as '#26448#26009#32534#30721', s.INV_NAME as '#26448#26009#21517#31216' , '
      #9#9'   s.INV_DESCRIPTION as '#26448#26009#35268#26684', s.GROUP_DESC as '#26448#26009#31867#22411', '
      #9#9'   s.ABBR_NAME as '#20379#24212#21830', s.a_abbm as '#39046#26009#24037#21378' ,'
      #9#9'   s.DEPT_CODE as '#39046#26009#37096#38376#20195#30721', s.DEPT_NAME as '#39046#26009#37096#38376#21517#31216' ,'
      #9#9'   CASE s.ttype WHEN  '#39'1'#39' THEN '#39#24037#24207#39'  else '#39#38750#24037#24207#39' END as '#37096#38376#31867#22411', '
      #9#9'   s.QUANTITY as '#21457#26009#25968#37327', s.UNIT_NAME as '#21333#20301' ,s.TDATE as '#21457#26009#26085#26399','
      #9#9'   s.SUPPLIER2 as '#21407#20379#24212#21830#25110#25209#21495', '
      #9#9'   s.EMPLOYEE_NAME as '#39046#26009#20154#21592', s.Cut_NO AS '#21457#26009#22791#27880', '
      #9#9'   s.LOCATION as '#21457#26009#20179#24211', '
      #9#9'   s. a_EMPLOYEE_NAME as   '#21457#26009#20154#21592
      'from ('
      '                      '
      'SELECT     dbo.Data0457.REF_NUMBER, dbo.Data0457.GON_NUMBER ,'
      
        '           dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME ,' +
        ' '
      
        '           dbo.Data0017.INV_DESCRIPTION , dbo.Data0496.GROUP_DES' +
        'C, '
      
        '           dbo.Data0023.ABBR_NAME , dbo.Data0015.ABBR_NAME as a_' +
        'abbm,'
      '           dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME ,'
      
        '           CASE dbo.Data0034.ttype WHEN  '#39'1'#39' THEN '#39#24037#24207#39' else '#39#38750#24037#24207 +
        #39' END AS ttype, '
      
        '           dbo.Data0207.QUANTITY , dbo.Data0002.UNIT_NAME ,dbo.D' +
        'ata0207.TDATE ,'
      '           dbo.Data0022.SUPPLIER2 , '
      '           dbo.Data0005.EMPLOYEE_NAME , dbo.Data0457.Cut_NO, '
      '           dbo.Data0016.LOCATION , '
      '           Data0005_1.EMPLOYEE_NAME as a_EMPLOYEE_NAME '
      'FROM       dbo.Data0071 RIGHT OUTER JOIN'
      '           dbo.Data0207 INNER JOIN'
      
        '           dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data' +
        '0017.RKEY INNER JOIN'
      
        '           dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496' +
        '.RKEY INNER JOIN'
      
        '           dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022' +
        '.RKEY INNER JOIN'
      
        '           dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.' +
        'Data0002.RKEY INNER JOIN'
      
        '           dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0' +
        '016.RKEY INNER JOIN'
      
        '           dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data' +
        '0015.RKEY INNER JOIN'
      
        '           dbo.Data0005 AS Data0005_1 ON dbo.Data0457.CREATE_BY ' +
        '= Data0005_1.RKEY ON dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR'
      'union '
      ''
      'SELECT     dbo.Data0457.REF_NUMBER, dbo.Data0457.GON_NUMBER, '
      '           dbo.Data0235.goods_name, dbo.Data0235.goods_guige, '
      '           null, dbo.Data0235.goods_type, '
      
        '           dbo.Data0023.ABBR_NAME, dbo.Data0015.ABBR_NAME  as a_' +
        'abbm,'
      '           dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '
      
        '           CASE dbo.Data0034.ttype when '#39'1'#39' THEN '#39#24037#24207#39' else '#39#38750#24037#24207#39 +
        ' END AS ttype, '
      
        '           dbo.DATA0208.QUANTITY, dbo.Data0002.UNIT_NAME, dbo.DA' +
        'TA0208.TDATE, '
      
        '           dbo.Data0235.REF_NUMBER AS Expr2, dbo.Data0005.EMPLOY' +
        'EE_NAME, '
      
        '           dbo.Data0457.Cut_NO, dbo.Data0016.LOCATION, Data0005_' +
        '1.EMPLOYEE_NAME as a_EMPLOYEE_NAME '
      'FROM       dbo.DATA0208 INNER JOIN'
      
        '           dbo.Data0457 ON dbo.DATA0208.GON_PTR = dbo.Data0457.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0235 ON dbo.DATA0208.SOURCE_PTR = dbo.Data023' +
        '5.RKEY INNER JOIN'
      
        '           dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0' +
        '016.RKEY INNER JOIN'
      
        '           dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data' +
        '0015.RKEY INNER JOIN'
      
        '           dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0005 AS Data0005_1 ON dbo.Data0457.CREATE_BY ' +
        '= Data0005_1.RKEY'
      ') as s'
      'WHERE    1=0')
    Left = 136
    Top = 184
    object strngfldqry1领料单号: TStringField
      FieldName = #39046#26009#21333#21495
      ReadOnly = True
      Size = 15
    end
    object strngfldqry1出仓单号: TStringField
      FieldName = #20986#20179#21333#21495
      ReadOnly = True
      Size = 10
    end
    object strngfldqry1材料编码: TStringField
      FieldName = #26448#26009#32534#30721
      ReadOnly = True
      Size = 60
    end
    object strngfldqry1材料名称: TStringField
      FieldName = #26448#26009#21517#31216
      ReadOnly = True
      Size = 200
    end
    object strngfldqry1材料规格: TStringField
      FieldName = #26448#26009#35268#26684
      ReadOnly = True
      Size = 70
    end
    object strngfldqry1材料类型: TStringField
      FieldName = #26448#26009#31867#22411
      ReadOnly = True
      Size = 30
    end
    object strngfldqry1供应商: TStringField
      FieldName = #20379#24212#21830
      ReadOnly = True
      Size = 16
    end
    object strngfldqry1领料工厂: TStringField
      FieldName = #39046#26009#24037#21378
      ReadOnly = True
      Size = 10
    end
    object strngfldqry1领料部门代码: TStringField
      FieldName = #39046#26009#37096#38376#20195#30721
      ReadOnly = True
      Size = 10
    end
    object strngfldqry1领料部门名称: TStringField
      FieldName = #39046#26009#37096#38376#21517#31216
      ReadOnly = True
      Size = 30
    end
    object strngfldqry1部门类型: TStringField
      FieldName = #37096#38376#31867#22411
      ReadOnly = True
      Size = 6
    end
    object fltfldqry1发料数量: TFloatField
      FieldName = #21457#26009#25968#37327
      ReadOnly = True
    end
    object strngfldqry1单位: TStringField
      FieldName = #21333#20301
      ReadOnly = True
    end
    object dtmfldqry1发料日期: TDateTimeField
      FieldName = #21457#26009#26085#26399
      ReadOnly = True
    end
    object strngfldqry1原供应商或批号: TStringField
      FieldName = #21407#20379#24212#21830#25110#25209#21495
      ReadOnly = True
      Size = 30
    end
    object strngfldqry1领料人员: TStringField
      FieldName = #39046#26009#20154#21592
      ReadOnly = True
      Size = 16
    end
    object strngfldqry1发料备注: TStringField
      FieldName = #21457#26009#22791#27880
      ReadOnly = True
      Size = 40
    end
    object strngfldqry1发料仓库: TStringField
      FieldName = #21457#26009#20179#24211
      ReadOnly = True
    end
    object strngfldqry1发料人员: TStringField
      FieldName = #21457#26009#20154#21592
      ReadOnly = True
      Size = 16
    end
  end
end

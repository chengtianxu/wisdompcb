object Dm: TDm
  Left = 485
  Top = 250
  Width = 513
  Height = 305
  Caption = 'Dm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADOConn: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\68.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 24
  end
  object dsado220: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select dbo.data0220.inventory_ptr,'#13#10'(select sum(dbo.data0220.Qua' +
      'ntity) as iSum from dbo.data0220 right join dbo.data0219 on dbo.' +
      'data0220.grn_ptr=dbo.data0219.Rkey where dbo.data0219.ttype=0 an' +
      'd dbo.data0220.Location_ptr =1 ) as '#26032#38075','#13#10'(select sum(dbo.data022' +
      '0.Quantity) as iSum from dbo.data0220 right join dbo.data0219 on' +
      ' dbo.data0220.grn_ptr=dbo.data0219.Rkey where dbo.data0219.ttype' +
      '=0 and dbo.data0220.Location_ptr in(35,36,37,38,39,40,41)) as '#24453#32763 +
      #30952#20179','#13#10'(select sum(dbo.data0220.Quantity) as iSum from dbo.data022' +
      '0 right join dbo.data0219 on dbo.data0220.grn_ptr=dbo.data0219.R' +
      'key where dbo.data0219.ttype=0 and dbo.data0220.Location_ptr in(' +
      '43,44,45,46,47,48)) as '#24050#30952#25968#37327','#13#10'((select sum(dbo.data0220.Quantity' +
      ') as iSum from dbo.data0220 right join dbo.data0219 on dbo.data0' +
      '220.grn_ptr=dbo.data0219.Rkey where dbo.data0219.ttype=0 and dbo' +
      '.data0220.Location_ptr =49)-(select sum(dbo.data0220.Quantity) a' +
      's iSum from dbo.data0220 right join dbo.data0219 on dbo.data0220' +
      '.grn_ptr=dbo.data0219.Rkey where dbo.data0219.ttype=0 and dbo.da' +
      'ta0220.Location_ptr=49 and dbo.data0220.oh_degree=0)) as '#39'46'#26635#29983#20135#32447 +
      #39','#13#10'((select sum(dbo.data0220.Quantity) as iSum from dbo.data022' +
      '0 right join dbo.data0219 on dbo.data0220.grn_ptr=dbo.data0219.R' +
      'key where dbo.data0219.ttype=0 and dbo.data0220.Location_ptr =50' +
      ')-(select sum(dbo.data0220.Quantity) as iSum from dbo.data0220 r' +
      'ight join dbo.data0219 on dbo.data0220.grn_ptr=dbo.data0219.Rkey' +
      ' where dbo.data0219.ttype=0 and dbo.data0220.Location_ptr =50 an' +
      'd dbo.data0220.oh_degree=0)) as '#38598#22242#29983#20135#32447','#13#10'(select sum(dbo.data0220' +
      '.Quantity) as iSum from dbo.data0220 right join dbo.data0219 on ' +
      'dbo.data0220.grn_ptr=dbo.data0219.Rkey where dbo.data0219.ttype=' +
      '0 and dbo.data0220.Location_ptr in(34)) as '#25253#24223#20179','#13#10'(select sum(dbo' +
      '.data0220.Quantity) as iSum from dbo.data0220 right join dbo.dat' +
      'a0219 on dbo.data0220.grn_ptr=dbo.data0219.Rkey where dbo.data02' +
      '19.ttype=0 and dbo.data0220.Location_ptr in(33)) as '#30740#30952#25151','#13#10'(selec' +
      't sum(dbo.data0220.Quantity) as iSum from dbo.data0220 right joi' +
      'n dbo.data0219 on dbo.data0220.grn_ptr=dbo.data0219.Rkey where d' +
      'bo.data0219.ttype=0 and dbo.data0220.Location_ptr =49 and dbo.da' +
      'ta0220.oh_degree=0) as '#39'46'#26635#22312#32447#26032#38075#39','#13#10'(select sum(dbo.data0220.Quan' +
      'tity) as iSum from dbo.data0220 right join dbo.data0219 on dbo.d' +
      'ata0220.grn_ptr=dbo.data0219.Rkey where dbo.data0219.ttype=0 and' +
      ' dbo.data0220.Location_ptr =50 and dbo.data0220.oh_degree=0) as ' +
      #38598#22242#22312#32447#26032#38075#13#10'from dbo.data0220 right join dbo.data0219 on dbo.data022' +
      '0.grn_ptr=dbo.data0219.Rkey '#13#10'where dbo.data0219.ttype=0 and dbo' +
      '.data0219.system_date>=:dBeinDate and dbo.data0219.system_date<=' +
      ':dEndDate'#13#10'group by dbo.data0220.inventory_ptr '
    Parameters = <
      item
        Name = 'dBeinDate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dEndDate'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 104
    Top = 24
  end
end

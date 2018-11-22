unit UMod38Common;

interface

uses
  System.SysUtils, IdHashMessageDigest, IdGlobal, IdHash, Vcl.Dialogs, uSvrIntf,
  Datasnap.DBClient,
  Vcl.Forms, System.Generics.Collections, RzTabs, DBGridEh, Winapi.ActiveX,
  System.Win.ComObj,
  Vcl.StdCtrls, Vcl.Controls, System.ZLib, System.Classes, uCommFunc, Data.DB,
  System.Variants;

type
  TcommonFunc_Mod38 = record
    procedure UpdateBillNo(ANowBillNo: string; Acds04: TClientDataSet);
    function GetMaxOutBillNo: string;
    function IsBillNorepeated(ABillNo: string; out ANewBillno: string): Boolean;

    function IsStockCheck(out ABillNo: string): Boolean;

    procedure send_message(ARkeyStr17: string; cds14, cds314: TClientDataSet);
    function GetVmiQty(Arkey17: integer): single;
    procedure initOne(cdsDetail, cdsLookUp: TClientDataSet);
    procedure initTwo;
    function GetRkeyStr(Acds: TClientDataSet; Afield: string): string;
    function GetTwoRkeyStr(Acds: TClientDataSet;
      Afield, Afield2: string): string;
    function GetMtlAQty(Acds: TClientDataSet; AMField, ASField: string;
      Resultcds: TClientDataSet): TClientDataSet;
    function GetMtlAQty2(Acds: TClientDataSet; AMField, ASField: string;
      Resultcds, ACdstemp: TClientDataSet): TClientDataSet;
    function GetRkeyStringLst(Acds: TClientDataSet; Afield: string)
      : TStringList;
    procedure Update403(AStr468: string; Acds403, Acds207: TClientDataSet);
  end;

var
  FFunc: TcommonFunc_Mod38;

implementation

{ TcommonFunc }

function TcommonFunc_Mod38.GetMtlAQty(Acds: TClientDataSet;
  AMField, ASField: string; Resultcds: TClientDataSet): TClientDataSet;
begin
  result := nil;
  Acds.First;
  while not Acds.Eof do
  begin
    if not Resultcds.Locate(AMField, Acds.FieldByName(AMField).Value, []) then
    begin
      Resultcds.append;
      Resultcds.FieldByName(AMField).Value := Acds.FieldByName(AMField).Value;
      Resultcds.FieldByName(ASField).Value := Acds.FieldByName(ASField).Value;
      Resultcds.Post;
    end
    else
    begin
      Resultcds.edit;
      Resultcds.FieldByName(ASField).Value := Resultcds.FieldByName(ASField)
        .Value + Acds.FieldByName(ASField).Value;
      Resultcds.Post;
    end;
    Acds.next;
  end;
  result := Resultcds;
end;

function TcommonFunc_Mod38.GetMtlAQty2(Acds: TClientDataSet;
  AMField, ASField: string; Resultcds, ACdstemp: TClientDataSet)
  : TClientDataSet;
begin
  result := nil;
  Acds.First;
  while not Acds.Eof do // rkey22; rkey468--- D0022_ptr,D0468_ptr
  begin
    if ACdstemp.Locate('rkey22;rkey468',
      vararrayof([Acds.FieldByName('D0022_ptr').AsInteger,
      Acds.FieldByName('D0468_ptr').AsInteger]), []) then
    begin
      if not Resultcds.Locate(AMField, Acds.FieldByName(AMField).Value, []) then
      begin
        Resultcds.append;
        Resultcds.FieldByName(AMField).Value := Acds.FieldByName(AMField).Value;
        Resultcds.FieldByName(ASField).Value := Acds.FieldByName(ASField).Value;
        Resultcds.Post;
      end
      else
      begin
        Resultcds.edit;
        Resultcds.FieldByName(ASField).Value := Resultcds.FieldByName(ASField)
          .Value + Acds.FieldByName(ASField).Value;
        Resultcds.Post;
      end;
    end;
    Acds.next;
  end;
  result := Resultcds;
end;

function TcommonFunc_Mod38.GetTwoRkeyStr(Acds: TClientDataSet;
  Afield, Afield2: string): string;
var
  str: string;
begin
  result := '';
  if Acds.IsEmpty then
    exit;

  Acds.First;
  while not Acds.Eof do
  begin
    str := '''+acds.FieldByName(Afield).asstring+''-''+acds.FieldByName(Afield2).asstring+''';
    result := result + '''' + Acds.FieldByName(Afield).asstring + '-' +
      Acds.FieldByName(Afield2).asstring + '''' + ',';
    Acds.next;
  end;
  result := '(' + copy(result, 0, length(result) - 1) + ')';
end;

function TcommonFunc_Mod38.GetRkeyStr(Acds: TClientDataSet;
  Afield: string): string;

begin
  result := '';
  if Acds.IsEmpty then
    exit;

  Acds.First;
  while not Acds.Eof do
  begin
    result := result + Acds.FieldByName(Afield).asstring + ',';
    Acds.next;
  end;

  result := '(' + result + '-1)';
end;

function TcommonFunc_Mod38.GetRkeyStringLst(Acds: TClientDataSet;
  Afield: string): TStringList;
var
  LSLst: TStringList;
begin
  result := nil;
  LSLst := TStringList.Create;
  if Acds.IsEmpty then
    exit;

  Acds.First;
  while not Acds.Eof do
  begin
    LSLst.Add(Acds.FieldByName(Afield).asstring);
    Acds.next;
  end;
  result := LSLst;
end;

procedure TcommonFunc_Mod38.Update403(AStr468: string;
  Acds403, Acds207: TClientDataSet);
var
  Lsql: string;
  cdstemp60, cdstemp207, cdstemp207_2: TClientDataSet;
begin
    cdstemp60 := TClientDataSet.Create(nil);
    cdstemp207 := TClientDataSet.Create(nil);
    cdstemp207_2 := TClientDataSet.Create(nil);
  try
    Lsql := ' select d468.DEPT_PTR,d468.INVENT_PTR,d60.rkey as rkey60 ' +
      '  from dbo.Data0468 d468   ' +
      '  inner join dbo.Data0060 d60 ON d468.SO_NO = d60.SALES_ORDER' +
      '  where d468.rkey in ' + AStr468 + '  ';
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp60);

    gSvrIntf.IntfGetDataBySql
      (' select Dept_ptr,INVENTORY_PTR,INVENTORY_PTR as rkey60 , QUANTITY   from data0207 where 1=0',
      cdstemp207);
    // rkey60的值后续从cdstemp60里取
    Acds207.First;
    while not Acds207.Eof do
    begin
      cdstemp207.append;
      cdstemp207.FieldByName('Dept_ptr').Value :=
        Acds207.FieldByName('Dept_ptr').AsInteger;
      cdstemp207.FieldByName('INVENTORY_PTR').Value :=
        Acds207.FieldByName('INVENTORY_PTR').AsInteger;
      cdstemp207.FieldByName('QUANTITY').Value :=
        Acds207.FieldByName('QUANTITY').AsInteger;
      cdstemp207.Post;
      Acds207.next;
    end;

    cdstemp207.First;
    // cdstemp207.fieldbyname('rkey60').readonly:=false;
    while not cdstemp207.Eof do
    begin
      if cdstemp60.Locate('Dept_ptr;INVENT_PTR',
        vararrayof([cdstemp207.FieldByName('DEPT_PTR').AsInteger,
        cdstemp207.FieldByName('INVENTORY_PTR').AsInteger]), []) then
      begin
        cdstemp207.edit;
        cdstemp207.FieldByName('rkey60').Value :=
          cdstemp60.FieldByName('rkey60').AsInteger;
        cdstemp207.Post;
      end;

      cdstemp207.next;
    end;

    cdstemp207_2.Data := cdstemp207.Data;

    cdstemp207_2.First;
    while not cdstemp207_2.Eof do
    begin
      cdstemp207_2.delete;
    end;

    cdstemp207.First;
    while not cdstemp207.Eof do
    begin // DEPT_PTR;INVENTORY_PTR;rkey60 --- Dept_ptr;INVENTORY_PTR;rkey60
      if not cdstemp207_2.Locate('Dept_ptr;INVENTORY_PTR;rkey60',
        vararrayof([cdstemp207.FieldByName('DEPT_PTR').AsInteger,
        cdstemp207.FieldByName('INVENTORY_PTR').AsInteger,
        cdstemp207.FieldByName('rkey60').AsInteger]), []) then
      begin
        cdstemp207_2.append;
        cdstemp207_2.FieldByName('Dept_ptr').Value :=
          cdstemp207.FieldByName('Dept_ptr').AsInteger;
        cdstemp207_2.FieldByName('INVENTORY_PTR').Value :=
          cdstemp207.FieldByName('rkey60').AsInteger;
        cdstemp207_2.FieldByName('rkey60').Value :=
          cdstemp207.FieldByName('rkey60').AsInteger;
        cdstemp207_2.FieldByName('QUANTITY').Value :=
          cdstemp207.FieldByName('QUANTITY').Value;
        cdstemp207_2.Post;
      end
      else
        cdstemp207_2.FieldByName('QUANTITY').Value :=
          cdstemp207_2.FieldByName('QUANTITY').Value + cdstemp207.FieldByName
          ('QUANTITY').Value;
      cdstemp207.next;
    end;

    Acds403.First;
    while not Acds403.Eof do
    begin // rkeky34;rkey17;rkey60  --DEPT_PTR; INVENTORY_PTR;rkey
      if cdstemp207_2.Locate('DEPT_PTR; INVENTORY_PTR;rkey60',
        vararrayof([Acds403.FieldByName('rkeky34').AsInteger,
        Acds403.FieldByName('rkey17').AsInteger, Acds403.FieldByName('rkey60')
        .AsInteger]), []) then
      begin
        Acds403.edit;
        Acds403.FieldByName('QUAN_ISSUED').Value :=
          cdstemp207_2.FieldByName('QUANTITY').Value;
        if cdstemp207_2.FieldByName('QUANTITY').Value >
          Acds403.FieldByName('qty_bom').Value then
          Acds403.FieldByName('status').Value := 1
        else
          Acds403.FieldByName('status').Value := 0;
        Acds403.Post;
      end;
      Acds403.next;
    end;
  finally
    cdstemp60.free;
    cdstemp207.free;
    cdstemp207_2.free;
  end;

end;

procedure TcommonFunc_Mod38.UpdateBillNo(ANowBillNo: string;
  Acds04: TClientDataSet);
var
  i, v_length: integer;
  v_last, new_seed: string;

begin

  if (not Acds04.IsEmpty) and (Acds04.FieldByName('SEED_FLAG').Value <> 1) then
  begin
    v_length := length(ANowBillNo);
    for i := v_length downto 1 do
      if (copy(ANowBillNo, i, 1) < '0') or (copy(ANowBillNo, i, 1) > '9') then
      // 如果不是数字
      begin
        v_last := floattostr(exp((v_length - 1) * ln(10)) +
          strtofloat(copy(ANowBillNo, i + 1, v_length - i)) + 1); // 后缀加1
        new_seed := copy(ANowBillNo, 1, i) + copy(v_last, i + 1, v_length - i);

        break;
      end
      else if i = 1 then // 如果第一位是数字
      begin
        v_last := floattostr(exp((v_length) * ln(10)) +
          strtofloat(ANowBillNo) + 1);
        new_seed := copy(v_last, 2, v_length);

      end;

    Acds04.edit;
    Acds04.FieldByName('SEED_value').Value := new_seed;
    Acds04.Post;
  end;
end;

function TcommonFunc_Mod38.GetMaxOutBillNo: string;
var
  cds04: TClientDataSet;
begin
  result := '';
      cds04 := TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0004 where rkey=56', cds04);
    if not cds04.IsEmpty then
      result := cds04.FieldByName('seed_value').asstring;

  finally
    cds04.free;
  end;
end;

function TcommonFunc_Mod38.IsBillNorepeated(ABillNo: string;
  out ANewBillno: string): Boolean;
var
 // Lsql: string;
  cds457temp: TClientDataSet;
  cds04: TClientDataSet;
begin
  result := false;
    cds04 := TClientDataSet.Create(nil);
    cds457temp := TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0457 where GON_NUMBER=''' +
      ABillNo + ''' ', cds457temp);

    if not cds457temp.IsEmpty then
      result := true;

    gSvrIntf.IntfGetDataBySql('select * from data0004 where rkey=56', cds04);
    if not cds04.IsEmpty then
      ANewBillno := cds04.FieldByName('seed_value').asstring;
  finally
    cds04.free;
    cds457temp.free;
  end;
end;


function TcommonFunc_Mod38.IsStockCheck(out ABillNo: string): Boolean;
var
  Lsql: string;
  cds92: TClientDataSet;
begin
  result := false;
  cds92 := TClientDataSet.Create(nil);
  try
    Lsql := 'SELECT top 1 dbo.Data0092.PHY_COUNT_NO, dbo.Data0092.TDATE,' + #13
      + 'dbo.Data0005.EMPLOYEE_NAME' + #13 + 'FROM dbo.Data0005 INNER JOIN' +
      #13 + 'dbo.Data0092 ON dbo.Data0005.RKEY = dbo.Data0092.EMPLOYEE_PTR' +
      #13 + 'WHERE (dbo.Data0092.STATUS = ''0'')';
    gSvrIntf.IntfGetDataBySql(Lsql, cds92);

    if not cds92.IsEmpty then
    begin
      ABillNo := cds92.FieldByName('PHY_COUNT_NO').asstring +
        cds92.FieldByName('EMPLOYEE_NAME').asstring;
      result := true;
    end;
  finally
    cds92.free;
  end;

end;

procedure TcommonFunc_Mod38.send_message(ARkeyStr17: string;
  cds14, cds314: TClientDataSet);
var
  Lsend_msg: TStringList;
//  Lrkey14: integer;
  cdstemp: TClientDataSet;
  cdstemp4: TClientDataSet;
  cdstemp3: TClientDataSet;
  cds73: TClientDataSet;
  Lsql: string;
  IDkey:string;
begin
    cdstemp := TClientDataSet.Create(nil);
    cdstemp4 := TClientDataSet.Create(nil);
    cdstemp3 := TClientDataSet.Create(nil);
    cds73 := TClientDataSet.Create(nil);

  try
    Lsend_msg := TStringList.Create;
    Lsend_msg.Text := '';
    Lsql := 'select distinct GROUP_NAME from dbo.data0021';
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp4);

    if (not cdstemp4.IsEmpty) then
    begin
      cdstemp4.First;
      while not cdstemp4.Eof do
      begin
        IDkey:=gFunc.CreateIDKey;
        Lsql := ' SELECT data0017.rkey,Data0017.QUAN_ON_HAND, Data0017.CONSIGN_ONHAND_QTY, '
          + ' Data0017.INV_PART_NUMBER,data0017.INV_NAME' +
          ' FROM  dbo.Data0017' +
          ' inner join dbo.data0496 on dbo.data0017.GROUP_PTR=dbo.data0496.RKey '
          + ' inner join dbo.data0019 on dbo.data0496.group_ptr=dbo.data0019.RKey  '
          + ' WHERE  (dbo.Data0017.CONSIGN_ONHAND_QTY > 0)    ' +
          ' and (dbo.data0019.inv_group_name=''' + cdstemp4.FieldByName
          ('GROUP_NAME').asstring + ''' )   ' +
          ' and (dbo.Data0017.QUAN_ON_HAND < dbo.Data0017.CONSIGN_ONHAND_QTY) '
          + ' and (dbo.Data0017.rkey in ' + ARkeyStr17 + ' ) ';
        // showmessage(Lsql);

        gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

        if (not cdstemp.IsEmpty) then
        begin
          Lsend_msg.Clear;
          cdstemp.First;
          while not cdstemp.Eof do
          begin
            if cdstemp.FieldByName('CONSIGN_ONHAND_QTY').AsCurrency -
              cdstemp.FieldByName('QUAN_ON_HAND').AsCurrency >
              GetVmiQty(cdstemp.FieldByName('rkey').AsInteger) then

              Lsend_msg.Add(cdstemp.FieldByName('INV_PART_NUMBER').asstring +
                '名称:' + cdstemp.FieldByName('INV_NAME').asstring + '差额:' +
                currtostr(cdstemp.FieldByName('CONSIGN_ONHAND_QTY').AsCurrency -
                cdstemp.FieldByName('QUAN_ON_HAND').AsCurrency -
                GetVmiQty(cdstemp.FieldByName('rkey').AsInteger)));
            cdstemp.next;
          end;
        end;

        if Lsend_msg.Text <> '' then
        begin
          Lsend_msg.Insert(0, '以下材料编码低于安全库存,请及时请购,日期:' +
            datetimetostr(gFunc.GetSvrDateTime));

          cds14.append;
          cds14.fieldbyname('IDKey').value:=IDkey;
          cds14.fieldvalues['MESSAGE'] := Lsend_msg.Text;
          cds14.fieldvalues['whosend'] := strtoint(gVar.RKEY73);
          cds14.Post;

          Lsql := 'select * from dbo.data0021 where GROUP_NAME=''' +
            cdstemp4.FieldByName('GROUP_NAME').asstring + '''';
          gSvrIntf.IntfGetDataBySql(Lsql, cdstemp3);

          if (not cdstemp3.IsEmpty) then
          begin
            cdstemp3.First;
            while not cdstemp3.Eof do
            begin
              gSvrIntf.IntfGetDataBySql
                ('select rkey from data0073 where USER_LOGIN_NAME=''' +
                cdstemp3.FieldByName('USER_LOGIN_NAME').asstring +
                '''   ', cds73);

              cds314.append;
              cds314.FieldByName('d14_IDKey').Value:=idkey;
              cds314.FieldByName('emp_ptr').Value := cds73.FieldByName('rkey')
                .AsInteger;
              cds314.Post;

              cdstemp3.next;
            end;
          end;

        end;

        cdstemp4.next;
      end;

    end;
    Lsend_msg.free;
  finally
    cdstemp.free;
    cdstemp4.free;
    cdstemp3.free;
    cds73.free;
  end;

end;

function TcommonFunc_Mod38.GetVmiQty(Arkey17: integer): single;
var
  cdstemp: TClientDataSet;
  Lsql: string;
begin
  result := 0;
     cdstemp := TClientDataSet.Create(nil);
  try

    Lsql := 'SELECT SUM(DATA0134.QUAN_ON_HAND) AS vmi_qty ' + 'FROM DATA0134 ' +
      'where DATA0134.INVENTORY_PTR=' + inttostr(Arkey17);
    gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);

    if cdstemp.FieldByName('vmi_qty').AsCurrency > 0 then
      result := cdstemp.FieldByName('vmi_qty').AsCurrency;

  finally
    cdstemp.free;
  end;
end;

procedure TcommonFunc_Mod38.initOne(cdsDetail, cdsLookUp: TClientDataSet);
var
  LLKField: TField;
  i: integer;
begin
  gSvrIntf.IntfGetDataBySql('SELECT * FROM data0207 WHERE 1=0', cdsDetail);
  // 在数据集关闭的情况下新增加一个字段
  try
    cdsDetail.Close;
    cdsDetail.FieldDefs.BeginUpdate;
    for i := 0 to cdsDetail.FieldDefList.Count - 1 do
    begin
      cdsDetail.FieldDefList.FieldDefs[i].CreateField(nil);
    end;
    // Add New Field
    // 增加新的字段
    LLKField := TStringField.Create(cdsDetail);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_PART_NUMBER';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_PART_NUMBER';
    LLKField.DataSet := cdsDetail;

    LLKField := TStringField.Create(cdsDetail);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'inv_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'inv_name';
    LLKField.DataSet := cdsDetail;

    LLKField := TStringField.Create(cdsDetail);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'INV_DESCRIPTION';
    LLKField.KeyFields := 'INVT_PTR';
    LLKField.LookupDataSet := cdsLookUp;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'INV_DESCRIPTION';
    LLKField.DataSet := cdsDetail;

    LLKField := TStringField.Create(cdsDetail);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'unit_name';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'unit_name';
    LLKField.DataSet := cdsDetail;

    LLKField := TStringField.Create(cdsDetail);
    LLKField.FieldKind := fkLookup;
    LLKField.FieldName := 'rohs';
    LLKField.KeyFields := 'INVENTORY_PTR';
    LLKField.LookupDataSet := cdsLookUp;
    LLKField.LookupKeyFields := 'rkey';
    LLKField.LookupResultField := 'rohs';
    LLKField.DataSet := cdsDetail;

  finally
    cdsDetail.FieldDefs.EndUpdate;
  end;

end;

procedure TcommonFunc_Mod38.initTwo;
begin
  //
end;

end.

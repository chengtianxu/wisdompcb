unit Ubom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, DB, ADODB,common,
  Provider, DBClient;

type
  TForm_bom = class(TForm)
    DataSource1: TDataSource;
    ADODataSet2: TADODataSet;
    ADODataSet1: TADODataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    ADODataSet3: TADODataSet;
    ADODataSet3Rkey: TIntegerField;
    ADODataSet3D492_ptr: TIntegerField;
    ADODataSet3D017_ptr: TIntegerField;
    ADODataSet3STD_QTY: TBCDField;
    ADODataSet3App_QTY: TBCDField;
    ADODataSet3Con_QTY: TBCDField;
    ADODataSet3QUAN_ASSIGN: TBCDField;
    ADODataSet3d801_ptr: TIntegerField;
    ADODataSet3Type: TWordField;
    ADODataSet2qty: TBCDField;
    ADODataSet2RKEY25: TIntegerField;
    ADODataSet2ISSUED_QTY: TIntegerField;
    ADODataSet2RKEY17: TIntegerField;
    ADODataSet2rkey801: TAutoIncField;
    ADODataSet2Active: TBooleanField;
    ADODataSet2DSDesigner25rkey: TAutoIncField;
    ADODataSet2Type: TWordField;
    ADODataSet2rkey: TAutoIncField;
    ADODataSet2INV_NAME: TStringField;
    ADODataSet2INV_PART_NUMBER: TStringField;
    ADODataSet2FAILURE_RATE: TBCDField;
    ADODataSet2rkey800: TAutoIncField;
    ADODataSet1zinv_part_number: TStringField;
    ADODataSet1zinv_name: TStringField;
    ADODataSet1FAILURE_RATE: TBCDField;
    ADODataSet1D492_ptr: TIntegerField;
    ADODataSet1D017_ptr: TIntegerField;
    ADODataSet1STD_QTY: TBCDField;
    ADODataSet1RKEY800: TIntegerField;
    ADODataSet1d801_ptr: TIntegerField;
    ADODataSet1rkey492: TAutoIncField;
    ADODataSet1rkey801: TAutoIncField;
    ADODataSet1UNIT_NAME: TStringField;
    ADODataSet1YXKC: TBCDField;
    ADODataSet1isTL: TStringField;
    ADODataSet2UNIT_NAME: TStringField;
    ADODataSet2vmi_quantotal: TBCDField;
    ADODataSet2zaitu: TBCDField;
    ADODataSet2isTL: TStringField;
    ADODataSet1App_QTY: TBCDField;
    ADODataSet1Con_QTY: TBCDField;
    ADODataSet1QUAN_ASSIGN: TBCDField;
    ADODataSet2YXKC: TBCDField;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1zinv_part_number: TStringField;
    ClientDataSet1zinv_name: TStringField;
    ClientDataSet1FAILURE_RATE: TBCDField;
    ClientDataSet1D492_ptr: TIntegerField;
    ClientDataSet1D017_ptr: TIntegerField;
    ClientDataSet1STD_QTY: TBCDField;
    ClientDataSet1RKEY800: TIntegerField;
    ClientDataSet1d801_ptr: TIntegerField;
    ClientDataSet1rkey492: TAutoIncField;
    ClientDataSet1rkey801: TAutoIncField;
    ClientDataSet1UNIT_NAME: TStringField;
    ClientDataSet1YXKC: TBCDField;
    ClientDataSet1isTL: TStringField;
    ClientDataSet1App_QTY: TBCDField;
    ClientDataSet1Con_QTY: TBCDField;
    ClientDataSet1QUAN_ASSIGN: TBCDField;
    ADODataSet2typeisTL: TStringField;
    ADODataSet1Type: TWordField;
    ADODataSet1typeisTL: TStringField;
    ClientDataSet1Type: TSmallintField;
    ClientDataSet1typeisTL: TStringField;
    ADODataSet1zaitu: TBCDField;
    ADODataSet1vmi_quantotal: TBCDField;
    ClientDataSet1zaitu: TBCDField;
    ClientDataSet1vmi_quantotal: TBCDField;
    N2: TMenuItem;
    ADODataSet2INV_DESCRIPTION: TStringField;
    ADODataSet1INV_DESCRIPTION: TStringField;
    ClientDataSet1INV_DESCRIPTION: TStringField;
    ADO22: TADOQuery;
    ADO22ship_DATE: TDateTimeField;
    ADO22RKEY: TAutoIncField;
    ADO22INV_PART_NUMBER: TStringField;
    ADO22ValQty: TBCDField;
    ADO475: TADOQuery;
    ADO475rkey468: TIntegerField;
    ADO475rkey22: TIntegerField;
    ADO475quan_alloc: TBCDField;
    ADO475alloc_userptr: TIntegerField;
    ADO475alloc_datetime: TDateTimeField;
    ADO475cp492_ptr: TIntegerField;
    ADOCommand1: TADOCommand;
    ADO22QUAN_TO_BE_SHIPPED: TBCDField;
    ADO22QUAN_TO_BE_STOCKED: TBCDField;
    ADODataSet1cprkey: TAutoIncField;
    ClientDataSet1cprkey: TAutoIncField;
    N4: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    ADODataSet1cp492_17ptr: TIntegerField;
    ClientDataSet1cp492_17ptr: TIntegerField;
    BitBtn5: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

  private
  sql:string;
    PreColumn: TColumnEh;
   procedure SetDstAllFieldCanEdit(cdsA: TClientDataSet);
   Function  SQLResultValue(ADataSet:TDataSet;ASQL:string):string;
    { Private declarations }
  public

    tcsl,user_ptr:string;
    rkey492,rkey25: Integer;
    { Public declarations }
  end;

var
  Form_bom: TForm_bom;

implementation

uses DmUnit1,Pick_Item_Single,ConstVar, Ubommx;

{$R *.dfm}

procedure TForm_bom.FormShow(Sender: TObject);
begin

 if StrToInt(vprev)=1 then
 begin
  N1.Enabled:=False;
  N2.Enabled:=False;
  N4.Enabled:=False;
  N5.Enabled:=False;
  BitBtn4.Enabled:=False;
  N1.Caption:=N1.Caption+'--无权限操作';
  N2.Caption:=N2.Caption+'--无权限操作';
  N4.Caption:=N4.Caption+'--无权限操作';
  N5.Caption:=N5.Caption+'--无权限操作';
 end;
 if StrToInt(vprev)=2 then
 begin
  N2.Enabled:=False;
  N4.Enabled:=False;
  N2.Caption:=N2.Caption+'--无权限操作';
  N4.Caption:=N4.Caption+'--无权限操作';
 end;

 if StrToInt(vprev)=3 then
 begin
  N1.Enabled:=False;
  N5.Enabled:=False;
  N1.Caption:=N1.Caption+'--无权限操作';
  N5.Caption:=N5.Caption+'--无权限操作';
 end;




 sql:=ADODataSet3.CommandText;
 PreColumn := DBGridEh1.Columns[0];
 DM.TMP.Close;
 DM.TMP.CommandText:='SELECT D492_ptr FROM  dbo.WZCP0492 where d492_ptr= '+ IntToStr(rkey492);
 DM.TMP.Open;

 ADODataSet1.Close;
 ADODataSet1.CommandText:=ADODataSet1.CommandText+' WHERE D492_ptr= '+IntToStr(rkey492);
 ADODataSet1.Open;

 if DM.TMP.IsEmpty then
 begin
  ADODataSet2.Close;
  ADODataSet2.CommandText:= ADODataSet2.CommandText+' WHERE (dbo.Data0800.Active = 1) AND (dbo.Data0800.RKEY25 = '+IntToStr( rkey25)+') AND (dbo.Data0801.Type = 0) AND (dbo.data0492.rkey= '+ IntToStr(rkey492)+')';
  ADODataSet2.Open;

   ClientDataSet1.Open;
   SetDstAllFieldCanEdit(ClientDataSet1);

  while not ADODataSet2.Eof do
  begin
   ClientDataSet1.Append;
   ClientDataSet1Type.Value:=ADODataSet2Type.Value;
   ClientDataSet1typeisTL.Value:=ADODataSet2typeisTL.Value;
   ClientDataSet1zinv_part_number.Value:=ADODataSet2INV_PART_NUMBER.Value;
   ClientDataSet1zinv_name.Value:=ADODataSet2INV_NAME.Value;
   ClientDataSet1FAILURE_RATE.Value:=ADODataSet2FAILURE_RATE.Value;
   ClientDataSet1D492_ptr.Value:= rkey492;
   ClientDataSet1D017_ptr.Value:=ADODataSet2RKEY17.Value;
   ClientDataSet1STD_QTY.Value:=ADODataSet2qty.Value;
   ClientDataSet1rkey800.Value:=ADODataSet2rkey800.Value;
   ClientDataSet1d801_ptr.Value:=ADODataSet2rkey801.Value;
   ClientDataSet1INV_DESCRIPTION.Value:=ADODataSet2INV_DESCRIPTION.Value;
   ClientDataSet1UNIT_NAME.Value:=ADODataSet2UNIT_NAME.Value;
   ClientDataSet1YXKC.Value:=ADODataSet2YXKC.Value;
   ClientDataSet1zaitu.Value:=ADODataSet2zaitu.Value;
   ClientDataSet1vmi_quantotal.Value:=ADODataSet2vmi_quantotal.Value;
   ClientDataSet1isTL.Value:=ADODataSet2isTL.Value;
   ClientDataSet1App_QTY.Value:=0;
   ClientDataSet1Con_QTY.Value:=0;
   ClientDataSet1QUAN_ASSIGN.Value:=0;
   ClientDataSet1.Post;
   ADODataSet2.Next;
  end;
 end;
 ClientDataSet1.Open;
end;

procedure TForm_bom.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm_bom.BitBtn3Click(Sender: TObject);
begin
 ADODataSet1.Close;
 ADODataSet1.Open;
 ClientDataSet1.Close;
 ClientDataSet1.Open;
end;

procedure TForm_bom.BitBtn2Click(Sender: TObject);
begin
 if ADODataSet1.IsEmpty then exit;
 Export_dbGridEH_to_Excel(DBGridEh1,'配料单管理')
end;

procedure TForm_bom.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssCtrl in Shift) and (Key=46 ) then Key := 0;
 if (key=VK_Insert)then
 begin
  KEY:=0;
  Shift:=[];
 end;
 if (chr(key)='V') and (ssalt in shift) then
 showmessage(ADODataSet1.CommandText);
end;

procedure TForm_bom.N1Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  with ClientDataSet1 do
  if(Trim(ClientDataSet1isTL.AsString)='无替料') or (ClientDataSet1QUAN_ASSIGN.Value>0) then
  begin
   ShowMessage('不能选择, 无替料或者已分配.');
   Exit;
  end;
  ADODataSet3.Close;
  ADODataSet3.CommandText:='';
  ADODataSet3.CommandText:=sql+' WHERE D017_ptr= '+ ClientDataSet1D017_ptr.AsString;
  ADODataSet3.Open;
  if ADODataSet3Con_QTY.Value>0 then
  begin
   ShowMessage('不能选择,此材料已有发放数量.');
   exit;
  end;


 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'INV_PART_NUMBER/物料编码/150,INV_NAME/物料名称/150,YXKC/有效库存/100,zaitu/在途物料/100,vmi_quantotal/VMI库存/100';
  InputVar.Sqlstr :='select CASE dbo.data0801.Type WHEN 0 THEN  '+ QuotedStr('主料')+' WHEN 1 THEN '+ QuotedStr('替代料')+' END AS typeisTL, dbo.Data0017.rkey as rkey17,dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0801.FAILURE_RATE, dbo.Data0801.RKEY, '+
                    ' data0017.INV_DESCRIPTION,dbo.Data0017.QUAN_ON_HAND - dbo.Data0017.QUAN_ASSIGN AS YXKC,isnull(z_t.zaitu,0)as zaitu ,isnull(vmi.vmi_quantotal,0)as vmi_quantotal ,'+
                   tcsl+ ' * dbo.Data0801.Qty *(1+ dbo.Data0801.FAILURE_RATE*0.01) AS qty, '+
                    ' Data0801.Type FROM dbo.Data0017 INNER JOIN dbo.Data0801 ON dbo.Data0017.RKEY = dbo.Data0801.RKEY17 '+
                    'LEFT OUTER JOIN (SELECT dbo.Data0071.INVT_PTR, SUM(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD) AS zaitu ' +
                    'FROM dbo.Data0071 INNER JOIN dbo.Data0070 AS Data0070 ON dbo.Data0071.PO_PTR = Data0070.RKEY '+
                    'WHERE(Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0) '+
                    'GROUP BY dbo.Data0071.INVT_PTR) AS z_t ON dbo.Data0017.RKEY = z_t.INVT_PTR LEFT OUTER JOIN '+
                    '(SELECT TOP (100) PERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND) AS vmi_quantotal FROM  dbo.DATA0134 '+
                    'WHERE (QUAN_ON_HAND > 0) GROUP BY INVENTORY_PTR) AS vmi ON dbo.Data0017.RKEY = vmi.INVENTORY_PTR '+ 'where dbo.data0801.mainptr= '+ IntToStr(ClientDataSet1d801_ptr.Value);
  inputvar.KeyField:='rkey';
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    ClientDataSet1.Edit;
    ClientDataSet1STD_QTY.Value:=frmPick_Item_Single.adsPick.FieldValues['qty'];
    ClientDataSet1Type.Value:=frmPick_Item_Single.adsPick.FieldValues['Type'];
    ClientDataSet1D017_ptr.Value:=frmPick_Item_Single.adsPick.FieldValues['rkey17'];
    ClientDataSet1zINV_PART_NUMBER.Value:=frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];
    ClientDataSet1zINV_NAME.Value:=frmPick_Item_Single.adsPick.FieldValues['INV_NAME'];
    ClientDataSet1typeisTL.Value:= frmPick_Item_Single.adsPick.FieldValues['typeisTL'];
    ClientDataSet1INV_DESCRIPTION.Value:=frmPick_Item_Single.adsPick.FieldValues['INV_DESCRIPTION'];
    ClientDataSet1YXKC.Value:=frmPick_Item_Single.adsPick.FieldValues['YXKC'];
    ClientDataSet1zaitu.Value:=frmPick_Item_Single.adsPick.FieldValues['zaitu'];
    ClientDataSet1vmi_quantotal.Value:=frmPick_Item_Single.adsPick.FieldValues['vmi_quantotal'];
    ClientDataSet1.Post;
  end ;
 finally
 frmPick_Item_Single.Free ;
 end;
end;

procedure TForm_bom.BitBtn4Click(Sender: TObject);
var locate1: Integer;
begin

// if ClientDataSet1.ChangeCount>0 then
// ShowMessage('>0')
// else
// ShowMessage('0');

 if ClientDataSet1.IsEmpty then exit;
 locate1:=ClientDataSet1cprkey.Value;
 ADODataSet3.Close;
 ADODataSet3.CommandText:='';
 ADODataSet3.CommandText:= sql+' where d801_ptr= '+ IntToStr((ClientDataSet1rkey801.Value))+' and d492_ptr= '+ ClientDataSet1rkey492.AsString;
 ADODataSet3.Open;
 try
  DM.ADOConnection1.BeginTrans;
  ClientDataSet1.First;
  if not ADODataSet3.IsEmpty then
   begin
    ADODataSet3.First;
    while not ClientDataSet1.Eof do
    begin
     ADODataSet3.Close;
     ADODataSet3.CommandText:='';
     ADODataSet3.CommandText:= sql+' where d801_ptr= '+ IntToStr((ClientDataSet1rkey801.Value))+' and d492_ptr= '+ ClientDataSet1rkey492.AsString;
     ADODataSet3.Open;
     ADODataSet3.Edit;
     ADODataSet3D017_ptr.Value:=ClientDataSet1D017_ptr.Value;
     ADODataSet3STD_QTY.Value:=ClientDataSet1STD_QTY.Value;
     ADODataSet3Type.Value:=ClientDataSet1Type.Value;
     ADODataSet3.Post;
     ClientDataSet1.Next;
     ADODataSet3.Next;
    end;
   end
  else
  begin
   while not ClientDataSet1.Eof do
   begin
    ADODataSet3.Append;
    ADODataSet3D492_ptr.Value:=ClientDataSet1D492_ptr.Value;
    ADODataSet3D017_ptr.Value:=ClientDataSet1D017_ptr.Value;
    ADODataSet3STD_QTY.Value:=ClientDataSet1STD_QTY.Value;
    ADODataSet3d801_ptr.Value:=ClientDataSet1d801_ptr.Value;
    ADODataSet3Type.Value:=ClientDataSet1Type.Value;
    ADODataSet3.Post;
    ClientDataSet1.Next;
   end;
  end;
  DM.ADOConnection1.CommitTrans;

  except
   on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
  end ;
 BitBtn3.Click;
 ClientDataSet1.Locate('cprkey',locate1,[]);
end;

procedure TForm_bom.SetDstAllFieldCanEdit(cdsA: TClientDataSet);
var cdsB:TClientDataSet;
    I:Integer;
begin
 cdsB := TClientDataSet.Create(nil);
 Try
  cdsA.DisableControls;
  cdsB.Data := cdsA.Data;
  cdsA.Close;
  cdsA.FieldDefs.Clear;
  for I:=0 to cdsB.FieldDefs.Count - 1 do
  begin
   with cdsA.FieldDefs.AddFieldDef   do
   begin
    DataType := cdsB.FieldDefs[I].DataType;
    Size := cdsB.FieldDefs[I].Size;
    Name := cdsB.FieldDefs[I].Name;
   end;
  end;
  cdsA.CreateDataSet;
  with cdsB do
  begin
   First;
   while not Eof do
   begin
    cdsA.Append;
    for I := 0 to Fields.Count - 1 do
    cdsA.Fields[I].Value := Fields[I].Value;
    Next;
   end;
  end;
  if cdsA.State in[dsInsert,dsEdit] then cdsA.Post;
  cdsA.MergeChangeLog;
 Finally
  cdsA.EnableControls;
  cdsB.Free;
 End;
end;

procedure TForm_bom.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
 if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    ADODataSet1.Sort:=Column.FieldName;
  end
 else
 begin
   column.Title.SortMarker:=smDownEh;
   ADODataSet1.Sort:=Column.FieldName+' DESC';
 end;
 if (PreColumn.FieldName<>column.FieldName)  and
    (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
  ClientDataSet1.Close;
  ClientDataSet1.Open;
end;

procedure TForm_bom.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ClientDataSet1.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
 ClientDataSet1.Filter:='';
end;

procedure TForm_bom.N2Click(Sender: TObject);
var locate1: Integer;
    Qty,Qty1:real;
    rkey801:Integer;
begin

  if ClientDataSet1QUAN_ASSIGN.Value>0 then
  begin
    ShowMessage('不能分配,已经分配完成.');
    Exit;
  end;

   with ClientDataSet1 do
   if (ClientDataSet1QUAN_ASSIGN.Value>0) and (ClientDataSet1STD_QTY.Value- ClientDataSet1Con_QTY.Value>0) then
   begin
    ShowMessage('不能分配,已分配完成.');
    Exit;
   end;

  rkey801:=ClientDataSet1d801_ptr.Value;
 if MessageBox(Handle,'生产BOM行确定要预分配库存吗？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON1)=IDNO	then exit;
   locate1:=ClientDataSet1cprkey.Value;
 BitBtn4.Click;


 ADO22.Close;
 ADO22.Parameters.ParamValues['17key']:= ClientDataSet1D017_ptr.Value;
 ADO22.Open;
 if ADO22.IsEmpty then
 begin
  showmessage('此材料没有可供分配的有效库存  !');
  exit;
 end ;

  with ClientDataSet1 do                 // 标准数量 - 已领用 -  已分配数量 > 0 还有未分配的需求
  begin
   if FieldByName('STD_QTY').Value - FieldByName('Con_QTY').Value - FieldByName('QUAN_ASSIGN').Value > 0 then //需求要大于0
   begin
    try
     Qty:=FieldByName('STD_QTY').Value - FieldByName('Con_QTY').Value - FieldByName('QUAN_ASSIGN').Value;  //还要的数量
     Qty1:=0;

     if DM.ADOConnection1.InTransaction then
     DM.ADOConnection1.RollbackTrans;

     DM.ADOConnection1.BeginTrans;
     while not ADO22.Eof do
     begin
      ADO22.Edit;
      if ADO22ValQty.AsFloat < Qty then       //如果D022表的未分配数量 < 当前wzcp0492需要分配的数量
       begin           //已分配数量+ 已分配数量 +  未分配数量
        ADO22QUAN_TO_BE_STOCKED.AsFloat := ADO22QUAN_TO_BE_STOCKED.AsFloat + ADO22ValQty.AsFloat;      //修改22表已分配的数量
        ADO22.Post;
        ADOCommand1.CommandText := 'insert into data0475(cp492_ptr,rkey22,quan_alloc,alloc_userptr,alloc_datetime)'  //插入分配明细 d148_ptr
        +'values('+ ClientDataSet1cprkey.AsString+','
        +ADO22RKEY.AsString+','+ADO22ValQty.AsString
        +','+user_ptr+',getdate())';
        ADOCommand1.Execute;
        Qty:=Qty-ADO22ValQty.AsFloat;
        Qty1:=Qty1+ADO22ValQty.AsFloat;
       end
      else
      begin
       ADO22QUAN_TO_BE_STOCKED.AsFloat := ADO22QUAN_TO_BE_STOCKED.AsFloat + Qty;
       ADO22.Post;
       Qty1:=Qty1+Qty;
       ADOCommand1.CommandText := 'insert into data0475(cp492_ptr,rkey22,quan_alloc,alloc_userptr,alloc_datetime)' //d148_ptr
       +'values('+ClientDataSet1cprkey.AsString+','
       +ADO22RKEY.AsString+','+floatToStr(Qty)
       +','+user_ptr+',getdate())';
       ADOCommand1.Execute;
       break;
      end;
       ADO22.Next;
     end;

     if Qty1=0 then//可分配当量
     begin
      DM.ADOConnection1.RollbackTrans;
      ADO22.Close;
      showmessage('此材料没有可供分配的有效库存。');
      exit;
     end;
      ADO22.UpdateBatch(arAll);

      Edit;
      FieldByName('QUAN_ASSIGN').Value := FieldByName('QUAN_ASSIGN').Value + Qty1;   //修改wzcp492表已分配的数量
      Post;

      ADOCommand1.CommandText:='UPDATE WZCP0492 SET QUAN_ASSIGN= '+FieldByName('QUAN_ASSIGN').AsString+' WHERE Rkey= '+ IntToStr (ClientDataSet1cprkey.Value) ;
      ADOCommand1.Execute;


      ADOCommand1.CommandText :='update data0017 set QUAN_assign = QUAN_assign + '+floattostr(Qty1)     //修改D17表已分配的数量
        +' where rkey = '+ FieldByName('D017_ptr').AsString;
      ADOCommand1.Execute;

      DM.ADOConnection1.CommitTrans;
      BitBtn3.Click;
     // ClientDataSet1.Locate('d801_ptr',rkey801,[]);
     // ClientDataSet1.Locate('cprkey',locate,[]);
      ClientDataSet1.Locate('cprkey',locate1,[]);
      if FieldByName('STD_QTY').Value - FieldByName('Con_QTY').Value - FieldByName('QUAN_ASSIGN').Value > 0 then
       showmessage('已部分分配,有效库存不足,请及时补充原材料!') ;
      ADO22.Close;

      except
      on e:Exception do
      begin
       if DM.ADOConnection1.InTransaction then
       DM.ADOConnection1.RollbackTrans;
       ShowMessage(e.Message);
      end;
     end ;

   end;
  end;


end;

procedure TForm_bom.N4Click(Sender: TObject);
var
  locate1: Integer;
  Qty:Real;
  str_SQL:string;
begin
  if ClientDataSet1QUAN_ASSIGN.value<=0 then
  begin
    ShowMessage('不能取消,无已分配数量.');
    Exit;
  end;
  if MessageBox(Handle,'确定要取消此材料的预分配吗？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON2)=IDNO	then
    exit;

 locate1:=ClientDataSet1cprkey.Value;

  Qty:=ClientDataSet1QUAN_ASSIGN.AsFloat;//已分配数量 cds_wzcp0492QUAN_ASSIGN.asfloat;
  if DM.ADOConnection1.InTransaction then
  DM.ADOConnection1.RollbackTrans;
  str_SQL :=  'select QUAN_ASSIGN from dbo.wzcp0492 where rkey = '+ClientDataSet1cprkey.AsString ;
  if Round(StrToFloat(SQLResultValue(DM.qrytemp,str_SQL))*10000) <> Round(Qty*10000) then  //四舍五入
  begin
    ShowMessage('数据库中分配数量已发生更改，刷新后重试。');
    Exit;
  end;
  try
    DM.ADOConnection1.BeginTrans;
    with ADOCommand1 do
    begin                                                            //将Data0022表已预留的数量恢复
      CommandText :=
      'update data0022 set QUAN_TO_BE_STOCKED = QUAN_TO_BE_STOCKED - t1.quan_alloc '+#13+
      'from data0022 join' +#13+
      '(select rkey22,sum(quan_alloc)quan_alloc from Data0475' +#13+
      'where Data0475.cp492_ptr = '+ ClientDataSet1cprkey.AsString +' group by rkey22)as t1' +#13 + //+' and Data0475.d148_ptr = '      +cds_wzcp0492D148_ptr.AsString+
      'on t1.rkey22 = data0022.rkey ';
      Execute;

      CommandText := 'update data0017 set QUAN_assign = QUAN_assign - '+floattostr(Qty)+' where rkey = '+ ClientDataSet1D017_ptr.AsString;//cds_wzcp0492D017_ptr.AsString;
      Execute;

      CommandText :='delete from data0475  where cp492_ptr = '+ ClientDataSet1cprkey.AsString;
      Execute;
    end;

    ADOCommand1.CommandText:='UPDATE WZCP0492 SET QUAN_ASSIGN= 0 WHERE Rkey= '+ IntToStr (ClientDataSet1cprkey.Value) ;
    ADOCommand1.Execute;

    ClientDataSet1.Edit;
    ClientDataSet1QUAN_ASSIGN.Value := 0;
    ClientDataSet1.Post;
    DM.ADOConnection1.CommitTrans;
    BitBtn3.Click;
    ClientDataSet1.Locate('cprkey',locate1,[]);
  except
    on E:Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      ShowMessage(e.Message);
    end;
  end;
end;

//end.
//procedure TForm_bom.N3Click(Sender: TObject);
//begin
//
//end;
 Function  TForm_bom.SQLResultValue(ADataSet:TDataSet;ASQL:string):string;
begin
  Result:='';
  if ADataSet is TADODataSet then
  with ADataSet as TADODataSet do
  begin
    Close;
    CommandText:=ASQL;
    Open;
    if FieldList[0].IsNull  then
      Result:=''
    else
      Result:=FieldList[0].Value;
  end;

  if ADataSet is TClientDataSet then
  with ADataSet as TClientDataSet do
  begin
    Close;
    CommandText:=ASQL;
    Open;
    if FieldList[0].IsNull  then
      Result:=''
    else
      Result:=FieldList[0].Value;
  end;

  if ADataSet is TADOQuery then
  with ADataSet as TADOQuery do
  begin
    Close;
    SQL.Text:=ASQL;
    Open;
    if FieldList[0].IsNull  then
      Result:=''
    else
      Result:=FieldList[0].Value;
  end;
end;

procedure TForm_bom.N3Click(Sender: TObject);
begin
  Application.CreateForm(TForm_shomx, Form_shomx);
  TRY
   //Form_shomx.cp492rkey:=ClientDataSet1cprkey.Value;
   Form_shomx.ADOQuery1.Parameters.ParamValues['cp492rkey']:=ClientDataSet1cprkey.Value;
   Form_shomx.ADOQuery1.Open;
   //if Form_shomx.ADOQuery1.IsEmpty then Exit;
   Form_shomx.ShowModal;
  FINALLY
   Form_shomx.Free ;
  END ;
end;

procedure TForm_bom.N5Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  if Trim(ClientDataSet1typeisTL.Value)='主料' then
  begin
    ShowMessage('不用还原,已经是主料.');
    Exit;
  end;
  ADODataSet3.Close;
  ADODataSet3.CommandText:='';
  ADODataSet3.CommandText:=sql+' WHERE D017_ptr= '+ ClientDataSet1D017_ptr.AsString;
  ADODataSet3.Open;
  if ADODataSet3Con_QTY.Value>0 then
  begin
    //ShowMessage(ADODataSet3.CommandText);
   ShowMessage('不能还原,此材料已有发放数量.');
   exit;
  end;

 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  InputVar.Fields := 'INV_PART_NUMBER/物料编码/150,INV_NAME/物料名称/150,YXKC/有效库存/100,zaitu/在途物料/100,vmi_quantotal/VMI库存/100';
  InputVar.Sqlstr :='select CASE dbo.data0801.Type WHEN 0 THEN  '+ QuotedStr('主料')+' WHEN 1 THEN '+ QuotedStr('替代料')+' END AS typeisTL, dbo.Data0017.rkey as rkey17,dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0801.FAILURE_RATE, dbo.Data0801.RKEY, '+
                    ' data0017.INV_DESCRIPTION,dbo.Data0017.QUAN_ON_HAND - dbo.Data0017.QUAN_ASSIGN AS YXKC,isnull(z_t.zaitu,0)as zaitu ,isnull(vmi.vmi_quantotal,0)as vmi_quantotal ,'+
                     tcsl+ ' * dbo.Data0801.Qty *(1+ dbo.Data0801.FAILURE_RATE*0.01) AS qty, '+
                    ' Data0801.Type FROM dbo.Data0017 INNER JOIN dbo.Data0801 ON dbo.Data0017.RKEY = dbo.Data0801.RKEY17 '+
                    'LEFT OUTER JOIN (SELECT dbo.Data0071.INVT_PTR, SUM(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD) AS zaitu ' +
                    'FROM dbo.Data0071 INNER JOIN dbo.Data0070 AS Data0070 ON dbo.Data0071.PO_PTR = Data0070.RKEY '+
                    'WHERE(Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0) '+
                    'GROUP BY dbo.Data0071.INVT_PTR) AS z_t ON dbo.Data0017.RKEY = z_t.INVT_PTR LEFT OUTER JOIN '+
                    '(SELECT TOP (100) PERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND) AS vmi_quantotal FROM  dbo.DATA0134 '+
                    'WHERE (QUAN_ON_HAND > 0) GROUP BY INVENTORY_PTR) AS vmi ON dbo.Data0017.RKEY = vmi.INVENTORY_PTR '+ 'where dbo.data0801.rkey= '+ IntToStr(ClientDataSet1d801_ptr.Value);

  inputvar.KeyField:='rkey';
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
//  if frmPick_Item_Single.ShowModal=mrok then
  //begin

    ClientDataSet1.Edit;
    ClientDataSet1STD_QTY.Value:=frmPick_Item_Single.adsPick.FieldValues['qty'];
    ClientDataSet1Type.Value:=frmPick_Item_Single.adsPick.FieldValues['Type'];
    ClientDataSet1D017_ptr.Value:=frmPick_Item_Single.adsPick.FieldValues['rkey17'];
    ClientDataSet1zINV_PART_NUMBER.Value:=frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];
    ClientDataSet1zINV_NAME.Value:=frmPick_Item_Single.adsPick.FieldValues['INV_NAME'];
    ClientDataSet1typeisTL.Value:= frmPick_Item_Single.adsPick.FieldValues['typeisTL'];
    ClientDataSet1INV_DESCRIPTION.Value:=frmPick_Item_Single.adsPick.FieldValues['INV_DESCRIPTION'];
    ClientDataSet1YXKC.Value:=frmPick_Item_Single.adsPick.FieldValues['YXKC'];
    ClientDataSet1zaitu.Value:=frmPick_Item_Single.adsPick.FieldValues['zaitu'];
    ClientDataSet1vmi_quantotal.Value:=frmPick_Item_Single.adsPick.FieldValues['vmi_quantotal'];
    ClientDataSet1.Post;
    // ShowMessage(IntToStr(ClientDataSet1D017_ptr.Value));
    frmPick_Item_Single.ModalResult:= mrok;
    //BitBtn4.Click;
  //end ;
 finally
 frmPick_Item_Single.Free ;
 end;
end;

procedure TForm_bom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not ClientDataSet1.IsEmpty then
 begin
   DM.TMP.Close;
   DM.TMP.CommandText:='SELECT D492_ptr FROM  dbo.WZCP0492 where d492_ptr= '+ IntToStr(rkey492);
   DM.TMP.Open;


   if DM.TMP.IsEmpty then
   if MessageBox(Handle,'生成的BOM还没有保存,是否取消关闭？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON1)=IDNO	then else
   Action := CaNone;
 end;
end;

procedure TForm_bom.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
begin
   if gdSelected in State then
    Exit;
  if ClientDataSet1.RecNo mod 2 = 0 then
    DBGridEh1.Canvas.Brush.Color := clInfoBk
  else
    DBGridEh1.Canvas.Brush.Color := RGB(191, 255, 223);
    
    DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    DBGridEh1.Canvas.Pen.Color := $00C08000;
    DBGridEh1.Canvas.MoveTo(Rect.Left, Rect.Bottom);
    DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);
    DBGridEh1.Canvas.MoveTo(Rect.Right, Rect.Top);
    DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);
end;
end;

procedure TForm_bom.PopupMenu1Popup(Sender: TObject);
begin
 if ClientDataSet1.IsEmpty then
 PopupMenu1.Items.Clear;


end;

procedure TForm_bom.BitBtn5Click(Sender: TObject);
begin
 ShowMessage('1:只读  2:市场部选择替料权限  3:计划部自动分配权限');
end;

end.

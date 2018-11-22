unit UBOMMtrlEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, Buttons, StdCtrls, DB, ADODB,
  DBCtrls, Mask, Menus;

type
  TfrmBOMMtrlEdit = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    eh495: TDBGridEh;
    pnl5: TPanel;
    lbl1: TLabel;
    btn_exit: TSpeedButton;
    btn_save: TSpeedButton;
    lbl2: TLabel;
    edt_PCode: TEdit;
    lbl3: TLabel;
    edt_PName: TEdit;
    btn_export: TBitBtn;
    ds495: TDataSource;
    qry495: TADOQuery;
    qrytemp: TADOQuery;
    btn_Import: TSpeedButton;
    pm495: TPopupMenu;
    mni_Del: TMenuItem;
    qry139: TADOQuery;
    ds139: TDataSource;
    mni_Import: TMenuItem;
    qry494s: TADOQuery;
    qry494srkey: TAutoIncField;
    qry494spart_name: TStringField;
    qry494spart_ptr: TIntegerField;
    qry494suser_ptr: TIntegerField;
    qry494sauth_date: TDateTimeField;
    qry494sstatus: TWordField;
    qry494suser2_ptr: TIntegerField;
    qry494sauth2_date: TDateTimeField;
    qry494suser3_ptr: TIntegerField;
    qry494sauth3_date: TDateTimeField;
    qry495rkey: TAutoIncField;
    qry495PARTBOM_PTR: TIntegerField;
    qry495INVENT_PTR: TIntegerField;
    qry495repl_invt_ptr: TIntegerField;
    qry495QUAN_BOM: TBCDField;
    qry495VENDOR: TStringField;
    qry495STD_COST: TBCDField;
    qry495seq_no: TIntegerField;
    qry495P_CODE: TIntegerField;
    qry495production_teamname: TWideStringField;
    qry495inv_part_number: TStringField;
    qry495inv_name: TStringField;
    qry495INV_DESCRIPTION: TStringField;
    qry495STOP_PURCH: TStringField;
    qry495inv_part_number_r: TStringField;
    qry495inv_name_r: TStringField;
    qry495INV_DESCRIPTION_r: TStringField;
    qry495unit_name: TStringField;
    qry495QUAN_ON_HAND: TBCDField;
    qry495CRITICAL_MATL_FLAG: TWordField;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    qry494sPROD_CODE: TStringField;
    qry494sPRODUCT_NAME: TStringField;
    edt_BName: TDBEdit;
    ds494S: TDataSource;
    edt_ProdCode: TDBEdit;
    edt_ProdName: TDBEdit;
    qry495S: TADOQuery;
    qry495Srkey: TAutoIncField;
    qry495SPARTBOM_PTR: TIntegerField;
    qry495SINVENT_PTR: TIntegerField;
    qry495Srepl_invt_ptr: TIntegerField;
    qry495SQUAN_BOM: TBCDField;
    qry495SVENDOR: TStringField;
    qry495SSTD_COST: TBCDField;
    qry495Sseq_no: TIntegerField;
    qry495SP_CODE: TIntegerField;
    qry495Sproduction_teamname: TWideStringField;
    btn_sel: TButton;
    qry495TotalCost: TBCDField;
    qry495STOP_PURCH_r: TStringField;
    mni_add: TMenuItem;
    procedure btn_exportClick(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eh495Columns1EditButtons0Click(Sender: TObject;    //选择物料
      var Handled: Boolean);
    procedure eh495Columns8tButtons0Click(Sender: TObject;   //选择替代物料
      var Handled: Boolean);
    procedure mni_DelClick(Sender: TObject);
    procedure mni_ImportClick(Sender: TObject);
    procedure btn_selClick(Sender: TObject);
    procedure qry495TotalCostGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure mni_addClick(Sender: TObject);
   //procedure eh495Columns6EditButtons0Click(Sender: TObject;
     // var Handled: Boolean);
  private
    { Private declarations }
   procedure SetCtrlsStatus;
   procedure SetCtrlsempty;
   function IsReq(rkey495:integer):boolean;
    function ReqQtyOr(rkey495:integer;BQty:Double):boolean;
   procedure Save494;
   procedure Save495;
   function Get495rkey17(Ads:TADOQuery):string;
  public
    { Public declarations }
    FStatus:Integer;
    FPart_Name:string;
  end;

var
  frmBOMMtrlEdit: TfrmBOMMtrlEdit;

implementation
    uses DM_u,ConstVar, Pick_Item_Single,common, Frm_MatSelect_u,
  USelBOMMtrl;
{$R *.dfm}


function TfrmBOMMtrlEdit.ReqQtyOr(rkey495:integer;BQty:Double):boolean;
var
  Lsql:string;
begin
     result:= False;
     Lsql:=' select isnull(sum(d468.quan_issued),0)qty  '+
          ' FROM  dbo.wzcp0495  w495 '+
          ' left join wzcp0492  w492 on w495.rkey=w492.wzcp0495_ptr '+
          ' left join data0468 d468 on w492.rkey=d468.wzcp0492_ptr '+
          ' where  w495.rkey='+qry495.fieldbyname('rkey').asstring;
    if common.OpenQuery(qrytemp,Lsql)  then
    begin
       if    (BQty>=qrytemp.fieldbyname('qty').value) then
       result:= True;
    end;
end;

procedure TfrmBOMMtrlEdit.btn_exportClick(Sender: TObject);
begin
 if not qry495.isempty then
 common.Export_dbGridEH_to_Excel(eh495,'BOM物料明细');
end;

procedure TfrmBOMMtrlEdit.btn_exitClick(Sender: TObject);
begin
 close;
end;

procedure TfrmBOMMtrlEdit.btn_saveClick(Sender: TObject);
var
  Lsql:string;
begin
    if   qry495.IsEmpty then  Exit;
    if Trim(edt_BName.Text)='' then
    begin
    ShowMessage('BOM名称不能为空!');
    exit;
    end;

//    if Trim(edt_ProdName.Text)='' then
//    begin
//    ShowMessage('工程编码不能为空!');
//    exit;
//    end;
//
//    if Trim(edt_ProdName.Text)='' then
//    begin
//    ShowMessage('产品名称不能为空!');
//    exit;
//    end;

   qry495.First;
   while not qry495.Eof do
   begin
    if (qry495.FieldByName('p_code').AsString='' ) then   // or  (qry495.FieldByName('production_teamname').AsString='' )
    begin
    ShowMessage('采购等级不能为空');
    exit;
    end;

    if (qry495.FieldByName('QUAN_BOM').AsString='' ) then
    begin
    ShowMessage('数量不能为空');
    exit;
    end;

//    if (qry495.FieldByName('QUAN_BOM').value=0 ) then
//    begin
//    ShowMessage('数量不能为0');
//    exit;
//    end;

    if (qry495.FieldByName('rkey').asinteger>0) then  
    if(not ReqQtyOr(qry495.FieldByName('rkey').asinteger,qry495.FieldByName('quan_bom').value)) then
    begin
     showmessage(qry495.FieldByName('inv_part_number').asstring+'的需求数小于对应生产单的已申领数！');
    exit;
    end;
   qry495.Next;
   end;


 try
  dm.ADOCon.BeginTrans;
//  if FStatus=1 then
//  begin
//   Lsql:='select w495.rkey from wzcp0494   w494  inner join wzcp0495 w495 on w494.rkey=w495.partBOM_ptr where w494.part_ptr= '+dm.D08RKEY.asstring;
//   if common.OpenQuery(qrytemp,Lsql) then
//   begin
//     if not qrytemp.isempty  then
//     begin
//     Lsql:=' delete  from wzcp0495  where partBOM_ptr= '+dm.qry_WZCP494rkey.asstring;
//      dm.execsql(qrytemp,Lsql);
//     end;
//   end;
//  end;
   Save494;
   qry494s.UpdateBatch(arAll);
   Save495;
   qry495s.UpdateBatch(arAll);
  
 dm.ADOCon.CommitTrans;
 FPart_Name:=Trim(edt_BName.text);
  Self.ModalResult:=mrOk;

 except   on e:Exception do
 begin
  ShowMessage('保存错误：'+e.message);
  dm.ADOCon.RollbackTrans;
 end;
 end;

end;

procedure TfrmBOMMtrlEdit.FormShow(Sender: TObject);
var
  Lsql:string;
begin
    // if not qry139.Active then qry139.Open;
    // if not qry494s.Active  then  qry494s.Open;
     if not qry495s.Active  then  qry495s.Open;

end;

procedure TfrmBOMMtrlEdit.SetCtrlsStatus;
begin
//
end;

procedure TfrmBOMMtrlEdit.SetCtrlsempty;
begin

end;

 //选择物料
procedure TfrmBOMMtrlEdit.eh495Columns1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
  var
    Lfrm:  TfrmSelMtrls;
begin
  if Lfrm=nil then
    Lfrm:=TfrmSelMtrls.Create(self);
 try

  try
   // if not qry495.IsEmpty  then
    Lfrm.FfilterStr:= Get495rkey17(qry495);

    Lfrm.TVInit;

    if Lfrm.ShowModal=mrok then
    begin
     eh495.DataSource:=nil;
     if qry495.Locate('INVENT_PTR',Lfrm.qry17.fieldbyname('rkey').AsInteger,[]) then
     begin
     ShowMessage('已存在该物料，请重新选择！');
     eh495.DataSource:=ds495;
     exit;
     end;
     eh495.DataSource:=ds495;

     qry495.append;
     qry495.FieldByName('seq_no').value:=qry495.recordcount+1;
     qry495.FieldByName('INVENT_PTR').value:= Lfrm.qry17RKEy.value;
     qry495.FieldByName('inv_part_number').value:= Lfrm.qry17INV_PART_NUMBER.value;
     qry495.FieldByName('inv_name').value:=Lfrm.qry17INV_NAME.value;
     qry495.FieldByName('INV_DESCRIPTION').value:=Lfrm.qry17INV_DESCRIPTION.value;
     qry495.FieldByName('unit_name').value:=Lfrm.qry17unit_name.value;
     qry495.FieldByName('STOP_PURCH').value:=Lfrm.qry17STOP_PURCH.value;
     qry495.FieldByName('STD_COST').value:=Lfrm.qry17std_cost.value;
    // qry495.FieldByName('p_code').value:=1;
     qry495.post;
      eh495.SelectedIndex:=4;
    end;

  except on e:Exception do
    begin
    ShowMessage('错误：'+e.message);
    exit;
    end;
  end;

 finally
  Lfrm.free;
 end;

end;

 //选择替代物料
procedure TfrmBOMMtrlEdit.eh495Columns8tButtons0Click(Sender: TObject;
  var Handled: Boolean);
   var
    Lfrm:  TfrmSelMtrls;
    Lrkey: integer;
begin
  if Lfrm=nil then
    Lfrm:=TfrmSelMtrls.Create(self);
 try

  try
    Lrkey:=qry495rkey.AsInteger;
    Lfrm.FfilterStr:= Get495rkey17(qry495);
    Lfrm.TVInit;

    if Lfrm.ShowModal=mrok then
    begin
     if Lfrm.qry17INV_PART_NUMBER.value=  qry495.FieldByName('INVENT_PTR').value then
     begin
      ShowMessage('替代物料不能和原物料一样！');
     Exit;
     end;

     if qry495.Locate('INVENT_PTR',Lfrm.qry17.fieldbyname('rkey').AsInteger,[]) then
     begin
     ShowMessage('已存在该物料，请重新选择！');

     exit;
     end;

    if  qry495.Locate('rkey',Lrkey,[]) then
    begin
     qry495.edit;
     qry495.FieldByName('repl_invt_ptr').value:= Lfrm.qry17RKEy.value;
     qry495.FieldByName('inv_part_number_r').value:= Lfrm.qry17INV_PART_NUMBER.value;
     qry495.FieldByName('inv_name_r').value:=Lfrm.qry17INV_NAME.value;
     qry495.FieldByName('INV_DESCRIPTION_r').value:=Lfrm.qry17INV_DESCRIPTION.value;
     qry495.FieldByName('STOP_PURCH_r').value:=Lfrm.qry17STOP_PURCH.value;
     qry495.post;
     end;
    end;

  except on e:Exception do
    begin
    ShowMessage('错误：'+e.message);
    exit;
    end;
  end;

 finally
  Lfrm.free;
 
 end;

end;

procedure TfrmBOMMtrlEdit.mni_DelClick(Sender: TObject);
begin
  if qry495.IsEmpty then Exit;

  if qry495s.Locate('INVENT_PTR', qry495.fieldbyname('INVENT_PTR').value ,[]) then
  begin
    if IsReq(qry495s.fieldbyname('rkey').AsInteger) then
    begin
      showmessage('此物料已产生领料单,不能删除...');
      exit;
    end;
    qry495s.delete;
    qry495.Delete;
  end;

end;

function TfrmBOMMtrlEdit.IsReq(rkey495: integer): boolean;
var
  Lsql:string;
begin
     result:= False;
     Lsql:=' select sum(d468.quan_issued)qty '+
          ' FROM  dbo.wzcp0495  w495 '+
          ' left join wzcp0492  w492 on w495.rkey=w492.wzcp0495_ptr '+
          ' left join data0468 d468 on w492.rkey=d468.wzcp0492_ptr '+
          ' where  w495.rkey='+qry495.fieldbyname('rkey').asstring;
    if common.OpenQuery(qrytemp,Lsql)  then
    begin
       if  qrytemp.fieldbyname('qty').asstring<>'' then
       result:= True;
    end;
end;

procedure TfrmBOMMtrlEdit.Save494;
begin
 //494
//  if fstatus=0  then
//  qry494s.append
//  else
  qry494s.edit;
 // qry494spart_name.Value:=Trim(edt_BName.Text);
  qry494spart_ptr.Value:=DM.D08RKEY.AsInteger;
  qry494sstatus.Value:=0;
  qry494suser3_ptr.Value:=StrToInt(common.user_ptr);
  qry494sauth3_date.Value:=common.getsystem_date(qrytemp,0);
  qry494sProd_code.Value:=Trim(edt_ProdCode.text);
  qry494sPRODUCT_NAME.Value:=Trim(edt_ProdName.text);
  qry494s.post;

end;


procedure TfrmBOMMtrlEdit.Save495;
begin
  //495:
  qry495.first;
  while not qry495.Eof do
  begin
  if qry495s.Locate('INVENT_PTR', qry495INVENT_PTR.AsInteger,[])  then
  begin
  qry495s.Edit;
  qry495S.fieldbyname('seq_no').value:=qry495.RecNo;
  qry495srepl_invt_ptr.Value:= qry495repl_invt_ptr.Value;
  qry495sQUAN_BOM.Value:= qry495QUAN_BOM.Value;
  qry495sVENDOR.Value:= qry495VENDOR.Value;
  qry495sP_CODE.Value:=qry495P_CODE.Value;
  qry495sproduction_teamname.Value:=qry495production_teamname.Value;
  qry495s.post;
  end
  else
  begin
  qry495s.Append;
  qry495S.fieldbyname('seq_no').value:=qry495.RecNo;
  qry495sPARTBOM_PTR.Value:= qry494srkey.Value;
  qry495sINVENT_PTR.Value:=qry495INVENT_PTR.Value;
  qry495srepl_invt_ptr.Value:= qry495repl_invt_ptr.Value;
  qry495sQUAN_BOM.Value:= qry495QUAN_BOM.Value;
  qry495sVENDOR.Value:= qry495VENDOR.Value;
  qry495sSTD_COST.Value:= qry495STD_COST.Value;
  qry495sP_CODE.Value:=qry495P_CODE.Value;
  qry495sproduction_teamname.Value:=qry495production_teamname.Value;
  qry495s.post;
  end;
  
  qry495.next;
  end;
 end;

function TfrmBOMMtrlEdit.Get495rkey17(Ads:TADOQuery):string;
var
  Lstr:string;
begin
  result:='';
  Ads.DisableControls;
  Lstr:='' ;
  try
  ads.First;
  while not ads.Eof do
  begin
   Lstr:=Lstr+ads.fieldbyname('INVENT_PTR').asstring+',';
   ads.next;
  end;
  result:='('+Lstr+'-1)';
  finally
  Ads.EnableControls;
  end;

end;

procedure TfrmBOMMtrlEdit.mni_ImportClick(Sender: TObject);
var
  Lsql,str:string;
  Lfrm:TfrmPick_Item_Single;
  InputVar: PDlgInput ;
  messages:string;
  s:integer;
begin
  if Trim(edt_BName.Text)='' then
  begin
    showmessage('请先输入BOM名称!');
    exit;
  end;

      str:= Get495rkey17(qry495);
  Lfrm := TfrmPick_Item_Single.Create(self) ;
  try
    InputVar.Fields := 'PROD_CODE/产品编码/90,PRODUCT_NAME/产品名称/120,PRODUCT_DESC/产品规格/120,part_name/BOM名称/120,ttype_c/类别/50';
//    Lsql :=  'SELECT  dbo.Data0008.*,wzcp0494.rkey as rkey494,wzcp0494.part_name, dbo.Data0007.PR_GRP_CODE,'+#13
//                        +'dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME,' +#13
//                        +'case when data0008.ttype=0 then ''半成品''  else ''成品'' end ttype_c'+#13
//                        +'FROM  dbo.Data0008 inner join wzcp0494 on data0008.rkey=wzcp0494.part_ptr INNER JOIN'+#13
//                        +'dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'+#13
//                        +'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY '+#13
//                        +' where Data0008.PROD_CODE<>'+QuotedStr(edt_PCode.Text);

       Lsql :=  'SELECT  dbo.Data0008.*,wzcp0494.rkey as rkey494,wzcp0494.part_name, dbo.Data0007.PR_GRP_CODE,'+#13
                        +'dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME,' +#13
                        +'case when data0008.ttype=0 then ''半成品''  else ''成品'' end ttype_c'+#13
                        +'FROM  dbo.Data0008  inner join wzcp0494 on data0008.rkey=wzcp0494.part_ptr INNER JOIN'+#13
                        +'dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY INNER JOIN'+#13
                        +'dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY '+#13
                        +' where  wzcp0494.status=1 and  Data0008.PROD_CODE<>'+QuotedStr(edt_PCode.Text);

     InputVar.Sqlstr := Lsql;
    inputvar.KeyField:='PROD_CODE';
    // ShowMessage(Lsql);
    InputVar.AdoConn := DM.ADOCon;
    Lfrm.InitForm_New(InputVar) ;

  if Lfrm.ShowModal=mrok then
  begin

//        Lsql:=Format('declare @sql nvarchar(max)'
//          + #13#10 + 'set @sql='''  +' with bomlist(parentptr,ior,rk08,rk140, rk148,pcs,quantity) as '
//          + #13#10 +'(select a.part_ptr,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148, '
//          + #13#10 +'b.quan_bom as pcs,b.quan_bom  as quantity  '
//          + #13#10 +'from data0140 as a join       '
//          + #13#10 +'data0148 as b  on a.rkey =b.part_ptr  '
//          + #13#10 +'where   a.status=1 and  a.part_ptr= %d  '
//          + #13#10 +'union all            '
//          + #13#10 +'select a.part_ptr ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148, '
//          + #13#10 +'b.quan_bom,  b.quan_bom*e.quantity  as quan_bom   '
//          + #13#10 +'from data0140 as a                             '
//          + #13#10 +'join data0148 as b  on a.rkey=b.part_ptr    '
//          + #13#10 +'join  bomlist e on e.rk08= a.part_ptr '
//          + #13#10 +'where  e.ior=1 and a.status=1)     '
//
//        + #13#10 +'select  d17.RKEY, sum(a.quantity)quantity,d17.INV_PART_NUMBER,d17.iNV_NAME,d17.INV_DESCRIPTION,d17.std_cost,d17.STOP_PURCH,d02.unit_name'   //,d148.p_code,d148.production_teamname
//        + #13#10 +'from bomlist a '
//        + #13#10 +'inner join data0017  d17 on a.rk08=d17.rkey '
//        + #13#10 +'inner join data0002 d02  on d17.STOCK_UNIT_PTR=d02.rkey '
//        + #13#10 +'where  a.ior=0 and d17.rkey not in  '+Get495rkey17(qry495)
//        + #13#10 +' group by   d17.RKEY,d17.INV_PART_NUMBER,d17.iNV_NAME,d17.INV_DESCRIPTION,d17.std_cost,d17.STOP_PURCH,d02.unit_name '''    //,d148.p_code,d148.production_teamname
//        + #13#10 + 'exec sp_executesql @sql' + #13#10,[Lfrm.adsPick.FieldByName('rkey').asinteger]);

          // + #13#10 +'inner join data0148 d148 on a.rk148=d148.rkey '

      Lsql:='SELECT  wzcp0495.rkey,wzcp0495.PARTBOM_PTR,wzcp0495.INVENT_PTR,wzcp0495.repl_invt_ptr, '
          + #13#10 + 'wzcp0495.QUAN_BOM,wzcp0495.VENDOR,wzcp0495.STD_COST,wzcp0495.seq_no,wzcp0495.P_CODE, '
          + #13#10 + 'wzcp0495.production_teamname,  '
          + #13#10 + 'd17_0.inv_part_number,d17_0.inv_name,d17_0.INV_DESCRIPTION,'
          + #13#10 + ' d17_0.STOP_PURCH ,d17_1.STOP_PURCH as STOP_PURCH_r , '
          + #13#10 + 'd17_1.inv_part_number inv_part_number_r ,d17_1.inv_name inv_name_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r, '
          + #13#10 + 'd02.unit_name,d17_0.QUAN_ON_HAND,d17_0.CRITICAL_MATL_FLAG,wzcp0495.VENDOR '
          + #13#10 + 'FROM  dbo.wzcp0495  '
          + #13#10 + 'inner join   dbo.wzcp0494 d494  on d494.rkey =wzcp0495.partBom_ptr  '
          + #13#10 + 'inner join data0017 d17_0 on wzcp0495.invent_ptr=d17_0.rkey  '
          + #13#10 + 'inner join data0002 d02 on d17_0.STOCK_UNIT_PTR=d02.rkey  '
          + #13#10 + 'left join data0017 d17_1 on wzcp0495.repl_invt_ptr=d17_1.rkey '
          + #13#10 + 'where  d494.status=1  and  d494.part_ptr='+Lfrm.adsPick.FieldByName('rkey').asstring   //and wzcp0495.INVENT_PTR not in  '+Get495rkey17(qry495)+'
          + #13#10 + ' and  d494.part_name= '''+Lfrm.adsPick.FieldByName('part_name').asstring+''' ';
       // showmessage(Lsql);
    if not common.OpenQuery(qrytemp,Lsql) then Exit;

     if not qrytemp.IsEmpty then
     begin
       qrytemp.first;
      while not qrytemp.Eof do
      begin
        if qry495.Locate('INVENT_PTR', qrytemp.fieldbyname('INVENT_PTR').Value,[]) then
        begin
            messages:='[物料已存在]: '+#13+#13+qrytemp.fieldbyname('inv_name').asstring+' '+qrytemp.fieldbyname('inv_part_number').asstring+#13+
            '规格:['+qrytemp.fieldbyname('INV_DESCRIPTION').asstring+']'+#13+
             ''+#13+' 原物料BOM数量为:' +qry495.fieldbyname('QUAN_BOM').AsString+qry495.fieldbyname('unit_name').asstring+#13+
            ' 新增需求数量为: '+ qrytemp.fieldbyname('QUAN_BOM').asstring+qrytemp.fieldbyname('unit_name').asstring+#13+#13+' 需要叠加数量吗？' ;
            s:=messagebox(Self.Handle,PAnsiChar(AnsiString(messages)),'询问:',MB_YESNO+MB_iconquestion) ;
          if S = idyes  then
          begin
          qry495.edit;
          qry495.FieldByName('QUAN_BOM').value:=qry495.FieldByName('QUAN_BOM').value+ qrytemp.fieldbyname('QUAN_BOM').value;
          qry495.post;
          end
          else
          ShowMessage('不需增加，保存现BOM需求数');
       end
       else
       begin
          qry495.Append;
          qry495.FieldByName('seq_no').value:=qry495.RecordCount+1;
          qry495.FieldByName('INVENT_PTR').value:= qrytemp.fieldbyname('INVENT_PTR').value;
          qry495.FieldByName('inv_part_number').value:=  qrytemp.fieldbyname('inv_part_number').value;
          qry495.FieldByName('inv_name').value:= qrytemp.fieldbyname('inv_name').value;
          qry495.FieldByName('INV_DESCRIPTION').value:= qrytemp.fieldbyname('INV_DESCRIPTION').value;
          qry495.FieldByName('unit_name').value:= qrytemp.fieldbyname('unit_name').value;
          qry495.FieldByName('STOP_PURCH').value:= qrytemp.fieldbyname('STOP_PURCH').value;
          qry495.FieldByName('STD_COST').value:= qrytemp.fieldbyname('STD_COST').value;
          qry495.FieldByName('p_code').value:= qrytemp.fieldbyname('p_code').value;
          qry495.FieldByName('production_teamname').value:= qrytemp.fieldbyname('production_teamname').value;
          qry495.FieldByName('QUAN_BOM').value:= qrytemp.fieldbyname('QUAN_BOM').value;
          qry495.FieldByName('repl_invt_ptr').value:= qrytemp.fieldbyname('repl_invt_ptr').value;
          qry495.FieldByName('inv_part_number_r').value:=  qrytemp.fieldbyname('inv_part_number_r').value;
          qry495.FieldByName('inv_name_r').value:= qrytemp.fieldbyname('inv_name_r').value;
          qry495.FieldByName('INV_DESCRIPTION_r').value:= qrytemp.fieldbyname('INV_DESCRIPTION_r').value;
          qry495.FieldByName('STOP_PURCH_r').value:= qrytemp.fieldbyname('STOP_PURCH_r').value;
          qry495.FieldByName('vendor').value:= qrytemp.fieldbyname('vendor').value;
          qry495.post;
        end;
      qrytemp.Next;
     end;
    end;


  end;
  finally
    Lfrm.adsPick.Close;
    Lfrm.Free ;
  end;

  
end;

procedure TfrmBOMMtrlEdit.btn_selClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
  try

    InputVar.AdoConn :=dm.ADOCon;
     InputVar.Fields := 'prod_CODE/工程编码/150,product_NAME/产品名称/200,ttype/类型/100,PRODUCT_GROUP_NAME/组别/100';
          InputVar.Sqlstr :=' SELECT      dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0008.prod_CODE, dbo.Data0008.product_NAME,'+
                          ' case when data0008.ttype=0 then ''半成品'' else ''成品'' end ttype  '+
                          ' FROM	dbo.Data0008    '+
                          ' INNER JOIN    dbo.Data0007 ON dbo.Data0008.PR_GRP_POINTER = dbo.Data0007.RKEY '+
                          ' order by   dbo.Data0007.PRODUCT_GROUP_NAME,  data0008.ttype';

          inputvar.KeyField := 'prod_CODE';
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal = mrok then
    begin

          begin
            qry494s.edit;
            qry494s.FieldByName('prod_code').value:= trim(frmPick_Item_Single.adsPick.FieldValues['prod_code']);
            qry494s.FieldByName('product_name').value:= trim(frmPick_Item_Single.adsPick.FieldValues['product_name']);
            qry494s.post;
          end;

    end;
  finally
    frmPick_Item_Single.Free;
  end;

end;

//选择班组
//procedure TfrmBOMMtrlEdit.eh495Columns6EditButtons0Click(Sender: TObject;
//  var Handled: Boolean);
// var
//  InputVar: PDlgInput;
//begin
//  frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
//  try
//
//    InputVar.AdoConn :=dm.ADOCon;
//     InputVar.Fields := 'rkey/序号/100,production_teamname/生产班组/150';
//          InputVar.Sqlstr :='select rkey, production_teamname from wzcp0139';
//
//          inputvar.KeyField := 'rkey';
//    frmPick_Item_Single.InitForm_New(InputVar);
//    if frmPick_Item_Single.ShowModal = mrok then
//    begin
//          begin
//            qry495.edit;
//            qry495.FieldByName('production_teamname').value:= trim(frmPick_Item_Single.adsPick.FieldValues['production_teamname']);
//            qry495.post;
//          end;
//    end;
//  finally
//    frmPick_Item_Single.Free;
//  end;
//
// 
//end;

procedure TfrmBOMMtrlEdit.qry495TotalCostGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
//  if (qry495.FieldByName('quan_bom').AsString<>'' ) and (qry495.FieldByName('std_cost').AsString<>'' ) then
//  begin
//     qry495.edit;
//     qry495.FieldByName('quan_bom').Value:=qry495.FieldByName('quan_bom').Value*qry495.FieldByName('std_cost').Value;
//     qry495.post;
//  end;
end;

procedure TfrmBOMMtrlEdit.mni_addClick(Sender: TObject);
begin
qry495.Append;
end;

end.

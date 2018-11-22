unit UBOMMtrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus, DB, ADODB,OleServer, Excel2000, ComObj;

type
  TfrmBOMMtrl = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn_Close: TBitBtn;
    btn_Refresh: TBitBtn;
    btn_Export1: TBitBtn;
    btn_Export2: TBitBtn;
    pnl5: TPanel;
    pnl6: TPanel;
    eh494: TDBGridEh;
    pnl7: TPanel;
    eh495: TDBGridEh;
    lbl_field1: TLabel;
    edt_value1: TEdit;
    lbl_field2: TLabel;
    edt_value2: TEdit;
    qrytemp: TADOQuery;
    btn_UpdateMtrl: TButton;
    pm494: TPopupMenu;
    mni_Edit: TMenuItem;
    mni_Del: TMenuItem;
    mniN4: TMenuItem;
    mni_EngAUdit: TMenuItem;
    mniEngNoAUdit: TMenuItem;
    mniN10: TMenuItem;
    mni_MCtrlAudit: TMenuItem;
    mni_MCtrNolAudit: TMenuItem;
    mniN7: TMenuItem;
    mni_ReCal: TMenuItem;
    mni_Cancel: TMenuItem;
    mni_Add: TMenuItem;
    qry495S: TADOQuery;
    qrytemp494: TADOQuery;
    btn_GetAppQty: TButton;
    procedure qry_WZCP494BeforeScroll(DataSet: TDataSet);
    procedure btn_SelClick(Sender: TObject);
    procedure btn_UpdateMtrlClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure mni_DelClick(Sender: TObject);
    procedure mni_EngAUditClick(Sender: TObject);
    procedure btn_RefreshClick(Sender: TObject);
    procedure mniEngNoAUditClick(Sender: TObject);
    procedure mni_MCtrlAuditClick(Sender: TObject);
    procedure mni_MCtrNolAuditClick(Sender: TObject);
    procedure mni_ReCalClick(Sender: TObject);
    procedure mni_CancelClick(Sender: TObject);
    procedure mni_AddClick(Sender: TObject);
    procedure pm494Popup(Sender: TObject);
    procedure mni_EditClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure eh494KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh495KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eh494TitleClick(Column: TColumnEh);
    procedure edt_value1Change(Sender: TObject);
    procedure edt_value2Change(Sender: TObject);
    procedure eh495TitleClick(Column: TColumnEh);
    procedure btn_Export1Click(Sender: TObject);
    procedure btn_Export2Click(Sender: TObject);
    procedure btn_GetAppQtyClick(Sender: TObject);


  private
    { Private declarations }
    PreColumn1,PreColumn2: TColumnEh;
    Fsql:string;
    function ReCheck:Boolean;
  public
    { Public declarations }
  end;

var
  frmBOMMtrl: TfrmBOMMtrl;

implementation
    uses DM_u,ConstVar, Pick_Item_Single,common,UBOMMtrlEdit;
{$R *.dfm}

procedure TfrmBOMMtrl.qry_WZCP494BeforeScroll(DataSet: TDataSet);
begin
 if DM.qry_WZCP494.IsEmpty then Exit;
  DM.qry_WZCP495.Close;
  DM.qry_WZCP495.SQL.Clear;
  DM.qry_WZCP495.SQL.Text:=Format('declare @sql nvarchar(max)' +
  #13#10 + 'set @sql='''  +' with bomlist(parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,quantity) as '
        + #13#10 +'(select a.part_ptr, 1+0 as lvl ,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148, '
        + #13#10 +'a.part_name as bomname,b.quan_bom as pcs,b.quan_bom  as quantity  '
        + #13#10 +'from data0140 as a join       '
        + #13#10 +'data0148 as b  on a.rkey =b.part_ptr  '
        + #13#10 +'where   a.status=1 and  a.part_ptr= %d  '
        + #13#10 +'union all            '
        + #13#10 +'select a.part_ptr, 1+e.lvl as lvl ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148,  a.part_name, '
        + #13#10 +'b.quan_bom,  b.quan_bom*e.quantity  as quan_bom   '
        + #13#10 +'from data0140 as a                             '
        + #13#10 +'join data0148 as b  on a.rkey=b.part_ptr    '
        + #13#10 +'join  bomlist e on e.rk08= a.part_ptr '
        + #13#10 +'where  e.ior=1 and a.status=1)     '
        + #13#10 +'select  parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,code ,name,u,unit_name,sum(quantity)as STD_QTY '
        + #13#10 +'from               '
        + #13#10 +'(select   a.*,   '
        + #13#10 +'case when a.ior=1  then b.PRODUCT_NAME else c.inv_part_number end as code,  '
        + #13#10 +'case when a.ior=1  then b.prod_code else c.INV_PART_DESCRIPTION end as name, '
        + #13#10 +'case when a.ior=1 then  b.unit_ptr else c.stock_unit_ptr end   as u,        '
        + #13#10 +'case when a.ior=1 then  bb.unit_name else  cc.unit_name  end   as  unit_name, '
        + #13#10 +'0 as  ctrl                                          '
        + #13#10 +'from bomlist  a                          '
        + #13#10 +'left  join data0008  b on a.rk08=b.rkey  '
        + #13#10 +'left join data0002 bb on b.unit_ptr=bb.rkey '
        + #13#10 +'left join data0017 c on  a.rk08=c.rkey        '
        + #13#10 +'left join data0002 cc on c.stock_unit_ptr=cc.rkey  '
        + #13#10 +'where ior=0)aa                                  '
        + #13#10 +'group by parentptr,lvl,ior,rk08,rk140, rk148,bomname,pcs,code ,name,u,unit_name  '''+
        #13#10 + 'exec sp_executesql @sql' + #13#10,[DM.qry_WZCP494.FieldByName('partBOm_ptr').asinteger]);
     //showMessage(ADODataSet2.sql.Text);
  DM.qry_WZCP495.Open;

end;

procedure TfrmBOMMtrl.btn_SelClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
//  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
//  try
//    InputVar.Fields := 'rkey/ID/100, part_name/BOM名称/200';
//     InputVar.Sqlstr := 'Select  rkey , part_name from data0140   ';
//    InputVar.InPut_value:= edt_BOMName.Text;
//    InputVar.KeyField:= 'rkey';
//    InputVar.AdoConn:= DM.ADOCon;
//    frmPick_Item_Single.InitForm_New(InputVar);
//    if frmPick_Item_Single.ShowModal=mrok then
//    edt_BOMName.Text:=frmPick_Item_Single.adsPick.FieldValues['part_name'];
//  finally
//  frmPick_Item_Single.Free;
//  end;
end;
   //    if Trim(edt_BOMName.text)='' then
//    begin
//     ShowMessage('请先录入一个BOM名称');
//     Exit;
//    end;

//    Lsql:='select  user_ptr  From data0140 where part_ptr='+dm.ADO492.FieldByName('BOM_PTR').asstring;
//    dm.OpenQry(qrytemp,Lsql);
//    if not qrytemp.IsEmpty then
//    begin
//      if qrytemp.FieldByName('user_ptr').AsString='' then
//      begin
//      ShowMessage('该BOM表工程还没审核暂时不能更新材料过来!');
//      exit;
//      end;
//    end
//    else
//    begin
//    ShowMessage('该工程编码还没有建立BOM表！');
//    exit;
//    end;
procedure TfrmBOMMtrl.btn_UpdateMtrlClick(Sender: TObject);
var
  Lsql,LS:string;
begin

 try
     if  (strtoint(vprev) <> 3)    then
    begin
     ShowMessage('对不起，您无权操作！');
     Exit;
    end;


    Lsql:='select  rkey  From wzcp0494 where part_ptr='+dm.D08rkey.asstring;
    dm.OpenQry(qrytemp,Lsql);
    if not qrytemp.IsEmpty then
    begin
      ShowMessage('已存在该工程编码的BOM材料明细，如下， 不能再重复更新！');
      exit;
    end;

  //开始更新data140和data148-->wzcp494/wzcp495
  

 //494:
//  Fsql:=Format('declare @sql nvarchar(max)'
//+#13#10 + 'set @sql='''  +'  with bomlist(parentptr,rk08,rk140, rk148 ,ir,qty) as'
//+#13#10 + '(select  a.part_ptr ,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148, b.Invent_or  as ir, b.quan_bom as qty '
//+#13#10 + 'from data0140 as a join  '
//+#13#10 + 'data0148 as b  on a.rkey =b.part_ptr '
//+#13#10 + 'where a.status=1 and  a.part_ptr= %d '
//+#13#10 + 'union all  '
//+#13#10 + 'select  a.part_ptr,b.invent_ptr,a.rkey as rk140,b.rkey as rk148, b.Invent_or   as ir, b.quan_bom*e.qty as qty'
//+#13#10 + 'from data0140 as a '
//+#13#10 + 'inner join data0148 as b  on a.rkey=b.part_ptr'
//+#13#10 + 'inner join  bomlist e on e.rk08= a.part_ptr'
//+#13#10 + 'where a.status=1 and e.ir=1)'
//
//+#13#10 + 'select distinct  seqno= IDENTITY(INT,1,1) ,case when a.ir=1  then b.product_name else c.part_name end as part_name,'
//+#13#10 + 'a.parentptr,a.ir, '
//+#13#10 + ' case when a.ir=1  then b.prod_code else d.prod_code end as  prod_code, '
//+#13#10 + ' case when a.ir=1  then b.product_name else d.product_name end as product_name,  '
//+#13#10 + ' case when a.ir=1  then a.rk08 else null end as rk08,case when a.ir=1  then a.qty else -1 end as qty,a.rk140  '
//+#13#10 + ' into #494  '
//+#13#10 + 'from  bomlist  a  '
//+#13#10 + 'inner join data0140  c on a.rk140=c.rkey  '
//+#13#10 + 'left join data0008 b on  a.rk08=b.rkey '
//+#13#10 + 'left  join data0008 d on a.parentptr=d.rkey '
//+#13#10 + ' select case when a.ir=1 then  part_name+''''_''''+cast(seqno as varchar) else part_name end as part_name,a.parentptr,a.ir,'
//+#13#10 + 'prod_code,product_name,rk08,a.qty ,a.rk140'
//+#13#10 + 'from #494 a '
//+#13#10 + 'drop table #494 '''
//+ #13#10 + 'exec sp_executesql @sql' + #13#10,[DM.D08RKEY.asinteger]);

   Lsql:='select * from data0140  where status=1 and part_ptr='+  DM.D08RKEY.asstring;

   // showmessage(Lsql);
  qrytemp494.Close;
  qrytemp494.SQL.Clear;
  qrytemp494.SQL.Text:=Lsql;
  qrytemp494.open;
  //if not common.OpenQuery(qrytemp,Lsql) then exit;


   if   qrytemp494.IsEmpty then  exit;

   DM.ADOCon.beginTrans;
    qrytemp494.First;
       while not qrytemp494.eof do
       begin
        

         dm.qry_WZCP494.Append;

         dm.qry_WZCP494.FieldByName('part_name').value:=qrytemp494.fieldbyname('part_name').value;
         dm.qry_WZCP494.FieldByName('part_ptr').value:=DM.D08RKEY.asinteger;//qrytemp494.fieldbyname('parentptr').value;
         //dm.qry_WZCP494.FieldByName('PROD_CODE').value:=qrytemp494.fieldbyname('prod_code').value;
       //  dm.qry_WZCP494.FieldByName('PRODUCT_NAME').value:=qrytemp494.fieldbyname('product_name').value;
         dm.qry_WZCP494.FieldByName('user3_ptr').value:=qrytemp494.fieldbyname('user3_ptr').value; //user_ptr;
         dm.qry_WZCP494.FieldByName('auth3_date').value:=qrytemp494.fieldbyname('auth3_date').value;
         dm.qry_WZCP494.FieldByName('user_ptr').value:=qrytemp494.fieldbyname('user_ptr').value;
         dm.qry_WZCP494.FieldByName('auth_date').value:=qrytemp494.fieldbyname('auth_date').value;
         dm.qry_WZCP494.FieldByName('user2_ptr').value:=qrytemp494.fieldbyname('user2_ptr').value;
         dm.qry_WZCP494.FieldByName('auth2_date').value:=qrytemp494.fieldbyname('auth2_date').value;
         dm.qry_WZCP494.FieldByName('status').value:= qrytemp494.fieldbyname('status').value;


//          Lsql:='select status, user_ptr, auth_date,user2_ptr,auth2_date from data0140 a inner join data0148 b on a.rkey=b.part_ptr   where a.rkey= '+qrytemp494.fieldbyname('rk140').AsString;
//         if not common.OpenQuery(qrytemp,Lsql) then exit;
//         if not qrytemp.IsEmpty  then
//         begin
//         dm.qry_WZCP494.FieldByName('user_ptr').value:=qrytemp.fieldbyname('user_ptr').value;
//         dm.qry_WZCP494.FieldByName('auth_date').value:=qrytemp.fieldbyname('auth_date').value;
//         dm.qry_WZCP494.FieldByName('user2_ptr').value:=qrytemp.fieldbyname('user2_ptr').value;
//         dm.qry_WZCP494.FieldByName('auth2_date').value:=qrytemp.fieldbyname('auth2_date').value;
//         dm.qry_WZCP494.FieldByName('status').value:= qrytemp.fieldbyname('status').value;
//         end;

         dm.qry_WZCP494.post;

       qrytemp494.Next;
      end;
       dm.qry_WZCP494.updatebatch(arall);
 

    //wzcp495:
   dm.qry_WZCP494.First;
   while not dm.qry_WZCP494.Eof do
   begin
   //if  not qrytemp494.Locate('part_name',dm.qry_WZCP494.FieldByName('part_name').asstring,[]) then  exit;
    
//    if  qrytemp494.FieldByName('ir').Value=0  then
//   Lsql:= ' insert into  wzcp0495(partBOM_ptr,seq_no,invent_ptr,STD_cost,quan_BOm) '+
//          ' select  '+dm.qry_WZCP494.FieldByName('rkey').Asstring+', b.seq_no,b.invent_ptr,b.std_cost,b.quan_bom '+//*'+qrytemp494.FieldByName('qty').asstring+
//           ' from data0140 a  '+
//          '  inner  join data0148  b on a.rkey=b.part_ptr '+
//          '  where b.Invent_or=0 and  a.part_ptr='+qrytemp494.FieldByName('parentptr').asstring+' and a.part_name='''+dm.qry_WZCP494.FieldByName('part_name').asstring+''' '+
//          '  order by b.seq_no  '
//   else
//    Lsql:=' select  seq_no= IDENTITY(INT,1,1), b.invent_ptr,b.std_cost,sum(quan_bom*'+qrytemp494.FieldByName('qty').asstring+')quan_bom '+
//          ' into #aa      '+
//          ' from data0140 a  '+
//          ' inner join  data0148 b on a.rkey=b.part_ptr  '+
//          ' where b.invent_or=0 and a.part_ptr='+qrytemp494.FieldByName('rk08').asstring+
//          ' group by b.invent_ptr,b.std_cost '+
//          ' insert into  wzcp0495(partBOM_ptr,seq_no,invent_ptr,STD_cost,quan_BOm)'+
//          ' select '+dm.qry_WZCP494.FieldByName('rkey').Asstring+' ,* from #aa  '+
//           ' drop table #aa' ;


     LsqL:= Format('declare @sql nvarchar(max)'
         +#13#10 + 'set @sql='''  +' with bomlist(parentptr,ior,rk08,rk140, rk148,quantity) as  '
         +#13#10 + '(select a.part_ptr ,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148, '
         +#13#10 + 'b.quan_bom  as quantity  '
         +#13#10 + 'from data0140 as a join '
         +#13#10 + 'data0148 as b  on a.rkey =b.part_ptr '
         +#13#10 + 'where   a.status=1 and  a.part_ptr= %d and a.part_name='''''+dm.qry_WZCP494.FieldByName('part_name').Asstring+''''' '
         +#13#10 + 'union all  '
         +#13#10 + 'select a.part_ptr ,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148,'
         +#13#10 + 'b.quan_bom*e.quantity  as quan_bom  '
         +#13#10 + 'from data0140 as a    '
         +#13#10 + 'join data0148 as b  on a.rkey=b.part_ptr  '
         +#13#10 + 'join  bomlist e on e.rk08= a.part_ptr  '
         +#13#10 + 'where  e.ior=1 and a.status=1)'

         +#13#10 + 'select * into #bl from  bomlist '

         +#13#10 + 'select  a.rk08,min(b.p_code)p_code,max(b.VENDOR)VENDOR'
         +#13#10 + 'into #PCode '
         +#13#10 + 'from #bl a '
         +#13#10 + 'inner join data0148 b on a.rk148=b.rkey '
         +#13#10 + 'group by a.rk08 '

         +#13#10 + 'select seqno= IDENTITY(INT,1,1) ,a.* , c.std_cost,d.p_code,d.VENDOR '
         +#13#10 + 'into #495  '
         +#13#10 + 'from  ( select  rk08,sum(quantity)quantity from  #bl where  ior=0 group  by rk08)a '
         +#13#10 + 'inner join data0017 c on  a.rk08=c.rkey  '
         +#13#10 + 'left join #PCode d on  d.rk08=a.rk08  '
         +#13#10 + ' insert into wzcp0495(PARTBOM_PTR,seq_no,INVENT_PTR,QUAN_BOM,STD_COST,P_CODE,VENDOR) '
         +#13#10 + ' select %d,* from  #495 '
         +#13#10 + ' drop table #bl '
         +#13#10 + ' drop table #Pcode'
         +#13#10 + ' drop table #495 '''
        + #13#10 + 'exec sp_executesql @sql' + #13#10,[DM.D08RKEY.asinteger,dm.qry_WZCP494.FieldByName('rkey').AsInteger]);

      // showmessage(Lsql);
    qrytemp.Close;
    qrytemp.SQL.Clear;
    qrytemp.SQL.Text:=LsqL;
    qrytemp.execsql;

   dm.qry_WZCP494.Next;
   end;



    btn_Refreshclick(btn_Refresh);

   DM.ADOCon.CommitTrans;    
 except on e: exception do
 begin
  DM.ADOCon.RollbackTrans;
  ShowMessage('更新出错：'+e.Message);
 end;

 end;

end;

procedure TfrmBOMMtrl.FormShow(Sender: TObject);
begin
 DM.qry_WZCP494.Close;
 DM.qry_WZCP494.Parameters[0].Value:=dm.D08RKEY.AsInteger;
 DM.qry_WZCP494.Open;

 if  dm.qry_WZCP494.IsEmpty then   dm.qry_WZCP495.close;

 PreColumn1:=eh494.Columns[0];
 PreColumn2:=eh495.Columns[1];
 eh494.Columns[0].Title.Color := clred ;
 eh495 .Columns[1].Title.Color := clred ;


end;

procedure TfrmBOMMtrl.mniDelClick(Sender: TObject);
begin
    if DM.aqCP140status.Value = 1 then
      begin
        ShowMessage('此材料报价已审核,不允许删除!');
        Exit;
      end
      else if MessageBox(Handle,'确定删除此材料报价吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDYES then
      begin
        try
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='delete from WZCP0140 where rkey='+DM.aqcp140rkey.AsString;
          DM.Tmp.ExecSQL;
          DM.CDS148.Close;
          DM.aqCP148.Close;
          DM.aqCP148.Parameters[0].Value:= DM.aqcp140rkey.Value;
          DM.aqCP148.Parameters[1].Value:= DM.aqcp140rkey.Value;
          DM.aqCP148.Open;
          DM.CDS148.Open;
        except
          on E: Exception do
          begin
            ShowMessage('删除材料报价失败:'+E.Message);
          end;
        end;
      end;
end;

function TfrmBOMMtrl.ReCheck: Boolean;
var
  Lsql:string;
begin
  result:=false;
  //权限不为4的无法操作别人的记录
 if (user_ptr <> DM.qry_WZCP494.FieldByName('user3_ptr').AsString) and (DM.qry_WZCP494.FieldByName('user3_ptr').AsString<>'') and (strtoint(vprev) < 3)
  then
  begin
   ShowMessage('对不起，您无权操作别人的记录！');
   Exit;
  end;
  if not (DM.qry_WZCP494.IsEmpty) then

    Lsql :=' SELECT  wzcp0495.seq_no,wzcp0495.rkey,wzcp0495.partBOM_ptr,wzcp0495.INVENT_PTR,wzcp0495.repl_invt_ptr,'
      + #13#10 +
      'wzcp0495.QUAN_BOM,wzcp0495.VENDOR, wzcp0495.STD_COST ,'
      + #13#10 + 
      'd17_0.inv_part_number,d17_0.inv_name,d17_0.INV_DESCRIPTION,' 
      + #13#10 + 'wzcp0495.QUAN_BOM*wzcp0495.STD_COST TotalCost,'
      + #13#10 + 
      'case when d17_0.STOP_PURCH=''Y'' then ''是''   when d17_0.STOP_PURCH=''N'' then ''否''  else '''' end as STOP_PURCH,'
      + #13#10 + 
      'case when d17_1.STOP_PURCH=''Y'' then ''是''   when d17_1.STOP_PURCH=''N'' then ''否''  else '''' end as STOP_PURCH1,' 
      + #13#10 + 
      'd17_1.inv_part_number inv_part_number_r ,d17_1.inv_name inv_name_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r,' 
      + #13#10 + 
      'd02.unit_name,d17_0.QUAN_ON_HAND,d17_0.CRITICAL_MATL_FLAG,0.0 as  QUAN_ISSUED,p_code,production_teamname'
      + #13#10 +
      'FROM         dbo.wzcp0495 inner join data0017 d17_0 on wzcp0495.invent_ptr=d17_0.rkey '
      + #13#10 + 
      '               inner join data0002 d02 on d17_0.STOCK_UNIT_PTR=d02.rkey'
      + #13#10 + 
      '               left join data0017 d17_1 on wzcp0495.repl_invt_ptr=d17_1.rkey'
      + #13#10 + 'where  1=1 ' + #13#10 +
      'and wzcp0495.partBOM_ptr='+DM.qry_wzcp494.fieldbyname('rkey').AsString + ' and d17_0.STOP_PURCH=''Y''';

   //showmessage(Lsql);

   dm.OpenQry(qrytemp,Lsql);

//  if not (qrytemp.IsEmpty) and (Tmenuitem(Sender).Tag in [3]) then
//  begin
//    if MessageBox(Handle,'有已停止采购物料,是否需要继续','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
//
//  end;
   Result:=true;
end;

procedure TfrmBOMMtrl.mni_DelClick(Sender: TObject);
var
Lsql:string;
begin

 if not ReCheck then Exit;

 if MessageBox(Handle,'确定删除此BOM吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;


    Lsql := 'select   isnull(w492.app_qty,0)app_qty '+
            ' from wzcp0494 w494   '+
            ' inner join wzcp0495 w495 on w494.rkey=w495.partBOM_ptr  '+
            ' left join wzcp0492  w492 on w495.rkey=w492.wzcp0495_ptr '+
            ' where w494.rkey=' + DM.qry_wzcp494.fieldbyname('rkey').AsString;

        dm.OpenQry(qrytemp,Lsql);

         if (not qrytemp.IsEmpty)  and (qrytemp.FieldByName('app_qty').AsInteger > 0) then
           showmessage('此BOM已生成领料单,不能删除...')
         else
         begin
           Lsql:='delete from wzcp0494 where rkey='+DM.qry_wzcp494.fieldbyname('rkey').AsString;
           dm.execsql(qrytemp,Lsql);
      
          btn_RefreshClick(nil);
         end;

end;

procedure TfrmBOMMtrl.mni_EngAUditClick(Sender: TObject);
var
  Lsql:string;
  Lrkey:Integer;
begin
//
       if not  ReCheck   then Exit;

        if strtoint(vprev) < 3 then
         begin
           messagedlg('对不起!您没有该程序的审核权限',mtinformation,[mbok],0);
           Exit;
         end;

         try
           DM.ADOCon.BeginTrans;
           Lsql:='update wzcp0494 set status=1,user_ptr='+user_ptr+',auth_date=convert(varchar,getdate(),120)  where rkey='+DM.qry_wzcp494.fieldbyname('rkey').AsString;;

           if  not common.ExecSql(qrytemp,Lsql) then
           begin
           ShowMessage('审核出错！');
           exit;
           end;


            Lsql := ' update data0008  '+
            ' set total_cost=derivedtbl_1.t_cost    ' +
            ' FROM  dbo.Data0008 INNER JOIN   ' +
            ' (SELECT    dbo.wzcp0494.part_ptr,     '  +
            ' ROUND(SUM(dbo.wzcp0495.STD_COST * dbo.wzcp0495.QUAN_BOM), 2) AS t_cost '+
            ' FROM   dbo.wzcp0494 INNER JOIN   '+
            ' dbo.wzcp0495 ON dbo.wzcp0494.rkey = dbo.wzcp0495.PARTBOM_PTR INNER JOIN  '+
            ' dbo.Data0008 AS Data0008_1 ON dbo.wzcp0494.part_ptr = Data0008_1.RKEY '+
            ' WHERE  (dbo.wzcp0494.part_ptr = '+DM.D08RKEY.AsString+') AND (dbo.wzcp0494.status = 1) '+
            ' GROUP BY dbo.wzcp0494.part_ptr) AS derivedtbl_1 ON dbo.Data0008.RKEY = derivedtbl_1.part_ptr '+
            ' where data0008.rkey='+DM.D08RKEY.AsString ;

           if  not common.ExecSql(qrytemp,Lsql) then
           begin
           ShowMessage('审核出错！');
           exit;
           end;
           
            DM.ADOCon.CommitTrans;
             Lrkey:= dm.qry_WZCP494.FieldByName('rkey').asinteger;
            btn_refreshclick(btn_refresh);
            if not  dm.qry_WZCP494.locate('rkey',Lrkey,[]) then exit;
         except
            on E: Exception do
            begin
              DM.ADOCon.RollbackTrans;
              showmessage('数据保存发生错误:'+E.Message);
            end;
          end;
          


end;

procedure TfrmBOMMtrl.btn_RefreshClick(Sender: TObject);
begin
 DM.qry_WZCP494.Close;
 DM.qry_WZCP494.Parameters[0].Value:=dm.D08RKEY.AsInteger;
 DM.qry_WZCP494.Open;

 DM.qry_WZCP495.Close;
 DM.qry_WZCP495.Parameters[0].Value:=DM.qry_WZCP494rkey.AsInteger;
 DM.qry_WZCP495.Open;

end;

procedure TfrmBOMMtrl.mniEngNoAUditClick(Sender: TObject);
var
  Lsql:string;
  Lrkey:Integer;
  begin
   if not ReCheck then exit;
   
       if strtoint(vprev) < 3 then
         begin
           messagedlg('对不起!您没有该程序的反审权限',mtinformation,[mbok],0);
           Exit;
         end;

           Lsql:= 'select user2_ptr from wzcp0494 where rkey='+DM.qry_WZCP494RKEY.AsString;
         if common.OpenQuery(qrytemp,Lsql) then
           if DM.qry_WZCP494.FieldByName('user2_ptr').asstring <>'' then
           begin
             ShowMessage('物控已审，无法反审核，请通知物控人员进行反审核！');
             Exit;
           end;

           if DM.qry_WZCP494.FieldByName('user_ptr').asstring <>user_ptr then
           begin
             ShowMessage('您不能反审别人提交的资料！');
             Exit;
           end;



         Lsql:='update wzcp0494 set status=0,user_ptr=null,auth_date=null where status=1 and  rkey='+DM.qry_wzcp494rkey.AsString;
        // ShowMessage(Lsql);
         qrytemp.Close;
         qrytemp.SQL.Clear;
         qrytemp.SQL.Add(Lsql);
        // qrytemp.ExecSQL;
         if qrytemp.ExecSQL<>1 then
           showmessage('数据状态发生变化,反审核失败')
         else begin
           qrytemp.Close;
           qrytemp.SQL.Text:='update data0008 set total_cost=(SELECT top 1 isnull(SUM(dbo.wzcp0495.STD_COST * dbo.wzcp0495.QUAN_BOM),0) '+
                            'FROM dbo.wzcp0494 INNER JOIN dbo.wzcp0495 ON dbo.wzcp0494.rkey = dbo.wzcp0495.PARTBOM_PTR '+
                            'WHERE (dbo.wzcp0494.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.wzcp0494.status = 1)) '+
                            'where rkey='+DM.D08RKEY.AsString;
          // ShowMessage(DM.Tmp.SQL.Text);
           qrytemp.ExecSQL;
         end;
          Lrkey:= dm.qry_WZCP494.FieldByName('rkey').asinteger;
         btn_refreshclick(btn_refresh);
       if not  dm.qry_WZCP494.locate('rkey',Lrkey,[]) then exit;
end;

procedure TfrmBOMMtrl.mni_MCtrlAuditClick(Sender: TObject);
var
  Lsql:string;
  Lrkey:Integer;
begin
 if strtoint(vprev)<>4 then
   begin
     messagedlg('对不起!您的权限不够，请联系管理员',mtinformation,[mbok],0);
     Exit;
   end;
   with DM.Tmp do
   begin
     Close;
     SQL.Clear;
     SQL.Text := 'select status from wzcp0494 where rkey='+DM.qry_WZCP494rkey.AsString;
     Open;
     if (not IsEmpty) and (FieldByName('status').Value <> 1) then
     begin
       ShowMessage('工程未审，请联系工程相关人员进行审核！');
       Exit;
     end;
   end;
   DM.Tmp.Close;
   DM.Tmp.SQL.Text:='select getdate()';
   DM.Tmp.Open;
   try
     DM.ADOCon.BeginTrans;

     DM.qry_WZCP494.Edit;
    // DM.qry_WZCP494.fieldbyname('status').Value:=3;
     DM.qry_WZCP494.fieldbyname('user2_ptr').Value:=strtoint(user_ptr);
     DM.qry_WZCP494.fieldbyname('auth2_date').Value:=DM.Tmp.Fields[0].AsDateTime;
     DM.qry_WZCP494.Post;
     DM.qry_WZCP494.UpdateBatch(arAll);
     
     DM.Tmp.Close;
     DM.Tmp.SQL.Text:='update data0008 set total_cost=(SELECT isnull(SUM(dbo.wzcp0495.STD_COST * dbo.wzcp0495.QUAN_BOM),0) '+
                      'FROM dbo.wzcp0494 INNER JOIN dbo.wzcp0495 ON dbo.wzcp0494.rkey = dbo.wzcp0495.PARTBOM_PTR '+
                      'WHERE (dbo.wzcp0494.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.wzcp0494.status = 3)) '+
                      'where rkey='+DM.D08RKEY.AsString;
     DM.Tmp.ExecSQL;

     DM.ADOCon.CommitTrans;
   except
      on E: Exception do
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('数据保存发生错误:'+E.Message);
      end;
   end;
    Lrkey:= dm.qry_WZCP494.FieldByName('rkey').asinteger;
       btn_refreshclick(btn_refresh);
    if not  dm.qry_WZCP494.locate('rkey',Lrkey,[]) then exit;
end;

procedure TfrmBOMMtrl.mni_MCtrNolAuditClick(Sender: TObject);
var
  Lsql:string;
  Lrkey:Integer;
begin
 if strtoint(vprev)<>4 then
   begin
     messagedlg('对不起!您的权限不够，请联系管理员',mtinformation,[mbok],0);
     Exit;
   end;
   with DM.Tmp do
   begin
     Close;
     SQL.Clear;
     SQL.Text := 'select user2_ptr from wzcp0494 where rkey='+DM.qry_wzcp494RKEY.AsString;
     Open;
     if IsEmpty then
     begin
       ShowMessage('工程未审，请联系工程相关人员进行审核！');
       Exit;
     end;
   end;

    if  DM.qry_WZCP494.fieldbyname('user2_ptr').AsString<>user_ptr then 
     begin
     ShowMessage('您无法反审别人提交的资料!');
     Exit;
     end;



   DM.Tmp.Close;
   DM.Tmp.SQL.Text:='update wzcp0494 set status=1,user2_ptr=null,auth2_date=null where rkey='+DM.qry_wzcp494RKEY.AsString;
   if DM.Tmp.ExecSQL <> 1 then showmessage('数据状态发生变化,反审核失败')
   else
   begin
     DM.Tmp.Close;
     DM.Tmp.SQL.Text:='update data0008 set total_cost=(SELECT SUM(dbo.wzcp0495.STD_COST * dbo.wzcp0495.QUAN_BOM) '+
                      'FROM dbo.wzcp0494 INNER JOIN dbo.wzcp0495 ON dbo.wzcp0494.rkey = dbo.wzcp0495.PARTBOM_PTR '+
                      'WHERE (dbo.wzcp0494.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.wzcp0494.status = 1)) '+
                      'where rkey='+DM.D08RKEY.AsString;
     DM.Tmp.ExecSQL;
   end;
    Lrkey:= dm.qry_WZCP494.FieldByName('rkey').asinteger;
       btn_refreshclick(btn_refresh);
    if not  dm.qry_WZCP494.locate('rkey',Lrkey,[]) then exit;
end;

procedure TfrmBOMMtrl.mni_ReCalClick(Sender: TObject);
var
  Lsql:string;
begin

  if not ReCheck  then exit;

 try
           if (strtoint(vprev)<>4) then
           begin
             messagedlg('对不起!您没有该程序的重算成本权限',mtinformation,[mbok],0);
             Exit;
           end;
          //物料部分
          DM.Tmp.Close;
          Lsql:=' update wzcp0495  '+
            ' set std_cost=b.std_cost ' +
            ' from wzcp0495 a  ' +
            ' join data0017 b '  +
            ' on a.invent_ptr=b.rkey '+
            ' where  partBOM_ptr in(   '  +
            ' select rkey from wzcp0494 '+
            ' where part_ptr='+DM.D08RKEY.AsString+
            ')   ';
          DM.Tmp.SQL.Text:=Lsql;
          DM.Tmp.ExecSQL;
          DM.Tmp.Close;
       // 半成品部分
//          DM.Tmp.SQL.Text:=' update wzcp0495  '+
//            ' set std_cost=b.total_cost ' +
//            ' from wzcp0495 a  ' +
//            ' join data0008 b '  +
//            ' on a.invent_ptr=b.rkey '+
//            ' where  partBOM_ptr in(   '  +
//            ' select rkey from wzcp0494 '+
//            ' where part_ptr='+DM.D08RKEY.AsString+
//            ') and a.invent_or=1 ';
//          DM.Tmp.ExecSQL;
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='update data0008 set total_cost=(SELECT SUM(dbo.wzcp0495.STD_COST * dbo.wzcp0495.QUAN_BOM) '+
                                      'FROM dbo.wzcp0494 INNER JOIN dbo.wzcp0495 ON dbo.wzcp0494.rkey = dbo.wzcp0495.PARTBOM_PTR '+
                                      'WHERE (dbo.wzcp0494.part_ptr ='+DM.D08RKEY.AsString+' ) AND (dbo.wzcp0494.status = 1)) '+
                                      'where rkey='+DM.D08RKEY.AsString;
          // showmessage(DM.Tmp.SQL.Text);
           DM.Tmp.ExecSQL;
      showmessage('重算成功');
 except
  on E: Exception do
  begin
    showmessage('数据更新发生错误:'+E.Message);
  end;
 end;

end;

procedure TfrmBOMMtrl.mni_CancelClick(Sender: TObject);
var
  Lrkey:Integer;
begin
  try
        DM.ADOCon.BeginTrans;
        DM.qry_WZCP494.Edit;
        DM.qry_WZCP494status.Value:=2;
        DM.qry_WZCP494.post;

       DM.qry_WZCP494.UpdateBatch(arall);
        DM.ADOCon.CommitTrans;
      
       Lrkey:= dm.qry_WZCP494.FieldByName('rkey').asinteger;
       btn_refreshclick(btn_refresh);
     if not  dm.qry_WZCP494.locate('rkey',Lrkey,[]) then exit;

      except
        on E: Exception do
        begin
          DM.ADOCon.RollbackTrans;
          ShowMessage('作废失败:'+E.Message);
        end;
      end;
end;

procedure TfrmBOMMtrl.mni_AddClick(Sender: TObject);
var
  Lfrm: TfrmBOMMtrlEdit;
begin
// if not DM.qry_WZCP494.IsEmpty  then
// begin
//   ShowMessage('已存在BOM明细，不能再添加！');
//   Exit;
// end;
 Lfrm:= TfrmBOMMtrlEdit.create(self);

 try
  Lfrm.FStatus:=0;
  Lfrm.edt_PCode.Text:=dm.D08PROD_CODE.AsString;
  Lfrm.edt_PName.Text:=dm.D08PRODUCT_NAME.asstring;
  //lfrm.qry494s.FieldByName('prod_code').Text:=dm.D08PROD_CODE.AsString;
 // lfrm.edt_ProdName.Text:=dm.D08PRODUCT_NAME.AsString;
  Lfrm.qry494s.Close;
  Lfrm.qry494s.Parameters[0].Value:=-1;
  Lfrm.qry494s.open;

  Lfrm.qry495.Close;
  Lfrm.qry495.Parameters[0].Value:=-1;
  Lfrm.qry495.open;

  Lfrm.qry495s.Close;
  Lfrm.qry495s.Parameters[0].Value:=-1;
  Lfrm.qry495s.open;



  if Lfrm.ShowModal=mrok then
   begin
       btn_refreshclick(btn_refresh);
       if not  dm.qry_WZCP494.locate('part_name',Lfrm.FPart_Name,[]) then exit;
   end;

 finally
  Lfrm.free;
 end

end;

procedure TfrmBOMMtrl.pm494Popup(Sender: TObject);
begin
// mni_Add.Enabled:=(DM.qry_WZCP494.IsEmpty);

  mni_Add.Enabled := StrToInt(vprev) in[2,3,4];                                //新增
  mni_Edit.Enabled:=not DM.qry_WZCP494.IsEmpty  and (DM.qry_WZCP494status.Value=0); //修改
  mni_Del.Enabled:=mni_Edit.Enabled;                                                         //删除
  mni_EngAUdit.Enabled:=not DM.qry_WZCP494.IsEmpty and (StrToInt(vprev) in [3,4]) and (DM.qry_WZCP494status.Value=0); //工程审核
  mniEngNoAUdit.Enabled:=not DM.qry_WZCP494.IsEmpty and (StrToInt(vprev) in [3,4]) and (DM.qry_WZCP494status.Value=1) and (DM.qry_WZCP494user2_ptr.IsNull); //工程反审
  mni_ReCal.Enabled:=not DM.qry_WZCP494.IsEmpty and (StrToInt(vprev)=4) and (DM.qry_WZCP494status.Value in  [1,3]); //重算成本
  mni_MCtrlAUdit.Enabled:=not DM.qry_WZCP494.IsEmpty and (StrToInt(vprev)=4) and (DM.qry_WZCP494status.Value=1) and (DM.qry_WZCP494user2_ptr.IsNull); //物控审核
  mni_MCtrNolAudit.Enabled:=not DM.qry_WZCP494.IsEmpty and (StrToInt(vprev)=4) and  (DM.qry_WZCP494user2_ptr.Value > 0); //物控反审
  mni_Cancel.Enabled:=mni_Edit.Enabled ;//作废
end;

procedure TfrmBOMMtrl.mni_EditClick(Sender: TObject);
var
  Lfrm: TfrmBOMMtrlEdit;
  Lrkey: integer;
begin
 Lfrm:= TfrmBOMMtrlEdit.create(self);
 Lfrm.FStatus:=1;

 try
  Lfrm.edt_PCode.Text:=dm.D08PROD_CODE.AsString;
  Lfrm.edt_PName.Text:=dm.D08PROD_CODE.AsString;
 
  Lfrm.qry494s.Close;
  Lfrm.qry494s.Parameters.ParamByName('rkey').Value:=dm.qry_WZCP494rkey.value;
  Lfrm.qry494s.open;

  Lfrm.qry495.Close;
  Lfrm.qry495.Parameters.ParamByName('rkey494').Value:=dm.qry_WZCP494rkey.value;
  Lfrm.qry495.open;

  Lfrm.qry495s.Close;
  Lfrm.qry495s.Parameters.ParamByName('rkey494').Value:=dm.qry_WZCP494rkey.value;
  Lfrm.qry495s.open;


   if Lfrm.ShowModal=mrok then
   begin
     Lrkey:= dm.qry_WZCP494.FieldByName('rkey').asinteger;
       btn_refreshclick(btn_refresh);
    if not  dm.qry_WZCP494.locate('rkey',Lrkey,[]) then exit;
   end;


  finally
  Lfrm.free;
  end
end;

procedure TfrmBOMMtrl.btn_CloseClick(Sender: TObject);
begin
close;
end;

procedure TfrmBOMMtrl.eh494KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (ssAlt in Shift)  and  (Key=35) then
     showmessage(dm.qry_WZCP494.sql.Text);

  if (ssAlt in Shift)  and  (Key=86) then
  //showmessage(qrytemp494.SQL.Text);
     showmessage(dm.qry_WZCP494.sql.Text);
end;

procedure TfrmBOMMtrl.eh495KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(dm.qry_WZCP495.sql.Text);
end;

procedure TfrmBOMMtrl.eh494TitleClick(Column: TColumnEh);
begin
  if eh494.DataSource.DataSet.IsEmpty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry_WZCP494.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry_WZCP494.Sort:=Column.FieldName+' DESC';
  end;

  if eh494.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (self.PreColumn1.FieldName <> column.FieldName) then
  begin
    lbl_field1.Caption := column.Title.Caption ;
    edt_value1.SetFocus;
    PreColumn1.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn1 := column ;
    edt_value1Change(edt_value1);
  end else
    edt_value1.SetFocus;
end;

procedure TfrmBOMMtrl.edt_value1Change(Sender: TObject);
begin
if eh494.DataSource.DataSet.Filtered = False then eh494.DataSource.DataSet.Filtered := True;
  if eh494.DataSource.DataSet.FieldByName(PreColumn1.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value1.text) <> '' then
    begin
      if eh494.DataSource.DataSet.FieldByName(PreColumn1.FieldName).DataType in  [ftString, ftWideString]  then
        eh494.DataSource.DataSet.Filter:=' (' +  PreColumn1.FieldName + ' like ''%' + trim(edt_value1.text) + '%'')'
      else if eh494.DataSource.DataSet.FieldByName(PreColumn1.FieldName).DataType in  [ftSmallint, ftInteger]  then
        eh494.DataSource.DataSet.Filter:=' (' + PreColumn1.FieldName+' >= ' + inttostr(strtointdef(edt_value1.text,0))+')';
    end else
      eh494.DataSource.DataSet.Filter:='';
  end;
end;

procedure TfrmBOMMtrl.edt_value2Change(Sender: TObject);
begin
if eh495.DataSource.DataSet.Filtered = False then eh495.DataSource.DataSet.Filtered := True;
  if eh495.DataSource.DataSet.FieldByName(PreColumn2.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value2.text) <> '' then
    begin
      if eh495.DataSource.DataSet.FieldByName(PreColumn2.FieldName).DataType in  [ftString, ftWideString]  then
        eh495.DataSource.DataSet.Filter:=' (' +  PreColumn2.FieldName + ' like ''%' + trim(edt_value2.text) + '%'')'
      else if eh495.DataSource.DataSet.FieldByName(PreColumn2.FieldName).DataType in  [ftSmallint, ftInteger]  then
        eh495.DataSource.DataSet.Filter:=' (' + PreColumn2.FieldName+' >= ' + inttostr(strtointdef(edt_value2.text,0))+')';
    end else
      eh495.DataSource.DataSet.Filter:='';
  end;
end;

procedure TfrmBOMMtrl.eh495TitleClick(Column: TColumnEh);
begin
 if eh495.DataSource.DataSet.IsEmpty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    //dm.qry_WZCP495s     ds_WZCp495
    if eh495.DataSource= dm.ds_WZCp495s then
     DM.qry_WZCP495s.Sort:=Column.FieldName
     else
    DM.qry_WZCP495.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    if eh495.DataSource= dm.ds_WZCp495s then
    DM.qry_WZCP495s.Sort:=Column.FieldName+' DESC'
   else
    DM.qry_WZCP495.Sort:=Column.FieldName+' DESC';
  end;
  

  if eh495.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (self.PreColumn2.FieldName <> column.FieldName) then
  begin
    lbl_field2.Caption := column.Title.Caption ;
    edt_value2.SetFocus;
    PreColumn2.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
    edt_value2Change(edt_value2);
  end else
    edt_value2.SetFocus;
end;

procedure TfrmBOMMtrl.btn_Export1Click(Sender: TObject);
begin
 if not dm.qry_WZCP494.isempty then
 common.Export_dbGridEH_to_Excel(eh495,dm.qry_WZCP494.fieldbyname('part_name').AsString);
end;

procedure TfrmBOMMtrl.btn_Export2Click(Sender: TObject);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
  b:boolean;
begin
 
    if DM.qry_WZCP494.IsEmpty then exit;
    DM.qry_WZCP494.DisableControls;
    DM.qry_WZCP495.DisableControls;
    DM.qry_WZCP494.First;
    Screen.Cursor := crHourGlass;
    if not VarIsEmpty(XLApp) then
    begin
      XLApp.DisplayAlerts := False;
      XLApp.Quit;
      VarClear(XLApp);
    end;
    try
      XLApp := CreateOleObject('Excel.Application');
    except
      Screen.Cursor := crDefault;
      Exit;
    end;
    XLApp.WorkBooks.Add;
    while not DM.qry_WZCP494.Eof do
    begin
      if DM.qry_WZCP494status.AsInteger<>1 then
      begin
        DM.qry_WZCP494.Next;
        continue;
      end;
      if  b then
        Sheet :=XLApp.Sheets.Add
      else begin
        b:=true;
        Sheet :=XLApp.WorkBooks[1].WorkSheets[1];
      end;
      Sheet.name:=DM.qry_WZCP494part_name.AsString;
      DM.qry_WZCP495.first;
      v_cloumn := 0;
      for iCount := 0 to eh495.Columns.Count - 1 do
        if eh495.Columns.Items[iCount].Visible then
          Sheet.Cells[1, iCount + 1 - v_cloumn] :=eh495.Columns[iCount].Title.Caption
        else
          inc(v_cloumn);

      jCount := 1;
      while not DM.qry_WZCP495.Eof do
      begin
        v_cloumn := 0;
        for iCount := 0 to eh495.Columns.Count - 1 do
          if eh495.Columns[iCount].Visible = true then
          begin
            if eh495.Columns[iCount].Field.DataType=ftString then
              Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
            Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] := eh495.Columns[iCount].Field.AsString;
          end else
            inc(v_cloumn);
        Inc(jCount);
        DM.qry_WZCP495.Next;
      end;
      DM.qry_WZCP494.Next;
    end;

    XlApp.Visible := True;
    Screen.Cursor := crDefault;
    DM.qry_WZCP494.EnableControls;
    DM.qry_WZCP494.EnableControls;


end;

procedure TfrmBOMMtrl.btn_GetAppQtyClick(Sender: TObject);
var
  Lstr:string;
begin
     if  dm.qry_WZCP495.IsEmpty then   exit;

  eh495.DataSource.DataSet.Filtered:=false;

 eh495.DataSource:=dm.ds_wzcp495s;
 dm.qry_WZCP495s.Close;
 dm.qry_WZCP495s.Parameters[0].Value:=dm.qry_WZCP494rkey.AsInteger;
 dm.qry_WZCP495s.Open;

  if Trim(edt_value2.text)<>'' then
   edt_value2Change(sender);

end;

end.

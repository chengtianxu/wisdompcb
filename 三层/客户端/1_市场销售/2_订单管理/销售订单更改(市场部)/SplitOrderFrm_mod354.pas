unit SplitOrderFrm_mod354;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, Datasnap.DBClient,uCommFunc,
  Vcl.Mask, Vcl.DBCtrls, Data.Win.ADODB, Vcl.Menus,System.DateUtils;

type
  TfrmSplitOrder_mod354 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    eh360: TDBGridEh;
    ds360: TDataSource;
    cds360: TClientDataSet;
    ds60: TDataSource;
    cds60: TClientDataSet;
    pnl5: TPanel;
    eh60: TDBGridEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl_SetQty: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    dbedtSALES_ORDER: TDBEdit;
    dbedtORIG_REQUEST_DATE: TDBEdit;
    dbedtORIG_SCHED_SHIP_DATE: TDBEdit;
    dbedtABBR_NAME: TDBEdit;
    dbedtMANU_PART_NUMBER: TDBEdit;
    dbedtMANU_PART_DESC: TDBEdit;
    dbedtPO_NUMBER: TDBEdit;
    dbedtPARTS_SHIPPED: TDBEdit;
    edt_qtyPcs: TEdit;
    edt_qtySet: TEdit;
    edt_file: TEdit;
    dbedtSTATUS: TDBEdit;
    ds60N: TDataSource;
    cds60N: TClientDataSet;
    qrytemp: TADOQuery;
    strngfld_order: TStringField;
    fltfldPARTS_ORDERED: TFloatField;
    intgrfld_ORDERED: TIntegerField;
    dtmfldORIG_REQUEST_DATE: TDateTimeField;
    dtmfldORIG_SCHED_SHIP_DATE: TDateTimeField;
    pm1: TPopupMenu;
    mni_Add: TMenuItem;
    mni_edit: TMenuItem;
    mni_edit60: TMenuItem;
    pm2: TPopupMenu;
    mni_del360: TMenuItem;
    cdsTemp: TClientDataSet;
    procedure mni_AddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mni_del360Click(Sender: TObject);
    procedure eh360Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mni_edit60Click(Sender: TObject);
    procedure mni_editClick(Sender: TObject);
    procedure eh60DblClick(Sender: TObject);
  private
    { Private declarations }
    function get_NewSoNumber( bef:string):string;
    function checkQty(qty: integer): Boolean;
  public
    { Public declarations }
    FPARTS_SHIPPED ,FRETURNED_SHIP,FISSUED_QTY:integer;
    procedure GetData(Arkey60:string);
  end;

var
  frmSplitOrder_mod354: TfrmSplitOrder_mod354;

implementation
       uses AddSplitOrderFrm_mod354;
{$R *.dfm}

{ TfrmSplitOrder_mod354 }

procedure TfrmSplitOrder_mod354.btnCloseClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmSplitOrder_mod354.btnSaveClick(Sender: TObject);
var
Lsql:string;
begin
inherited;
 Lsql:='select PARTS_SHIPPED,RETURNED_SHIP,ISSUED_QTY from data0060'+
               ' where rkey='+cds60.FieldByName('rkey').AsString;
 gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

  if (cdsTemp.FieldByName('PARTS_SHIPPED').AsInteger<>FPARTS_SHIPPED) or
     (cdsTemp.FieldByName('RETURNED_SHIP').AsInteger<>FRETURNED_SHIP ) or
     (cdsTemp.FieldByName('ISSUED_QTY').AsInteger<>FISSUED_QTY ) then
   begin
    showmessage('原订单送货数量,投产数量发生变化不能拆分,请刷新数据!');
    eh60.SetFocus;
   end
  else
  if strtoint(edt_qtyPcs.Text)<cds60.FieldByName('PARTS_SHIPPED').AsInteger then
   begin
    showmessage('原订单数量PCS不能小于已装运数量!');
    eh60.SetFocus;
   end
  else
   if checkQty(StrToInt(edt_qtyPcs.Text)) then
   begin
    showmessage('完工数量必须等于原订单数量PCS数减去折分PCS数量！');
    eh60.SetFocus;
   end
  else
    IF messagedlg('订单拆分将会是不可逆操作你确定吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    ModalResult:=mrok;
end;

function TfrmSplitOrder_mod354.checkQty(qty: integer): Boolean;
var
  n:Integer;
begin
  n:= 0;
  if ((cds360.Active) and (cds360.RecordCount > 0)) then

    cds360.DisableControls;
    try
      cds360.First;
      while not cds360.Eof do
      begin
        n:= n + cds360.FieldByName('quantity').AsInteger;
        cds360.Next;
      end;
    finally
      cds360.EnableControls;
    end;

  if qty <> n then Result:= True
  else Result:= False;
end;

procedure TfrmSplitOrder_mod354.eh360Exit(Sender: TObject);
begin
  inherited;
    if cds60.State in[dsInsert, dsEdit] then CDS60.Post;
end;

procedure TfrmSplitOrder_mod354.eh60DblClick(Sender: TObject);
begin
  inherited;
  mni_editClick(sender);
end;

procedure TfrmSplitOrder_mod354.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  Action:=caFree;
// frmSplitOrder_mod354:=nil;
end;

procedure TfrmSplitOrder_mod354.GetData(Arkey60: string);
var
Lsql60,Lsql60N,Lsql360:string;
begin

  Lsql60:=cds60.CommandText+' and data0060.rkey='+Arkey60;
//  showmessage(Lsql60);
  Lsql60N:='select *  from data0060 where 1=0 ';
  Lsql360:=cds360.CommandText +' and  so_ptr='+Arkey60;
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql60,Lsql60N, Lsql360]),
   [cds60,cds60N, cds360]) then    exit;
end;

function TfrmSplitOrder_mod354.get_NewSoNumber(bef: string): string;
var
 L_so:string;
 L_row:integer;
 Lsql:string;
begin
 Lsql:='select top 1 sales_order from data0060'+
      ' where sales_order like '''+bef+'%''' +
      'order by sales_order desc';
     gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

    if not cdstemp.IsEmpty then      //如果同一采购号同一部品以前卖过so从自身取值
     begin
     //订单号前部分
      L_so:=copy(cdsTemp.fieldvalues['sales_order'],1,pos('-',cdsTemp.fieldvalues['sales_order'])-1);
      if cds60N.RecordCount=0 then
       begin
        L_row := strtoint(trim(copy(cdsTemp.fieldvalues['sales_order'],//取后缀
               pos('-',cdsTemp.fieldvalues['sales_order'])+1,2)))+1;
        if L_row<10 then
         get_NewSoNumber:=L_so+'-0'+inttostr(L_row)
        else
         get_NewSoNumber:=L_so+'-'+inttostr(L_row);
       end
      else
       begin
        L_row := strtoint(trim(copy( cds60N.fieldvalues['sales_order'],//取后缀
                 pos('-',cdsTemp.fieldvalues['sales_order'])+1,2)))+1;
        if L_row<10 then
         get_NewSoNumber:=L_so+'-0'+inttostr(L_row)
        else
         get_NewSoNumber:=L_so+'-'+inttostr(L_row);
       end;
     end
    else
     get_NewSoNumber:='';
end;


procedure TfrmSplitOrder_mod354.mni_AddClick(Sender: TObject);
var
Lfrm:TfrmAddSplitOrder_mod354;
begin
  inherited;
   LFrm:=TfrmAddSplitOrder_mod354.Create(nil);
   try
    LFrm.FOldOrderQty:=cds60.FieldByName('PARTS_ORDERED').asinteger;
    LFrm.FPARTS_SHIPPED:=cds60.FieldByName('PARTS_SHIPPED').asinteger; //已装运的数量
    Lfrm.FSetQty:= cds60.FieldByName('set_Qty').asinteger;
    Lfrm.edt_orderNo.Text:=get_Newsonumber(Copy(dbedtSALES_ORDER.Text,1,Pos('-',dbedtSALES_ORDER.Text)));
     Lfrm.edt_CustDate.Text:=FormatDateTime('yyyy-MM-dd',cds60.FieldByName('ORIG_REQUEST_DATE').asdatetime);//客户交期 RIG_REQUEST_DATE
    Lfrm.edt_PDate.Text:=FormatDateTime('yyyy-MM-dd',cds60.FieldByName('ORIG_SCHED_SHIP_DATE').asdatetime);// 计划交期 RIG_REQUEST_DATE

    if Lfrm.ShowModal=mrok then
    begin
    cds60N.Append;
    cds60N.FieldByName('sales_order').Value:=LFrm.edt_orderNO.Text;
    cds60N.FieldByName('PARTS_ORDERED').Value:=strtoint(LFrm.edt_QtySet.Text);
    cds60N.FieldByName('set_ORDERED').Value:= strtoint(Lfrm.edt_QtyPcs.Text);
    cds60N.FieldByName('ORIG_REQUEST_DATE').Value:=StrToDate(Lfrm.edt_CustDate.Text);
    cds60N.FieldByName('ORIG_SCHED_SHIP_DATE').Value:=StrToDate(Lfrm.edt_PDate.Text);
    cds60N.Post;

    edt_qtySet.Text := inttostr(strtoint(edt_qtySet.Text)-strtoint(Lfrm.edt_QtySet.Text));
    edt_qtyPcs.Text := inttostr(strtoint(edt_qtyPcs.Text)-strtoint(Lfrm.edt_QtyPcs.Text));
    end;
   finally
     LFrm.Free;
   end;
end;

procedure TfrmSplitOrder_mod354.mni_del360Click(Sender: TObject);
begin
  inherited;
     if cds360.IsEmpty  then exit;
     cds360.Delete;
end;

procedure TfrmSplitOrder_mod354.mni_edit60Click(Sender: TObject);
begin
  inherited;
   if cds60N.IsEmpty  then exit;

    edt_qtySet.Text := inttostr(strtoint(edt_qtySet.Text)+cds60n.FieldByName('parts_ordered').AsInteger );
    edt_qtyPcs.Text := inttostr(strtoint(edt_qtyPcs.Text)+cds60n.FieldByName('set_ordered').AsInteger );

    cds60N.Delete;

end;

procedure TfrmSplitOrder_mod354.mni_editClick(Sender: TObject);
var
Lfrm:TfrmAddSplitOrder_mod354;
LsetQty,LPcsQty:Integer;
begin
  inherited;
   LFrm:=TfrmAddSplitOrder_mod354.Create(nil);
   try
    LFrm.FOldOrderQty:=cds60N.FieldByName('PARTS_ORDERED').asinteger;
    LFrm.FPARTS_SHIPPED:=cds60N.FieldByName('PARTS_SHIPPED').asinteger; //已装运的数量
    Lfrm.FSetQty:= cds60.FieldByName('set_Qty').asinteger;
    Lfrm.Frush_charge_pct_used:=cds60.FieldByName('rush_charge_pct_used').asinteger;
    Lfrm.edt_orderNo.Text:=get_Newsonumber(Copy(dbedtSALES_ORDER.Text,1,Pos('-',dbedtSALES_ORDER.Text)));
    Lfrm.edt_CustDate.Text:=FormatDateTime('yyyy-MM-dd',cds60N.FieldByName('ORIG_REQUEST_DATE').AsDateTime);//客户交期 RIG_REQUEST_DATE
    Lfrm.edt_PDate.Text:=FormatDateTime('yyyy-MM-dd',cds60N.FieldByName('ORIG_SCHED_SHIP_DATE').AsDateTime);// 计划交期 RIG_REQUEST_DATE
    LFrm.edt_QtySet.Text:= cds60N.FieldByName('PARTS_ORDERED').asstring;
    LFrm.edt_Qtypcs.Text:= cds60N.FieldByName('set_ordered').asstring;

    LsetQty:=StrToInt(LFrm.edt_QtySet.Text);
    LPcsQty:=StrToInt(LFrm.edt_QtyPcs.Text);

    if Lfrm.ShowModal=mrok then
    begin
    cds60N.edit;
    cds60N.FieldByName('sales_order').Value:=LFrm.edt_orderNO.Text;
    cds60N.FieldByName('PARTS_ORDERED').Value:=strtoint(LFrm.edt_QtySet.Text);
    cds60N.FieldByName('set_ORDERED').Value:= strtoint(Lfrm.edt_QtyPcs.Text);
    cds60N.FieldByName('ORIG_REQUEST_DATE').Value:=StrToDate(Lfrm.edt_CustDate.Text);
    cds60N.FieldByName('ORIG_SCHED_SHIP_DATE').Value:=StrToDate(Lfrm.edt_PDate.Text);
    cds60N.Post;

    edt_qtySet.Text := inttostr(strtoint(edt_qtySet.Text)-strtoint(Lfrm.edt_QtySet.Text)+LsetQty);
    edt_qtyPcs.Text := inttostr(strtoint(edt_qtyPcs.Text)-strtoint(Lfrm.edt_QtyPcs.Text)+LPcsQty);
    end;
   finally
     LFrm.Free;
   end;
end;

end.

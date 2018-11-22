unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, Mask, DB, DBClient,midaslib;

type
  TFrm_main = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    LBCust1: TLabel;
    LBfac1: TLabel;
    LBStore1: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    EdtCust1: TEdit;
    EdtPart1: TEdit;
    EdtCustPart1: TEdit;
    EdtFac1: TEdit;
    EdtStore1: TEdit;
    Edit12: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Edit14: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LBfac: TLabel;
    LBStore: TLabel;
    LBCust: TLabel;
    EdtCust: TEdit;
    EdtPart: TEdit;
    EdtCustPart: TEdit;
    EdtFac: TEdit;
    EdtStore: TEdit;
    Edit6: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Rd1: TRadioButton;
    Rd2: TRadioButton;
    Grid1: TDBGridEh;
    MaskEdit1: TMaskEdit;
    DS: TDataSource;
    CDS: TClientDataSet;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Rd1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EdtCustEnter(Sender: TObject);
    procedure EdtPartEnter(Sender: TObject);
    procedure EdtCust1Enter(Sender: TObject);
    procedure EdtPart1Enter(Sender: TObject);
    procedure EdtFac1Enter(Sender: TObject);
    procedure EdtStore1Enter(Sender: TObject);
    procedure EdtCustExit(Sender: TObject);
    procedure EdtPartExit(Sender: TObject);
    procedure EdtCust1Exit(Sender: TObject);
    procedure EdtPart1Exit(Sender: TObject);
    procedure EdtFac1Exit(Sender: TObject);
    procedure EdtStore1Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
  private
     Frkey06,Frkey53:integer;
     F53cost_pcs: Double;
     empl_ptr :integer;
     FMFG_Date53:TDatetime;
     FEdtCust,FEdtPart,FEdtCust1,FEdtPart1,FEdtFac1,FEdtStore1:string;
     FinValid:boolean;
    procedure SelValidate(Sender: TField);
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses common,Pick_Item_Single,ConstVar,DM_u,MyClass;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOCon) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;


//  dm.ADOCon.Open;
//  rkey73 := '1593';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  MyDataClass:=TMyDataClass.Create(dm.ADOCon);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
           s:string;
           i:integer;
begin
 if (Tcomponent(Sender).Tag=2) and  (EdtCust.Text='') then
 begin
   showmessage('请先输入本厂编号!');
   exit;
 end;

 if RD2.Checked and (Tcomponent(Sender).Tag=2) then
 begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT cast(0 as bit) sel,'+
                      'Data0053.RKEY RKEY53,Data0053.WHSE_PTR rkey15,Data0053.LOC_PTR rkey16,'+
                      'Data0015.warehouse_code ,data0015.warehouse_name ,'+
                      'Data0016.CODE ,data0016.location,'+
                      'Data0006.WORK_ORDER_NUMBER ,Data0053.REFERENCE_NUMBER ,Data0053.MFG_DATE ,'+
                      'Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC as QTY_AVAIL,'+
                      'Data0053.QTY_ON_HAND ,Data0053.QTY_ALLOC ,Data0025.REVIEW_DAYS ,'+
                      'Data0006.RKEY rkey06, '+
                      ' data0053.cost_pcs ' +
                      'FROM '+
                      'Data0053 inner join Data0015 on Data0053.WHSE_PTR = Data0015.RKEY '+
                               'inner join Data0016 on Data0053.LOC_PTR = Data0016.RKEY '+
                               'left outer join Data0006 on Data0053.WORK_ORDER_PTR = Data0006.RKEY '+
                               'inner join Data0025 on Data0053.CUST_PART_PTR = Data0025.rkey '+
                      'WHERE Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC>0 and '+
                      'Data0053.CUST_PART_PTR = '+inttostr(EdtPart.Tag);
    DM.tmp.Open;
    for i:=0 to DM.tmp.Fields.Count-1 do DM.tmp.Fields[i].ReadOnly:=i<>0;
    DM.DP.DataSet:=DM.tmp;
    CDS.Data:=DM.DP.Data;
    cds.fieldbyname('Sel').OnValidate:=SelValidate;
    DM.tmp.Close;
    DM.DP.DataSet:=nil;
    Edit6.Text:='0';
    exit;
 end;

 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0,3:
    begin
      InputVar.Fields := 'CUST_CODE/客户编码/50,CUSTOMER_NAME/客户名称/250,LOCATION/送货地址/100';
      InputVar.Sqlstr :='SELECT RKEY, CUST_CODE, CUSTOMER_NAME from data0010 order by Data0010.CUST_CODE';
      inputvar.KeyField:='CUST_CODE';
      if Tcomponent(Sender).Tag=0 then inputvar.InPut_value:=EdtCust.Text else inputvar.InPut_value:=EdtCust1.Text;
    end;

    1,4:
    begin
      if (Tcomponent(Sender).Tag=1) and (EdtCust.Text<>'') then
         s:=' and CUSTOMER_PTR='+inttostr(EdtCust.Tag)
      else if (Tcomponent(Sender).Tag=4) and (EdtCust1.Text<>'') then
         s:=' and CUSTOMER_PTR='+inttostr(EdtCust1.Tag);

     if Tcomponent(Sender).Tag=1 then  s:='and QTY_ON_HAND>0'+s ;

      InputVar.Fields := 'manu_part_number/本厂编号/100,manu_part_desc/客户型号/150,ttype/类别/150';
      InputVar.Sqlstr :='select rkey,manu_part_number,manu_part_desc, customer_ptr, case data0025.ttype '+
                        'when 0 then ''批量'' when 1 then ''样板''  end ttype from  data0025 '+
                        'where data0025.PARENT_PTR is null  '+s+
                        ' order by manu_part_number';

      inputvar.KeyField:='manu_part_number';
      if Tcomponent(Sender).Tag=1 then inputvar.InPut_value:=EdtPart.Text else inputvar.InPut_value:=EdtPart1.Text;
    end;
    2:
    begin
      InputVar.Fields :='warehouse_code/工厂/50,location/仓库/80,WORK_ORDER_NUMBER/工作订单/80,REFERENCE_NUMBER/参考号/80,MFG_DATE/入库日期/100,QTY_AVAIL/有效数量/80';
      InputVar.Sqlstr :='SELECT '+
                        'Data0053.RKEY RKEY53,Data0053.WHSE_PTR rkey15,Data0053.LOC_PTR rkey16,'+
                        'Data0015.warehouse_code ,data0015.warehouse_name ,data0015.abbr_name ,'+
                        'Data0016.CODE ,data0016.location,'+
                        'Data0006.WORK_ORDER_NUMBER ,Data0053.REFERENCE_NUMBER ,Data0053.MFG_DATE ,'+
                        'Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC as QTY_AVAIL,'+
                        'Data0053.QTY_ON_HAND ,Data0053.QTY_ALLOC ,Data0025.REVIEW_DAYS ,'+
                        'Data0006.RKEY rkey06, '+
                        ' data0053.cost_pcs ' +
                        'FROM '+
                        'Data0053 inner join Data0015 on Data0053.WHSE_PTR = Data0015.RKEY '+
                                 'inner join Data0016 on Data0053.LOC_PTR = Data0016.RKEY '+
                                 'left outer join Data0006 on Data0053.WORK_ORDER_PTR = Data0006.RKEY '+
                                 'inner join Data0025 on Data0053.CUST_PART_PTR = Data0025.rkey '+
                        'WHERE Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC>0 and '+
                        'Data0053.CUST_PART_PTR = '+inttostr(EdtPart.Tag);
      inputvar.KeyField:='manu_part_number';
    end;

    5:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/150,abbr_name/工厂简称/200';
      InputVar.Sqlstr :='SELECT RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,abbr_name FROM Data0015 ORDER BY  WAREHOUSE_CODE';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    6:
    begin
      if EdtFac1.Text<>'' then s:=' and data0015.rkey='+inttostr(EdtFac1.tag);
      InputVar.Fields := 'CODE/仓库代码/150,LOCATION/仓库名称/200,WAREHOUSE_CODE/工厂代码/80,abbr_name/工厂简称/120';
      InputVar.Sqlstr :='SELECT data0016.RKEY,CODE,LOCATION ,whouse_ptr,data0015.warehouse_code,data0015.warehouse_name,data0015.abbr_name '+
                      'FROM Data0016 inner join data0015 on whouse_ptr=data0015.rkey where data0016.location_type=1 '+
                      'and data0016.allow_putout=1'+s+
                      ' ORDER BY data0016.CODE' ;
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtCust.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_CODE']);
         LBCust.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME']);
         EdtCust.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

         EdtPart.Text:='';
         EdtCustPart.Text:='';
       end;
     1:begin
         EdtPart.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         EdtPart.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         EdtCustPart.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_desc']);

         edit6.Text:='0';
         if EdtCust.text='' then
         begin
           DM.tmp.Close;
           DM.tmp.SQL.Text:='SELECT RKEY, CUST_CODE, CUSTOMER_NAME from data0010 where rkey='+frmPick_Item_Single.adsPick.Fieldbyname('customer_ptr').asstring;
           DM.tmp.Open;
           EdtCust.Text:=DM.tmp.Fields[1].AsString;
           LBCust.Caption:=DM.tmp.Fields[2].AsString;
           EdtCust.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
         end;
       end;
     2:begin
         Edtfac.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
         Edtfac.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey15').AsInteger;
         LBFac.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['abbr_name']);

         Edtstore.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['code']);
         Edtstore.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey16').AsInteger;
         LBstore.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['location']);

         Edit6.Text:=frmPick_Item_Single.adsPick.Fieldbyname('QTY_AVAIL').AsString;
         Frkey53:=frmPick_Item_Single.adsPick.Fieldbyname('rkey53').AsInteger;
         F53cost_pcs := frmPick_Item_Single.adsPick.fieldbyname('cost_pcs').AsFloat;
         Frkey06:=frmPick_Item_Single.adsPick.Fieldbyname('rkey06').AsInteger;

         FMFG_Date53:=frmPick_Item_Single.adsPick.Fieldbyname('MFG_Date').asdatetime;
         EdtCust1.SetFocus;
       end;
     3:begin
         EdtCust1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_CODE']);
         LBCust1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME']);
         EdtCust1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

         EdtPart1.Text:='';
         EdtCustPart1.Text:='';
       end;
     4:begin
         EdtPart1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_number']);
         EdtPart1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         EdtCustPart1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['manu_part_desc']);
         if EdtCust1.text='' then
         begin
           DM.tmp.Close;
           DM.tmp.SQL.Text:='SELECT RKEY, CUST_CODE, CUSTOMER_NAME from data0010 where rkey='+frmPick_Item_Single.adsPick.Fieldbyname('customer_ptr').asstring;
           DM.tmp.Open;
           EdtCust1.Text:=DM.tmp.Fields[1].AsString;
           LBCust1.Caption:=DM.tmp.Fields[2].AsString;
           EdtCust1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
         end;
       end;
     5:begin
         Edtfac1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         Edtfac1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         LBfac1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['abbr_name']);
         Edtstore1.Text:='';
         LBstore1.Caption:='';
       end;
     6:begin
         Edtstore1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
         Edtstore1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         LBstore1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['LOCATION']);

         Edtfac1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         Edtfac1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('whouse_ptr').AsInteger;
         LBfac1.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['abbr_name']);
         DM.GetNo(MaskEdit1,'5',0);
       end;
    end;
  end else case Tcomponent(Sender).Tag of
     0: begin EdtCust.SetFocus;FEdtCust:='';end;
     1: begin EdtPart.SetFocus;FEdtPart:='';end;
     3: begin EdtCust1.SetFocus;FEdtCust1:='';end;
     4: begin EdtPart1.SetFocus;FEdtPart1:='';end;
     5: begin Edtfac1.SetFocus;FEdtfac1:='';end;
     6: begin Edtstore1.SetFocus;FEdtstore1:='';end;
  end;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_main.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then abort;
end;

procedure TFrm_main.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_main.Button2Click(Sender: TObject);
begin
  MyDataClass.Free;
  close;
end;

procedure TFrm_main.Rd1Click(Sender: TObject);
begin
  Label4.Visible:=Rd1.Checked;
  EdtFac.Visible:=Rd1.Checked;
  LBfac.Visible:=Rd1.Checked;

  Label5.Visible:=Rd1.Checked;
  EdtStore.Visible:=Rd1.Checked;
  LBStore.Visible:=Rd1.Checked;
  Grid1.Visible:=not Rd1.Checked;
//  edit12.Enabled:=Rd1.Checked;
  CDS.Close;
  Edit6.Text:='0';
end;

procedure TFrm_main.SelValidate(Sender: TField);
begin
  if Sender.AsBoolean then
    Edit6.Text:=inttostr(strtoint(Edit6.Text)+cds.fieldbyname('QTY_AVAIL').AsInteger)
  else
    Edit6.Text:=inttostr(strtoint(Edit6.Text)-cds.fieldbyname('QTY_AVAIL').AsInteger);
  edit12.Text:=Edit6.Text;
end;

procedure TFrm_main.Button1Click(Sender: TObject);
var Dt:TDatetime;
//    irkey416:integer;
    function AppData(rkey06,fac,store,rkey53,Qty:integer;Dt0:TDatetime; cost_pcs: Double):integer;
//    var iDrkey53:integer;
    begin
      result:=0;
//      DM.tmp.Close;
//      DM.tmp.SQL.Text:='select * from data0053 where rkey=null';
//      DM.tmp.Open;
//      DM.tmp.Append;
//      DM.tmp.FieldByName('WHSE_PTR').Value:=fac;
//      DM.tmp.FieldByName('loc_PTR').Value:=store;
//      if rkey06>0 then
//        DM.tmp.FieldByName('WORK_ORDER_PTR').Value:=rkey06; //原作业单
//      DM.tmp.FieldByName('CUST_PART_PTR').Value:=EdtPart1.Tag;
//      DM.tmp.FieldByName('RMA_PTR').Value:=7;
//      DM.tmp.FieldByName('QUANTITY').Value:=Qty;
//      DM.tmp.FieldByName('qty_on_hand').Value:=Qty;
//      DM.tmp.FieldByName('MFG_DATE').Value:=Dt0;
//      DM.tmp.FieldByName('REFERENCE_NUMBER').Value:=edit14.Text;
//      DM.tmp.FieldByName('npad_ptr').Value:=irkey416;
//      dm.tmp.FieldByName('cost_pcs').Value := cost_pcs;
//      DM.tmp.Post;
//      iDrkey53:=DM.tmp.FieldByName('rkey').AsInteger;

      DM.tmp.Close;  
//      if Rd1.Checked then
//      begin
//        DM.tmp.SQL.Text:='update data0053 set QTY_ON_HAND=QTY_ON_HAND-'+inttostr(Qty)+
//                         ' where rkey='+inttostr(rkey53)+' and QTY_ON_HAND='+Edit6.Text;
//      end
//      else
//      begin
//        DM.tmp.SQL.Text:='update data0053 set QTY_ON_HAND=QTY_ON_HAND-'+inttostr(Qty)+
//                         ' where rkey='+inttostr(rkey53)+' and QTY_ON_HAND='+inttostr(Qty);
//      end;
      DM.tmp.SQL.Text:='update data0053 set WHSE_PTR='+inttostr(fac)+',loc_PTR='+inttostr(store)+',CUST_PART_PTR='+inttostr(EdtPart1.Tag)
                      +' where rkey='+inttostr(rkey53);
      if DM.tmp.ExecSQL<>1 then
      begin
        DM.ADOCon.RollbackTrans;
        result:=1;
        showmessage('转换操作不成功:多人同时操作或待转换仓库数量不足...');
        exit;
      end;
      DM.tmp.SQL.Text:='update data0025 set qty_on_hand=qty_on_hand-'+inttostr(Qty)+
                       ' where rkey='+inttostr(EdtPart.Tag)+' and qty_on_hand>='+inttostr(Qty);
      if DM.tmp.ExecSQL<>1 then
      begin
        DM.ADOCon.RollbackTrans;
        result:=2;
        showmessage('转换操作不成功:待转换总库存不足...');
        exit;
      end;
      DM.tmp.SQL.Text:='update data0025 set qty_on_hand=qty_on_hand+'+inttostr(Qty)+
                       ' where rkey='+inttostr(EdtPart1.Tag);
      if DM.tmp.ExecSQL<>1 then
      begin
        DM.ADOCon.RollbackTrans;
        result:=3;
        showmessage('转换操作不成功...');
        exit;
      end;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='select * from data0113 where rkey=null';
      DM.tmp.Open;
      DM.tmp.Append;
      DM.tmp.FieldByName('tran_type').Value:=2; //制成品转换
      DM.tmp.FieldByName('srce_ptr').Value:=rkey53;  //Srkey53
//      DM.tmp.FieldByName('dest_ptr').Value:=iDrkey53;
      DM.tmp.FieldByName('dest_ptr').Value:=rkey53;
      
      DM.tmp.FieldByName('CSI_USER_PTR').Value:=rkey73;
      DM.tmp.FieldByName('EMPL_PTR').Value:=empl_ptr;
      DM.tmp.FieldByName('TDATE').Value:=Dt;
      DM.tmp.FieldByName('quantity').Value:=Qty;
      DM.tmp.FieldByName('FromMANU_PART_NUMBER').Value:=EdtPart.Text;
      DM.tmp.FieldByName('ToMANU_PART_NUMBER').Value:=EdtPart1.Text;
      if Rd1.Checked then
        DM.tmp.FieldByName('REFERENCE_NUMBER').Value:='工厂:'+EdtFac.Text+'->'+EdtFac1.Text+';仓库:'+EdtStore.Text+'->'+EdtStore1.Text
      else
        DM.tmp.FieldByName('REFERENCE_NUMBER').Value:='工厂:'+CDS.Fieldbyname('warehouse_code').AsString+'->'+EdtFac1.Text
                                                     +';仓库:'+CDS.Fieldbyname('CODE').AsString+'->'+EdtStore1.Text;
      DM.tmp.Post;
    end;
begin
  if IS_FG_counting then
  begin
    showmessage('成品仓处于盘点状态，不能操作！');
    exit;
  end;
  if  strtoint('0'+edit6.Text)=0 then
  begin
    showmessage('转出数量不能为0...');
    exit;
  end;
  if  strtoint('0'+edit12.Text)=0 then
  begin
    showmessage('转入数量不能为0...');
    exit;
  end;
  if strtoint(edit12.Text)>strtoint(edit6.Text) then
  begin
    showmessage('转移数量输入错误，转移数量大于可用数量，请重新检查！');
    Edit12.SetFocus;
    exit;
  end;
  if FinValid then exit;
  if Rd1.Checked and (EdtPart.Tag=EdtPart1.Tag) and (EdtFac.Tag=EdtFac1.Tag) and (EdtStore.Tag=EdtStore1.Tag) then
  begin
    showmessage('转出与转入数据相同，请重新检查！');
    EdtPart1.SetFocus;
    exit;
  end;



  if EdtCust.Text='' then
  begin
    showmessage('转出客户不能为空...');
    exit;
  end;
  if EdtPart.Text='' then
  begin
    showmessage('转出本厂编号不能为空...');
    exit;
  end;

  if EdtCust1.Text='' then
  begin
    showmessage('转入客户不能为空...');
    exit;
  end;
  if EdtPart1.Text='' then
  begin
    showmessage('转入本厂编号不能为空...');
    exit;
  end;
  if EdtFac1.Text='' then
  begin
    showmessage('转入工厂不能为空...');
    exit;
  end;
    if EdtStore1.Text='' then
  begin
    showmessage('转入仓库不能为空...');
    exit;
  end;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select getdate(),employee_ptr from data0073 where rkey='+rkey73;
  DM.tmp.Open;
  Dt:=DM.tmp.Fields[0].AsDateTime;
  empl_ptr:=DM.tmp.Fields[1].AsInteger;
  DM.ADOCon.BeginTrans;
  try
//    if not DM.GetNo(MaskEdit1,'5',1) then
//      if DM.ADOCon.InTransaction then
//      begin
//        DM.ADOCon.RollbackTrans;
//        MaskEdit1.SetFocus;
//        exit;
//      end;
//    DM.tmp.Close;
//    DM.tmp.SQL.Text:='select * from data0416 where rkey=null';
//    DM.tmp.Open;
//    DM.tmp.Append;
//    DM.tmp.FieldByName('number').Value:=trim(MaskEdit1.Text);
//    DM.tmp.FieldByName('type').Value:=5;        //转换入库类型
//    DM.tmp.FieldByName('empl_ptr').Value:=empl_ptr;
//    DM.tmp.FieldByName('sys_date').Value:=Dt;
//    DM.tmp.FieldByName('quantity').Value:=strtoint(edit12.Text);
//    DM.tmp.FieldByName('reference').Value:=trim(edit14.Text);
//    DM.tmp.Post;
//    irkey416:=DM.tmp.FieldByName('rkey').AsInteger;

    if RD1.Checked then
    begin
      if AppData(Frkey06,Edtfac1.Tag,EdtStore1.Tag,Frkey53,strtoint(edit12.Text),FMFG_Date53, F53cost_pcs)<>0 then abort;
    end else  begin
      CDS.First;
      while not CDS.Eof do
      begin
        if CDS.Fieldbyname('Sel').AsBoolean then
          if (AppData(CDS.Fieldbyname('rkey06').AsInteger,Edtfac1.Tag,EdtStore1.Tag,CDS.Fieldbyname('rkey53').AsInteger,CDS.Fieldbyname('QTY_AVAIL').AsInteger,CDS.Fieldbyname('MFG_date').AsDateTime,cds.fieldbyname('cost_pcs').AsFloat)<>0) then abort;
        CDS.Next;
      end;
    end;

    DM.ADOCon.CommitTrans;
    showmessage('转换操作成功...');
    GroupBox1.Enabled:=false;
    GroupBox2.Enabled:=false;
    Button1.Enabled:=false;
    Button3.Enabled:=true;
  except
    DM.ADOCon.RollbackTrans;
    showmessage('转换操作不成功');
  end;

end;

procedure TFrm_main.EdtCustEnter(Sender: TObject);
begin
  FEdtCust:=EdtCust.Text;
end;

procedure TFrm_main.EdtPartEnter(Sender: TObject);
begin
  FEdtPart:=EdtPart.text;
end;

procedure TFrm_main.EdtCust1Enter(Sender: TObject);
begin
  FEdtCust1:=EdtCust1.Text;
end;

procedure TFrm_main.EdtPart1Enter(Sender: TObject);
begin
  FEdtPart1:=EdtPart1.Text;
end;

procedure TFrm_main.EdtFac1Enter(Sender: TObject);
begin
  FEdtFac1:=EdtFac1.Text;
end;

procedure TFrm_main.EdtStore1Enter(Sender: TObject);
begin
  FEdtStore1:=EdtStore1.Text;
end;

procedure TFrm_main.EdtCustExit(Sender: TObject);
begin
  if (FEdtCust<>EdtCust.Text) and (EdtCust.Text<>'') and (self.ActiveControl<>BitBtn1) then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT RKEY, CUST_CODE, CUSTOMER_NAME from data0010 where CUST_CODE='''+EdtCust.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('客户代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtCust.SetFocus;
      FEdtCust:='';
      EdtPart.Text:='';
      FinValid:=true;
      abort;
    end else begin
      EdtCust.Text:=trim(DM.tmp.FieldValues['cust_CODE']);
      LBCust.Caption:=trim(DM.tmp.FieldValues['CUSTOMER_NAME']);
      EdtCust.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;

      EdtPart.Text:='';
      EdtCustPart.Text:='';
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_main.EdtPartExit(Sender: TObject);
var s,srkey10:string;
begin
  if (FEdtPart<>EdtPart.Text) and (EdtPart.Text<>'') and (self.ActiveControl<>BitBtn2) then
  begin
    if EdtCust.Text<>'' then  s:=' and CUSTOMER_PTR='+inttostr(EdtCust.Tag) ;
    DM.tmp.Close;
    DM.tmp.SQL.Text :='select rkey,manu_part_number,manu_part_desc, customer_ptr from  data0025 '+
                      'where manu_part_number='''+EdtPart.Text+''' and data0025.PARENT_PTR is null and QTY_ON_HAND>0 '+s;

    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('本厂编号不正确或无库存,请重新输入或选择',mtinformation,[mbok],0);
      EdtPart.SetFocus;
      FEdtPart:='';
      FinValid:=true;
      exit;
    end else begin
      EdtPart.Text:=trim(DM.tmp.FieldValues['manu_part_number']);
      EdtPart.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      EdtCustPart.Text:=trim(DM.tmp.FieldValues['manu_part_desc']);
      FinValid:=false;

     edit6.Text:='0';
     if EdtCust.text='' then
     begin
       srkey10:=DM.tmp.Fieldbyname('customer_ptr').asstring;
       DM.tmp.Close;
       DM.tmp.SQL.Text:='SELECT RKEY, CUST_CODE, CUSTOMER_NAME from data0010 where rkey='+srkey10;
       DM.tmp.Open;
       EdtCust.Text:=DM.tmp.Fields[1].AsString;
       LBCust.Caption:=DM.tmp.Fields[2].AsString;
       EdtCust.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
     end;
    end;
  end;
end;

procedure TFrm_main.EdtCust1Exit(Sender: TObject);
begin
  if (FEdtCust1<>EdtCust1.Text) and (EdtCust1.Text<>'') and (self.ActiveControl<>BitBtn4) then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT RKEY, CUST_CODE, CUSTOMER_NAME from data0010 where CUST_CODE='''+EdtCust1.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('客户代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtCust1.SetFocus;
      FEdtCust1:='';
      EdtPart1.Text:='';
      FinValid:=true;
      abort;
    end else begin
      EdtCust1.Text:=trim(DM.tmp.FieldValues['cust_CODE']);
      LBCust1.Caption:=trim(DM.tmp.FieldValues['CUSTOMER_NAME']);
      EdtCust1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;

      EdtPart1.Text:='';
      EdtCustPart1.Text:='';
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_main.EdtPart1Exit(Sender: TObject);
var s,srkey10:string;
begin
  if (FEdtPart1<>EdtPart1.Text) and (EdtPart1.Text<>'') and (self.ActiveControl<>BitBtn5) then
  begin
    if EdtCust1.Text<>'' then  s:=' and CUSTOMER_PTR='+inttostr(EdtCust1.Tag) ;
    DM.tmp.Close;
    DM.tmp.SQL.Text :='select rkey,manu_part_number,manu_part_desc, customer_ptr from  data0025 '+
                      'where manu_part_number='''+EdtPart1.Text+''' and data0025.PARENT_PTR is null'+s;

    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('本厂编号不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtPart1.SetFocus;
      FEdtPart1:='';
      FinValid:=true;
      abort;
    end else begin
      EdtPart1.Text:=trim(DM.tmp.FieldValues['manu_part_number']);
      EdtPart1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      EdtCustPart1.Text:=trim(DM.tmp.FieldValues['manu_part_desc']);
      FinValid:=false;

     if EdtCust1.text='' then
     begin
       srkey10:=DM.tmp.Fieldbyname('customer_ptr').asstring;
       DM.tmp.Close;
       DM.tmp.SQL.Text:='SELECT RKEY, CUST_CODE, CUSTOMER_NAME from data0010 where rkey='+srkey10;
       DM.tmp.Open;
       EdtCust1.Text:=DM.tmp.Fields[1].AsString;
       LBCust1.Caption:=DM.tmp.Fields[2].AsString;
       EdtCust1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
     end;
    end;
  end;

end;

procedure TFrm_main.EdtFac1Exit(Sender: TObject);
begin
  if (FEdtFac1<>EdtFac1.Text) and (EdtFac1.Text<>'') and (self.ActiveControl<>BitBtn6) then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT RKEY, WAREHOUSE_CODE , WAREHOUSE_NAME,abbr_NAME FROM Data0015 where WAREHOUSE_CODE='''+EdtFac1.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('工厂代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtFac1.SetFocus;
      FEdtFac1:='';
      FinValid:=true;
      abort;
    end else begin
      Edtfac1.Text:=trim(DM.tmp.FieldValues['WAREHOUSE_CODE']);
      Edtfac1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      LBfac1.Caption:=trim(DM.tmp.FieldValues['abbr_NAME']);
      FinValid:=false;
      Edtstore1.Text:='';
      LBstore1.Caption:='';
    end;
  end;
end;

procedure TFrm_main.EdtStore1Exit(Sender: TObject);
var s:string;
begin
  if (FEdtStore1<>EdtStore1.Text) and (EdtStore1.Text<>'') and (self.ActiveControl<>BitBtn7) then
  begin
    if EdtFac1.Text<>'' then
      s:=' and data0015.rkey='+inttostr(EdtFac1.tag);

    DM.tmp.Close;
    DM.tmp.SQL.Text :='SELECT data0016.RKEY,data0016.CODE,data0016.LOCATION,data0015.RKEY rkey15, data0015.WAREHOUSE_CODE , data0015.WAREHOUSE_NAME '+
                      'FROM Data0016 inner join data0015 on whouse_ptr=data0015.rkey '+s+
                      ' where data0016.location_type=1 and data0016.CODE='''+EdtStore1.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('仓库代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtStore1.SetFocus;
      FEdtStore1:='';
      FinValid:=true;
      abort;
    end else begin
      Edtstore1.Text:=trim(DM.tmp.FieldValues['CODE']);
      Edtstore1.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      LBstore1.Caption:=trim(DM.tmp.FieldValues['LOCATION']);
      if EdtFac1.Text='' then
      begin
        Edtfac1.Text:=trim(DM.tmp.FieldValues['WAREHOUSE_CODE']);
        Edtfac1.tag:=DM.tmp.Fieldbyname('rkey15').AsInteger;
        LBfac1.Caption:=trim(DM.tmp.FieldValues['WAREHOUSE_Name']);
      end;
      DM.GetNo(MaskEdit1,'5',0);
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_main.Button3Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to self.ComponentCount-1 do
    if self.Components[i] is TEdit then TEdit(self.Components[i]).Text:='';
  MaskEdit1.Text:='';
  LBCust.Caption:='';
  LBfac.Caption:='';
  LBStore.Caption:='';
  LBCust1.Caption:='';
  LBfac1.Caption:='';
  LBStore1.Caption:='';
  cds.Close;
  Button1.Enabled:=true;
  Button3.Enabled:=false;
  GroupBox1.Enabled:=true;
  GroupBox2.Enabled:=true;
end;

procedure TFrm_main.Edit6Change(Sender: TObject);
begin
  Edit12.Text:= Edit6.Text;
end;

end.

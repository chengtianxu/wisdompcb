unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    DBGridEh1: TDBGridEh;
    CheckBox1: TCheckBox;
    PopupMenu2: TPopupMenu;
    N8: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N1: TMenuItem;
    BitBtn5: TBitBtn;
    PopupMenu3: TPopupMenu;
    MRB1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MRB2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    nMI1: TMenuItem;
    lbl2: TLabel;
    lbl1: TLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure MRB2Click(Sender: TObject);
    procedure MRB1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure nMI1Click(Sender: TObject);
  private
    { Private declarations }
    sotp:integer;
    PreColumn: TColumnEh;
    sql_text:string;
    procedure item_click(sender:TObject);
    procedure show_bomview(rkey25,OPT_LOT_SIZE,rkey15: integer;EST_SCRAP:double;ttype:byte);
    function all_touchang(rkey25,ONHOLD_PLAN_flag:Integer):boolean;
    function GetUnDoCount: string;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, condition, deptinfo,
Pick_Item_Single ,ConstVar, mrb_remark, mrb_reworked, bomview, cancelcutno,
MIStepFrm;

{$R *.dfm}

procedure tform1.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.show_bomview(rkey25,OPT_LOT_SIZE,rkey15: integer;EST_SCRAP:double;ttype:byte);
var
  i:Integer;
begin
 try
 application.CreateForm(TForm_bomview,Form_bomview);

 Form_bomview.rkey25 := rkey25;
 Form_bomview.rkey0015 := rkey15;
 Form_bomview.edit1.Text:=inttostr(OPT_LOT_SIZE);   //最佳流转批量
 Form_bomview.edit2.Text:=floattostr(EST_SCRAP);    //报废率
 Form_bomview.ComboBox1.ItemIndex:=ttype;
 if ttype = 0 then
 begin                   //Integer(cbbWorkHour.Items.Objects[cbbWorkHour.ItemIndex]))
  { for i:=0 to Form_bomview.cbb1.Items.Count -1 do
    if DM.ADS60PRIORITY_name.asstring = Form_bomview.cbb1.items[i] then
       Form_bomview.cbb1.ItemIndex:= i;    }
     Form_bomview.cbb1.ItemIndex:=
     form_bomview.cbb1.Items.IndexOf(DM.ADS60PRIORITY_name.asstring);
 end;

 if ttype=3 then              //mrbR返修
  begin
   Form_bomview.rkey414:=Form_MRBREWORKED.ads414rkey.Value;
   Form_bomview.Edit13.Text:=Form_MRBREWORKED.ads414qty_rece.AsString;  //检查数量
   Form_bomview.Edit7.Text:=Form_bomview.Edit13.Text;
   Form_bomview.CUSTOMER_PTR:=Form_MRBREWORKED.ads414CUSTOMER_PTR.Value;
   Form_bomview.sales_order:= Form_MRBREWORKED.ads414SALES_ORDER.Value;
  end
 else
  if ttype=2 then        //mrb重投
   begin
    Form_bomview.rkey414:=Form_MRBREMARK.ads414rkey.Value;
    Form_bomview.Edit13.Text:=Form_MRBREMARK.ads414qty_to_be_remaked.AsString;
    Form_bomview.Edit7.Text:=Form_bomview.Edit13.Text;
    Form_bomview.TreeView1.PopupMenu:= Form_bomview.PopupMenu1;
    Form_bomview.Lal_sostatus.Caption:=Form_MRBREMARK.ads414MI_status.Value;     //允许投产
    Form_bomview.CUSTOMER_PTR:=Form_MRBREMARK.ads414CUSTOMER_PTR.Value;
   end
  else
   if ttype=1 then        //补料
    begin
     Form_bomview.sales_order:=
      frmPick_Item_Single.adsPick.Fieldbyname('sales_order').AsString;
     Form_bomview.CUSTOMER_PTR:=
       frmPick_Item_Single.adsPick.Fieldbyname('CUSTOMER_PTR').AsInteger;
    end
   else
    if ttype=4 then        //按板号
     begin
      Form_bomview.CUSTOMER_PTR:=
       frmPick_Item_Single.adsPick.Fieldbyname('CUSTOMER_PTR').AsInteger;
     end;
   if Form_bomview.ShowModal=mrok then
    begin
     showmsg('投产操作成功!',1);
     dm.AQY492.Close;
     dm.AQY468.Close;
     dm.AQY06.Close;
     bitbtn3.OnClick(nil);
    end;
 finally
  Form_bomview.Free;
 end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS60.CommandText);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
  rkey:=0;
 if not DM.ADS60.IsEmpty then
     rkey:=dm.ads60rkey.Value;
 dm.ADS60.Close;
 dm.ADS60.Open;
 lbl2.Caption:= GetUnDoCount;
 if rkey>0 then dm.ADS60.Locate('rkey',rkey,[]);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
if dm.ADOConnection1.Connected then
 begin
 sotp:=0;
 dm.ADS60.Close;
 dm.ADS60.Parameters.ParamByName('dtpk1').Value:=getsystem_date(dm.ADOQuery1,1);
 dm.ADS60.Parameters.ParamByName('dtpk2').Value:=getsystem_date(dm.ADOQuery1,1)+1;
 dm.ADS60.Prepared;
 dm.ADS60.Open;

 lbl2.Caption:= GetUnDoCount;
 sql_text := dm.ADS60.CommandText;

 PreColumn := DBGridEH1.Columns[1];
 label1.Caption:=precolumn.Title.Caption;
 for i:=1 to DBGrideh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := dbgrideh1.Columns[i-1].Title.Caption ;
    if dbgrideh1.Columns[i-1].Visible then
      item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu1.Items.Add(item) ;
  end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
    'SELECT PPC_BY_CustP  '+#13+   //允许按本厂编号投产
    'FROM dbo.Data0192';
   open;
   if fieldbyname('PPC_BY_CustP').AsString='Y' then
    n4.Enabled:=true
   else
    n4.Enabled:=false;
  end;

 end; 
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS60.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS60.IndexFieldNames:=Column.FieldName+' DESC';
  end;

if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 with  form_condition do
 begin

  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         dm.ADS60.Parameters.ParamValues['dtpk1']));

  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                         dm.ADS60.Parameters.ParamValues['dtpk2']-1));

  radiogroup1.ItemIndex:= dm.ADS60.Parameters.ParamValues['sotp'];

 if ShowModal=mrok then
  begin
   with dm.ADS60 do
    begin
     close;
     CommandText:=self.sql_text;
     for i:=1 to form_condition.SGrid1.RowCount-2 do
      dm.ADS60.CommandText:=dm.ADS60.CommandText+form_condition.SGrid1.Cells[2,i]+#13;
     Parameters.ParamValues['dtpk1']:=strtodate(
        formatdatetime('yyyy-mm-dd ',dtpk1.Date));
     Parameters.ParamValues['dtpk2']:=strtodate(
        formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
     dm.ADS60.Parameters.ParamValues['sotp'] := radiogroup1.ItemIndex;
     dm.ADS60.Prepared;
     open;
     lbl2.Caption:= GetUnDoCount;
     self.sotp := radiogroup1.ItemIndex;
    end;
  end;
 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if (trim(edit1.Text)<> '') and (checkbox1.Checked) then
 dm.ADS60.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''+
                       'and onhold_planning_flag = 0'
else
 if (trim(edit1.Text)<> '') and (not checkbox1.Checked) then
  dm.ADS60.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
 else
  if (trim(edit1.Text) = '') and (checkbox1.Checked) then
 dm.ADS60.Filter:='onhold_planning_flag = 0'
  else
   dm.ADS60.Filter:='';
   
  lbl2.Caption:= GetUnDoCount;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
 try
 application.CreateForm(TForm_deptinfo,Form_deptinfo);
 Form_deptinfo.ShowModal;
 finally
  Form_deptinfo.Free;
 end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限不能做投产操作',1)
else

  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
    'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
    InputVar.Sqlstr :=
'SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
      'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
      'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
      'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
      'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
      'dbo.Data0025.set_qty,data0025.OPT_LOT_SIZE,data0025.EST_SCRAP,'+#13+
      'data0025.prod_route_ptr,data0025.CUSTOMER_PTR' +#13+
'FROM dbo.Data0025 INNER JOIN'+#13+
      'dbo.Data0008 ON'+#13+
      'dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'+#13+
      'dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
  'where (Data0025.PARENT_PTR is null) and (Data0025.ONHOLD_PLANNING_FLAG=0)'+#13+
'order by dbo.Data0025.MANU_PART_NUMBER';

//    inputvar.InPut_value:=;
//    inputvar.KeyField:='MANU_PART_NUMBER';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      show_bomview(frmPick_Item_Single.adsPick.FieldValues['rkey25'],
                   frmPick_Item_Single.adsPick.FieldValues['OPT_LOT_SIZE'],
                   frmPick_Item_Single.adsPick.Fieldbyname('prod_route_ptr').AsInteger,
                   frmPick_Item_Single.adsPick.Fieldbyname('EST_SCRAP').AsFloat,
                   4);
     end;
  finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
  end;
end;

procedure TForm1.MRB2Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限不能做投产操作',1)
else

 try
 application.CreateForm(TForm_MRBREMARK,Form_MRBREMARK);
 if Form_MRBREMARK.ShowModal=mrok then
  begin
    show_bomview(Form_MRBREMARK.ads414custpart_ptr.Value,
                 Form_MRBREMARK.ads414OPT_LOT_SIZE.Value,
                 0,
                 Form_MRBREMARK.ads414EST_SCRAP.Value,
                 2);
  end;
 finally
  Form_MRBREMARK.Free;
 end;
end;

procedure TForm1.MRB1Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限不能做投产操作',1)
else

 try
 application.CreateForm(TForm_MRBREWORKED,Form_MRBREWORKED);
 if Form_MRBREWORKED.ShowModal=mrok then
  begin
   show_bomview(Form_MRBREWORKED.ads414custpart_ptr.Value,
                Form_MRBREWORKED.ads414OPT_LOT_SIZE.Value,
                0,
                Form_MRBREWORKED.ads414EST_SCRAP.Value,
                3);
  end;
 finally
  Form_MRBREWORKED.Free;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限不能做投产操作',1)
else

try
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'SALES_ORDER/销售订单/83,MANU_PART_NUMBER/本厂编号/81,'+
  'MANU_PART_DESC/客户型号/110,'+
  'CUST_CODE/客户代码/53,PO_NUMBER/客户订单/81,SCH_DATE/回复交期/69,'+
  'PARTS_ORDERED/订单数量/60,ISSUED_QTY/投产数量/60,notenough/欠货数量/60';

  InputVar.Sqlstr :=
'SELECT Data0060.RKEY, Data0060.CUST_PART_PTR,data0060.CUSTOMER_PTR,'+#13+
' dbo.Data0060.SALES_ORDER, dbo.Data0010.CUST_CODE, dbo.Data0097.PO_NUMBER,'+#13+
'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
'dbo.Data0060.ENT_DATE, dbo.Data0060.SCH_DATE,'+#13+
'dbo.Data0060.PARTS_ORDERED, dbo.Data0060.ISSUED_QTY,'+#13+
'dbo.Data0060.PARTS_ORDERED - dbo.Data0060.PARTS_SHIPPED +'+#13+
'dbo.Data0060.PARTS_RETURNED - dbo.Data0060.RETURNED_SHIP AS notenough,'+#13+
'data0025.OPT_LOT_SIZE,data0025.EST_SCRAP,data0060.SHIP_REG_TAX_ID'+#13+
'FROM         dbo.Data0060 INNER JOIN'+#13+
'dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN'+#13+
'dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
'dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'+#13+
'WHERE (Data0025.ONHOLD_PLANNING_FLAG = 0) AND'+#13+
'(Data0060.STATUS = 1) AND (Data0060.PROD_REL <> ''1'') and'+#13+
'(data0060.so_tp='+inttostr(self.sotp)+')'+#13+
 'order by SALES_ORDER';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
     begin
       //产品信息界面
      show_bomview(frmPick_Item_Single.adsPick.FieldValues['CUST_PART_PTR'],
                   frmPick_Item_Single.adsPick.FieldValues['OPT_LOT_SIZE'],
                   frmPick_Item_Single.adsPick.Fieldbyname('SHIP_REG_TAX_ID').AsInteger,
                   frmPick_Item_Single.adsPick.Fieldbyname('EST_SCRAP').AsFloat,
                   1);
     end;
  finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
  end;
end;

function TForm1.all_touchang(rkey25,ONHOLD_PLAN_flag: Integer): boolean;
var
  plan_falg:Integer;
begin
 plan_falg:=1;
 Result:=False;
 if ONHOLD_PLAN_flag=0 then Result:=True
 else
  begin
    with dm.aqTmp do
    begin
      close;
      sql.Text:='select top 1 ONHOLD_PLANNING_FLAG from data0025 where PARENT_PTR='+
                IntToStr(rkey25);
      open;
      if not IsEmpty then
      plan_falg:=fieldbyname('ONHOLD_PLANNING_FLAG').AsInteger;
    end;
    if plan_falg=0 then  Result:=True
    else
     begin
      with dm.aqTmp do
      begin
        close;
        sql.Text:='SELECT top 1 dbo.Data0025.ONHOLD_PLANNING_FLAG '+
            'FROM  dbo.Data0025 INNER JOIN '+
            'dbo.Data0025 AS Data0025_1 ON dbo.Data0025.PARENT_PTR = Data0025_1.RKEY '+
             'where Data0025_1.PARENT_PTR='+IntToStr(rkey25);
        open;
        if not IsEmpty then
        plan_falg:=fieldbyname('ONHOLD_PLANNING_FLAG').AsInteger;
      end;
       if plan_falg=0 then  Result:=True
       else
        begin
          with dm.aqTmp do
          begin
            close;
            sql.Text:='SELECT top 1 dbo.Data0025.ONHOLD_PLANNING_FLAG '+
                'FROM  dbo.Data0025 INNER JOIN '+
                'dbo.Data0025 AS Data0025_1 ON dbo.Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN '+
                'dbo.Data0025 AS Data0025_2 ON Data0025_1.PARENT_PTR = Data0025_2.RKEY '+
                 'where Data0025_2.PARENT_PTR='+IntToStr(rkey25);
            open;
            if not IsEmpty then
            Result:=FieldByName('ONHOLD_PLANNING_FLAG').AsInteger=0;
          end;
        end;
     end;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
var
 sql_str,LErr_str:string;
 LQry1,LQry2:TADOQuery;
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限不能做投产操作',1)
else
 begin
   LErr_str:='';
   sql_str:= ' SELECT MANU_PART_NUMBER,ONHOLD_SALES_FLAG FROM DATA0025 WHERE rkey=' + DM.ADS60CUST_PART_PTR.AsString;
   LQry1:= TADOQuery.Create(Self);
   LQry1.Connection:= DM.ADOConnection1;
   LQry2:= TADOQuery.Create(Self);
   LQry2.Connection:= DM.ADOConnection1;
   try
    OpenQuery(LQry1,sql_str);
     if not LQry1.IsEmpty then
     begin
       if LQry1.FieldByName('ONHOLD_SALES_FLAG').AsInteger = 1 then
       begin
         LErr_str:= '本厂编号' + LQry1.FieldByName('MANU_PART_NUMBER').AsString + '已经过期,';
         sql_str:=' ;with cte as  ' + #13+
                  '  (   ' + #13+
                  '  SELECT Data0025.MANU_PART_NUMBER,Data0025.ONHOLD_SALES_FLAG ,Data0273.COPYFROMCUST_PTR,Data0273.CUSTOMER_PART_PTR  ' + #13+
                  '  FROM Data0273 inner join  ' + #13+
                  '      Data0025 ON DATA0025.RKEY = Data0273.CUSTOMER_PART_PTR  ' + #13+
                  '  WHERE DATA0025.RKEY= ' + DM.ADS60CUST_PART_PTR.AsString + #13+
                  '  UNION ALL ' + #13+
                  '  SELECT Data0025.MANU_PART_NUMBER,Data0025.ONHOLD_SALES_FLAG ,Data0273.COPYFROMCUST_PTR,Data0273.CUSTOMER_PART_PTR ' + #13+
                  '  FROM Data0273 inner join  ' + #13+
                  '      Data0025 ON DATA0025.RKEY = Data0273.CUSTOMER_PART_PTR inner join  ' + #13+
                  '      cte ON data0273.COPYFROMCUST_PTR = cte.CUSTOMER_PART_PTR   ' + #13+
                  '  )  ' + #13+
                  '  select * from cte where ONHOLD_SALES_FLAG=0  ';
         OpenQuery(LQry2,sql_str);
         if not LQry2.IsEmpty then
         begin
           LErr_str:= LErr_str + ' 已被升级成' + LQry2.FieldByName('MANU_PART_NUMBER').AsString + ',';
         end;
       end;
       if LErr_str <> '' then
        if MessageDlg(LErr_str + '是否继续？',mtConfirmation,[mbYes,mbNo],0) <> mryes then  Exit;
       sql_str:='SELECT Data0060.PROD_REL, dbo.Data0025.ONHOLD_PLANNING_FLAG '+
       'FROM dbo.Data0060 INNER JOIN '+
       'dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY '+
       'where data0060.sales_order='+quotedstr(dm.ADS60SALES_ORDER.Value);
       openquery(dm.ADOQuery1,sql_str);
       if (dm.ADOQuery1.FieldByName('PROD_REL').AsString<>
         dm.ADS60PROD_REL.Value) or
         (dm.ADOQuery1.FieldByName('ONHOLD_PLANNING_FLAG').AsInteger<>
         dm.ADS60ONHOLD_PLANNING_FLAG.Value) then
        showmsg('订单确订状态或者MI允许投产发生变化请刷新数据重新投产!',1)
       else
        if (dm.ADS60PROD_REL.Value='2') and
           (all_touchang(dm.ADS60CUST_PART_PTR.Value,dm.ADS60ONHOLD_PLANNING_FLAG.Value)) then
          show_bomview(dm.ADS60CUST_PART_PTR.Value,
                       dm.ADS60OPT_LOT_SIZE.Value,
                       dm.ADS60SHIP_REG_TAX_ID.Value,
                       dm.ADS60EST_SCRAP.Value,0)
        else
         showmsg('订单未通过确认,或者没有产品允许投产!',1);
     end;
   finally
     if DM.aqQnty1.Active then DM.aqQnty1.Active:= False;
     if DM.qry53.Active then DM.qry53.Active:= False;
     LQry1.Free;
     LQry2.Free;
   end;
 end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
if not DBGridEh1.DataSource.DataSet.IsEmpty then
Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
if not App_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;
  self.caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';

//  dm.ADOConnection1.Open;
//  vprev:='4';
//  user_ptr:='3';
//  rkey73 := '2224';
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限不能做投产操作',1)
else

 try
 application.CreateForm(TForm_cancelcutno,Form_cancelcutno);
 Form_cancelcutno.Caption:=(sender as tmenuitem).Caption;
 Form_cancelcutno.cancel_type:=(sender as tmenuitem).Tag;
 if Form_cancelcutno.ShowModal=mrok then
  begin
   showmsg((sender as tmenuitem).Caption+'取消操作成功',1);
   bitbtn3.OnClick(nil);
  end;
 finally
  Form_cancelcutno.ads492.Close;
  Form_cancelcutno.ads06.Close;
  Form_cancelcutno.Free;
 end;
end;

procedure TForm1.N12Click(Sender: TObject);
var
 sql_str:string;
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限不能做投产操作',1)
else
 if (dm.ADS60PROD_REL.Value='2') then
  if messagedlg('订单取消投产是不可逆操作是您确定吗?',
       mtconfirmation,[mbYes,mbNo],0)=mrYes then
  begin
   sql_str:='SELECT Data0060.PROD_REL '+
   'FROM Data0060 '+
   'where data0060.rkey='+dm.ADS60rkey.AsString;
   openquery(dm.ADOQuery1,sql_str);
   if dm.ADOQuery1.FieldByName('PROD_REL').AsInteger<>dm.ADS60PROD_REL.AsInteger then
    showmsg('订单确认状态发生变发无法取消',1)
   else
    begin
     sql_str:='update data0060 '+
              'set PROD_REL=''3'' '+
              'where data0060.rkey='+dm.ADS60rkey.AsString;
     ExecSql(dm.ADOQuery1,sql_str);
     bitbtn3.OnClick(nil);
    end;
  end
  else
 else
  showmsg('订单未通过确认不允许取消',1);

end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin

N8.Enabled:=not dm.ADS60.IsEmpty;
n12.Enabled:=N8.Enabled;
n13.Enabled:=N8.Enabled;
nMI1.Enabled:=N8.Enabled;

end;

procedure TForm1.nMI1Click(Sender: TObject);
begin
  if not Assigned(frmMIStep) then
    Application.CreateForm(TfrmMIStep, frmMIStep);
  frmMIStep.rkey25:= DM.ADS60rkey25.AsString;
  frmMIStep.Show;
  frmMIStep.GetMITree;
end;

function TForm1.GetUnDoCount: string;
var
//  LSql:string;
//  LAdoQry:TADOQuery;
//  LRkey:Integer;
  LList:TStringList;
begin
  Result:= '0';
//  LSql:= 'SELECT DISTINCT count(CUST_PART_PTR) from data0060 '+#13+
//         ' WHERE     (dbo.Data0060.PROD_REL <> ''3'') AND (dbo.Data0060.STATUS = 1) '+#13+
//         ' and (data0060.ent_date >= ' + QuotedStr(ASDate) + ') and (data0060.ent_date <= ' + QuotedStr(AEDate) + ')'+#13+
//         ' and (data0060.so_tp = '+ ASoTP + ')' ;
//  LAdoQry:= TADOQuery.Create(Self);
//  LAdoQry.Connection:= DM.ADOConnection1;
//  try
//    OpenQuery(LAdoQry,LSql);
//    if not LAdoQry.IsEmpty then
//      Result:= IntToStr(LAdoQry.Fields[0].value)
//    else
//      Result:= '0';
//  finally
//    LAdoQry.Free;
//  end;
   LList:= TStringList.Create;
   try
     LList.Sorted := True;
     LList.Duplicates := dupIgnore;
//     LRkey:= DM.ADS60rkey.Value;
     DM.ADS60.DisableControls;
     DM.ADS60.First;
     while not dm.ADS60.Eof do
     begin
       LList.Add(DM.ADS60rkey25.AsString);
       DM.ADS60.Next;
     end;
     Result:= IntToStr(LList.Count);
   finally
     DM.ADS60.EnableControls;
//     DM.ADS60.Locate('rkey',LRkey,[]);
   end;

end;

end.

unit OutWh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus, ComCtrls, ExtCtrls, Mask;

type
  TForm_OutWh = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    LBwh: TLabel;
    Label9: TLabel;
    LBuser: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    MaskEdit1: TMaskEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Edit6: TEdit;
    BitBtn6: TBitBtn;
    Label10: TLabel;
    Edit7: TEdit;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    SGrid2: TStringGrid;
    Label2: TLabel;
    Edit1: TEdit;
    SpeedButton3: TSpeedButton;
    lbsup: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    SpeedButton4: TSpeedButton;
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure update_grid1();
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    warehouse_ptr,empl_ptr,supply_ptr:integer;
     function find_134rkey():boolean;
  public
    { Public declarations }
  end;

var
  Form_OutWh: TForm_OutWh;
  function Power(x, y : extended) : extended;
implementation

uses StockSearch, Warehouse, User,common, demo, Main, Supply,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm_OutWh.BitBtn6Click(Sender: TObject);
begin
if trim(edit3.Text)='' then
 messagedlg('请首先确定发料工厂信息!',mterror,[mbcancel],0)
else
if trim(edit5.Text)=''  then
messagedlg('请首先确定领料人员!',mterror,[mbcancel],0)
else
if trim(edit1.Text)='' then
messagedlg('请首先确定供应商!',mterror,[mbcancel],0)
else
if trim(edit2.Text)='' then
messagedlg('请首先确定货币!',mterror,[mbcancel],0)
else
begin
 if SpeedButton1.Enabled then
 begin
  Form_StockSearch.ADS134.Close;
  Form_StockSearch.ADS134.Parameters[1].Value:=edit2.Tag;
  Form_StockSearch.ADS134.Parameters[0].Value:=self.supply_ptr;
  Form_StockSearch.ADS134.Open
 end;
 Form_stocksearch.Edit1.Text:=edit6.Text;
 Form_stocksearch.parent_flag:=0;
 Form_stocksearch.ShowModal;
 if sgrid1.RowCount>2 then
 begin
  edit3.Enabled:=false;
  SpeedButton1.Enabled:=false;
  edit2.Enabled:=false;
  speedbutton4.Enabled:=false;
  edit1.Enabled:=false;
  speedbutton3.Enabled:=false;
  edit5.Enabled:=false;
  speedbutton2.Enabled:=false;
 end;
end;
end;

procedure TForm_OutWh.SpeedButton1Click(Sender: TObject);
begin
try
form_Warehouse:=tform_Warehouse.Create(application);
form_Warehouse.Edit1.Text:=edit3.Text;
if form_Warehouse.ShowModal=mrok then
 begin
  edit3.Text:=form_Warehouse.ADOQuery1WAREHOUSE_CODE.Value;
  lbwh.Caption:=form_Warehouse.ADOQuery1WAREHOUSE_NAME.Value;
  self.warehouse_ptr:=form_Warehouse.ADOQuery1RKEY.Value;
 end;
finally
form_Warehouse.Free;
end;
end;

procedure TForm_OutWh.SpeedButton2Click(Sender: TObject);
begin
try
 form_user:=Tform_user.Create(application);
 form_user.MaskEdit1.Text:=edit5.Text;
 if form_user.ShowModal=mrok then
  begin
   edit5.Text:=form_user.ADOQuery1EMPL_CODE.Value;
   lbuser.Caption:=form_user.ADOQuery1EMPLOYEE_NAME.Value;
   self.empl_ptr:=form_user.ADOQuery1RKEY.Value;
  end;
finally
 form_user.Free;
end;
end;

procedure TForm_OutWh.BitBtn9Click(Sender: TObject);
begin
if sgrid1.RowCount>2 then
if messagedlg('你确定不保存此次发料就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 close
else
 MaskEdit1.SetFocus
else
 close;
end;
function TForm_OutWh.find_134rkey():boolean; //获取库存明细主键
var
 i :integer;
begin
 result:=false;
 for i:=1 to sgrid2.RowCount-2 do
 begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:='select rkey from data0134'+#13+
             'where rkey ='+sgrid2.Cells[1,i];
   open;
  end;
  if dm.ADOQuery1.IsEmpty then
   begin
    result:=true;
    break;
   end;
 end;
end;
procedure Tform_outwh.update_grid1();
var
 i:integer;
begin
  edit5.Text:='';
  edit7.Text:='';
  lbuser.Caption:='';
  for i:=1 to sgrid2.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
   sgrid1.RowCount:=2;
   sgrid2.RowCount:=2;
   edit3.Enabled:=true;
   form_outwh.SpeedButton1.Enabled:=true;
end;
function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm_OutWh.FormActivate(Sender: TObject);
begin
sgrid1.Cells[0,0]:='物料编码';
sgrid1.Cells[1,0]:='物料名称';
sgrid1.Cells[2,0]:='物料规格';
sgrid1.Cells[3,0]:='环保标识';
sgrid1.Cells[4,0]:='发放单位';
sgrid1.Cells[5,0]:='发放数量';
sgrid1.Cells[6,0]:='价格含税';
sgrid1.Cells[7,0]:='税率';

sgrid2.Cells[0,0]:='17.rkey';
sgrid2.Cells[1,0]:='134.rkey';
Form_stocksearch:=TForm_stocksearch.Create(application);
end;

procedure TForm_OutWh.FormDestroy(Sender: TObject);
begin
Form_stocksearch.Free;
end;

procedure TForm_OutWh.N1Click(Sender: TObject);
var
 i:word;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i]:=sgrid1.Rows[i+1];
   sgrid2.Rows[i]:=sgrid2.Rows[i+1];
  end;
 sgrid1.RowCount:=sgrid1.RowCount-1;
 sgrid2.RowCount:=sgrid2.RowCount-1;
 if sgrid1.RowCount<=2 then
 begin
  edit3.Enabled:=true;
  speedbutton1.Enabled:=true;
 end;
end;

procedure TForm_OutWh.SGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then
 begin
  sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
 end;
end;

procedure TForm_OutWh.Edit3Exit(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,WAREHOUSE_CODE,WAREHOUSE_NAME from data0015'+#13+
           'where WAREHOUSE_CODE='''+trim(edit3.Text)+'''';
  open;
 if IsEmpty then
  begin
   messagedlg('工厂编码输入错误!!',mterror,[mbcancel],0);
   edit3.SetFocus;
  end
 else
  if FieldValues['rkey']<>self.warehouse_ptr then
  begin
   lbwh.Caption:=FieldValues['WAREHOUSE_NAME'];
   self.warehouse_ptr:=FieldValues['rkey'];
  end;
 end;
end;

procedure TForm_OutWh.Edit5Exit(Sender: TObject);
begin
if trim(edit5.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey, EMPL_CODE, EMPLOYEE_NAME from data0005'+#13+
            'where ACTIVE_FLAG=''Y'''+#13+
            'and EMPL_CODE='''+trim(edit5.Text)+'''';
  open;
 if IsEmpty then
  begin
   messagedlg('领料人员编码输入错误!!',mterror,[mbcancel],0);
   edit5.SetFocus;
  end
 else
  if FieldValues['rkey']<>self.empl_ptr then
  begin
   lbuser.Caption:=FieldValues['EMPLOYEE_NAME'];
   self.empl_ptr:=FieldValues['rkey'];
  end;
 end;
end;

procedure TForm_OutWh.BtnSaveClick(Sender: TObject);
var
 i:integer;
begin
 if self.find_134rkey then
  begin
   messagedlg('物料发放不成功库存记录发生变化!请重新选择库存发放',mterror,[mbcancel],0);
   self.update_grid1;
   exit;
  end;
dm.ADOConnection1.BeginTrans;
 try
  dm.ADO148.Close;
  dm.ADO148.Open;
  dm.ADO148.Append;
  dm.ADO148GON_NUMBER.Value:=maskedit1.Text;
  dm.ADO148REF_NUMBER.Value:=edit7.Text;
  dm.ADO148warehouse_ptr.Value:=self.warehouse_ptr;
  dm.ado148TTYPE.Value:=1;
  dm.ado148CREATE_DATE.Value:=form_main.sys_longdate;         //长格式
  dm.ADO148CREATE_BY.Value:=form_main.rkey05;
  dm.ADO148RECD_BY.Value:=self.empl_ptr;
  dm.ADO148supplier_ptr.Value:=self.supply_ptr;
  dm.ADO148status.Value:=0;
  if not dm.GetNo(maskedit1,'data0724',1) then abort;
  dm.ado148.Post;
  dm.ado149.close;
  dm.ado149.Open;
 for i:=1 to sgrid2.RowCount-2 do
  dm.ado149.AppendRecord([strtoint(sgrid2.Cells[0,i]),    //材料17.rkey
                          dm.ado148rkey.Value,            //148.rkey
                          strtoint(sgrid2.Cells[1,i]),    // 134.rkey
                          strtocurr(sgrid1.Cells[5,i]),   //数量
                          0,strtofloat(sgrid1.Cells[6,i]),strtofloat(sgrid1.Cells[7,i])]); //价格含税和税率
 //SELECT INVENTORY_PTR, GON_PTR, D0134_PTR, QUANTITY, RTN_QUANTITY,
 //tax_price,TAX_2
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select data0149.D0134_PTR from data0149'+#13+
             'inner join data0134 on'+#13+
             'data0149.D0134_PTR=data0134.rkey'+#13+
             'where Data0134.QUAN_ON_HAND < Data0149.QUANTITY'+#13+
             'and data0149.gon_ptr='+dm.ado148rkey.AsString;
   open;
  end;
 if not dm.ADOQuery1.IsEmpty then
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg('发料失败,可能多用户同时发放了同一批物料且导致库存出现负数!请重发', mterror,[mbcancel],0);
   self.update_grid1;
  end
 else
  begin

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update data0134'+#13+
   'set Data0134.QUAN_ON_HAND=Data0134.QUAN_ON_HAND-Data0149.QUANTITY'+#13+
           'from data0149 inner join data0134 on'+#13+
             'data0149.D0134_PTR=data0134.rkey'+#13+
             'where data0149.gon_ptr='+dm.ado148rkey.AsString;
    execsql;
   end;         //减去库存134中的库数量
  dm.ADOConnection1.CommitTrans;
  messagedlg('恭喜!发料成功!', mtinformation,[mbok],0);
  self.update_grid1;
  self.Timer1Timer(sender);
  close;
  end;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     edit6.SetFocus;
    end;
  end;
end;


procedure TForm_OutWh.Timer1Timer(Sender: TObject);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='SELECT GETDATE() AS sys_date,'+#13+
   'CONVERT(datetime, CONVERT(varchar, GETDATE(), 101), 101) AS sort_date';
  open;
  form_main.sys_longdate:=fieldvalues['sys_date'];
  form_main.sys_sortdate:=fieldvalues['sort_date'];
 end;
 StatusBar1.Panels[2].Text:='发料日期:'+
 formatdatetime('yyyy-mm-dd HH:mm:ss',form_main.sys_longdate);
end;


procedure TForm_OutWh.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;


procedure TForm_OutWh.FormCreate(Sender: TObject);
begin
dm.GetNo(MaskEdit1,'data0724',0);
dm.tmpt.Close;
dm.tmpt.SQL.Text:='select user_full_name from data0073 where rkey=:rkey73';
dm.tmpt.Parameters[0].Value:=strtoint(rkey73);
dm.tmpt.Open;
statusbar1.Panels[1].Text:=dm.tmpt.FieldValues['user_full_name'];
end;

procedure TForm_OutWh.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow>0) and (ACol in [5,6]) then
  sGrid1.Options:=sGrid1.Options+[goEditing]
  else
  sGrid1.Options:=sGrid1.Options-[goEditing];

end;

procedure TForm_OutWh.SpeedButton3Click(Sender: TObject);
begin
try
form_supply:=tform_supply.Create(application);
form_supply.Edit1.Text:=edit1.Text;
if form_supply.ShowModal=mrok then
 begin
  edit1.Text:=form_supply.ADOQuery1CODE.Value;
  lbsup.Caption:=form_supply.ADOQuery1SUPPLIER_NAME.Value;
  self.supply_ptr:=form_supply.ADOQuery1RKEY.Value;
  with dm.tmpt do
  begin
  close;
  sql.Clear;
  sql.Text:='select data0001.RKEY, data0001.CURR_CODE, data0001.CURR_NAME, data0001.BASE_TO_OTHER from data0001 inner join data0023 on data0023.CURRENCY_PTR=data0001.rkey where data0023.rkey=:rkey';
  dm.tmpt.Parameters[0].Value:=self.supply_ptr;
  open;
  edit2.Text:=trim(dm.tmpt.FieldValues['CURR_CODE']);
  edit2.tag:=dm.tmpt.FieldValues['rkey'];
  end;
 end;
finally
form_supply.Free;
end;
end;

procedure TForm_OutWh.Edit1Exit(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey, CODE, SUPPLIER_NAME from data0023'+#13+
            'where EDI_OUT_NEW_PO=1'+#13+
            'and CODE='''+trim(edit1.Text)+'''';
  open;
 if IsEmpty then
  begin
   messagedlg('VMI供应商编码输入错误!!',mterror,[mbcancel],0);
   edit5.SetFocus;
  end
 else
  if FieldValues['rkey']<>self.supply_ptr then
  begin
   self.supply_ptr:=FieldValues['rkey'];
  end;
 end;
end;

procedure TForm_OutWh.SpeedButton4Click(Sender: TObject);
 var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
try
InputVar.Fields := 'CURR_CODE/货币代码/150,CURR_NAME/货币名称/150,,BASE_TO_OTHER/汇率/100';
InputVar.Sqlstr :='SELECT RKEY, CURR_CODE, CURR_NAME, BASE_TO_OTHER FROM  dbo.Data0001 order by 2';
inputvar.KeyField:='CURR_CODE';
InputVar.AdoConn :=dm.ADOConnection1 ;
frmPick_Item_Single.InitForm_New(InputVar);
if frmPick_Item_Single.ShowModal=mrok then
begin
edit2.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_CODE']);
edit2.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
end;
finally
frmPick_Item_Single.Free ;
end;
end;

end.

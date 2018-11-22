unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls,DateUtils;

type
  TFrmQry = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl_field: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl_rkey15: TLabel;
    cbb1: TComboBox;
    dtpt1: TDateTimePicker;
    dtp1: TDateTimePicker;
    edt_value: TEdit;
    btn_add: TButton;
    btn_sel: TBitBtn;
    lst1: TListBox;
    txt1: TStaticText;
    dtp2: TDateTimePicker;
    dtpt2: TDateTimePicker;
    txt2: TStaticText;
    SGrid1: TStringGrid;
    btn_OK: TButton;
    btn_cancel: TButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    procedure btn_addClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btn_selClick(Sender: TObject);
    procedure lst1Click(Sender: TObject);
  private
    { Private declarations }
     procedure update_sgrid(sgrid_row:byte);
  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation
            uses ConstVar,common, Pick_Item_Single, UDM;
{$R *.dfm}

procedure TFrmQry.btn_addClick(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=lst1.Items[lst1.itemindex]  then
   begin
    update_sgrid(i);
    exit;
   end;

 update_sgrid(sgrid1.RowCount-1);

 sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TfrmQry.update_sgrid(sgrid_row: byte);
var
  s:string;
  PStatus:integer;
begin
 sgrid1.Cells[0,sgrid_row]:=lst1.Items[lst1.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
 case lst1.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and data0010.cust_code = '''''+edt_value.Text+'''''';
 1:
 begin
  sgrid1.Cells[2,sgrid_row]:='and data0034.dept_code = '''''+edt_value.Text+''''' ';
 // s:='and data0034.dept_code = '''''+edt_value.Text+''''' ';
  //showmessage(s);
  end;
 2:
  sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_NUMBER LIKE ''''%'+edt_value.Text+'%''''';
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0025.MANU_PART_DESC LIKE ''''%'+edt_value.Text+'%''''';
 4:
  sgrid1.Cells[2,sgrid_row]:='and DATEDIFF(day,Data0056.INTIME, GETDATE()) > '+trim(edt_value.Text);
 5:
  sgrid1.Cells[2,sgrid_row]:='and DATEDIFF(hh,data0056.intime,getdate()) > '+trim(edt_value.Text);
 6:
  sgrid1.Cells[2,sgrid_row]:='and data0006.work_order_number LIKE ''''%'+edt_value.Text+'%''''';
 7:
  sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO LIKE ''''%'+edt_value.Text+'%''''';
 8:
  sgrid1.Cells[2,sgrid_row]:='and data0060.SALES_ORDER LIKE ''''%'+edt_value.Text+'%''''';
 9:
 begin
  sgrid1.Cells[1,sgrid_row]:=cbb1.Text;
  case cbb1.ItemIndex of 
    0:   PStatus:=3;
    1:   PStatus:=4;
    2:   PStatus:=5;
    3:   PStatus:=6;
    4:   PStatus:=103;
  end;
  sgrid1.Cells[2,sgrid_row]:='and dbo.Data0006.Prod_Status = '+inttostr(PStatus)+' ';
 end;
10:
 begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtp1.date)+'到'+datetostr(dtp2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and Data0006.RELEASE_DATE >= '''''+formatdatetime('yyyy-mm-dd',dtp1.date)+
   formatdatetime(' hh:nn:ss',dtpt1.Time)+
   ''''' and Data0006.RELEASE_DATE <= '''''+formatdatetime('yyyy-mm-dd',dtp2.date)+
   formatdatetime(' hh:nn:ss',dtpt2.Time)+'''''';
 end;
11:
 sgrid1.Cells[2,sgrid_row]:='and data0492.WHOUSE_PTR = '+lbl_rkey15.Caption;
12:
sgrid1.Cells[2,sgrid_row]:='and dbo.Data0060.SALES_ORDER LIKE ''''%'+edt_value.Text+'%''''';
 end;
end;

procedure TFrmQry.FormShow(Sender: TObject);
begin
 sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  lst1.Selected[0]:=true;
  self.lst1.OnClick(sender);
   dtp1.Date:=dtp2.Date-15;
  dtp2.Date:=Now();

end;

procedure TFrmQry.N1Click(Sender: TObject);
var
 i:integer;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQry.btn_selClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin

  frmpick_item_single:=Tfrmpick_item_single.Create(application);

case self.lst1.ItemIndex of
0:
begin
     InputVar.Fields := 'Cust_Code/客户编号/100,Customer_name/客户名称/300';
    if ((vprev = '2') or (vprev = '4')) then   //如果有可写权限则可以查全部客户
      InputVar.Sqlstr := 'SELECT  TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                          'FROM  dbo.Data0010 '+
                          'ORDER BY dbo.Data0010.CUST_CODE'
    else
      InputVar.Sqlstr := 'SELECT  TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                          'FROM   dbo.Data0010 INNER JOIN  '+
                          'dbo.DATA0100 ON dbo.Data0010.RKEY = dbo.DATA0100.CUSTOMER_PTR '+
                          'WHERE  (dbo.DATA0100.CSI_PTR = '+ rkey73 + ') '+
                          'ORDER BY dbo.Data0010.CUST_CODE';
     InputVar.AdoConn := dm.con1;
      InputVar.KeyField := 'CUST_CODE';
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['CUST_CODE'];

end;
1:
 begin
   InputVar.Fields := 'DEPT_CODE/工序编号/100,DEPT_NAME/工序名称/300';

      InputVar.Sqlstr := 'SELECT  TOP 100 PERCENT DEPT_CODE, DEPT_NAME FROM  dbo.Data0034 where  TTYPE = 1  ';
     InputVar.AdoConn := dm.con1;
      InputVar.KeyField := 'DEPT_CODE';
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
 end;
11:
begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称,ABBR_NAME/工厂简称/500';
    InputVar.Sqlstr := 'SELECT  RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME, ABBR_NAME '+
                        'FROM         Data0015 '+
                        'ORDER BY WAREHOUSE_CODE';
    InputVar.AdoConn := DM.con1;
      InputVar.KeyField := 'WAREHOUSE_CODE';
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
       lbl_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
    end;
end;

end;
end;

procedure TFrmQry.lst1Click(Sender: TObject);
begin

lbl_field.Caption:=lst1.Items[lst1.itemindex];
edt_value.Text:='';
edt_value.Visible:=false;

btn_sel.Visible:=false;

cbb1.Visible:=false;

lbl2.Visible:=false;
lbl3.Visible:=false;
lbl4.Visible:=false;
lbl5.Visible:=false;

dtp1.Visible:=false;
dtp2.Visible:=false;
dtpt1.Visible:=false;
dtpt2.Visible:=false;

case lst1.ItemIndex of
 0,1,11:
 begin
 edt_value.Visible:=true;
 btn_sel.Visible:=true;
 end;

 2,3,6,7,8,12:
 begin
    edt_value.Visible:=true;
   end;

 4:begin
   lbl2.Visible:=true;
   lbl3.Visible:=true;
   lbl3.Caption:='天';
   edt_value.Visible:=true;
   end;
 5:
  begin
  lbl2.Visible:=true;
   lbl3.Visible:=true;
   lbl3.Caption:='小时';
   edt_value.Visible:=true;
  end;
 9:
 begin
  cbb1.Visible:=true;
 end;
10:
 begin
  lbl4.Visible:=true;
  lbl5.Visible:=true;
  dtp1.Visible:=true;
  dtp2.Visible:=true;
  dtpt1.Visible:=true;
  dtpt2.Visible:=true;
 end;

end;
end;

end.

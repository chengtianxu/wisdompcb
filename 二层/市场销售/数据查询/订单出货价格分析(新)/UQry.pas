unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls,DateUtils,ComCtrls;

type
  TFrmQry = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl_field: TLabel;
    cbb1: TComboBox;
    edt_value: TEdit;
    btn_add: TButton;
    btn_sel: TBitBtn;
    lst1: TListBox;
    txt1: TStaticText;
    txt2: TStaticText;
    sgrid1: TStringGrid;
    btn_qry: TBitBtn;
    btn_reset: TBitBtn;
    btn_close: TBitBtn;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb2: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure btn_selClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_resetClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
  private
    { Private declarations }
    procedure  update_sgrid(sgrid_row:integer);
  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation
          uses  common,Pick_Item_Single, ConstVar, UDM;
{$R *.dfm}

procedure TFrmQry.FormShow(Sender: TObject);
begin
    dtp1.Date:=  StartOfTheMonth(now);
    dtp2.Date:=  EndOfTheMonth(now);
    lst1.itemindex:=0;

    cbb1.Items.Clear;
    cbb1.Items.Add('自制');
    cbb1.Items.Add('外发');
    cbb1.Items.Add('半制程');


    cbb2.Items.Clear;
    cbb2.Items.Add('量产');
    cbb2.Items.Add('样板');

    sgrid1.Cells[0,0]:= '字段';
    sgrid1.Cells[1,0]:= '值';
    sgrid1.Cells[2,0]:= 'sql';
    self.cbb1.visible:=false;
    self.cbb2.visible:=false;
    btn_sel.visible:=false;
    edT_value.visible:=true;
end;

procedure TFrmQry.lst1Click(Sender: TObject);
begin
  lbl_field.caption:=lst1.Items[lst1.itemindex];
   self.edt_value.Visible:=false;
   self.cbb1.Visible:=false;
   self.cbb2.Visible:=false;
   self.btn_sel.Visible:=false;
     edt_value.text:='';
   case  lst1.ItemIndex of
   0,1:
   begin
    self.edt_value.Visible:=true;

   end ;
   2,3,4,5:
   begin
      edt_value.Visible:=true;
      btn_sel.Visible:=True;
   end ;

   6:
   begin
      cbb1.Visible:=true;
   end ;
    
   7:
   begin
      cbb2.Visible:=true;
   end;

   end;


end;

procedure TFrmQry.btn_selClick(Sender: TObject);
var
  FDlgInput: PDlgInput;
 Tmp_rslt: variant;
 ss: string;
begin
    frmpick_item_single:=Tfrmpick_item_single.Create(application);
 
 case lst1.ItemIndex of

    2:
   begin
        FDlgInput.Fields := 'Cust_Code/客户编号/100,Customer_name/客户名称/300';
    if ((vprev = '2') or (vprev = '4')) then   //如果有可写权限则可以查全部客户
      FDlgInput.Sqlstr := 'SELECT  TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                          'FROM  dbo.Data0010 '+
                          'ORDER BY dbo.Data0010.CUST_CODE'
    else
      FDlgInput.Sqlstr := 'SELECT  TOP 100 PERCENT dbo.Data0010.RKEY, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME '+
                          'FROM   dbo.Data0010 INNER JOIN  '+
                          'dbo.DATA0100 ON dbo.Data0010.RKEY = dbo.DATA0100.CUSTOMER_PTR '+
                          'WHERE  (dbo.DATA0100.CSI_PTR = '+ rkey73 + ') '+
                          'ORDER BY dbo.Data0010.CUST_CODE';
     FDlgInput.AdoConn := dm.con1;
      FDlgInput.KeyField := 'CUST_CODE';
      frmPick_Item_Single.InitForm_New(FDlgInput);
      if frmPick_Item_Single.ShowModal=mrok then
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['CUST_CODE'];
      ss:=  edt_value.Text;

   end;
    3:    //业务员
   begin
    FDlgInput.Fields := 'EMPL_CODE/销售代表编号/100,EMPLOYEE_NAME/销售代表名称/200';
    FDlgInput.Sqlstr := 'select rKey,EMPL_CODE,EMPLOYEE_NAME from Data0005 order by EMPL_CODE';
    FDlgInput.AdoConn := DM.con1;
      FDlgInput.KeyField := 'EMPL_CODE';
     frmPick_Item_Single.InitForm_New(FDlgInput);
     if frmPick_Item_Single.ShowModal=mrok then
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE'];
   end;
    4:  //产品类型：
   begin
    FDlgInput.Fields := 'PROD_code/产品编号/100,Product_name/产品名称/400';
    FDlgInput.Sqlstr := 'select rKey,PROD_code,Product_name from data0008 order by PROD_code';
    FDlgInput.AdoConn := DM.con1;
      FDlgInput.KeyField := 'PROD_code';
          frmPick_Item_Single.InitForm_New(FDlgInput);
     if frmPick_Item_Single.ShowModal=mrok then
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['PROD_code'];
   end;
    5:
   begin
         FDlgInput.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称,ABBR_NAME/工厂简称/500';
    FDlgInput.Sqlstr := 'SELECT     WAREHOUSE_CODE, WAREHOUSE_NAME, ABBR_NAME '+
                        'FROM         Data0015 '+
                        'ORDER BY WAREHOUSE_CODE';
    FDlgInput.AdoConn := DM.con1;
   // FDlgInput.InPut_value := value;
   // if PickType = 2 then
      FDlgInput.KeyField := 'WAREHOUSE_CODE';
    frmPick_Item_Single.InitForm_New(FDlgInput);
    if frmPick_Item_Single.ShowModal=mrok then
      edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
   end;
 end;
   ss:='test';
end;

procedure TFrmQry.btn_closeClick(Sender: TObject);
begin
close;
end;

procedure TFrmQry.btn_resetClick(Sender: TObject);
var
  i:integer;
begin
  for i:= 1 to sgrid1.RowCount - 2 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:= 2;
end;

procedure TFrmQry.btn_addClick(Sender: TObject);
var
  i:integer;
begin
  //if edt_value.visible=false  then edt_value.text:='';

  for i:= 1 to sgrid1.RowCount - 2 do
  if sgrid1.Cells[0,i] = lst1.Items[lst1.itemindex] then
  begin
    update_sgrid(i);
    exit;
  end;
  update_sgrid(sgrid1.RowCount - 1);
  sgrid1.RowCount:= sgrid1.RowCount + 1;

end;

 procedure  TFrmQry.update_sgrid(sgrid_row:integer);
 begin
  sgrid1.Cells[0,sgrid_row]:= lst1.Items[lst1.itemindex];
  sgrid1.Cells[1,sgrid_row]:= trim(edt_value.Text);
  case lst1.ItemIndex of
   0:  //本厂编号
    begin
    //sgrid1.Cells[1,sgrid_row]:=   trim(edt_value.Text);
    sgrid1.Cells[2,sgrid_row]:=' and dbo.Data0025.MANU_PART_NUMBER like ''%' + edt_value.Text + '%''';
    end;
   1:  //客户型号
    begin
   // sgrid1.Cells[1,sgrid_row]:=   trim(edt_value.Text);
    sgrid1.Cells[2,sgrid_row]:=' and data0085.CUST_PART_NO like ''%' + edt_value.Text + '%''';
    end;
   2:  //客户代码
     begin
   // sgrid1.Cells[1,sgrid_row]:=   trim(edt_value.Text);
    sgrid1.Cells[2,sgrid_row]:=' and  data0010.cust_code like ''%' + edt_value.Text + '%''';
    end;
   3:  //业务员
    begin
   // sgrid1.Cells[1,sgrid_row]:=   trim(edt_value.Text);
    sgrid1.Cells[2,sgrid_row]:=' and data0005.empl_code like ''%' + edt_value.Text + '%''';
    end;
   4:  //产品类型
    begin
  //  sgrid1.Cells[1,sgrid_row]:=   trim(edt_value.Text);
    sgrid1.Cells[2,sgrid_row]:=' and data0008.prod_code like ''%' + edt_value.Text + '%''';
    end;
   5:  //工厂编号
    begin
   // sgrid1.Cells[1,sgrid_row]:=   trim(edt_value.Text);
    sgrid1.Cells[2,sgrid_row]:=' and data0015.warehouse_code like ''%' + edt_value.Text + '%''';
    end;
   6: //加工形式
    begin
     if  cbb1.itemindex=0 then
         begin
         sgrid1.Cells[1,sgrid_row]:=   cbb1.Text;
         sgrid1.Cells[2,sgrid_row]:=' and data0060.so_tp =0' ;
         end
     else  if   cbb1.itemindex=1 then
         begin
        sgrid1.Cells[1,sgrid_row]:= cbb1.Text;
        sgrid1.Cells[2,sgrid_row]:=' and data0060.so_tp =1';
        end
    else if   cbb1.itemindex=2  then
     begin
      sgrid1.Cells[1,sgrid_row]:=  cbb1.Text;
      sgrid1.Cells[2,sgrid_row]:=' and data0060.so_tp =2';
         end;
   end;


   7: //产品属性：
      begin
     if  cbb2.itemindex=0 then
      begin
      sgrid1.Cells[1,sgrid_row]:=  cbb2.Text;
         sgrid1.Cells[2,sgrid_row]:=' and data0085.TTYPE =0';
       end
     else  if   cbb1.itemindex=1 then
      begin
      sgrid1.Cells[1,sgrid_row]:=  cbb2.Text;
      sgrid1.Cells[2,sgrid_row]:=' and data0085.TTYPE =1'
      end;   
     end;

  end;
 end;
 
end.

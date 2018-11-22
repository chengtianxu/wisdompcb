unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ComCtrls, Buttons, ExtCtrls,DateUtils,ConstVar;

type
  TFrmQry = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    lbl_to: TLabel;
    rg1: TRadioGroup;
    edtValue: TEdit;
    btn_OK: TButton;
    lst_field: TListBox;
    StaticText7: TStaticText;
    btn_Del: TButton;
    BitBtn1: TBitBtn;
    dtp1: TDateTimePicker;
    cbb_nation: TComboBox;
    cbb1: TComboBox;
    btn1: TBitBtn;
    StaticText2: TStaticText;
    SGrid: TStringGrid;
    rg2: TRadioGroup;
    dtp2: TDateTimePicker;
    Button1: TButton;
    btn_cancel: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure lst_fieldClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn_DelClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
  private
    { Private declarations }
    procedure updatesg(irow:integer);
  public
    { Public declarations }
    //ResultStr:string;
  end;

var
  FrmQry: TFrmQry;

implementation
          uses UPub, UDM, Pick_Item_Single;
{$R *.dfm}

procedure TFrmQry.FormShow(Sender: TObject);
var
   v_Field_List_CN,v_Field_List_EN:Variant;
   i:Integer;
   err, ssql: string;
begin

lst_field.ItemIndex:=0;
cbb1.Visible:=true;
Label8.Caption:= '离职类型';// lst_field.Items[lst_field.ItemIndex];

 dtp1.Date:= StartOfTheMonth(Now);
 dtp2.Date:= endOfTheMonth(Now);

 SGrid.Cells[0,0]:='字段';
 SGrid.Cells[1,0]:='值';
SGrid.Cells[0,2]:='';
 SGrid.ColWidths[2]:=800;

  try
      //  listbox绑定
       v_Field_List_CN := VarArrayOf(['离职类型',
        '部门','职务','姓名','入职日期','离职日期',
         '民族']);
        v_Field_List_EN := VarArrayOf(['d9.item',
        'd.rkey',
        'd1.item','e.chinesename','employee_1.orginal_ondutytime',
        'employee_1.orginal_outdutytime','e.nation']);

         lst_field.Items.Clear;
         for i :=VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
         self.lst_field.Items.Add(v_Field_List_CN[i]);

       lst_field.ItemIndex:=0;
       

        //离职类型绑定：
           ssql:= 'select item from datadetail where dictid=9';
           err:=openqry(ssql) ;
           if err<>'' then
           begin
           Showmessage('错误：'+err);
           exit;
           end;
         cbb1.items.clear;
         dm.qrytemp.first;
         while  not dm.qrytemp.eof do
         begin
         cbb1.items.add(dm.qrytemp.fieldbyname('item').asstring);
         dm.qrytemp.next;
         end;
  except on e:exception do
  begin
  ShowMessage('错误：'+e.message);
  exit;
  end;

 end;





end;

procedure TFrmQry.lst_fieldClick(Sender: TObject);
begin
//

Label8.caption:= lst_field.Items[lst_field.ItemIndex];
self.edtValue.Visible:=false;
self.btn1.Visible:=False;
self.cbb_nation.Visible:=false;
self.cbb1.Visible:=false;
self.rg1.Visible:=false;
Self.rg2.Visible:=false;
self.dtp1.Visible:=false;
self.dtp2.Visible:=false;
lbl_to.Visible:=false;


case  lst_field.ItemIndex of
0:
 begin
  cbb1.Visible:=true;

 end;
1,2,3:
 begin
 btn1.Visible:=true;
 edtValue.Visible:=true;
 rg1.Visible:=true;
 end;
4,5:
 begin
 dtp1.Visible:=true;
 dtp2.Visible:=true;
 lbl_to.Visible:=true;
 //rg2.Visible:=true;
 end;
6:
 begin
cbb_nation.Visible:=true;
 end;

end;



   

end;

procedure TFrmQry.btn1Click(Sender: TObject);
var
  inputvar: PDlgInput;
begin

 try
  frmPick_Item_Single:=TfrmPick_Item_Single.create(self);
  case  lst_field.ItemIndex of
   1: //部门
   begin
      inputvar.Fields:='departmentName/部门/300';
      inputvar.Sqlstr:='select rkey, departmentName from dataDepartment where invalid=0';
      inputvar.KeyField:='rkey';
      inputvar.AdoConn:=dm.con1;
      frmPick_Item_Single.InitForm_New(inputvar);
      if frmPick_Item_Single.showmodal=mrok then
      begin
         self.edtValue.Text:=frmPick_Item_Single.adspick.fieldbyname('departmentName').asstring;

      end;

   end;
   2:
      begin
      inputvar.Fields:='item/职务/300';
      inputvar.Sqlstr:='select rkey,item from datadetail where dictid=1';
      inputvar.KeyField:='rkey';
      inputvar.AdoConn:=dm.con1;
      frmPick_Item_Single.InitForm_New(inputvar);
      if frmPick_Item_Single.showmodal=mrok then
      begin
         self.edtValue.Text:=frmPick_Item_Single.adspick1.fieldbyname('item').asstring;

      end;

   end;

     3:    //姓名：
      begin
      inputvar.Fields:='chineseName/姓名/300,employeecode/工号/100';
      inputvar.Sqlstr:='select rkey, chineseName,employeecode from employeeMsg where  status=2 ';
      inputvar.KeyField:='rkey';
      inputvar.AdoConn:=dm.con1;
      frmPick_Item_Single.InitForm_New(inputvar);
      if frmPick_Item_Single.showmodal=mrok then
      begin
         self.edtValue.Text:=frmPick_Item_Single.adspick1.fieldbyname('chineseName').asstring;

      end;

   end;


  end;

 finally
   frmPick_Item_Single.free;
 end;

 end;

procedure TFrmQry.btn_DelClick(Sender: TObject);
var
  i :integer;
begin
     for i:=1  to SGrid.RowCount-2  do
     SGrid.Rows[i].Clear;
 SGrid.RowCount:=2;
end;

procedure TFrmQry.btn_cancelClick(Sender: TObject);
begin
close;
end;

procedure TFrmQry.btn_OKClick(Sender: TObject);
var
  i:integer;
begin
//
 case lst_field.ItemIndex of
 1,2,3:
 begin
 if (Trim(self.edtValue.Text)='') and (edtvalue.Visible=true)  then
  begin
  ShowMessage('请先输入值');
  edtvalue.SetFocus;
  exit;
  end;
 end;
 end;

 for i:=1 to  sgrid.rowcount-2  do
 begin
  if (lst_field.Items[lst_field.ItemIndex]=SGrid.Cells[0,i])  then
  begin
   updatesg(i);
  exit;
  end;
 end;

 
  SGrid.Cells[0,SGrid.RowCount-1]:=lst_field.Items[lst_field.itemindex];
  updatesg(SGrid.RowCount-1);
  SGrid.RowCount:=SGrid.RowCount+1;

end;

 procedure TFrmQry.updatesg(irow:integer);
 begin

 SGrid.Cells[0,irow]:= lst_field.Items[lst_field.itemindex];

 case  lst_field.ItemIndex of
 0 :
 begin
  SGrid.Cells[1,irow]:=cbb1.Text;
  SGrid.Cells[2,irow]:=' and d9.item = '''+cbb1.Text+''' ';


 end;
 1:
 begin
  SGrid.Cells[1,irow]:=Trim(edtValue.text);
  if rg1.ItemIndex=0  then
  SGrid.Cells[2,irow]:=' and d.departmentname  = '''+trim(edtValue.Text)+''' '
  else
   SGrid.Cells[2,irow]:=' and d.departmentname  like  ''%'+trim(edtValue.Text)+'%'' ';
 end;

  2 :
 begin
   SGrid.Cells[1,irow]:=Trim(edtValue.text);
  if rg1.ItemIndex=0  then
  SGrid.Cells[2,irow]:=' and d1.item  = '''+trim(edtValue.Text)+''' '
  else
   SGrid.Cells[2,irow]:=' and d1.item  like  ''%'+trim(edtValue.Text)+'%'' ';
 end;

  3 :
 begin
   SGrid.Cells[1,irow]:=Trim(edtValue.text);
  if rg1.ItemIndex=0  then
  SGrid.Cells[2,irow]:='  and e.chinesename  = '''+trim(edtValue.Text)+''' '
  else
   SGrid.Cells[2,irow]:='  and e.chinesename  like  ''%'+trim(edtValue.Text)+'%'' ';

 end;
 4:
 begin
  SGrid.Cells[1,irow]:='入职日期从'+formatdatetime('yyyy-mm-dd',dtp1.date) +'到'+formatdatetime('yyyy-mm-dd',dtp1.date);
  SGrid.Cells[2,irow]:=' and convert(varchar(10),employee_1.orginal_ondutytime,120)>='''+formatdatetime('yyyy-mm-dd',dtp1.Date)+'''  and  convert(varchar(10),employee_1.orginal_ondutytime,120)<='''+formatdatetime('yyyy-mm-dd',dtp2.Date)+'''     ';

 end;
  5 :
 begin
     SGrid.Cells[1,irow]:='入职日期从'+formatdatetime('yyyy-mm-dd',dtp1.date) +'到'+formatdatetime('yyyy-mm-dd',dtp1.date);
  SGrid.Cells[2,irow]:='and convert(varchar(10),employee_1.orginal_outdutytime,120)>='''+formatdatetime('yyyy-mm-dd',dtp1.Date)+'''  and  convert(varchar(10),orginal_outdutytime,120)<='''+formatdatetime('yyyy-mm-dd',dtp2.Date)+'''     ';

 end;
  6 :
 begin
    SGrid.Cells[1,irow]:=cbb_nation.Text;
   SGrid.Cells[2,irow]:=' and e.nation = '''+cbb_nation.Text+''' ';

 end;
 end;


 end;

end.

unit phy_counts;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, Grids, Menus, DB,
  ADODB;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SGrid2: TStringGrid;
    rkey05: TLabel;
    empl_name: TLabel;
    SGrid3: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SGrid1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
    function sys_total(rkey50:integer):integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  v_colwidth: array[0..7] of integer;  
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
 uses damo, employee_search, count_insert, main, total_count,common;
{$R *.dfm}

procedure TForm4.FormActivate(Sender: TObject);
var
 i:integer;
begin
 sgrid1.Cells[0,0] := '本厂编号';
 sgrid1.Cells[1,0] := '客户';
 sgrid1.Cells[2,0] := '位置';
 sgrid1.Cells[3,0] := '工作定单';
 sgrid1.Cells[4,0] := '现有库存';
 sgrid1.Cells[5,0] := '清点人员';
 sgrid1.Cells[6,0] := '清点数量';
 sgrid1.Cells[7,0] := '盘点菲号';
 sgrid2.Cells[0,0] := 'rkey';
 sgrid2.Cells[1,0] := '0050';
 sgrid2.Cells[2,0] := '0016';
 sgrid2.Cells[3,0] := '0005';

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  rkey05.Caption := inttostr(form1.rkey05);
  empl_name.Caption := form1.employee_name;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 i:=1;
 dm.aq215.Close;
 dm.aq215.Parameters[1].Value:=dm.ADO214RKEY.Value;
 dm.aq215.Open;
 sgrid1.RowCount := dm.aq215.RecordCount+2;
 sgrid2.RowCount := dm.aq215.RecordCount+2;
 if dm.aq215.IsEmpty then button1.Enabled := false;
 while not dm.aq215.Eof do
  begin
   sgrid1.Cells[0,i] := dm.aq215MANU_PART_NUMBER.Value;
   sgrid1.Cells[1,i] := dm.aq215CUST_CODE.Value;
   sgrid1.Cells[2,i] := dm.aq215LOCATION.Value;
   if dm.aq215WORK_ORDER_NUMBER.AsVariant<>null then
    sgrid1.Cells[3,i] := dm.aq215WORK_ORDER_NUMBER.Value
   else
    sgrid1.Cells[3,i] := dm.aq215REFERENCE_NUMBER.Value;
   sgrid1.Cells[4,i] := dm.aq215QTY_ON_HAND.AsString;
   sgrid1.Cells[5,i] := dm.aq215EMPLOYEE_NAME.Value;
   if dm.aq215QUANTITY.Value >= 0 then  //030728修改原来为'>0'
    sgrid1.Cells[6,i] := dm.aq215QUANTITY.AsString;
   sgrid1.Cells[7,i] := dm.aq215check_no.AsString;  
   sgrid2.Cells[0,i] := dm.aq215RKEY.AsString; //rkey215
   sgrid2.Cells[1,i] := dm.aq215custpart_ptr.AsString; //rkey50
   sgrid2.Cells[2,i] := dm.aq215location_ptr.AsString; //rkey16
   if dm.aq215COUNTED_BY_EMPL_PTR.AsVariant <> null then
    sgrid2.Cells[3,i] := dm.aq215COUNTED_BY_EMPL_PTR.AsString; //rkey05
   i := i+1;
   dm.aq215.Next;
  end;
 form6:=tform6.Create(application);
 form6.StringGrid1.Cells[0,0] := '生产板号';
 form6.StringGrid1.Cells[1,0] := '客户型号';
 form6.StringGrid1.Cells[2,0] := '量/样';
 form6.StringGrid1.Cells[3,0] := '客户物料号';
 form6.StringGrid1.Cells[4,0] := '客户简称';
 form6.StringGrid1.Cells[5,0] := '系统库存';
 form6.StringGrid1.Cells[6,0] := '清点库存';
 form6.StringGrid1.Cells[7,0] := '自动分配';
end;

procedure TForm4.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
 sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row = sgrid1.RowCount-1 then
 begin
  n1.Enabled := false;
  n4.Enabled := false;
 end
else
 begin
  n1.Enabled := true;
  n4.Enabled := true;
 end;
end;

procedure TForm4.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (trim(sgrid1.Cells[6,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])='') then
 begin
  sgrid1.Cells[5,sgrid1.row]:=empl_name.Caption;
  sgrid2.Cells[3,sgrid1.row]:=rkey05.Caption;
  sgrid1.Cells[6,sgrid1.row]:=inttostr(strtoint(sgrid1.Cells[6,sgrid1.row]));
 end
else
 if (trim(sgrid1.Cells[6,sgrid1.row])='') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
 begin
  sgrid1.Cells[5,sgrid1.row]:='';
  sgrid2.Cells[3,sgrid1.row]:='';
 end
 else
  if (trim(sgrid1.Cells[6,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
  sgrid1.Cells[6,sgrid1.row]:=inttostr(strtoint(sgrid1.Cells[6,sgrid1.row]));

 if (arow=sgrid1.RowCount-1) then  canselect:=false;

end;

procedure TForm4.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col=6 then
 if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm4.N4Click(Sender: TObject);
begin
 try
  form_employee:=tform_employee.Create(application);
  if form_employee.ShowModal=mrok then
   begin
    rkey05.Caption:=form_employee.ADOQuery1.fieldbyname('rkey').AsString;
    empl_name.Caption:=form_employee.ADOQuery1.fieldbyname('employee_name').AsString;
    if sgrid1.Cells[5,sgrid1.row]<>'' then
     begin
      sgrid1.Cells[5,sgrid1.row] := empl_name.Caption;
      sgrid2.Cells[3,sgrid1.row] := rkey05.Caption;
     end;
   end;
 finally
  form_employee.free;
 end;
end;

procedure TForm4.N2Click(Sender: TObject);  //盘点清单增加生产板号
begin
 try
  form5 := tform5.Create(application);
  form5.MaskEdit1.Text := datetostr(date());
  if form5.ShowModal = mrok then
   begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select * from data0053 where rkey is null');
      open;
      append;
      fieldbyname('whse_ptr').AsString := dm.ADO214WAREHOUSE_PTR.AsString;
      fieldbyname('loc_ptr').AsString := form5.rkey16.Caption;
      fieldbyname('cust_part_ptr').AsString := form5.rkey50.Caption;
      fieldvalues['quantity'] := 0;  //盘点的入库数量为零
      fieldvalues['qty_on_hand'] := 0;
      fieldvalues['rma_ptr']:=8;//代表盘点直接入仓
      fieldbyname('mfg_date').AsString := form5.MaskEdit1.Text;//短日期
      fieldbyname('reference_number').AsString := form5.Edit7.Text;
      post;
     end;

     dm.ado215.Close;
     dm.ado215.Parameters[0].Value:=dm.ADO214RKEY.Value;
     dm.ado215.Open;
     dm.ADO215.Append;
     dm.ADO215.FieldValues['fg_list_ptr']:=dm.ADO214RKEY.Value;
     dm.ADO215QUANTITY.Value:=-2;
     dm.ADO215.FieldValues['custpart_ptr']:=dm.ADOQuery1.FieldValues['cust_part_ptr'];
     dm.ADO215.FieldValues['custpart_batch_ptr']:=dm.ADOQuery1.FieldValues['rkey'];
     dm.ADO215.FieldValues['location_ptr']:=dm.ADOQuery1.FieldValues['loc_ptr'];
     dm.ADO215.Post;

     sgrid1.Cells[0,sgrid1.RowCount-1]:=form5.Edit2.Text;
     sgrid1.Cells[1,sgrid1.RowCount-1]:=form5.Edit1.Text;
     sgrid1.Cells[2,sgrid1.RowCount-1]:=form5.Label10.Caption;
     sgrid1.Cells[3,sgrid1.RowCount-1]:=form5.Edit7.Text;
     sgrid1.Cells[4,sgrid1.RowCount-1]:='0';
     sgrid1.Cells[5,sgrid1.RowCount-1]:=form5.Label11.Caption; //清点人员
     sgrid1.Cells[6,sgrid1.RowCount-1]:=form5.Edit5.Text;

     sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ado215.fieldbyname('RKEY').AsString;
     sgrid2.Cells[1,sgrid2.RowCount-1]:=form5.rkey50.Caption;
     sgrid2.Cells[2,sgrid2.RowCount-1]:=form5.rkey16.Caption;
     sgrid2.Cells[3,sgrid2.RowCount-1]:=form5.rkey05.Caption;

     sgrid1.RowCount:=sgrid1.RowCount+1;
     sgrid2.RowCount:=sgrid2.RowCount+1;
     if button1.Enabled=false then button1.Enabled:=true;
   end;
 finally
  form5.free;
 end;
end;

procedure TForm4.SGrid1Exit(Sender: TObject);
begin
if (trim(sgrid1.Cells[6,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])='') then
 begin
  sgrid1.Cells[5,sgrid1.row]:=empl_name.Caption;
  sgrid2.Cells[3,sgrid1.row]:=rkey05.Caption;
  sgrid1.Cells[6,sgrid1.row]:=inttostr(strtoint(sgrid1.Cells[6,sgrid1.row]));
 end
else
 if (trim(sgrid1.Cells[6,sgrid1.row])='') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
 begin
  sgrid1.Cells[5,sgrid1.row]:='';
  sgrid2.Cells[3,sgrid1.row]:='';
 end
 else
 if (trim(sgrid1.Cells[6,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
  sgrid1.Cells[6,sgrid1.row]:=inttostr(strtoint(sgrid1.Cells[6,sgrid1.row]));
end;

procedure TForm4.N1Click(Sender: TObject);
var
 i:integer;
begin
if messagedlg('你确定要删除这一条记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 sgrid3.Cells[0,sgrid3.RowCount-1]:=sgrid2.Cells[0,sgrid1.row];
 sgrid3.RowCount:=sgrid3.RowCount+1;   //记录被删除的盘点清单
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
   sgrid2.Rows[i].Text:=sgrid2.Rows[i+1].Text;
  end;
  sgrid1.RowCount:=sgrid1.RowCount-1;
  sgrid2.RowCount:=sgrid2.RowCount-1;
  if sgrid1.RowCount=2 then button1.Enabled:=false;
end;
end;

procedure TForm4.Button1Click(Sender: TObject);//确认
var
 i:integer;
begin
 dm.ado215.Close;
 dm.ado215.Parameters[0].Value:=dm.ADO214RKEY.Value;
 dm.ado215.Open;
 dm.ADOConnection1.BeginTrans;
 try
 for i:=1 to sgrid2.RowCount-2 do
  begin
   if dm.ADO215.Locate('rkey',strtoint(sgrid2.Cells[0,i]),[]) then
   if trim(sgrid1.Cells[6,i])<>'' then
    begin
     dm.ADO215.Edit;
     dm.ADO215.FieldByName('quantity').AsString := sgrid1.Cells[6,i];
     dm.ADO215.FieldByName('entered_by_user_ptr').AsString := rkey73;
     dm.ADO215.FieldValues['entered_by_ptr'] := form1.rkey05;
     dm.ADO215.FieldByName('COUNTED_BY_EMPL_PTR').AsString := sgrid2.Cells[3,i];
     dm.ADO215check_no.Value := sgrid1.Cells[7,i];
     dm.ADO215status.Value:=1;//已输入
     dm.ADO215.post;
    end;
  end;                                 //上面编辑盘点清单
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if sgrid3.RowCount>2 then             //下面是删除被删除的盘点清单
 for i:=1 to sgrid3.RowCount-2 do
  if dm.ADO215.Locate('rkey',strtoint(sgrid3.Cells[0,i]),[]) then
   begin
    dm.ADO215.Edit;
    dm.ADO215status.Value:=2;
    dm.ADO215.Post;
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  dm.ADOConnection1.CommitTrans;
  showmessage('数据保存成功!');
 except
  dm.ADOConnection1.RollbackTrans;
  showmessage('警告!警告!数据保存不成功!');
 end;
end;

procedure TForm4.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol=6) or (acol=4) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])-2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm4.Button3Click(Sender: TObject);//汇总输入
var
 i,j,systotal:integer;
begin
 i := 1;
 dm.adosum215.Open;
 form6.StringGrid1.RowCount:=dm.adosum215.RecordCount+2;
 form6.stringgrid2.rowcount:=dm.adosum215.RecordCount+2;
if not dm.adosum215.IsEmpty then
 begin
  setlength(form6.if_update,dm.adosum215.RecordCount);
  for j:=0 to dm.adosum215.RecordCount-1 do
   if form6.if_update[j]=0 then  //如果从未赋值
    form6.if_update[j]:=1;        //1更新系统
 end;

 while not dm.adosum215.Eof do
  begin
   form6.StringGrid1.Cells[0,i] := dm.adosum215MANU_PART_NUMBER.Value;
   form6.StringGrid1.Cells[1,i] := dm.adosum215MANU_PART_DESC.Value;
   form6.StringGrid1.Cells[2,i] := dm.adosum215bath_former.Value;
   form6.StringGrid1.Cells[3,i] := dm.adosum215analysis_code_2.Value;
   form6.StringGrid1.Cells[4,i] := dm.adosum215ABBR_NAME.Value;
   form6.StringGrid1.Cells[5,i] := dm.adosum215total_qty.AsString;
   if self.sys_total(dm.adosum215CUSTPART_PTR.Value)>=0 then
    begin
     form6.StringGrid1.Cells[6,i] := inttostr(sys_total(dm.adosum215CUSTPART_PTR.Value));
     if strtoint(form6.StringGrid1.Cells[6,i]) >= dm.adosum215total_qty.Value then
     form6.if_update[i-1]:=2;     //2不更新系统
    end;
   form6.StringGrid2.Cells[0,i] :=dm.adosum215CUSTPART_PTR.AsString;
   i:=i+1;
   dm.adosum215.Next;
  end;
 dm.adosum215.Close;
if form6.StringGrid1.RowCount>2 then
if form6.ShowModal = mrok then
 begin
  for i:=1 to form6.StringGrid2.RowCount-2 do
   begin
    if (form6.StringGrid1.Cells[6,i]<>'') and (form6.if_update[i-1]=1) then
    begin //如果输入了盘点数量,而且分配打勾,那么就分配到工单上
     systotal:=strtoint(form6.StringGrid1.Cells[6,i]);
     for j:=sgrid2.RowCount-2 downto 1 do
     begin
      if (strtoint(sgrid2.Cells[1,j])=strtoint(form6.StringGrid2.Cells[0,i])) then
       begin
        if (systotal>=strtoint(sgrid1.Cells[4,j])) then
         begin
          if (strtoint(sgrid2.Cells[1,j-1])<>strtoint(form6.StringGrid2.Cells[0,i])) or
             (j=1) then
           sgrid1.Cells[6,j]:=inttostr(systotal)
          else
           sgrid1.Cells[6,j]:=sgrid1.Cells[4,j];
          systotal:=systotal-strtoint(sgrid1.Cells[4,j]);
          sgrid1.Cells[5,j]:=empl_name.Caption;
          sgrid2.Cells[3,j]:=rkey05.Caption;
         end
        else
         begin
          sgrid1.Cells[6,j]:=inttostr(systotal);
          systotal:=0;
          sgrid1.Cells[5,j]:=empl_name.Caption;
          sgrid2.Cells[3,j]:=rkey05.Caption;
         end;
       end;
     end;
    end;
   end;
 end;
end;

function tform4.sys_total(rkey50:integer):integer;
var
 v_arow,sys_sum:integer;
begin
 sys_sum:=0;
 for v_arow:=1 to sgrid2.RowCount-2 do
  if (strtoint(sgrid2.Cells[1,v_arow])=rkey50) and (trim(sgrid1.Cells[6,v_arow])<>'') then
   sys_sum:=sys_sum+strtoint(sgrid1.Cells[6,v_arow]);
 sys_total:=sys_sum;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ADO215.Close;
 dm.aq215.Close;
end;

procedure TForm4.Button4Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if trim(sgrid1.Cells[6,i])='' then
    begin
     sgrid1.Cells[6,i]:=sgrid1.Cells[4,i];
     sgrid1.Cells[5,i]:=empl_name.caption;
     sgrid2.Cells[3,i]:=rkey05.caption;
    end;
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
if messagedlg('你确定要不保存退出输入界面吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 self.ModalResult:=mrcancel;
end;

procedure TForm4.FormShow(Sender: TObject);
var
 i:byte;
begin
 for i:=0 to 7 do
  self.v_colwidth[i]:=sgrid1.ColWidths[i];
end;

procedure TForm4.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 7 do
  sgrid1.ColWidths[i]:=v_colwidth[i]+round((sgrid1.Width-817)*v_colwidth[i]/790);
end;

end.



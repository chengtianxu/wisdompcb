unit put_wip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, DB, ADODB,ComObj,Excel2000;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    StG1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StG2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure StG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StG1KeyPress(Sender: TObject; var Key: Char);
    procedure N4Click(Sender: TObject);
    procedure StG1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StG1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StG1Exit(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
   newrow:integer;
   function return_rkey15(rkey06: integer): Integer;  
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses demo, main, employee_search, rej_search, insert_wo,common;

{$R *.dfm}

procedure TForm3.FormActivate(Sender: TObject);
var
 i:integer;
begin
 stg1.Cells[0,0] := '工序';
 stg1.Cells[1,0] := '客户';
 stg1.Cells[2,0] := '本厂编号';
// stg1.Cells[3,0] := '版本';
 stg1.ColWidths[3]:=0;
 stg1.Cells[4,0] := '工作定单';
 stg1.Cells[5,0] := '步骤';
 stg1.Cells[6,0] := '系统数量';
 stg1.Cells[7,0] := '清点人员';
 stg1.Cells[8,0] := '报废原因';
 stg1.Cells[9,0] := '清点数量panel';
 stg1.Cells[10,0]:= '清点数量pcs';
 stg1.Cells[11,0]:= '盘点菲号';
 stg2.Cells[0,0] := 'rkey401';
 stg2.Cells[1,0] := 'rej_ptr';
 stg2.Cells[2,0] := 'count_emp_ptr';

dm.ADP401.Close;        //用于显示数据及修改
dm.ADP401.Parameters[1].Value:=dm.ADP400rkey.Value;
dm.ADP401.Open;
if dm.adp401.IsEmpty then button1.Enabled:=false;
stg1.RowCount:=dm.ADP401.RecordCount+2;
stg2.RowCount:=dm.ADP401.RecordCount+2;
for i:=1 to dm.adp401.RecordCount do
 begin
  stg1.Cells[0,i] := dm.ADP401DEPT_CODE.Value;
  stg1.Cells[1,i] := dm.ADP401cust_code.Value;
  stg1.Cells[2,i] := dm.ADP401MANU_PART_NUMBER.Value;
//  stg1.Cells[3,i] := dm.ADP401CP_REV.Value;
  stg1.Cells[4,i] := dm.ADP401WORK_ORDER_NUMBER.Value;
  stg1.Cells[5,i] := dm.ADP401wip_ptr.AsString;
  stg1.Cells[6,i] := dm.ADP401wip_system_qty.AsString;
  stg1.Cells[7,i] := dm.ADP401EMPLOYEE_NAME.Value;

  if dm.ADP401reject_ptr.AsVariant<>null then
   begin
    stg2.Cells[1,i] := dm.ADP401reject_ptr.AsString;   //报废代码指针
    stg1.Cells[8,i] := dm.ADP401REJect_description.Value;
   end;

  stg1.Cells[9,i] := dm.ADP401pnls.AsString;

  if dm.ADP401physical_count_qty.Value>=0 then
   stg1.Cells[10,i] := dm.ADP401physical_count_qty.AsString ;

  stg1.Cells[11,i] := dm.adp401check_no.asstring;

  stg2.Cells[0,i] := dm.ADP401rkey.AsString; //盘点清单rkey

  if dm.ADP401count_ptr.AsVariant<>null then
   stg2.Cells[2,i] := dm.ADP401count_ptr.AsString;   //清点人员

  dm.ADP401.Next;
 end;
dm.ADP401.Close;
stg1.Col:=9;
newrow:=1;
end;

procedure TForm3.StG1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if  (acol=9) or (acol=10) then
 Stg1.Canvas.TextRect(rect,rect.right-Stg1.Canvas.TextWidth(Stg1.Cells[acol,arow])-2,
                           rect.Top+2,
                          Stg1.Cells[acol,aRow]);


if acol<=8 then
  if arow=newrow then
   begin
    stg1.Canvas.Brush.Color := clblue;
    stg1.Canvas.FrameRect(rect);


   end
  else
   begin
    stg1.Canvas.Brush.Color:= clscrollbar;
    stg1.Canvas.FillRect(rect);
    if acol=6 then
     Stg1.Canvas.TextRect(rect,rect.right-Stg1.Canvas.TextWidth(Stg1.Cells[acol,arow])-2,
                           rect.Top+2,
                          Stg1.Cells[acol,aRow])
    else
     stg1.Canvas.TextRect(rect,rect.left,rect.Top, stg1.Cells[acol,aRow]);
   end;


end;

procedure TForm3.StG1KeyPress(Sender: TObject; var Key: Char);
begin
if stg1.Col<>11 then
 if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm3.N4Click(Sender: TObject);
begin
 try
  form_employee:=tform_employee.Create(application);
  if form_employee.ShowModal=mrok then
   begin
    form1.v_employee:=form_employee.ADOQuery1rkey.value;
    form1.employee_name:=form_employee.ADOQuery1employee_name.Value;
    if stg1.Cells[7,stg1.row]<>'' then
     begin
      stg1.Cells[7,stg1.row] := form1.employee_name;
      stg2.Cells[2,stg1.row] := inttostr(form1.v_employee);
     end;
   end;
 finally
  form_employee.free;
 end;
end;

procedure TForm3.StG1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (trim(stg1.Cells[10,stg1.row])<>'') and (trim(stg1.Cells[7,stg1.row])='') then
 begin
  stg1.Cells[7,stg1.row]:=form1.employee_name;
  stg2.Cells[2,stg1.row]:=inttostr(form1.v_employee);
  stg1.Cells[10,stg1.row]:=inttostr(strtoint(stg1.Cells[10,stg1.row]));
  if stg1.Cells[10,stg1.row] <> stg1.Cells[6,stg1.row] then
   begin
    stg2.Cells[1,stg1.row]:=inttostr(form1.rej_ptr);
    stg1.Cells[8,stg1.row]:=form1.REJECT_DESC;
   end;
 end
else
 if (trim(stg1.Cells[10,stg1.row])='') and (trim(stg1.Cells[7,stg1.row])<>'') then
  begin
   stg1.Cells[7,stg1.row]:='';
   stg2.Cells[2,stg1.row]:=''; //清点人员指针为空

   stg2.Cells[1,stg1.row]:='';
   stg1.Cells[8,stg1.row]:='';
  end
 else
  if (trim(stg1.Cells[10,stg1.row])<>'') and (trim(stg1.Cells[7,stg1.row])<>'') then
   begin
    stg1.Cells[10,stg1.row]:=inttostr(strtoint(stg1.Cells[10,stg1.row]));
    if (stg1.Cells[10,stg1.row] <> stg1.Cells[6,stg1.row]) and
       (trim(stg1.Cells[8,stg1.row])='') then
    begin
     stg2.Cells[1,stg1.row]:=inttostr(form1.rej_ptr);
     stg1.Cells[8,stg1.row]:=form1.REJECT_DESC;
    end;
   end;

 if (arow=stg1.RowCount-1) or (acol<=8) then canselect:=false;

 newrow:=arow;
 stg1.Refresh;
end;

procedure TForm3.StG1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
 stg1.MouseToCell(x,y,column,row);
  if row<>0 then stg1.Row:=row;
end;

procedure TForm3.StG1Exit(Sender: TObject);
begin
if (trim(stg1.Cells[10,stg1.row])<>'') and (trim(stg1.Cells[7,stg1.row])='') then
 begin
  stg1.Cells[7,stg1.row]:=form1.employee_name;
  stg2.Cells[2,stg1.row]:=inttostr(form1.v_employee);
  stg1.Cells[10,stg1.row]:=inttostr(strtoint(stg1.Cells[10,stg1.row]));
 end
else
 if (trim(stg1.Cells[10,stg1.row])='') and (trim(stg1.Cells[7,stg1.row])<>'') then
 begin
  stg1.Cells[7,stg1.row]:='';
  stg2.Cells[2,stg1.row]:='';
 end
 else
 if (trim(stg1.Cells[10,stg1.row])<>'') and (trim(stg1.Cells[7,stg1.row])<>'') then
  stg1.Cells[10,stg1.row]:=inttostr(strtoint(stg1.Cells[10,stg1.row]));
end;

procedure TForm3.N5Click(Sender: TObject);
begin
try
 form_rej:=tform_rej.Create(application);
 if form_rej.ShowModal=mrok then
  begin
   form1.rej_ptr := form_rej.ADOQuery1rkey.Value;
   form1.REJECT_DESC := form_rej.ADOQuery1REJECT_DESCRIPTION.Value;
   if (stg1.Cells[10,stg1.row] <> stg1.Cells[6,stg1.row]) and
      (trim(stg1.Cells[10,stg1.row])<>'') then
    begin
    stg1.Cells[8,stg1.Row]:=form_rej.ADOQuery1REJect_description.Value;
    stg2.Cells[1,stg1.Row]:=form_rej.ADOQuery1rkey.AsString;
    end;
  end;
finally
 form_rej.Free;
end;
end;

procedure TForm3.N2Click(Sender: TObject);  //删除清单
var
 i:integer;
begin
dm.ADo401.Close;
dm.ADo401.Parameters[0].Value:=strtoint(stg2.Cells[0,stg1.row]);
dm.ADo401.Open;

if not dm.ADO401.IsEmpty then
 begin
  if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
  try
   dm.ado402.close;                    //临时记录被删除的在线工单
   dm.ado402.Parameters[0].Value := dm.ADP400rkey.Value;
   dm.ADO402.Open;
   dm.ADO402.Append;
   dm.ADO402wipcode_ptr.Value := dm.ADP400rkey.Value; //那一个盘点代码
   dm.ADO402wo_ptr.Value := dm.ADO401wo_ptr.Value;    //那一个作业单
   dm.ado402system_quan.value := dm.ADO401wip_system_qty.value;
   dm.ADO402panels.Value := dm.ADO401physical_panels.Value;    //新增字段
   dm.ado402dept_ptr.value := dm.Ado401dept_ptr.Value;
   dm.ADO402step.Value := dm.Ado401wip_ptr.Value;
   if trim(stg2.Cells[1,stg1.Row]) <> '' then
   dm.ADO402reject_ptr.Value := strtoint(stg2.Cells[1,stg1.Row]);

   if trim(stg2.Cells[2,stg1.row])<>'' then
    dm.ADO402employee_ptr.Value := strtoint(stg2.Cells[2,stg1.row])
   else
    dm.ADO402employee_ptr.Value := form1.v_employee;
   dm.ADO402.Post;

    with dm.ADOQuery2 do
     begin                        //修改作业单状态
      close;
      sql.Clear;
      sql.Add('select PROD_STATUS,quan_sch,quan_rej,quan_prod,panels');
      sql.Add('from data0006');
      sql.Add('where rkey='+dm.ADO402wo_ptr.AsString);
      open;
      edit;
      fieldvalues['quan_rej'] := fieldvalues['quan_rej']+dm.ADO402system_quan.Value;
      fieldvalues['panels'] := fieldvalues['panels']- dm.ADO402panels.Value;
      if fieldvalues['quan_sch']-fieldvalues['quan_rej']-fieldvalues['quan_prod']=0 then
       fieldvalues['prod_status'] := 9; //将作业单变成生产完成
      post;
     end;

   dm.adoquery1.close;
   dm.ADOQuery1.Parameters[0].Value := dm.ADO401wiprkey_ptr.Value;
   dm.ADOQuery1.Open;
   dm.ADOQuery1.Delete; //031103号修改程序直接删除在线工单 data0056

 
   dm.ADO401.Edit;
   dm.ADO401status.Value:=2;
   dm.ADO401physical_count_qty.Value:=0;
   dm.ADO401panels.Value:=0;  //041001增加的语句
   dm.ADO401.Post;



     dm.ADO58.Close; //报废
     dm.ADO58.Open;
     dm.ADO58.Append;
     dm.ADO58MRB_NO.Value:=form1.mrb_no;
     dm.ADO58WO_PTR.Value:=dm.ADO402wo_ptr.Value;
     dm.ADO58DEPT_PTR.Value:=dm.ADO402dept_ptr.Value;
     dm.ADO58RESP_DEPT_PTR.Value := dm.ADO402dept_ptr.Value;
     if dm.ADO402reject_ptr.Value>0 then
      dm.ADO58REJECT_PTR.Value := dm.ADO402reject_ptr.Value
     else
      dm.ADO58REJECT_PTR.Value := form1.rej_ptr;
     dm.ADO58QTY_ORG_REJ.Value := dm.ADO402system_quan.AsInteger;
     dm.ADO58QTY_REJECT.Value := dm.ADO402system_quan.Value;
     dm.ADO58PANELS.Value := dm.ADO402panels.Value;
     dm.ADO58STEP.Value:=dm.ADO402step.Value;
     dm.ADO58EMPL_PTR.Value:=dm.ADO402employee_ptr.Value;
     dm.ADO58TDATETIME.Value:=form1.v_date;
     dm.ADO58TTYPE.Value:=1;//盘点报废
     dm.ado58.Post;

  for i := stg1.Row to stg1.RowCount-2 do
   begin
    stg1.Rows[i].Text := stg1.Rows[i+1].Text;
    stg2.Rows[i].Text := stg2.Rows[i+1].Text;
   end;
  stg1.RowCount := stg1.RowCount-1;
  stg2.RowCount := stg2.RowCount-1;
  if stg1.RowCount = 2 then button1.Enabled:=false;

  dm.ADOConnection1.CommitTrans;
  showmessage('删除操作成功!');
 except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
 end;

 end
else
 messagedlg('在线工单没有查找到,请与管理员联系!',mterror,[mbcancel],0);
end;

procedure TForm3.Button1Click(Sender: TObject);
var
 i:integer;
begin
if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
 screen.Cursor := crHourGlass;
try
 for i:=1 to stg2.RowCount-2 do
  begin
   dm.ADo401.Close;
   dm.ADo401.Parameters[0].Value := strtoint(stg2.Cells[0,i]);
   dm.ADo401.Open;
   if not dm.ADO401.IsEmpty then
   begin
    if trim(stg1.Cells[10,i])<>'' then //清点pcs数
    begin
     dm.ADO401.Edit;
     dm.ADO401panels.Value:=strtoint(stg1.Cells[9,i]); //输入panels数   040427
     dm.ADO401physical_count_qty.AsString:=stg1.Cells[10,i];   //输入pcs数
     dm.ADO401user_ptr.Value:=strtoint(rkey73);
     dm.ADO401enterted_ptr.Value:=form1.v_employee;
     dm.ADO401ent_date.Value:=form1.v_date;
     dm.ADO401count_ptr.Value := strtoint(stg2.Cells[2,i]);

     if trim(stg2.Cells[1,i]) <> '' then
      dm.ADO401reject_ptr.Value := strtoint(stg2.Cells[1,i]);

     dm.ADO401check_no.Value := stg1.Cells[11,i];
     dm.ADO401status.Value:=1;    //盘点数量已录入
     dm.ADO401.post;
    end;
   end
   else
    showmessage('记录没有找到,请与管理员联系!');                                     //上面编辑盘点清单
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  screen.Cursor:=crDefault;
  dm.ADOConnection1.CommitTrans;
  screen.Cursor:=crDefault;
 except
  dm.ADOConnection1.RollbackTrans;
  messagedlg('对不起数据保存时出现差错请退出后重试!',mtinformation,[mbok],0);
  screen.Cursor:=crDefault;
 end;

end;

function TForm3.return_rkey15(rkey06: integer): Integer;
begin
 DM.ADOQuery2.Close;
 dm.ADOQuery2.SQL.Text :='select WHOUSE_PTR from data0006 where rkey='+inttostr(rkey06);
 dm.ADOQuery2.Open;
 if not dm.ADOQuery2.IsEmpty then
 Result:=dm.ADOQuery2.fieldbyname('WHOUSE_PTR').AsInteger
 else
 Result:=1;
end;

procedure TForm3.N1Click(Sender: TObject); //在清单中增加在线工单
begin
 try
  form4:=tform4.Create(application);
  if form4.ShowModal=mrok then
   begin
   if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
   try
    dm.adoquery1.close;
    dm.ADOQuery1.Parameters[0].Value := null;
    dm.ADOQuery1.Open;

    dm.ADOQuery1.Append; //增加在线工单data0056
    dm.ADOQuery1WO_PTR.Value := strtoint(form4.rkey06.Caption);
    dm.ADOQuery1DEPT_PTR.Value := strtoint(form4.dept_ptr.Caption);
    dm.ADOQuery1FLOW_NO.Value := strtoint(form4.flow_no.Caption);
    dm.ADOQuery1STEP.Value := strtoint(form4.step.Caption);
    dm.ADOQuery1EMPLOYEE_PTR.Value := form1.v_employee;
    dm.ADOQuery1QTY_BACKLOG.Value := strtoint(form4.Edit6.Text);
    dm.ADOQuery1INTIME.Value := form1.v_date;//接收日日期
    dm.ADOQuery1PANELS.Value := form4.system_panels; //新增字段 040529系统pan数量
    dm.ADOQuery1TO_BE_STOCKED.Value := 0;
    dm.ADOQuery1TDATE.Value:=common.getsystem_date(dm.ADOQuery2,0); //系统日期
    dm.ADOQuery1LOC_PTR.Value:=return_rkey15(strtoint(form4.rkey06.Caption)); //在线工厂
    dm.ADOQuery1.Post;

   if form4.RadioGroup1.ItemIndex = 1 then //增加非在线工单
    with dm.ADOQuery2 do
     begin              //修改作业单状态
      close;
      sql.Clear;
      sql.Add('select PROD_STATUS,quan_sch,quan_rej,quan_prod from data0006');
      sql.Add('where rkey='+dm.ADOQuery1WO_PTR.AsString);
      open;
      edit;
      fieldvalues['prod_status'] := 3; //将作业单变成生产中状态
      fieldvalues['quan_sch'] := dm.ADOQuery1QTY_BACKLOG.Value;
      fieldvalues['quan_rej'] := fieldvalues['quan_rej']-dm.ADOQuery1QTY_BACKLOG.Value;
      post;
     end
   else                           //增加在线工单
    with dm.ADOQuery2 do
     begin
      close;
      sql.Clear;
      sql.Add('delete data0402');
      sql.Add('where wo_ptr='+dm.ADOQuery1WO_PTR.AsString);
      ExecSQL;
      SQL.Text:='update data0006 set prod_status=3,quan_rej=quan_rej-'+dm.ADOQuery1QTY_BACKLOG.AsString+
                ' where rkey='+dm.ADOQuery1WO_PTR.AsString;
      ExecSQL;
     end;

    dm.ADo401.Close;
    dm.ADo401.Parameters[0].Value:=null;
    dm.ADo401.Open;
    dm.ADO401.Append; //增加在线工单盘点清单  data0401
    dm.ADO401header_ptr.Value := dm.ADP400rkey.Value;
    dm.ADO401wo_ptr.Value := dm.ADOQuery1WO_PTR.Value;
    dm.ADO401dept_ptr.Value := dm.ADOQuery1DEPT_PTR.Value;
    dm.ADO401wip_ptr.Value := dm.ADOQuery1STEP.Value;
    dm.ADO401wiprkey_ptr.Value := dm.ADOQuery1RKEY.Value; //新增字段56.rkey
    dm.ADO401reject_ptr.Value := form1.rej_ptr;
    dm.ADO401wip_system_qty.Value := 0;     //需要打报废
    dm.ADO401physical_panels.Value := form4.system_panels;//系统panel数量
    dm.ADO401panels.Value := strtoint(form4.Edit8.Text); //清点panel数量
    dm.Adomax_no.Open;
    dm.ADO401seaial_no.Value := dm.Adomax_nomax_no.Value;
    dm.ADO401.Post;      //得到当前盘点清单中最大的seq_no
    dm.Adomax_no.Close;

   stg1.Cells[0,stg1.RowCount-1] := form4.Edit4.Text;
   stg1.Cells[1,stg1.RowCount-1] := form4.Edit7.Text;
   stg1.Cells[2,stg1.RowCount-1] := form4.Edit1.Text;
//   stg1.Cells[3,stg1.RowCount-1] := form4.edit2.Text;
   stg1.Cells[4,stg1.RowCount-1] := form4.Edit3.Text;
   stg1.Cells[5,stg1.RowCount-1] := form4.step.Caption;
   stg1.Cells[6,stg1.RowCount-1] := dm.ADO401wip_system_qty.AsString;
   stg1.Cells[7,stg1.RowCount-1] := form1.employee_name;

   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('SELECT REJ_CODE,REJect_description from data0039');
     sql.Add('where rkey='+inttostr(form1.rej_ptr));
     open;
    end;
    
   stg1.Cells[8,stg1.RowCount-1] := dm.ADOQuery2.FieldValues['REJect_description'];;
   stg1.Cells[9,stg1.RowCount-1] := form4.Edit8.Text;  //清点panel数量
   stg1.Cells[10,stg1.RowCount-1] := form4.Edit6.Text; //清点pcs数量
   stg1.RowCount:=stg1.RowCount+1;

   stg2.Cells[0,stg2.RowCount-1] := dm.ADO401rkey.AsString;
   stg2.Cells[1,stg2.RowCount-1] := inttostr(form1.rej_ptr);
   stg2.Cells[2,stg2.RowCount-1] := inttostr(form1.v_employee);
   stg2.RowCount := stg2.RowCount+1;

   dm.ADOConnection1.CommitTrans;
   showmessage('增加操作成功!');
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

  end;
 finally
  form4.free;
 end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
if messagedlg('你确定要不保存数据退出输入界面吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans;
 self.ModalResult:=mrcancel;
end;
end;

procedure TForm3.Button4Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
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
 XLApp.SheetsInNewWorkbook := 1;

   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];

   for iCount := 0 to stg1.ColCount - 1 do
    Sheet.Cells[1, iCount + 1 ] := stg1.Cells[icount,0];

   for jcount :=1 to stg1.RowCount-2 do
    for iCount := 0 to stg1.ColCount - 1 do
     Sheet.Cells[jCount + 1, iCount + 1] := stg1.Cells[iCount,jcount];

   XlApp.Visible := True;
   Screen.Cursor := crDefault;
end;

procedure TForm3.Button3Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to stg1.RowCount-2 do
  begin
   if trim(stg1.Cells[10,i])='' then
    begin
     stg1.Cells[10,i]:=stg1.Cells[6,i];
     stg1.Cells[7,i]:=form1.employee_name;
     stg2.Cells[2,i]:=inttostr(form1.v_employee);
    end;
  end;
end;

end.

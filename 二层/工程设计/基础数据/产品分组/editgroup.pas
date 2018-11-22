unit editgroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, Mask, DBCtrls, DB, DBTables, Menus,
  ADODB, ComCtrls, ExtCtrls,common;

type
  TForm2 = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    del: TMenuItem;
    ADOQuery1: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    PopupMenu2: TPopupMenu;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtREVIEW_DAYS: TDBEdit;
    edtREVIEW_DAYS1: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function if_puthdate():boolean;
    procedure update_date0091();
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
implementation
uses main, dpment_search, parameter;

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
var
 i:word;
begin
 dbedit1.SetFocus;
 stringgrid1.Cells[0,0] := '审批部门代码';
 stringgrid1.Cells[1,0] := '审批部门';
 stringgrid1.Cells[2,0] := '评审交期';
 stringgrid1.Cells[3,0] := '评审信息';

  stringgrid2.cells[0,0]:='参数类别';
  stringgrid2.cells[1,0]:='参数名称';
  stringgrid2.cells[2,0]:='参数描述';
  stringgrid2.cells[3,0]:='单位';
  stringgrid2.cells[4,0]:='数据类型';
  stringgrid2.cells[5,0]:='输入方式';

if form1.ADOTable1.State=dsedit then   //编辑
begin
 with adoquery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select data0034.dept_code,data0034.dept_name,data0034.rkey,');
   sql.Add('data0091.if_puthdate,data0091.puth_info');
   sql.Add('from data0091 inner join data0034 on data0091.dept_ptr=data0034.rkey');
   sql.Add('where data0091.group_ptr='+form1.ADOTable1.fieldbyname('rkey').AsString);
   active:=true;
   if not IsEmpty then
   begin
    stringgrid1.RowCount:=RecordCount+2;
    for i:=1 to RecordCount do
    begin
     stringgrid1.Cells[0,i] := fieldvalues['dept_code'];
     stringgrid1.Cells[1,i] := fieldvalues['dept_name'];
     if fieldvalues['if_puthdate']=0 then
      stringgrid1.Cells[2,i] := '否'
     else
      stringgrid1.Cells[2,i] := '是';
     stringgrid1.Cells[3,i] := fieldbyname('puth_info').AsString;
     stringgrid1.Cells[4,i] := fieldbyname('rkey').AsString;
     Next;
    end;
   end;
  end;

 with adoquery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('SELECT Data0277.CATEGORY_NAME,Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,');
   sql.Add('Data0002.UNIT_NAME,Data0278.DATA_TYPE,Data0087.ttype,Data0087.PARAMETER_PTR');
   sql.Add('FROM Data0278 INNER JOIN');
   sql.Add('Data0277 ON Data0278.CATEGORY_PTR = Data0277.RKEY INNER JOIN');
   sql.Add('Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY INNER JOIN');
   sql.Add('Data0087 ON Data0278.RKEY = Data0087.PARAMETER_PTR');
   sql.Add('where data0087.group_ptr='+form1.ADOTable1.fieldbyname('rkey').AsString);
   sql.Add('ORDER BY Data0087.SEQ_NO');
   active:=true;
   if not IsEmpty then
   begin
    stringgrid2.RowCount:=RecordCount+2;
    for i:=1 to RecordCount do
    begin
     stringgrid2.Cells[0,i] := fieldvalues['category_name'];
     stringgrid2.Cells[1,i] := fieldvalues['parameter_name'];
     stringgrid2.Cells[2,i] := fieldvalues['parameter_desc'];
     stringgrid2.Cells[3,i] := fieldvalues['unit_name'];
     if fieldvalues['data_type']=1 then
      stringgrid2.Cells[4,i] := '数字'
     else
      if fieldvalues['data_type']=2 then
       stringgrid2.Cells[4,i] := '字符';
     if fieldvalues['ttype']=0 then
      stringgrid2.Cells[5,i] :='常规'
     else
      stringgrid2.Cells[5,i] :='后补';
     stringgrid2.Cells[6,i] := fieldbyname('parameter_ptr').AsString;
     Next;
    end;
   end;
  end;

end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 v_message:integer;
begin
 if form1.adoTable1.State=dsinsert then
  begin
   form1.adoTable1.Cancel;
   v_close:=1; //正常退出
   form1.Show;
   close;
  end;
if (dbedit1.Text='') or (dbedit2.Text='') then
   form1.adoTable1.Cancel;
if (form1.adoTable1.Modified) then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
   form1.adoTable1.Cancel     //取消对当前记录的修改包括新增
  else
   if v_message=6 then     //对修改的记录存盘
    bitbtn1click(sender)
   else                    //cancel不存盘也不保存
    exit;
  end;
 v_close:=1; //正常退出
 form1.Show;
 close;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
IF DBedit1.Text='' then
 begin
  showmessage('请输入一个正确的组别代码!');
  dbedit1.SetFocus;
  exit;
 end;

IF DBedit2.Text='' then
 begin
  showmessage('需要一个组别名称');
  dbedit2.SetFocus;
  exit;
 end;

if stringgrid1.RowCount<=2 then
 begin
  messagedlg('至少需要一个参于审批的部门!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  stringgrid1.SetFocus;
  exit;
 end
else
 begin
  if if_puthdate=false then
   begin
    showmessage('至少需要一个部门参于订单交期评审!');
    pagecontrol1.ActivePageIndex:=0;
    stringgrid1.SetFocus;
    exit;
   end;
 end;

 try
  form1.adoTable1.Post;
 except
  messagedlg('保存失败,请检查组别代码是否重复!',mtwarning,[mbok],0);
  exit;
 end;
  self.update_date0091;
  v_close:=1; //正常退出
  ShowMsg('新增操作成功!',1);
  form1.Show;
  ModalResult:=mrok;
  form1.BtBrushClick(Sender);

end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then
 del.Enabled:=false
else
 del.Enabled:=true;
end;

procedure TForm2.delClick(Sender: TObject);
var
 i:byte;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TForm2.addClick(Sender: TObject);
var
 i:word;
begin
form_dept:=tform_dept.Create(application);
if form_dept.ShowModal=mrok then
 begin
 if stringgrid1.RowCount>2 then
  begin
   for i := 1 to stringgrid1.RowCount-2 do //比较是否重复
   if comparetext(stringgrid1.Cells[0,i],trim(form_dept.ADOQuery1dept_code.Value))=0 then
    begin
     messagedlg('审批部门用户重复!',mtwarning,[mbcancel],0);
     break;
    end
   else
   if i=stringgrid1.RowCount-2 then
    begin
     stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form_dept.ADOQuery1dept_code.Value;
     stringgrid1.Cells[1,stringgrid1.RowCount-1]:=form_dept.ADOQuery1dept_name.Value;
     if form_dept.CheckBox1.Checked then
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:='是'
     else
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:='否';
     stringgrid1.Cells[3,stringgrid1.RowCount-1]:=form_dept.Edit2.Text;
     stringgrid1.Cells[4,stringgrid1.RowCount-1]:=inttostr(form_dept.ADOQuery1rkey.Value);
     stringgrid1.RowCount:=stringgrid1.RowCount+1;
    end;
  end
 else
  begin
   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form_dept.ADOQuery1dept_code.Value;
   stringgrid1.Cells[1,stringgrid1.RowCount-1]:=form_dept.ADOQuery1dept_name.Value;
   if form_dept.CheckBox1.Checked then
    stringgrid1.Cells[2,stringgrid1.RowCount-1]:='是'
   else
    stringgrid1.Cells[2,stringgrid1.RowCount-1]:='否';
   stringgrid1.Cells[3,stringgrid1.RowCount-1]:=form_dept.Edit2.Text;
   stringgrid1.Cells[4,stringgrid1.RowCount-1]:=inttostr(form_dept.ADOQuery1rkey.Value);
   stringgrid1.RowCount:=stringgrid1.RowCount+1;
  end;
end;
form_dept.Free;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then //非正常退出
 begin
  form1.Show;
  form1.adoTable1.Cancel;
 end;
end;

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
  if row<>0 then stringgrid1.Row:=row;
 end;
end;

function TForm2.if_puthdate: boolean;
var
 i:byte;
begin
 if_puthdate := false;
 for i:=1 to stringgrid1.RowCount-2 do
  if trim(stringgrid1.Cells[2,i])='是' then
   begin
    if_puthdate := true;
    break;
   end;
end;

procedure TForm2.update_date0091;
var
 i:word;
begin
 with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0091');
   sql.Add('where group_ptr='+form1.ADOTable1.fieldbyname('rkey').AsString);
   open;
  end;
 while not adoquery1.Eof do adoquery1.Delete;

 for i:=1 to stringgrid1.RowCount-2 do
  with adoquery1 do
   begin
    append;
    if trim(stringgrid1.Cells[2,i])='否' then
     fieldvalues['if_puthdate']:=0
    else
     fieldvalues['if_puthdate']:=1;
    fieldvalues['puth_info']:=stringgrid1.Cells[3,i];
    fieldvalues['dept_ptr']:=strtoint(stringgrid1.Cells[4,i]);
    fieldvalues['group_ptr']:=form1.ADOTable1.FieldValues['rkey'];
    post;
   end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 with ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0087');
   sql.Add('where group_ptr='+form1.ADOTable1.fieldbyname('rkey').AsString);
   open;
  end;
 while not adoquery1.Eof do adoquery1.Delete;

 for i:=1 to stringgrid2.RowCount-2 do
  with adoquery1 do
   begin
    append;
    if trim(stringgrid2.Cells[5,i])='常规' then
     fieldvalues['ttype']:=0
    else
     fieldvalues['ttype']:=1;
    fieldvalues['SEQ_NO']:=i;
    fieldvalues['PARAMETER_PTR']:=strtoint(stringgrid2.Cells[6,i]);
    fieldvalues['group_ptr']:=form1.ADOTable1.FieldValues['rkey'];
    post;
   end;
end;

procedure TForm2.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then
 begin
  stringgrid2.MouseToCell(x,y,column,row);
  if row<>0 then stringgrid2.Row:=row;
 end;
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
  if Stringgrid2.Row =stringgrid2.RowCount-1 then
   begin
    add1.Caption := '增加';
    Delete1.Enabled :=false;
    n3.Enabled := false;
   end
  else
   begin
    add1.Caption := '插入';
    Delete1.Enabled :=true;
    n3.Enabled :=true;
    if trim(stringgrid2.Cells[5,stringgrid2.Row])='常规' then
     n3.Caption:='设置为后补输入'
    else
     n3.Caption:='设置为常规输入';
   end;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
 if trim(stringgrid2.Cells[5,stringgrid2.Row])='常规' then
  stringgrid2.Cells [5,stringgrid2.Row]:='后补'
 else
  stringgrid2.Cells [5,stringgrid2.Row]:='常规';
end;

procedure TForm2.Add1Click(Sender: TObject);
var
 i:integer;
begin
   Application.CreateForm(TFrmParameter, FrmParameter);
   if FrmParameter.ShowModal=mrok then
   begin
    with stringgrid2 do
     for i:=1 to rowcount-2 do
      if strtoint(Cells[6,i])=frmparameter.ADOQuery1rkey.Value then
       begin
        MessageDlg('参数出现重复!',mtInformation,[mbOK],0);
        FrmParameter.Free;
        exit;
       end;

     if stringgrid2.row=stringgrid2.RowCount-1 then
      begin     //当总行数等于选择的行（最后）
       stringgrid2.Cells[0,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['category_name'];
       stringgrid2.Cells[1,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['parameter_name'];
       stringgrid2.Cells[2,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['parameter_desc'];
       stringgrid2.Cells[3,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['unit_name'];
       stringgrid2.Cells[4,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['datatype'];
       stringgrid2.Cells[5,stringgrid2.row]:='常规';
       stringgrid2.Cells[6,stringgrid2.row]:=frmparameter.ADOQuery1rkey.AsString;
       stringgrid2.RowCount:=stringgrid2.RowCount+1;
      end
     else     //向中间插入
      begin
       for i:=stringgrid2.RowCount-1 downto stringgrid2.Row+1 do
        stringgrid2.Rows[i].Text:=stringgrid2.rows[i-1].Text;

       stringgrid2.Cells[0,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['category_name'];
       stringgrid2.Cells[1,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['parameter_name'];
       stringgrid2.Cells[2,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['parameter_desc'];
       stringgrid2.Cells[3,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['unit_name'];
       stringgrid2.Cells[4,stringgrid2.row]:=FrmParameter.Adoquery1.fieldvalues['datatype'];
       stringgrid2.Cells[5,stringgrid2.row]:='常规';
       stringgrid2.Cells[6,stringgrid2.row]:=frmparameter.ADOQuery1rkey.AsString;
       stringgrid2.RowCount:=stringgrid2.RowCount+1;
      end;
   end;
   FrmParameter.Free ;
end;

procedure TForm2.Delete1Click(Sender: TObject);
var
 i:word;
begin
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
end;
end.


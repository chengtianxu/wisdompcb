unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, ComCtrls, Mask, Buttons, Menus,
  Grids, DBGrids, DB, ADODB;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1part_name: TStringField;
    ADOQuery1if_select: TBooleanField;
    ADOQuery1OPT_LOT_SIZE: TIntegerField;
    ADOQuery1LAYERS: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOQuery37: TADOQuery;
    PopupMenu2: TPopupMenu;
    R1: TMenuItem;
    W1: TMenuItem;
    Q1: TMenuItem;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery4part_name: TStringField;
    ADOQuery4step_number: TSmallintField;
    ADOQuery4dept_ptr: TIntegerField;
    ADOQuery4def_rout_inst: TStringField;
    ADOQuery5: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure Q1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  function Name_Is_Same(part_name:string):Boolean;
  function check_before_save:boolean;
  function update_name(part_name:string):boolean;
implementation

uses demo, main, deptcode_search, form_remark;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if form1.itype=0 then//新建子部件信息
begin
if check_before_save and Name_Is_Same(trim(edit1.Text)) then
begin
try
with adoquery2 do
close;
adoquery2.SQL.Text:='insert into data0037(part_name,OPT_LOT_SIZE,LAYERS) values(''%s'',''%d'',''%d'')';
adoquery2.SQL.Text:=format(ADOQuery2.SQL.Text,[edit1.Text,strtoint(edit2.Text),strtoint(edit3.Text)]);
adoquery2.ExecSQL;
dm.ADO037.Close;
dm.ADO037.Open;
dm.ADS42.First;
while not dm.ADS42.Eof do
begin
form2.ADOQuery5.Close;
form2.ADOQuery5.SQL.Text:='insert into data0042(part_name,step_number,dept_ptr,def_rout_inst) values(''%s'',''%d'',''%d'',''%s'')';
adoquery5.SQL.Text:=format(adoquery5.SQL.Text,[edit1.Text,dm.ADS42STEP_NUMBER.Value,dm.ADS42DEPT_PTR.Value,dm.ADS42DEF_ROUT_INST.Value]);
adoquery5.ExecSQL;
dm.ADS42.Next;
end;
showmessage('已成功保存!');
form2.Close;
except
showmessage('对不起保存失败!');
end;
end;
end;
if form1.itype=1 then //编辑更新子部件信息
if check_before_save and update_name(edit1.Text) then
begin
dm.ADOConnection1.BeginTrans;
try
with ADOQuery3 do
begin
close;
sql.Add('delete from data0042 where part_name=:part_name');//删除数据库data0042原有数据
Parameters[0].Value:=dm.ADO037part_name.Value;
ExecSQL;
end;
dm.ADOQuery1.Close;
dm.ADOQuery1.SQL.Clear;
dm.ADOQuery1.SQL.Text:='delete from data0037 where part_name=:part_name';
dm.ADOQuery1.Parameters[0].Value:=dm.ADO037part_name.Value;
dm.ADOQuery1.ExecSQL;
dm.ADOQuery1.Close;
dm.ADOQuery1.SQL.Clear;
dm.adoquery1.SQL.Text:='insert into data0037(part_name,OPT_LOT_SIZE,LAYERS) values(''%s'',''%d'',''%d'')';
dm.ADOQuery1.SQL.Text:=format(dm.ADOQuery1.SQL.Text,[edit1.Text,strtoint(edit2.Text),strtoint(edit3.Text)]);
dm.ADOQuery1.ExecSQL;
dm.ADOQuery1.Close;   //先更新主表
dm.ADO037.Close;
dm.ADO037.Open;//刷新主表数据
dm.ADS42.First;
while not dm.ADS42.Eof do
begin
form2.ADOQuery5.Close;
form2.ADOQuery5.SQL.Text:='insert into data0042(part_name,step_number,dept_ptr,def_rout_inst) values(''%s'',''%d'',''%d'',''%s'')';
adoquery5.SQL.Text:=format(adoquery5.SQL.Text,[edit1.Text,dm.ADS42STEP_NUMBER.Value,dm.ADS42DEPT_PTR.Value,dm.ADS42DEF_ROUT_INST.Value]);
adoquery5.ExecSQL;
dm.ADS42.Next;
end;
dm.ADOConnection1.CommitTrans;
showmessage('数据更新成功!');
form2.Close;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;
end;

function update_name(part_name:string):boolean;//编辑保存时判断内存名是否出现相同值
begin
result:=true;
form2.ADOQuery2.Close;
form2.adoquery2.SQL.Text:='select * from data0037 where part_name<>:part_name and part_name=:name';
form2.adoquery2.Parameters[0].Value:=dm.ADO037part_name.Value;
form2.adoquery2.Parameters[1].Value:=part_name;
form2.adoquery2.Open;
if not form2.adoquery2.IsEmpty then
begin
result:=false;
showmessage('这个内层名已存在,请换一个吧!');
exit;
end;
if form2.ADOQuery2.IsEmpty then
begin
result:=true;
exit;
end;
end;

function Name_Is_Same(part_name:string):boolean;//新增时判断名称是否出现相同值
begin
result:=true;
form2.ADOQuery1.Close;
form2.ADOQuery1.Parameters[0].Value:=part_name;
form2.ADOQuery1.Open;
if form2.ADOQuery1.IsEmpty then
begin
result:= true;
exit;
end;
if not form2.ADOQuery1.IsEmpty then
begin
result:= false;
showmessage('内层名称不能出现相同的值!');
exit;
end;
end;

procedure TForm2.N1Click(Sender: TObject);//新增工序信息
begin
try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
 begin
 if not dm.ADS42.Active then
 dm.ADS42.Close;
 dm.ADS42.Open;
 dm.ADS42.AppendRecord([ dm.ADS42.RecordCount+1,dm.ADO037part_name.Value,
                          form_deptcode.ADOQuery1rkey.Value,'']); //暂时只增加数据集的记录,不更新数据库
  end;
finally
 form_deptcode.Free;
end;

end;

function check_before_save:boolean;//判断输入是否为空
begin
  result:=true;
  if (trim(form2.Edit1.Text)='') then
  begin
    messagedlg('内层名称不能为空!',mtconfirmation,[mbok],0);
    result:=false;
   form2.Edit1.SetFocus;
    exit;
  end;
    if (trim(form2.Edit2.Text)='') then
  begin
    messagedlg('最佳流转批量不能为空!',mtconfirmation,[mbok],0);
    result:=false;
    form2.Edit2.SetFocus;
    exit;
  end;
     if (trim(form2.Edit3.Text)='') then
  begin
    messagedlg('层数不能为空!',mtconfirmation,[mbok],0);
    result:=false;
    form2.Edit3.SetFocus;
    exit;
  end;
end;
procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8, #13]) then
begin
Key:= #0;
end;
end;

procedure TForm2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8, #13]) then
begin
Key:= #0;
end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
if form1.itype=0 then
begin
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
dbgrid1.PopupMenu:=PopupMenu1;
dm.ADS42.Close;
dm.ADS42.Parameters[0].Value:='';
dm.ADS42.Open;
end;
if form1.itype=1 then
begin
edit1.Text:=dm.ADO037part_name.Value;
edit2.Text:=inttostr(dm.ADO037OPT_LOT_SIZE.Value);
edit3.Text:=inttostr(dm.ADO037LAYERS.value);
dbgrid1.PopupMenu:=form2.PopupMenu1;
dm.ADS42.Close;
dm.ADS42.Parameters[0].Value:=dm.ADO037part_name.Value;
dm.ADS42.Open;
end;
if form1.itype=2 then
begin
edit1.Text:=dm.ADO037part_name.Value;
edit2.Text:=inttostr(dm.ADO037OPT_LOT_SIZE.Value);
edit3.Text:=inttostr(dm.ADO037LAYERS.value);
edit1.Enabled:=false;
edit2.Enabled:=false;
edit3.Enabled:=false;
form2.DBGrid1.PopupMenu:=form2.PopupMenu2;
form2.BitBtn1.Enabled:=false;
dm.ADS42.Close;
dm.ADS42.Parameters[0].Value:=dm.ADO037part_name.Value;
dm.ADS42.Open;
end;
end;

procedure TForm2.N2Click(Sender: TObject);   //插入工序
var
 step_number:word;
begin
try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
  begin
   if dm.ADS42.IsEmpty then
    step_number:=1
   else
    begin
     step_number:=dm.ADS42STEP_NUMBER.Value;
     dm.ADS42.IndexFieldNames := '';
     dm.ADS42.Filter:='step_number >= '+inttostr(step_number);
     dm.ADS42.DisableControls;
     while not dm.ADS42.Eof do
     begin
      dm.ADS42.Edit;
      dm.ADS42STEP_NUMBER.Value:=dm.ADS42STEP_NUMBER.Value+1;
      dm.ADS42.Post;
      dm.ADS42.Next;
      end;
     end;
     dm.ADS42.IndexFieldNames:='step_number';
     dm.ADS42.Filter:='';
     dm.ADS42.MoveBy(step_number-dm.ADS42.RecNo);
     dm.ADS42.EnableControls;
     dm.ADS42.AppendRecord([ step_number,dm.ADO037part_name.Value,
                          form_deptcode.ADOQuery1rkey.Value,'']);
   if not form2.BitBtn1.Enabled then bitbtn1.Enabled:=true;
  end;
finally
 form_deptcode.Free;
 end;
end;


procedure TForm2.N4Click(Sender: TObject);//删除工序信息
var
 step_number:word;
begin
if dm.ADS42.RecNo = dm.ADS42.RecordCount then
begin
 dm.ADS42.Delete;
end
else
 begin
  dm.ADS42.Delete;
  step_number := dm.ADS42.RecNo;
  dm.ADS42.DisableControls;
  while not dm.ADS42.Eof do
   begin
    dm.ADS42.Edit;
    dm.ADS42STEP_NUMBER.Value := dm.ADS42STEP_NUMBER.Value-1;
    dm.ADS42.Post;
    dm.ADS42.Next;
   end;
   dm.ADS42.MoveBy(step_number-dm.ADS42.RecNo);
   dm.ADS42.EnableControls;
 end;
  if not bitbtn1.Enabled then bitbtn1.Enabled:=true;
end;

procedure TForm2.R1Click(Sender: TObject); //替换相关工序信息
begin
try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
  begin
   dm.ADS42.Edit;
   dm.ADS42DEPT_PTR.Value:=form_deptcode.ADOQuery1rkey.Value;
   dm.ADS42DEF_ROUT_INST.Value:=form_deptcode.ADOQuery1DEF_ROUT_INST.Value;
   dm.ADS42.Post;
   if not bitbtn1.Enabled then bitbtn1.Enabled:=true;
  end;
finally
 form_deptcode.Free;
end;

end;
procedure TForm2.N5Click(Sender: TObject);
var
 step_number,recd_cound:integer;
begin
 step_number:=dm.ADS42STEP_NUMBER.Value;
 recd_cound:=dm.ADS42.RecordCount;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=recd_cound+1;
 dm.ADS42.Post;
 dm.ADS42.MoveBy(step_number-1-dm.ADS42.RecNo);
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number;
 dm.ADS42.Post;
 dm.ADS42.Last;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number-1;
 dm.ADS42.Post;
end;


procedure TForm2.N6Click(Sender: TObject);
var
 step_number,recd_cound:integer;
begin
 step_number:=dm.ADS42STEP_NUMBER.Value;
 recd_cound:=dm.ADS42.RecordCount;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=recd_cound+1;
 dm.ADS42.Post;
 dm.ADS42.MoveBy(step_number-dm.ADS42.RecNo);
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number;
 dm.ADS42.Post;
 dm.ADS42.Last;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number+1;
 dm.ADS42.Post;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS42.IsEmpty then
 begin
  n3.Enabled:=false;
  n4.Enabled:=false;
  R1.Enabled:=false;
  w1.Enabled:=false;
  q1.Enabled:=false;
 end
else
 begin
  n3.Enabled:=true;
  n4.Enabled:=true;
  R1.Enabled:=true;
  if dm.ADS42STEP_NUMBER.Value=1 then
  w1.Enabled:=false
  else
  w1.Enabled:=true;
  if dm.ADS42STEP_NUMBER.Value=dm.ADS42.RecordCount then
  q1.Enabled:=false
  else
  q1.Enabled:=true;
 end;
end;

procedure TForm2.N3Click(Sender: TObject); //增加工序的加工指示信息
begin
try
remark:=tremark.Create(application);
if remark.ShowModal=mrok then
  begin

  end;
finally
 remark.free;
end;
end;
procedure TForm2.W1Click(Sender: TObject); //与上行工序对调
 var
 step_number,recd_cound:integer;
begin
 step_number:=dm.ADS42STEP_NUMBER.Value;
 recd_cound:=dm.ADS42.RecordCount;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=recd_cound+1;
 dm.ADS42.Post;
 dm.ADS42.MoveBy(step_number-1-dm.ADS42.RecNo);
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number;
 dm.ADS42.Post;
 dm.ADS42.last;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number-1;
 dm.ADS42.Post;
end;

procedure TForm2.Q1Click(Sender: TObject);//与下行工序对调
var
 step_number,recd_cound:integer;
begin
 step_number:=dm.ADS42STEP_NUMBER.Value;
 recd_cound:=dm.ADS42.RecordCount;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=recd_cound+1;
 dm.ADS42.Post;
 dm.ADS42.MoveBy(step_number-dm.ADS42.RecNo);
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number;
 dm.ADS42.Post;
 dm.ADS42.Last;
 dm.ADS42.Edit;
 dm.ADS42STEP_NUMBER.Value:=step_number+1;
 dm.ADS42.Post;
end;

end.

unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Menus, DB, ADODB;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    ADOQuery1: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1CATEGORY: TStringField;
    ADOQuery1BILLING_FLAG: TStringField;
    ADOQuery1TAX_FLAG: TStringField;
    ADOQuery1PTR_TO_GL_ACCT: TIntegerField;
    ADOQuery1COMMISSION_FLAG: TStringField;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOConnection1: TADOConnection;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  v_edit:boolean;
implementation

uses editprice,common;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 v_message:integer;
begin
if v_edit then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
   begin
    adoquery1.CancelBatch();
    Application.Terminate;    //取消对所有记录的修改包括新增
   end
  else
   if v_message=6 then     //对修改的记录存盘
    bitbtn1click(sender)
  else                    //cancel不存盘也不保存
    exit;
 end
else
 Application.Terminate;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
 i:byte;
begin
if not adoquery1.Active then adoquery1.Active:=true;
if not adoquery2.Active then adoquery2.Active:=true;
 stringgrid1.Cells[0,0]:='编号';
 stringgrid1.Cells[1,0]:='类别名称';
 stringgrid1.Cells[2,0]:='帐目代码';
 stringgrid1.Cells[3,0]:='征税';
 stringgrid1.Cells[4,0]:='佣金';
 for i:=1 to 20 do
  stringgrid1.Cells[0,i]:=inttostr(i);
 for i:=1 to adoquery1.RecordCount do
 begin
  stringgrid1.Cells[1,i]:=adoquery1.FieldValues['category'];
  if adoquery1.FieldValues['ptr_to_gl_acct']<>null then
   stringgrid1.Cells[2,i]:=adoquery2.FieldValues['GL_ACC_NUMBER'];
  if adoquery1.FieldValues['tax_flag']='Y' then
   stringgrid1.Cells[3,i]:='是' else
   stringgrid1.Cells[3,i]:='否';
  if adoquery1.FieldValues['COMMISSION_FLAG']='Y' then
   stringgrid1.Cells[4,i]:='是' else
   stringgrid1.Cells[4,i]:='否';
  adoquery1.Next;
 end;
 adoquery1.First;
end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
   column,row:longint;
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
   if row<>0 then
  stringgrid1.Row:=row;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
 searchoption:=[lopartialkey];
 Adoquery1.Locate('category',stringgrid1.Cells[1,stringgrid1.Row],searchoption);
 if adoquery1.FieldValues['ptr_to_gl_acct']<>null then
  begin
    form2.Edit1.Text:=adoquery2.FieldValues['GL_ACC_NUMBER'];
    form2.edit1.Font.Color:=clwindowtext;
    form2.Label3.Caption:='   '+adoquery2.FieldValues['gl_description'];
  end;
 adoquery1.Edit;
if form2.ShowModal=mrok then
 begin
  for i:=1 to 20 do //比较是否有重复类型名称
    begin
     if stringgrid1.Cells[1,i]='' then break;
     if i<>stringgrid1.Row then
     if comparetext(TRIM(stringgrid1.Cells[1,i]),TRIM(adoquery1.FieldValues['category']))=0 then
        begin
         messagedlg('类别名重复!',mtwarning,[mbok],0);
         adoquery1.Cancel;
         exit;
        end;
    end;
  adoquery1.Post;
  v_edit:=true;
  stringgrid1.Cells[1,stringgrid1.Row]:=adoquery1.FieldValues['category'];
  if adoquery1.FieldValues['ptr_to_gl_acct']<>null then
     stringgrid1.Cells[2,stringgrid1.Row]:=adoquery2.FieldValues['GL_ACC_NUMBER']
  else
     stringgrid1.Cells[2,stringgrid1.Row]:='';
  if adoquery1.FieldValues['tax_flag']='Y' then
     stringgrid1.Cells[3,stringgrid1.Row]:='是' else
     stringgrid1.Cells[3,stringgrid1.Row]:='否';
  if adoquery1.FieldValues['COMMISSION_FLAG']='Y' then
     stringgrid1.Cells[4,stringgrid1.Row]:='是' else
     stringgrid1.Cells[4,stringgrid1.Row]:='否';
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 adoquery1.UpdateBatch();
 application.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
 adoquery1.Append;
 adoquery1.FieldValues['COMMISSION_FLAG']:='N';
 adoquery1.FieldValues['tax_flag']:='N';
 if form2.ShowModal=mrok then
  begin
   for i:=1 to 20 do //比较是否有重复类型名称
    begin
     if stringgrid1.Cells[1,i]='' then break;
     if comparetext(TRIM(stringgrid1.Cells[1,i]),TRIM(adoquery1.FieldValues['category']))=0 then
      begin
       messagedlg('类别名重复!',mtwarning,[mbok],0);
       adoquery1.Cancel;
       exit;
      end;
    end;
  adoquery1.Post;
  v_edit:=true;
  stringgrid1.Cells[1,adoquery1.RecordCount]:=adoquery1.FieldValues['category'];
  if adoquery1.FieldValues['ptr_to_gl_acct']<>null then
   stringgrid1.Cells[2,adoquery1.RecordCount]:=adoquery2.FieldValues['GL_ACC_NUMBER']
  else
   stringgrid1.Cells[2,adoquery1.RecordCount]:='';
  if adoquery1.FieldValues['tax_flag']='Y' then
   stringgrid1.Cells[3,adoquery1.RecordCount]:='是' else
   stringgrid1.Cells[3,adoquery1.RecordCount]:='否';
  if adoquery1.FieldValues['COMMISSION_FLAG']='Y' then
   stringgrid1.Cells[4,adoquery1.RecordCount]:='是' else
   stringgrid1.Cells[4,adoquery1.RecordCount]:='否';
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
 searchoption:=[lopartialkey];
 Adoquery1.Locate('category',stringgrid1.Cells[1,stringgrid1.Row],searchoption);
 with adoquery3 do
  begin
   if active=true then active:=false;
    sql.Clear;
    sql.Add('select rkey from data0062 where addl_cat_ptr=:rkey');
    Parameters.ParamValues['rkey']:=adoquery1.FieldValues['rkey'];
    active:=true;
  end;
 if not adoquery3.IsEmpty then
  begin
   messagedlg('不能删除该记录!已用于销售定单',mtwarning,[mbok],0);
   exit;
  end
 else
  begin
   with adoquery3 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select rkey from data0065 where addl_category_ptr=:rkey');
    Parameters.ParamValues['rkey']:=adoquery1.FieldValues['rkey'];
    active:=true;
   end;
   if not adoquery3.IsEmpty then
    begin
     messagedlg('不能删除该记录!已用于工具费用发票',mtwarning,[mbok],0);
     exit;
    end;
 end;
  for i:=stringgrid1.Row to adoquery1.RecordCount do
   begin
    if i<>adoquery1.RecordCount then
     begin
      stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,i+1];
      stringgrid1.Cells[2,i]:=stringgrid1.Cells[2,i+1];
      stringgrid1.Cells[3,i]:=stringgrid1.Cells[3,i+1];
      stringgrid1.Cells[4,i]:=stringgrid1.Cells[4,i+1];
      end else
     begin
      stringgrid1.Cells[1,i]:='';
      stringgrid1.Cells[2,i]:='';
      stringgrid1.Cells[3,i]:='';
      stringgrid1.Cells[4,i]:='';
     end;
   end;
  adoquery1.Delete;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Cells[1,stringgrid1.Row] = '' then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
 end;
 if adoquery1.RecordCount>=20 then
  n1.Enabled:=false
 else
  n1.Enabled:=true;
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin
 if stringgrid1.Cells[1,stringgrid1.Row] <> '' then
  N2click(sender);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(self.ADOConnection1) then
 begin
  showmsg('程序起动失败请联系管理员!',1);
  application.Terminate;
 end;
self.Caption:=application.Title;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin

 end;
end;

initialization  //初始发变量
v_edit:=false;
end.

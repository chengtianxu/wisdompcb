unit mic_category;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, DB, ADODB, Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    ADOConnection1: TADOConnection;
    aq0199: TADOQuery;
    DataSource1: TDataSource;
    AQ103: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ADOQuery1: TADOQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;    
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  v_edit: boolean;
implementation

uses edit_mic,common;

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
    aq0199.CancelBatch();
    Application.Terminate;      //取消对所有记录的修改包括新增
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
 v_edit:=false;
 stringgrid1.Cells[0,0] := '序号';
 stringgrid1.Cells[1,0] := '杂项类别';
 stringgrid1.Cells[2,0] := '总帐帐目代码';
 stringgrid1.Cells[3,0] := '征税';
 for i := 1 to 10 do
  stringgrid1.Cells[0,i] := inttostr(i);
 aq0199.Open;
 aq103.Open;
 aq0199.First;
 for i := 1 to aq0199.RecordCount do
  begin
   stringgrid1.Cells[1,i] := aq0199.FieldValues['MISC_CHARGE_CATEGORY'];
  if aq0199.FieldValues['GEN_LED_ACCTPTR']<>null then
   stringgrid1.Cells[2,i]:=aq103.FieldValues['GL_ACC_NUMBER'];
  if aq0199.FieldValues['TAXABLE']='Y' then
   stringgrid1.Cells[3,i]:='是' else
   stringgrid1.Cells[3,i]:='否';
   aq0199.Next;
  end;
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
 if aq0199.RecordCount>=10 then
  n1.Enabled:=false
 else
  n1.Enabled:=true;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
 searchoption:=[lopartialkey];
 aq0199.Locate('MISC_CHARGE_CATEGORY',stringgrid1.Cells[1,stringgrid1.Row],searchoption);
 if aq0199.FieldValues['gen_led_acctptr']<>null then
  begin
    form2.Edit1.Text:=aq103.FieldValues['GL_ACC_NUMBER'];
    form2.edit1.Font.Color:=clwindowtext;
    form2.Label3.Caption:=aq103.FieldValues['gl_description'];
  end;
 aq0199.Edit;
if form2.ShowModal=mrok then
 begin
  for i:=1 to 10 do //比较是否有重复类型名称
    begin
     if stringgrid1.Cells[1,i]='' then break;
     if i<>stringgrid1.Row then
     if comparetext(TRIM(stringgrid1.Cells[1,i]),TRIM(aq0199.FieldValues['MISC_CHARGE_CATEGORY']))=0 then
      begin
       messagedlg('类别名重复!',mtwarning,[mbok],0);
       aq0199.Cancel;
       exit;
      end;
    end;
  aq0199.Post;
  v_edit:=true;
  stringgrid1.Cells[1,stringgrid1.Row]:=aq0199.FieldValues['MISC_CHARGE_CATEGORY'];
  if aq0199.FieldValues['gen_led_acctptr']<>null then
    stringgrid1.Cells[2,stringgrid1.Row]:=aq103.FieldValues['GL_ACC_NUMBER']
  else
    stringgrid1.Cells[2,stringgrid1.Row]:='';
  if aq0199.FieldValues['taxable']='Y' then
     stringgrid1.Cells[3,stringgrid1.Row]:='是' else
     stringgrid1.Cells[3,stringgrid1.Row]:='否';
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
 aq0199.Append;
 aq0199.FieldValues['taxable']:='N';
 if form2.ShowModal=mrok then
  begin
   for i:=1 to 10 do //比较是否有重复类型名称
    begin
     if stringgrid1.Cells[1,i]='' then break;
     if comparetext(TRIM(stringgrid1.Cells[1,i]),TRIM(aq0199.FieldValues['MISC_CHARGE_CATEGORY']))=0 then
      begin
       messagedlg('类别名重复!',mtwarning,[mbok],0);
       aq0199.Cancel;
       exit;
      end;
    end;
  aq0199.Post;
  v_edit:=true;
  stringgrid1.Cells[1,aq0199.RecordCount]:=aq0199.FieldValues['MISC_CHARGE_CATEGORY'];
  if aq0199.FieldValues['gen_led_acctptr']<>null then
    stringgrid1.Cells[2,aq0199.RecordCount]:=aq103.FieldValues['GL_ACC_NUMBER']
  else
    stringgrid1.Cells[2,aq0199.RecordCount]:='';
  if aq0199.FieldValues['taxable']='Y' then
     stringgrid1.Cells[3,aq0199.RecordCount]:='是' else
     stringgrid1.Cells[3,aq0199.RecordCount]:='否';
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 aq0199.UpdateBatch();
 application.Terminate;
end;

procedure TForm1.N3Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
 searchoption:=[lopartialkey];
 aq0199.Locate('misc_charge_category',stringgrid1.Cells[1,stringgrid1.Row],searchoption);
 with adoquery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey from data0200 where misc_charge_ptr=:rkey');
   Parameters.ParamValues['rkey']:=aq0199.FieldValues['rkey'];
   active:=true;
  end;
 if not adoquery1.IsEmpty then
  begin
   messagedlg('不能删除该记录!已有子表联结',mtwarning,[mbok],0);
   exit;
  end
 else
  begin
   with adoquery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select rkey from data0201 where misc_chargeptr=:rkey');
    Parameters.ParamValues['rkey']:=aq0199.FieldValues['rkey'];
    active:=true;
   end;
   if not adoquery1.IsEmpty then
    begin
     messagedlg('不能删除该记录!已有子表联结',mtwarning,[mbok],0);
     exit;
    end
   else
    with adoquery1 do
     begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select rkey from data0212 where misc_charge_ptr=:rkey');
     Parameters.ParamValues['rkey']:=aq0199.FieldValues['rkey'];
     active:=true;
     if not isempty then
      begin
      messagedlg('不能删除该记录!已有子表联结',mtwarning,[mbok],0);
      exit;
      end;
    end;
  end;
  for i:=stringgrid1.Row to aq0199.RecordCount do
   begin
    if i<>adoquery1.RecordCount then
     begin
      stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,i+1];
      stringgrid1.Cells[2,i]:=stringgrid1.Cells[2,i+1];
      stringgrid1.Cells[3,i]:=stringgrid1.Cells[3,i+1];
      end else
     begin
      stringgrid1.Cells[1,i]:='';
      stringgrid1.Cells[2,i]:='';
      stringgrid1.Cells[3,i]:='';
     end;
   end;
  aq0199.Delete;
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

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin
 if stringgrid1.Cells[1,stringgrid1.Row] <> '' then
  N2click(sender);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(self.ADOConnection1) then
 begin
  showmsg('系统起动失败请联系管理员!',1);
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

end.

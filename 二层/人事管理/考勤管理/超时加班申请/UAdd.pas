unit UAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls, Buttons;

type
  TFrmAdd = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pm_selEmp: TPopupMenu;
    qry_emp: TADOQuery;
    ds: TDataSource;
    btn_close: TBitBtn;
    btn_save: TBitBtn;
    rg_type: TRadioGroup;
    Label1: TLabel;
    cbb_YM: TComboBox;
    Label2: TLabel;
    edt_days: TEdit;
    Label3: TLabel;
    memo1: TMemo;
    DBGrid1: TDBGrid;
    N1: TMenuItem;
    N2: TMenuItem;
    qry_emprkey: TAutoIncField;
    qry_empemployeecode: TWideStringField;
    qry_empchineseName: TWideStringField;
    procedure edt_daysKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
 
  private
    { Private declarations }

  public
    { Public declarations }
    PFlag: integer; // 1新增，2编辑，3查看
  end;

var
  FrmAdd: TFrmAdd;

implementation
       uses UDM, USelEMP, UMain;
{$R *.dfm}

procedure TFrmAdd.edt_daysKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

procedure TFrmAdd.FormShow(Sender: TObject);
var
  ssql:  string;
begin

if not qry_emp.Active  then qry_emp.Open;

 if PFlag=1  then
  memo1.text:='';

 rg_type.ItemIndex:=0;

 ssql:='select checkyearmonth  from  salarycheck  order by actived desc,  checkyearmonth desc  ';

 dm.OpenQry(dm.qry_temp,ssql);
 cbb_YM.Clear;

 if not dm.qry_temp.IsEmpty then
 with dm.qry_temp do
 begin
     first;
    while not eof do
    begin
    cbb_YM.Items.Add(fieldbyname('checkyearmonth').AsString);
    Next;
    end;
     cbb_YM.ItemIndex:=0;
 end;


end;

procedure TFrmAdd.N2Click(Sender: TObject);
begin
//
if qry_emp.IsEmpty then exit;

 qry_emp.Delete;


end;

procedure TFrmAdd.N1Click(Sender: TObject);
var   FilterStr:string;
begin

 if  trim(cbb_YM.Text)=''  then
  begin
  showmessage('请先选择年月！');
  exit;
  end;
  
   frmSelEmp:=TfrmSelEmp.create(application);
    if not qry_emp.isempty then
    begin
     qry_emp.First;
     while not qry_emp.Eof do
     begin

       FilterStr:=FilterStr+'employeecode <> '+qry_emp.fieldByName('employeecode').AsString+' and ';

      qry_emp.Next;
     end;
      FilterStr:=Copy(FilterStr,0,Length(FilterStr)-4);

    end;

      FrmSelEmp.qry_Selemp.filtered:=false;
      FrmSelEmp.qry_Selemp.filter:=FilterStr;
      FrmSelEmp.qry_Selemp.filtered:=true;



   if frmSelEmp.showmodal=mrok then
   begin
    if not frmSelEmp.qry_Selemp.isempty then
    with  frmSelEmp  do
    begin
     qry_Selemp.Filtered:=false;
     qry_Selemp.Filter:=' sel=1';
     qry_Selemp.Filtered:=true;

     qry_Selemp.First;
     while not qry_Selemp.Eof do
     begin
      qry_emp.Append;
       qry_emp.FieldByName('employeecode').AsString:=qry_Selemp.fieldByName('employeecode').AsString;
       qry_emp.FieldByName('chineseName').AsString:=qry_Selemp.fieldByName('chineseName').AsString;
       qry_emp.post;
      qry_Selemp.Next;
     end;



    end;




   end;




 end;

 
procedure TFrmAdd.btn_saveClick(Sender: TObject);
var
ssql,atype:string;
 i,status,employeeid:integer;
begin
//
 if trim(edt_days.Text)=''  then
 begin
 ShowMessage('天数不能为空！');
 edt_days.SetFocus;
 exit;
 end;

 if qry_emp.IsEmpty then 
 begin
 ShowMessage('请选择工号！');
 exit;
 end;
  if rg_type.ItemIndex=0  then
  atype :='0'
  else  atype:='1';

  status:=0;

  qry_emp.First;
  try
  while not qry_emp.Eof  do
  begin
    ssql:='select rkey  from employeemsg where employeecode='''+qry_emp.fieldbyname('employeecode').asstring+'''  ';
   employeeid:= dm.getone('rkey', ssql, dm.qry_temp );

     ssql:='select rkey from  OverWorkApply where employeeid='+inttostr(employeeid)+' and YearMonth='''+cbb_ym.text+''' and atype='+atype+'  ';
         dm.openqry(DM.qry_temp,ssql);
    if  DM.qry_temp.RecordCount>0 then
    begin
    ShowMessage('当月已经存在申请记录，请检查！');
    exit;
    end;
    
   ssql:=' insert into OverWorkApply(employeeid, YearMonth,AType,days,status,remark)'+
           'values('+inttostr(employeeid)+','''+cbb_ym.text+''','+atype+','+trim(edt_days.text)+','+inttostr(status)+','''+trim(memo1.text)+'''  )';
    dm.execsql(DM.qry_temp,ssql);
   qry_emp.next;
  end;

   self.close;
   frmMain.btn_refreshClick(sender);
   frmMain.lbl_count.caption:=IntToStr(frmMain.qry_main.recordcount);
   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;



end;

procedure TFrmAdd.btn_closeClick(Sender: TObject);
begin
close;
end;

end.

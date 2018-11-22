unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Menus,ComObj, Excel2000,ClipBrd,
  DB, ADODB;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    dtpk2: TDateTimePicker;
    dtpk1: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    MRB1: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure MRB1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private{ Private declarations }
    v_colwidth: array[0..11] of integer;
    field_name: string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  public{ Public declarations }
   long_datetime,sort_datetime:tdatetime;
   empl_ptr:integer;
  end;

var
  Form1: TForm1;

implementation

uses damo, dispost, report_mrb,common;

{$R *.dfm}

procedure tform1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 rkey414:integer;
begin
 rkey414:=dm.AQ414rkey.Value;
 dm.AQ414.Close;
 dm.AQ414.Open;
 if rkey414>0 then  dm.AQ414.Locate('rkey',rkey414,[]);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  self.field_name := 'number414';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin
if  dm.ADOConnection1.Connected then
 begin

  with dm.adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select getdate() as tdate');
    open;
    self.long_datetime := fieldvalues['tdate'];
    self.sort_datetime := strtodate(datetostr(long_datetime));
    dtpk2.Date:=self.sort_datetime;
    dtpk1.Date:=dtpk2.Date-30;
   end;
  with dm.adoquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    empl_ptr:=fieldvalues['employee_ptr'];
   end;
  dtpk1exit(sender);
  for i:=low(v_colwidth) to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;  
 end;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.AQ414.Close;
 dm.AQ414.Parameters[0].Value := dtpk1.Date;
 dm.AQ414.Parameters[1].Value := dtpk2.Date+1;
 dm.AQ414.Open;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-850)*v_colwidth[i]/825);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(dm.AQ414.SQL.Text);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly=true) and
    (column.FieldName<>self.field_name) then
 begin
  if column.FieldName<>'sys_date' then
  begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  end;
  edit1.SetFocus;
  with dm.AQ414 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.FieldName);
    open;
   end;
 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 dm.AQ414.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
else
 dm.AQ414.Filter:='';
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
begin
form2:=tform2.Create(application);
dm.ADO414.Close;
dm.ADO414.Parameters[0].Value:=null;
dm.ADO414.Open;
dm.ADO414.Append;
dm.ADO414QTY_REWORKED.Value:=0;
dm.ADO414QTY_REMAKED.Value:=0;
dm.ADO414sys_date.Value:=self.long_datetime;
dm.ADO414empl_ptr.Value:=self.empl_ptr;
if form2.ShowModal=mrok then
 begin
  dm.AQ414.Close;
  dm.AQ414.Open;
  dm.AQ414.Filter:='';
  dm.AQ414.Locate('rkey',dm.ADO414rkey.Value,[]);
 end
else
 begin
  dm.ADO414.close;
  dm.ADO99.Close;
 end;
form2.Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
begin
button2click(sender);
if (dm.AQ414QTY_REWORKED.Value<>0) or (dm.AQ414QTY_REMAKED.Value<>0) then
 showmessage('该MRB单已被返工,或投产不能再编辑')
else
begin
form2:=tform2.Create(application);
dm.ADO414.Close;
dm.ADO414.Parameters[0].Value:=dm.AQ414rkey.Value;
dm.ADO414.Open;
dm.ADO414.edit;
if form2.ShowModal=mrok then
 begin
  dm.AQ414.Close;
  dm.AQ414.Open;
  dm.AQ414.Locate('rkey',dm.ADO414rkey.Value,[]);
 end
else
 begin
  dm.ADO414.close;
  dm.ADO99.Close;
 end;
form2.Free;
end;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
form2:=tform2.Create(application);
form2.BitBtn1.Enabled:=false;
form2.DBGrid1.PopupMenu:=form2.PopupMenu2;
form2.Edit1.ReadOnly:=true;
form2.DBmemo1.ReadOnly:=true;
form2.DBEdit5.ReadOnly:=true;
form2.DBEdit6.enabled:=false;
form2.DBEdit7.Enabled:=false;
dm.ADO414.Close;
dm.ADO414.Parameters[0].Value:=dm.AQ414rkey.Value;
dm.ADO414.Open;

if form2.ShowModal=mrok then
 begin

 end;
form2.Free;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if not dm.AQ414.IsEmpty then n3click(sender);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
begin
button2click(sender);
if (dm.AQ414QTY_REWORKED.Value<>0) or (dm.AQ414QTY_REMAKED.Value<>0) then
 showmessage('该MRB单已被返工,或投产不能删除!')
else
if messagedlg('你确认要删除该项记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 dm.ADO414.Close;
 dm.ADO414.Parameters[0].Value:=dm.AQ414rkey.Value;
 dm.ADO414.Open;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select quantity,qty_received,status from data0415');
    sql.Add('where rkey='+dm.ADO414d415_ptr.AsString);
    open;
    edit;
    fieldvalues['qty_received']:=fieldvalues['qty_received']-dm.ADO414qty_rece.Value;
    if fieldvalues['qty_received']<fieldvalues['quantity'] then
     fieldvalues['status']:= 3;
    post;
   end;

 dm.ADO414.Delete;
 dm.AQ414.Close;
 dm.AQ414.Open;
end;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
begin
dm.AQ414.Edit;
dm.AQ414status.Value:=2;
dm.AQ414.Post;
Button2Click(Sender);
end;
end;

procedure TForm1.MRB1Click(Sender: TObject);
begin
  form_report:=tform_report.Create(application);
  form_report.ppReport1.Reset;
  form_report.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'MRB_report.rtm';
  form_report.ppReport1.Template.LoadFromFile;
  form_report.ppReport1.SaveAsTemplate:=false;
  form_report.ppReport1.Print;
  form_report.Free;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ414.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  MRB1.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  n4.Enabled:=true;
  if dm.AQ414status.Value=1 then
   n5.Enabled:=true
  else
   n5.Enabled:=false;
  MRB1.Enabled:=true;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);

 begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption);
 end;
procedure TForm1.Button4Click(Sender: TObject);
begin
  form_report:=tform_report.Create(application);
  form_report.ppReport1.Reset;
  form_report.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'MRB_report.rtm';
  form_report.ppReport1.Template.LoadFromFile;
  form_report.ppReport1.SaveAsTemplate:=false;
  Form_report.ppDesigner1.ShowModal;
  Form_report.Free;
end;

end.

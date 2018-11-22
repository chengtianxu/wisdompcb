unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    user_ptr: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   v_colwidth: array[0..5] of integer;
   file_number:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
    sys_longdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation
 uses damo, shipped_meth, report_r, shipsupp_sql,common;
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


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  if form2.ShowModal=mrok then
   begin
    dm.ADO235.Close;
    dm.ADO235.Open;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADO235.Active=true then
 if dm.ADO235quan_to_ship.Value>0 then
  n1.Enabled := true
 else
  n1.Enabled := false
 else
  n1.Enabled := false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 dm.ADO235.Close;
 dm.ADO235.Open;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin

if dm.ADOConnection1.Connected then
 begin
  dm.ado235.Open;
 for i:=0 to 5 do self.v_colwidth[i]:=dbgrid1.Columns[i].Width;
  with dm.ADOQuery1 do
   begin
    active:=false;     //取服务器时间字段赋值
    sql.Clear;
    sql.Add('select employee_ptr from data0073');
    sql.Add('where rkey='+rkey73);
    active:=true;
    user_ptr.Caption:=fieldbyname('employee_ptr').AsString;
   end;
   with dm.ADOQuery1 do
    begin
     active:=false;     //取服务器时间字段赋值
     sql.Clear;
     sql.Add('select getdate() as serve_date');
     active:=true;
     sys_longdate := fieldvalues['serve_date'];
    end;
 end;
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
  file_number:='DESCRIPTION';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;  
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 form3:=tform3.Create(application);
 dm.adoquery2.Open;
 form3.ShowModal;
 dm.adoquery2.Close;
 form3.Free;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  begin
   showmessage(dm.ADO235.SQL.Text);
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 5 do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-699)*v_colwidth[i]/662);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 dm.ADO235.Filter:=self.file_number+' like ''%'+trim(edit1.text)+'%'''
else
 dm.ADO235.Filter:='';
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly=true) and
   (column.FieldName<>self.file_number) then
 begin
  self.file_number:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  for i:=0 to 5 do
   if dbgrid1.Columns[i].Title.Color=clRed then
    dbgrid1.Columns[i].Title.Color:=clBtnFace;
  column.Title.Color:=clRed;  
 end;
end;

end.

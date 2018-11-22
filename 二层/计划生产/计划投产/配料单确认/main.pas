unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls,
  DateUtils ;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DTPK1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DTPK1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    sys_longdate:string;
    fieldname:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DAMO,common;

{$R *.dfm}

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.ADS492rkey.Value;
 dm.ADS492.Close;
 dm.ADS492.Open;
 dm.ADS492.Locate('rkey',rkey,[]);
end;

procedure TForm1.FormShow(Sender: TObject);
begin

if dm.ADOConnection1.Connected then
 begin
 fieldname:='CUT_NO';
  with dm.adoquery1 do
  begin
   close;
   sql.Text:='select getdate() as sys_date';
   open;
   dtpk2.Date:=dateof(fieldvalues['sys_date']);
   self.sys_longdate:=
   formatdatetime('yyyy-mm-dd HH:mm:ss',fieldvalues['sys_date']);

   dtpk1.Date:=dtpk2.Date-5;
   self.DTPK1Click(sender);
   dm.ADS468.Open;
 end;
end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 dm.ADS492.Filter:=fieldname+' like ''%'+trim(edit1.Text)+'%'''
else
 dm.ADS492.Filter:=''; 
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if fieldname<>dm.ADS492.IndexFieldNames then
dm.ADS492.IndexFieldNames:=fieldname;

if (column.ReadOnly) and (fieldname<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.fieldname:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;

end;

procedure TForm1.DTPK1Click(Sender: TObject);
begin
dm.ADS492.Close;
dm.ADS492.Parameters.ParamValues['dtpk1']:=dtpk1.Date;
dm.ADS492.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
dm.ADS492.Open;
end;

procedure TForm1.N1Click(Sender: TObject);

begin
 if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限',1)
else
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select con_flag from data0492'+#13+
            'where rkey='+dm.ADS492rkey.AsString;
  open;
 end;
if dm.ADOQuery1.FieldByName('con_flag').AsInteger<>0 then
  showmsg('配料单状态不正确,可能多人同进确认!',1)
else
if dm.ADS492tstatus.Value=1 then
 messagedlg('该批投产因超投或补料没有审核!请先审核再确认!',mtinformation,[mbcancel],0)
else
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='update data0492'+#13+
            'set con_flag=2,'+#13+
            'con_user_ptr='''+user_ptr+''','+#13+
            'con_date='''+self.sys_longdate+''''+#13+
            'where rkey='+dm.ADS492rkey.AsString;
  ExecSQL;
 end;

 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='update data0468'+#13+
            'set STATUS=0'+#13+
            'where CUT_NO='''+dm.ADS492CUT_NO.Value+'''';
  ExecSQL;
 end;

self.BitBtn3Click(sender);
end;
end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if not dm.ADS492.IsEmpty then
 if dm.ADS492DSDesigner.Value='未确认' then
 begin
  n1.Enabled:=true;
  n2.Enabled:=false;
 end
 else
 begin
  n1.Enabled:=false;
  n2.Enabled:=true;
 end
else
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 ff_ISSUED:boolean;
begin
if (vprev = '1') or (vprev = '3') then
 showmsg('你只有检查权限',1)
else
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select rkey from data0468 where CUT_NO='+quotedstr(dm.ADS492CUT_NO.Value)+
              'and ((QUAN_ISSUED>0) or (quan_alloc>0))';
    open;
  end;

 ff_ISSUED:=not dm.ADOQuery1.IsEmpty;

if ff_ISSUED then
 showmsg('配额明细已产生发料或者分配记录无法取消确认!',1)
else
 with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='update data0492'+#13+
              'set con_flag=0,'+#13+
              'con_user_ptr='''+user_ptr+''','+#13+
              'con_date='''+self.sys_longdate+''''+#13+
              'where rkey='+dm.ADS492rkey.AsString;
    ExecSQL;
    self.BitBtn3Click(sender);
  end;

end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;
 self.caption:=application.Title;
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmsg(dm.ADS492.CommandText,1);
end;

procedure TForm1.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmsg(dm.ADS468.CommandText,1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not dm.ADS492.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_DBGrid_to_Excel(self.DBGrid1,self.Caption);
end;

end.

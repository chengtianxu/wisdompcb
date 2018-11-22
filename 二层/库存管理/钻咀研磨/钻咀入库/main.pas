unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, ExtCtrls, DBGridEh, Grids, DBGrids;

type
  TForm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    CheckBox0: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    sql_text:string;
    grid_colwith:integer;
    v_colwidth1,v_colwidth2: array of integer;
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses damo,common, condition, detail;

{$R *.dfm}

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

procedure TForm_main.BitBtn3Click(Sender: TObject);
var
 v_rkey: integer;
begin
v_rkey := 0;
if not dm.ADS219.IsEmpty then  v_rkey := dm.ADS219RKEY.Value;
 dm.ADS219.Close;
 dm.ADS219.Open;
if v_rkey > 0 then  dm.ADS219.Locate('rkey',v_rkey,[]);
end;

procedure TForm_main.BitBtn4Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm_main.BitBtn2Click(Sender: TObject);
var i:byte;
begin
 with form_condition do
 begin
  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ADS219.Parameters.ParamValues['dtpk1']));
  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ADS219.Parameters.ParamValues['dtpk2']))-1;
  if ShowModal=mrok then
   with dm.ADS219 do
   begin
     close;
     CommandText:=self.sql_text;
     for i:=1 to form_condition.SGrid1.RowCount-2 do
       CommandText:=CommandText+form_condition.SGrid1.Cells[2,i]+#13;
     Parameters.ParamValues['dtpk1']:=strtodate(formatdatetime('yyyy-mm-dd',form_condition.dtpk1.Date));
     Parameters.ParamValues['dtpk2']:=strtodate(formatdatetime('yyyy-mm-dd',form_condition.dtpk2.Date))+1;
     open;
   end;
 end;
end;

procedure TForm_main.FormShow(Sender: TObject);
var
 i:integer;
 curr_date:tdatetime;
begin
if  dm.ADOConnection1.Connected then
 begin
  curr_date := getsystem_date(dm.adoquery1,1);
  dm.ADS219.Close;
  dm.ADS219.Parameters.ParamByName('dtpk1').Value:=curr_date;
  dm.ADS219.Parameters.ParamByName('dtpk2').Value:=curr_date+1;
  dm.ADS219.Open;
  dm.ADS220.Open;
  sql_text := dm.ADS219.CommandText;
  PreColumn := DBGridEH1.Columns[0];

  grid_colwith:=dbgrid1.Width;
 setlength(v_colwidth1,DBGridEh1.FieldCount);
 setlength(v_colwidth2,dbgrid1.FieldCount);

for i:=0 to high(v_colwidth1) do v_colwidth1[i] := DBGridEh1.Columns[i].Width;
for i:=0 to high(v_colwidth2) do v_colwidth2[i] := dbgrid1.Columns[i].Width;
 end;
end;

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS219.CommandText);
end;

procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS219.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS219.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_main.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dm.ADS219.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else dm.ADS219.filter := '';
end;

procedure TForm_main.CheckBox0Click(Sender: TObject);
begin
dm.ADS219.Close;
if CheckBox0.Checked then
 dm.ADS219.Parameters[2].Value:=9
else
 dm.ADS219.Parameters[2].Value:=0;

if checkbox1.Checked then
 dm.ADS219.Parameters[3].Value:=9
else
 dm.ADS219.Parameters[3].Value:=1;

if checkbox2.Checked then
 dm.ADS219.Parameters[4].Value:=9
else
 dm.ADS219.Parameters[4].Value:=2;

if checkbox3.Checked then
 dm.ADS219.Parameters[5].Value:=9
else
 dm.ADS219.Parameters[5].Value:=3;

if checkbox4.Checked then
 dm.ADS219.Parameters[6].Value:=9
else
 dm.ADS219.Parameters[6].Value:=4;

dm.ADS219.Open;
end;

procedure TForm_main.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth1) to high(v_colwidth1) do
 DBGridEh1.Columns[i].Width:=v_colwidth1[i]+
  round((DBGridEh1.Width-grid_colwith)*v_colwidth1[i]/(grid_colwith-28));

for i:=low(v_colwidth2) to high(v_colwidth2) do
 dbgrid1.Columns[i].Width:=v_colwidth2[i]+
  round((dbgrid1.Width-grid_colwith)*v_colwidth2[i]/(grid_colwith-28));

end;

procedure TForm_main.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
try
form_detail:=tform_detail.create(application);
form_detail.aded_flag:=1;
if form_detail.showmodal=mrok then
 begin
  dm.ADS219.Close;
  dm.ADS219.Open;
  dm.ADS219.Locate('rkey',dm.ADOQuery1.FieldByName('rkey').Value,[])
 end;
finally
  form_detail.free;
end;
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  user_ptr:='3';
//  vprev:='4';
end;

procedure TForm_main.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
if dm.find_qtyerror(dm.ADS219RKEY.Value) then
 showmsg('库存数据发生变化不允许编辑',1)
else
try
form_detail:=tform_detail.create(application);
form_detail.aded_flag:=2;
if form_detail.showmodal=mrok then
 begin
  dm.ADS219.Close;
  dm.ADS219.Open;
  dm.ADS219.Locate('rkey',dm.ADOQuery1.FieldByName('rkey').Value,[])
 end;
finally
  form_detail.free;
end;
end;

procedure TForm_main.N4Click(Sender: TObject);
begin
try
form_detail:=tform_detail.create(application);
with  form_detail do
 begin
  aded_flag:=3;
  edit2.Enabled:=false;
//  edit5.Enabled:=false;
  bitbtn1.Enabled:=false;
  strgrid1.PopupMenu:=nil;
  dtpk1.Enabled:=false;
  dtpkt1.Enabled:=false;
 end;
if form_detail.showmodal=mrok then
 begin

 end;
finally
  form_detail.free;
end;
end;

procedure TForm_main.PopupMenu2Popup(Sender: TObject);
begin
n4.Enabled:=not dm.ADS219.IsEmpty;
n2.Enabled:=((dm.ADS219TTYPE.Value=0) and (not dm.ADS219.IsEmpty));
n3.Enabled:=n2.Enabled;
end;

procedure TForm_main.N3Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
 if Msg_Dlg_Ask('你真的确定要删除直接入库记录吗?','删除确认',2) then
  if dm.find_qtyerror(dm.ADS219RKEY.Value) then
   showmsg('库存数据发生变化不允许删除',1)
  else
  begin
  try
  dm.ADOConnection1.BeginTrans;
  with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='delete data0219 '+
            'where rkey='+inttostr(dm.ADS219RKEY.Value);
    ExecSQL;
   end;
  dm.ADOConnection1.CommitTrans;
  showmsg('删除操作成功',1);
   BitBtn3Click(nil);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
  end;
end;

end.

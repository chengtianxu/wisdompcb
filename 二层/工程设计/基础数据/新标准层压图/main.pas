unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    MAdd: TMenuItem;
    Medit: TMenuItem;
    Mcopy: TMenuItem;
    Mview: TMenuItem;
    Mdelete: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MAddClick(Sender: TObject);
    procedure MeditClick(Sender: TObject);
    procedure MviewClick(Sender: TObject);
    procedure MdeleteClick(Sender: TObject);
    procedure McopyClick(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, layer_list;

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

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
 self.Caption:=application.Title;
 
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  dm.ADS193.Open;
  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.ADS193.IndexFieldNames) then
 dm.ADS193.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADS193.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADS193.filter := ''
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.ADS193RECORD_KEY.Value;
 dm.ADS193.Close;
 dm.ADS193.Open;
if rkey>0 then  dm.ADS193.Locate('RECORD_KEY',rkey,[]);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption)
end;

procedure TForm1.MAddClick(Sender: TObject);
var
 rkey:integer;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
with Tform2.Create(application) do
try
 rkey:=dm.ADS193RECORD_KEY.Value;
 dm.ADS193.Append;
 dm.ADS193SPEC_RKEY.Value:='N';
 if ShowModal=mrok then
 begin
  rkey:=dm.ADS193RECORD_KEY.Value;
  DM.ADS193.Close;
  DM.ADS193.Open;
   if rkey>0 then
   dm.ADS193.Locate('RECORD_KEY',rkey,[])
 end
 else
  begin
   dm.ADS193.Cancel;
   if rkey>0 then
   dm.ADS193.Locate('RECORD_KEY',rkey,[])
  end;
finally
 free;
end;
end;

procedure TForm1.MeditClick(Sender: TObject);
var
 rkey:integer;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
with Tform2.Create(application) do
try
 rkey:=dm.ADS193RECORD_KEY.Value;
 dm.ADS193.Edit;
 if ShowModal=mrok then
 begin
  DM.ADS193.Close;
  DM.ADS193.Open;
  if rkey>0 then
   dm.ADS193.Locate('RECORD_KEY',rkey,[])
 end
 else
  begin
   dm.ADS193.Cancel;
   if rkey>0 then
   dm.ADS193.Locate('RECORD_KEY',rkey,[])
  end;
finally
 free;
end;
end;

procedure TForm1.MviewClick(Sender: TObject);
begin
with Tform2.Create(application) do
try
 bitbtn1.Enabled:=false;
 dbedit1.ReadOnly:=true;
 dbedit2.ReadOnly:=true;
 dbedit3.ReadOnly:=true;
 DBCheckBox1.ReadOnly:=true;
 DBMemo1.ReadOnly:=true;
 dbmemo1.PopupMenu:=nil;
 if ShowModal=mrok then
 begin

 end
 else
  begin

  end;
finally
 free;
end;
end;

procedure TForm1.MdeleteClick(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('您确定要删除该条记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
TRY
 dm.ADOConnection1.BeginTrans;
 dm.ADS193.Delete;
 dm.ADOConnection1.CommitTrans;
 showmsg('删除操作成功',1);
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

procedure TForm1.McopyClick(Sender: TObject);
var
 v_recode:array of variant;
 i:word;
 rkey:integer;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
with Tform2.Create(application) do
try
 rkey:=dm.ADS193RECORD_KEY.Value;
 setlength(v_recode,dm.ADS193.FieldCount);
  for i:=low(v_recode) to high(v_recode) do
  v_recode[i]:=dm.ADS193.Fields[i].Value; //读到数组中

 dm.ADS193.Append;
  for i:=low(v_recode)+2 to high(v_recode)-1 do
  dm.ADS193.fieldvalues[dm.ADS193.Fields[i].FieldName]:=v_recode[i];

 if ShowModal=mrok then
 begin
  rkey:=dm.ADS193RECORD_KEY.Value;
  DM.ADS193.Close;
  DM.ADS193.Open;
   if rkey>0 then
   dm.ADS193.Locate('RECORD_KEY',rkey,[])
 end
 else
  begin
   dm.ADS193.Cancel;
   if rkey>0 then
   dm.ADS193.Locate('RECORD_KEY',rkey,[])
  end;
finally
 free;
end;



end;

end.

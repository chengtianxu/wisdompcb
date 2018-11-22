unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus, ImgList;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ImageList1: TImageList;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure append_deptcode(ttype:string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, edit_deptcode;

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
 rkey:=dm.ADS34rkey.Value;
 dm.ads34.Close;
 dm.ads34.Open;
if rkey>0 then  dm.ads34.Locate('rkey',rkey,[]);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption)
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
  dm.ADS34.Open;
  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.ADs34.IndexFieldNames) then
 dm.ADs34.IndexFieldNames:=column.FieldName;

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

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADs34.CommandText)
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if radiogroup1.ItemIndex=2 then
 if trim(Edit1.text)<>'' then
  dm.ads34.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ads34.filter := ''
else
 if trim(Edit1.text)<>'' then
  dm.ads34.Filter :='vttype='+QuotedStr(radiogroup1.Items[radiogroup1.ItemIndex])
  +' and '+field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ads34.Filter :='vttype='+QuotedStr(radiogroup1.Items[radiogroup1.ItemIndex]);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
with Tform2.Create(application) do
try
 dm.AQ34.Close;
 dm.AQ34.Parameters[0].Value:=dm.ADS34rkey.Value;
 dm.AQ34.Open;
 dm.AQ34.Edit;
 if ShowModal=mrok then
  begin
   dm.ADS34.Close;
   dm.ADS34.Open;
   dm.ADS34.Locate('rkey',dm.AQ34rkey.Value,[]);
  end
 else
  begin
   dm.AQ34.Cancel;
  end;
finally
 form2.Free;
 dm.AQ34.Close;
end;
end;

procedure TForm1.append_deptcode(ttype:string);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
with Tform2.Create(application) do
try
 dm.AQ34.Close;
 dm.AQ34.Parameters[0].Value:=dm.ADS34rkey.Value;
 dm.AQ34.Open;
 dm.AQ34.Append;
 dm.aq34ttype.Value:=ttype;
 dm.AQ34PCS_AS_UNIT.Value:=0;
 dm.AQ34OUT_SOURCE.Value:=0;
 dm.AQ34ACTIVE_FLAG.Value:=0;
 if ShowModal=mrok then
  begin
   dm.ADS34.Close;
   dm.ADS34.Open;
   dm.ADS34.Locate('rkey',dm.AQ34rkey.Value,[]);
  end
 else
  begin
   dm.AQ34.Cancel;
  end;
finally
 form2.Free;
dm.AQ34.Close;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 append_deptcode('4');
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 append_deptcode('5');
end;

procedure TForm1.N3Click(Sender: TObject);
begin
with Tform2.Create(application) do
try
 dm.AQ34.Close;
 dm.AQ34.Parameters[0].Value:=dm.ADS34rkey.Value;
 dm.AQ34.Open;
 bitbtn1.Enabled:=false;
 bitbtn3.Enabled:=false;
 bitbtn5.Enabled:=false;
 edit1.Enabled:=false;
 edit2.Enabled:=false;
 dbedit1.ReadOnly:=true;
 dbedit2.ReadOnly:=true;
 dbedit3.ReadOnly:=true;
 dbedit4.ReadOnly:=true;
 dbedit5.ReadOnly:=true;
 dbcheckbox1.ReadOnly:=true;
 dbcheckbox2.ReadOnly:=true;
 dbcheckbox3.ReadOnly:=true;
 if ShowModal=mrok then
  begin

  end;
finally
 form2.Free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('您确定要删除该条记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
TRY
 dm.ADOConnection1.BeginTrans;
 dm.AQ34.Close;
 dm.AQ34.Parameters[0].Value:=dm.ADS34rkey.Value;
 dm.AQ34.Open; 
 dm.AQ34.Delete;
 dm.ADOConnection1.CommitTrans;
 showmsg('删除操作成功',1);
 dm.ADS34.Close;
 dm.ADS34.Open;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADS34.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.Enabled:=true;
  end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ads34.IsEmpty then n3click(sender);
end;

end.

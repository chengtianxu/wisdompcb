unit uPuau;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Mask, DBCtrls, ComCtrls, ToolWin,
  Menus,DB, ExtCtrls;

type
  TfrmPuau = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    procedure save265();
    
  public
    _265New:boolean;//1新增,2编辑,3复制
    _264New:integer;
    function Check264(const pCode:string):boolean;
    procedure AddString();
    { Public declarations }
  end;

var
  frmPuau: TfrmPuau;

implementation

uses uMain, uUauEmp, uDm;

{$R *.dfm}
//检查重复
function TfrmPuau.Check264(const pCode:string):boolean;
begin
 dm.Query.Close;
 dm.Query.SQL.Text:='select * from data0264 where code='''+pCode+'''';
 dm.Query.Open;
 if dm.Query.RecordCount>0 then
  result:=true
 else
  result:=false
end;
//新增string
procedure TfrmPuau.AddString();
var
 i:integer;
begin
 with dm.DS265 do
  begin
   Close;
   Parameters[0].Value :=dm.DS264.Fieldbyname('rkey').Value;
   Open;
   i:=1;
   while not eof do
    begin
     dm.Query.Close;
     dm.Query.SQL.Text :='select USER_LOGIN_NAME as user_id,user_full_name'+#13
      +' from data0073 where rkey ='+dm.DS265.fieldbyname('user_ptr').AsString;
     dm.Query.Open;
     stringgrid1.Cells[0,i] := dm.Query.FieldValues['user_id'];
     stringgrid1.Cells[1,i] := dm.Query.FieldValues['user_full_name'];
     stringgrid1.Cells[2,i] := formatfloat('0.00',fieldvalues['lower_limit']);
     stringgrid1.Cells[3,i] := formatfloat('0.00',fieldvalues['upper_limit']);
     stringgrid1.Cells[4,i] := fieldvalues['user_ptr'];
     stringgrid1.RowCount := stringgrid1.RowCount+1;
     inc(i); //i:=i+1
     next;
    end;
  end;
end;

procedure TfrmPuau.save265();//保存265
var
 i:byte;
begin
 if _264New=2 then
  begin

    dm.Query.Close;
    dm.Query.SQL.Text:='delete from data0265 where AUTH_GROUP_PTR='+dm.DS264.Fieldbyname('rkey').AsString;
    dm.Query.ExecSQL;

  end;
 if _264New=1 then
  begin
   dm.DS265.Close ;
   dm.DS265.Parameters.ParamValues['vrkey']:=0;
   dm.DS265.Open ;

  end;

 for i:=1 to stringgrid1.RowCount-2 do
  begin
   with dm.DS265 do
    begin
     append;
     fieldvalues['auth_group_ptr'] := dm.DS264.FieldValues['RKEY'];           //审批代码
     fieldbyname('user_ptr').AsString := stringgrid1.Cells[4,i];
     fieldbyname('lower_limit').AsString := stringgrid1.Cells[2,i];
     fieldbyname('upper_limit').AsString := stringgrid1.Cells[3,i];
     post;
    end;
   end;

end;
procedure TfrmPuau.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0] := '审批人代码';
 stringgrid1.Cells[1,0] := '审批人姓名';
 stringgrid1.Cells[2,0] :='基价折让率%(上线)';
 stringgrid1.Cells[3,0] :='基价折让率%(下线)';
 if _264New=2  then  AddString;

end;
//新增
procedure TfrmPuau.N1Click(Sender: TObject);
var
 i:integer;
begin
 try
  frmAuEmp:=TfrmAuEmp.Create(application);
  if frmAuEmp.ShowModal=mrok then
   begin
   if stringgrid1.RowCount>2 then
    begin
    for i := 1 to stringgrid1.RowCount-2 do //比较是否重复
    if comparetext(stringgrid1.Cells[0,i],trim(frmAuEmp.Edit1.Text))=0 then
     begin
      messagedlg('用户重复!',mtwarning,[mbcancel],0);
      break;
     end
    else  //不重复
     if i=stringgrid1.RowCount-2 then
      begin
       stringgrid1.Cells[0,stringgrid1.RowCount-1] := frmAuEmp.Edit1.Text;
       stringgrid1.Cells[1,stringgrid1.RowCount-1] := frmAuEmp.Label4.Caption;
       stringgrid1.Cells[2,stringgrid1.RowCount-1] := frmAuEmp.Edit2.Text;
       stringgrid1.Cells[3,stringgrid1.RowCount-1] := frmAuEmp.Edit3.Text;
       stringgrid1.Cells[4,stringgrid1.RowCount-1] := frmAuEmp._UID;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
      end;
     end
   else
    begin
     stringgrid1.Cells[0,stringgrid1.RowCount-1] := frmAuEmp.Edit1.Text;
     stringgrid1.Cells[1,stringgrid1.RowCount-1] := frmAuEmp.Label4.Caption;
     stringgrid1.Cells[2,stringgrid1.RowCount-1] := frmAuEmp.Edit2.Text;
     stringgrid1.Cells[3,stringgrid1.RowCount-1] := frmAuEmp.Edit3.Text;
     stringgrid1.Cells[4,stringgrid1.RowCount-1] := frmAuEmp._UID;
     stringgrid1.RowCount:=stringgrid1.RowCount+1;
    end;

   end;
 frmAuEmp.free;
 except
  on E: Exception do
   begin
     frmAuEmp.free;
     messagedlg(E.Message,mtinformation,[mbok],0);
   end;
 end;

end;
//编辑
procedure TfrmPuau.N2Click(Sender: TObject);

begin
 try
  frmAuEmp:=TfrmAuEmp.Create(application);
  frmAuEmp.Edit1.Text := stringgrid1.Cells[0,stringgrid1.row];
  frmAuEmp.Edit1.Font.Color := clwindowtext;
  frmAuEmp.Label4.Caption := stringgrid1.Cells[1,stringgrid1.row];
  frmAuEmp.Edit2.Text := stringgrid1.Cells[2,stringgrid1.row];
  frmAuEmp.Edit3.Text := stringgrid1.Cells[3,stringgrid1.row];
  frmAuEmp._UID := stringgrid1.Cells[4,stringgrid1.row];
  if frmAuEmp.ShowModal=mrok then
   begin
   {for i := 1 to stringgrid1.RowCount-2 do //比较是否重复
    if i <> stringgrid1.Row then
    if comparetext(stringgrid1.Cells[0,i],trim(frmAuEmp.Edit1.Text))=0 then
     begin
      messagedlg('用户重复!',mtwarning,[mbcancel],0);
      exit;
     end;}
    stringgrid1.Cells[0,stringgrid1.row] := frmAuEmp.Edit1.Text;
    stringgrid1.Cells[1,stringgrid1.row] := frmAuEmp.Label4.Caption;
    stringgrid1.Cells[2,stringgrid1.row] := frmAuEmp.Edit2.Text;
    stringgrid1.Cells[3,stringgrid1.row] := frmAuEmp.Edit3.Text;
    stringgrid1.Cells[4,stringgrid1.row] := frmAuEmp._UID;
   end;
 finally
  frmAuEmp.free;
 end;
end;
//删除
procedure TfrmPuau.N3Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;

  end;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;
//保存
procedure TfrmPuau.BitBtn1Click(Sender: TObject);
begin
 if (_264New=1) OR (_264New=3) then
   begin
    if Check264(trim(edit1.Text)) then
     begin
       Messagedlg('代码重复！',mtwarning,[mbcancel],0);
       exit;
     end;
   end;

 if trim(Edit1.Text)='' then
  begin
   messagedlg('代码不能为空！',mtwarning,[mbcancel],0);
   exit;
  end;
 dm.Conn.BeginTrans;
 if _264New=1 then
  begin
   dm.DS264.Append;
   dm.DS264.FieldValues['QTE_APPROV_DESC']:=trim(edit2.text);
   dm.DS264.FieldValues['CODE']:=trim(edit1.text);
  end;

 if _264New=2 then
  begin
   dm.DS264.FieldValues['QTE_APPROV_DESC']:=trim(edit2.text);
   dm.DS264.FieldValues['CODE']:=trim(edit1.text);
  end;
 if _264New=3 then
  begin
   dm.DS264.Append;
   dm.DS264.FieldValues['QTE_APPROV_DESC']:=trim(edit2.text);
   dm.DS264.FieldValues['CODE']:= trim(edit1.text);
  end;
//============================================================================
 if (_264New=1) OR (_264New=2) or (_264New=3)  then     //新增,编辑,复制
   try

    dm.DS264.Post;
    save265;
    dm.Conn.CommitTrans;
    //ToolButton1.Enabled:=false;
   except
    on E: Exception do
     begin
      showmessage(e.Message);
      dm.Conn.RollbackTrans;
      edit1.SetFocus;
      exit;
     end;
   end;
  close;
end;
//退出
procedure TfrmPuau.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPuau.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  StringGrid1.MouseToCell(x,y,column,row);
  if row<>0 then StringGrid1.Row:=row;
  StringGrid1.Col:=column;
 end;

end;

procedure TfrmPuau.PopupMenu1Popup(Sender: TObject);
begin
if StringGrid1.Row <> StringGrid1.RowCount-1 then
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
 end 
else
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end;
end;

end.

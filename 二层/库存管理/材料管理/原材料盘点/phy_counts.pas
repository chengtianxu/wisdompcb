unit phy_counts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Mask, DBCtrls, Menus, DB, ADODB,ComObj,Excel2000;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SGrid2: TStringGrid;
    SGrid3: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rkey05: TLabel;
    empl_name: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Button4: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SGrid1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    newrow,newcol:integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses damo, main, employee_search, invt_insert,common;
{$R *.dfm}

procedure TForm4.FormActivate(Sender: TObject);
var
 i:integer;
begin
 sgrid1.Cells[0,0]:='类别';
 sgrid1.Cells[1,0]:='材料代码';
 sgrid1.Cells[2,0]:='名称规格';
 sgrid1.Cells[3,0]:='位置';
 sgrid1.Cells[4,0]:='供应商';
 sgrid1.Cells[5,0]:='清点人员';
 sgrid1.Cells[6,0]:='现有库存';
 sgrid1.Cells[7,0]:='清点数量';
 sgrid1.Cells[8,0]:='盘点菲号';
 sgrid1.Cells[9,0]:='入库备注';


 sgrid2.Cells[0,0]:='RKEY93';
 sgrid2.Cells[1,0]:='rkey22';
 sgrid2.Cells[2,0]:='rkey05';

with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select employee_ptr,employee_name from data0005,data0073');
  sql.Add('where data0073.employee_ptr=data0005.rkey and');
  sql.Add('data0073.rkey='+rkey73);
  open;
  rkey05.Caption:=fieldbyname('employee_ptr').AsString;
  empl_name.Caption:=fieldvalues['employee_name'];
 end;

i:=1;
dm.AQ93.First;
 sgrid1.RowCount:=dm.aq93.RecordCount+2;
 sgrid2.RowCount:=dm.aq93.RecordCount+2;
 if dm.aq93.IsEmpty then button1.Enabled:=false;
while not dm.AQ93.Eof do
 begin
  sgrid1.Cells[0,i]:=dm.AQ93GROUP_NAME.Value;
  sgrid1.Cells[1,i]:=dm.AQ93INV_PART_NUMBER.Value;
  sgrid1.Cells[2,i]:=dm.AQ93INV_PART_DESCRIPTION.Value;
  sgrid1.Cells[3,i]:=dm.AQ93LOCATION.Value;
  sgrid1.Cells[4,i]:=dm.AQ93abbr_name.Value;
  sgrid1.Cells[5,i]:=dm.AQ93EMPLOYEE_NAME.Value;
  sgrid1.Cells[6,i]:=formatfloat('0.0000',dm.AQ93OLD_QUANTITY.Value);
  if dm.AQ93QUANTITY.Value>=0 then //030728修改原来判断条件为'>0'
   sgrid1.Cells[7,i]:=formatfloat('0.0000',dm.AQ93QUANTITY.Value);
  sgrid1.Cells[8,i]:= dm.AQ93check_no.Value;
  sgrid1.Cells[9,i]:=dm.AQ93BARCODE_ID.Value;

  sgrid2.Cells[0,i]:=dm.AQ93RKEY.AsString;
  sgrid2.Cells[1,i]:=dm.AQ93rkey22.AsString;
  if dm.AQ93COUNTED_BY_EMPL_PTR.AsVariant<>null then
   sgrid2.Cells[2,i]:=dm.AQ93COUNTED_BY_EMPL_PTR.AsString;
  inc(i);      //i:=i+1;
  dm.AQ93.Next;
 end;

end;

procedure TForm4.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
{if acol=9 then
 begin
  sgrid1.Canvas.Brush.Color:= clscrollbar;
  sgrid1.Canvas.FillRect(rect);
  Sgrid1.Canvas.TextRect(rect,rect.left,rect.Top, Sgrid1.Cells[acol,aRow]);
 end;
}
if (acol=6) or (acol=7) then       //右对齐
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])-2,
             rect.Top+2, Sgrid1.Cells[acol,aRow]);

if (arow >= 1) and (arow <> sgrid1.RowCount-1) then
 if arow=newrow then
  begin
   if acol=newcol then
    begin
     Sgrid1.Canvas.Brush.Color := clred;
     Sgrid1.Canvas.FrameRect(rect);
    end
   else
    begin
     Sgrid1.Canvas.Brush.Color := clblue;
     Sgrid1.Canvas.FrameRect(rect);
    end;
  end;

end;

procedure TForm4.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
 sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
end;

procedure TForm4.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col=7 then
 if not (key in ['0'..'9','.',#8,#13]) then abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[7,sgrid1.row])>0 then abort;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 begin
  n1.Enabled:=false;
  n4.Enabled:=false;
 end
else
 begin
  n1.Enabled:=true;
  n4.Enabled:=true;
 end;
end;

procedure TForm4.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (trim(sgrid1.Cells[7,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])='') then
 begin
  sgrid1.Cells[5,sgrid1.row]:=empl_name.Caption; //清单人员姓名
  sgrid2.Cells[2,sgrid1.row]:=rkey05.Caption;    //清点人员指针
  sgrid1.Cells[7,sgrid1.row]:=formatfloat('0.0000',strtofloat(sgrid1.Cells[7,sgrid1.row]));
 end
else
 if (trim(sgrid1.Cells[7,sgrid1.row])='') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
 begin
  sgrid1.Cells[5,sgrid1.row]:='';
  sgrid2.Cells[2,sgrid1.row]:='';
 end
 else
 if (trim(sgrid1.Cells[7,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
  sgrid1.Cells[7,sgrid1.row]:=formatfloat('0.0000',strtofloat(sgrid1.Cells[7,sgrid1.row]));


 if ((acol=7) or (acol=8)) and (ARow<>sgrid1.RowCount-1) then
  sgrid1.Options:= sgrid1.Options+[goediting]
 else
  sgrid1.Options:= sgrid1.Options-[goediting];

 newrow:=arow;
 newcol:=acol;
 sgrid1.Refresh;

end;

procedure TForm4.N1Click(Sender: TObject);
var
 i:integer;
begin
 sgrid3.Cells[0,sgrid3.RowCount-1]:=sgrid2.Cells[0,sgrid1.row];
 sgrid3.RowCount:=sgrid3.RowCount+1;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
   sgrid2.Rows[i].Text:=sgrid2.Rows[i+1].Text;
  end;
  sgrid1.RowCount:=sgrid1.RowCount-1;
  sgrid2.RowCount:=sgrid2.RowCount-1;
  if sgrid1.RowCount=2 then button1.Enabled:=false;
end;

procedure TForm4.N4Click(Sender: TObject);
begin
 try
  form_employee := tform_employee.Create(application);
  if form_employee.ShowModal = mrok then
   begin
    rkey05.Caption := form_employee.ADOQuery1.fieldbyname('rkey').AsString;
    empl_name.Caption := form_employee.ADOQuery1.fieldbyname('employee_name').AsString;
    if sgrid1.Cells[5,sgrid1.row]<>'' then
     begin
      sgrid1.Cells[5,sgrid1.row] := empl_name.Caption;
      sgrid2.Cells[2,sgrid1.row] := rkey05.Caption;
     end;
   end;
 finally
  form_employee.free;
 end;
end;

procedure TForm4.SGrid1Exit(Sender: TObject);
begin
if (trim(sgrid1.Cells[7,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])='') then
 begin
  sgrid1.Cells[5,sgrid1.row]:=empl_name.Caption; //清单人员姓名
  sgrid2.Cells[2,sgrid1.row]:=rkey05.Caption;    //清点人员指针
  sgrid1.Cells[7,sgrid1.row]:=formatfloat('0.0000',strtofloat(sgrid1.Cells[7,sgrid1.row]));
 end
else
 if (trim(sgrid1.Cells[7,sgrid1.row])='') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
 begin
  sgrid1.Cells[5,sgrid1.row]:='';
  sgrid2.Cells[2,sgrid1.row]:='';
 end
 else
  if (trim(sgrid1.Cells[7,sgrid1.row])<>'') and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
  sgrid1.Cells[7,sgrid1.row]:=formatfloat('0.0000',strtofloat(sgrid1.Cells[7,sgrid1.row]));

end;

procedure TForm4.N2Click(Sender: TObject);
begin
try
 form5:=tform5.Create(application);
 if form5.ShowModal=mrok then
  begin
   dm.ADO93.Append;
   dm.ADO93PHY_LIST_PTR.Value:=dm.ADO92RKEY.Value;
   dm.ADO93QUANTITY.Value:=-2;
   dm.ADO93INVENTORY_PTR.AsString:=form5.rkey17.Caption;
   dm.ADO93INV_TRAN_PTR.AsString:=form5.rkey22.Caption;
   dm.ADO93LOCATION_PTR.AsString:=form5.rkey16.Caption;
   dm.ADO93.Post;
 sgrid1.Cells[0,0]:='类别';
 sgrid1.Cells[1,0]:='材料代码';
 sgrid1.Cells[2,0]:='名称规格';
 sgrid1.Cells[3,0]:='位置';
 sgrid1.Cells[4,0]:='供应商';
 sgrid1.Cells[5,0]:='清点人员';
 sgrid1.Cells[6,0]:='现有库存';
 sgrid1.Cells[7,0]:='清点数量';
 sgrid1.Cells[8,0]:='盘点菲号';
 sgrid1.Cells[9,0]:='入库备注';

  sgrid1.Cells[0,sgrid1.RowCount-1]:=form5.Edit8.Text;
  sgrid1.Cells[1,sgrid1.RowCount-1]:=form5.Edit1.Text;
  sgrid1.Cells[2,sgrid1.RowCount-1]:=form5.Label9.Caption;

  sgrid1.Cells[3,sgrid1.RowCount-1]:=form5.Edit3.Text;
  sgrid1.Cells[4,sgrid1.RowCount-1]:=form5.supp_name;
  sgrid1.Cells[5,sgrid1.RowCount-1]:=form5.Label8.Caption;
  sgrid1.Cells[6,sgrid1.RowCount-1]:=form5.Edit5.Text;
  sgrid1.Cells[7,sgrid1.RowCount-1]:=form5.Edit6.Text;
  sgrid1.Cells[9,sgrid1.RowCount-1]:=form5.Edit4.Text;

  sgrid2.Cells[0,sgrid1.RowCount-1]:=dm.ADO93RKEY.AsString;
  sgrid2.Cells[1,sgrid1.RowCount-1]:=form5.rkey22.Caption;
  sgrid2.Cells[2,sgrid1.RowCount-1]:=form5.rkey05.Caption;

  sgrid1.RowCount:=sgrid1.RowCount+1;
  sgrid2.RowCount:=sgrid2.RowCount+1;
  end;
finally
 form5.free;
end;

end;

procedure TForm4.Button1Click(Sender: TObject);
var
 i:integer;
 search_option:tlocateoptions;
begin
 dm.ADO93.Close;
 dm.ADO93.Open;
 search_option := [lopartialkey];
 dm.ADOConnection1.BeginTrans;
 try
 for i:=1 to sgrid2.RowCount-2 do
  begin
   DM.ADO93.First;
   if dm.ADO93.Locate('rkey',strtoint(sgrid2.Cells[0,i]),[]) then
   if trim(sgrid1.Cells[7,i])<>'' then
    begin
     dm.ADO93.Edit;
     dm.ADO93quantity.AsString:=sgrid1.Cells[7,i];
     dm.ADO93USER_PTR.AsString:=rkey73;
     dm.ADO93ENTERED_BY_EMPL_PTR.Value:=StrToInt(common.user_ptr);
     dm.ADO93COUNTED_BY_EMPL_PTR.AsString:=sgrid2.Cells[2,i];
     dm.ADO93check_no.Value:=sgrid1.Cells[8,i];
     dm.ADO93status.Value:=1;
     dm.ADO93.post;
    end;
  end;                                     //上面编辑盘点清单
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if sgrid3.RowCount>2 then                 //下面是删除盘点清单
 for i:=1 to sgrid3.RowCount-2 do
  begin
   dm.ADO93.Locate('rkey',strtoint(sgrid3.Cells[0,i]),search_option);
   dm.ADO93.Edit;
   dm.ADO93status.Value:=2;
   dm.ADO93.Post;
  end;

 dm.ADOConnection1.CommitTrans;
except
 dm.ADOConnection1.RollbackTrans;
 SHOWMESSAGE('数据保存没有成功请速与管理员联系');
end;

end;

procedure TForm4.Button4Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if trim(sgrid1.Cells[7,i])='' then
    begin
     sgrid1.Cells[7,i]:=sgrid1.Cells[6,i];
     sgrid1.Cells[5,i]:=empl_name.caption;
     sgrid2.Cells[2,i]:=rkey05.Caption;
    end;
  end;
end;

procedure TForm4.Button3Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
  begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
  end;

  try
   XLApp := CreateOleObject('Excel.Application');
  except
   Screen.Cursor := crDefault;
   Exit;
  end;

 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := 1;

   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];

   for iCount := 0 to sgrid1.ColCount - 1 do
    Sheet.Cells[1, iCount + 1 ] := sgrid1.Cells[icount,0];

   for jcount :=1 to sgrid1.RowCount-2 do
    for iCount := 0 to sgrid1.ColCount - 1 do
     Sheet.Cells[jCount + 1, iCount + 1] := sgrid1.Cells[iCount,jcount];

   XlApp.Visible := True;
   Screen.Cursor := crDefault;
end;

end.

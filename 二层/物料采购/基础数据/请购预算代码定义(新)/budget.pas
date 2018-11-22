unit budget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Spin, StdCtrls, Buttons, Menus,DB;

type
  Tform_budget = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    SpinEdit1: TSpinEdit;
    Editor1: TStringGrid;
    Label8: TLabel;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    Label9: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure Editor1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Editor1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Editor1KeyPress(Sender: TObject; var Key: Char);
    procedure Editor1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
   function returen_rkey73list():string;
   function find_code(code:string):Boolean;

  public
    { Public declarations }
    v_status,rkey362:Integer;
  end;

var
  form_budget: Tform_budget;

implementation

uses Pick_WorkShop, damo;

{$R *.dfm}

procedure Tform_budget.FormActivate(Sender: TObject);
var
  i:Integer;
begin
  editor1.Cells[0,0] := '月份';
 editor1.Cells[1,0] := '限额';
 editor1.Cells[2,0] := '已被使用';
 
 editor1.Cells[0,1] := '1 月份';
 editor1.Cells[0,2] := '2 月份';
 editor1.Cells[0,3] := '3 月份';
 editor1.Cells[0,4] := '4 月份';
 editor1.Cells[0,5] := '5 月份';
 editor1.Cells[0,6] := '6 月份';
 editor1.Cells[0,7] := '7 月份';
 editor1.Cells[0,8] := '8 月份';
 editor1.Cells[0,9] := '9 月份';
 editor1.Cells[0,10] := '10月份';
 editor1.Cells[0,11] := '11月份';
 editor1.Cells[0,12] := '12月份';

 StringGrid1.Cells[0,0] := '用户编码';
 StringGrid1.Cells[1,0] := '用户姓名';
 StringGrid1.ColWidths[2] := 0;

  if v_status=0 then
  begin
     for i:=1 to 12 do
      begin
       editor1.Cells[1,i] := '0.00';
       editor1.Cells[2,i] := '0.00';
      end
  end
  else
  if v_status in[1,2] then
  begin
    Edit1.Text := dm.ADS362CODE.Value;
    Edit2.Text :=  dm.ADS362DESCRIPTION.Value;
    SpinEdit1.Value :=dm.ADS362bud_year.Value;
    for i := 1 to 12 do
    begin
      Editor1.Cells[1,i] := FormatFloat('0.00',dm.ADS362.FieldByName('BUDGET_PERIOD_'+inttostr(i)).AsFloat);
      if v_status=1 then
      begin
       Editor1.Cells[2,i] := FormatFloat('0.00',dm.ADS362.FieldByName('USED_PERIOD_'+inttostr(i)).AsFloat);
      end
       else
       begin
        editor1.Cells[2,i] := '0.00';
        Edit1.Text:='';
       end;

    end;
   dm.ads363.First;
   for i :=1 to dm.ads363.RecordCount do
   begin
    StringGrid1.Cells[0,i] := dm.ads363USER_LOGIN_NAME.AsString;
    StringGrid1.Cells[1,i] := dm.ads363USER_FULL_NAME.AsString;
    StringGrid1.Cells[2,i] := dm.ads363USER_PTR.AsString;
    StringGrid1.RowCount:=StringGrid1.RowCount+1;
    dm.ads363.Next;
   end;

 end;

end;

procedure Tform_budget.Editor1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (acol>1) and (arow>0) then
 begin
  editor1.Canvas.Brush.Color :=clAqua;
  editor1.Canvas.FillRect(rect);
 end;

IF Acol>0 then
 editor1.Canvas.TextRect(rect,rect.right-editor1.Canvas.TextWidth(editor1.Cells[acol,arow])-2,rect.Top+2,editor1.Cells[acol,aRow]);

end;

procedure Tform_budget.Editor1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
 i:byte;  
begin
 if editor1.Cells[1,editor1.Row]='' then
  editor1.Cells[1,editor1.Row]:='0';

 editor1.Cells[1,editor1.Row]:=
  formatfloat('0.00',strtofloat(editor1.Cells[1,editor1.Row]));

 for i := editor1.Row+1 to 12 do
  IF strtofloat(editor1.Cells[1,i])=0 then
   editor1.Cells[1,i]:=editor1.Cells[1,editor1.Row];

 if strtofloat(editor1.Cells[1,editor1.Row]) < strtofloat(editor1.Cells[2,editor1.Row]) then
  begin
   Messagedlg('预算限额不能小于已被使使用金额!',mtinformation,[mbok],0);
   canselect := false;
  end;

 if acol=1 then
   Editor1.Options:=Editor1.Options+[goEditing]
 else
   Editor1.Options:=Editor1.Options-[goEditing];

end;

procedure Tform_budget.Editor1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then abort//判断是否输入数字

 else
 if key = chr(46) then
 if pos('.',editor1.Cells[1,editor1.row])>0then abort;//第二列小数点'.'不能重复
end;

procedure Tform_budget.Editor1Exit(Sender: TObject);
var
 i:byte;
begin
 if editor1.Cells[1,editor1.Row]='' then
  editor1.Cells[1,editor1.Row]:='0';

 editor1.Cells[1,editor1.Row]:=
  formatfloat('0.00',strtofloat(editor1.Cells[1,editor1.Row]));
  
 for i := editor1.Row+1 to 12 do
  IF strtofloat(editor1.Cells[1,i])=0 then
   editor1.Cells[1,i]:=editor1.Cells[1,editor1.Row];
 if strtofloat(editor1.Cells[1,editor1.Row])<strtofloat(editor1.Cells[2,editor1.Row]) then
  begin
   Messagedlg('预算限额不能小于已被使使用金额!',mtinformation,[mbok],0);
   editor1.SetFocus;
  end;
  
end;

function Tform_budget.returen_rkey73list: string;
var
  rkey73list:string;
  i:integer;
begin
 rkey73list:='(';
for i:= 1 to StringGrid1.RowCount-2 do
 if i=StringGrid1.RowCount-2 then
  rkey73list:=rkey73list+STRINGgrid1.Cells[2,i]+')'
 else
  rkey73list:=rkey73list+STRINGgrid1.Cells[2,i]+',';

 returen_rkey73list:=rkey73list;
end;

procedure Tform_budget.N1Click(Sender: TObject);
begin
try
 frmPick_WorkShop:=TfrmPick_WorkShop.Create(Application);

 if StringGrid1.RowCount>2 then
  frmPick_WorkShop.ads73.CommandText:=frmPick_WorkShop.ads73.CommandText+
  'and (rkey not in'+self.returen_rkey73list+')';
 frmPick_WorkShop.Enter(0);
 if frmPick_WorkShop.ShowModal=mrok then
 begin
   frmPick_WorkShop.ads73clientds.First;
   while not frmPick_WorkShop.ads73clientds.Eof do
   begin
     StringGrid1.Cells[0,StringGrid1.RowCount-1]:=frmPick_WorkShop.ads73clientdsUSER_LOGIN_NAME.Value;
     StringGrid1.Cells[1,StringGrid1.RowCount-1]:=frmPick_WorkShop.ads73clientdsUSER_FULL_NAME.Value;
     StringGrid1.Cells[2,StringGrid1.RowCount-1]:=frmPick_WorkShop.ads73clientdsrKey.AsString;
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
     frmPick_WorkShop.ads73clientds.Next;
   end;
 end;
finally
 frmPick_WorkShop.Free;
end; 
end;

procedure Tform_budget.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid1.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid1.Row:=row;
 end;
end;

procedure Tform_budget.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row= stringgrid1.RowCount-1 then
 n2.Enabled:=false
else
 n2.Enabled:=true;
end;

procedure Tform_budget.N2Click(Sender: TObject);
var
  i:integer;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;


procedure Tform_budget.BitBtn1Click(Sender: TObject);
var
  i:Integer;
begin
  if trim(edit1.Text) = '' then
  begin
   messagedlg('预算代码不能为空!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
   exit;
  end;
 if trim(edit2.Text) = '' then
  begin
   messagedlg('预算描述不能为空!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
   exit;
  end;
 if StringGrid1.RowCount<=2 then
  begin
   messagedlg('预算使用人员不能为空!',mtinformation,[mbcancel],0);
   StringGrid1.SetFocus;
   exit;
  end;

if (self.v_status=0)or(Self.v_status=2)  then
 begin
  if self.find_code(Edit1.Text) then
  begin
   messagedlg('预算代码重复,请重输入!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
   exit;
  end;
  try
   dm.ADOConnection1.BeginTrans;
   with dm.ADOQuery1 do
   begin
    Close;
    sql.Text:=
     'select rkey,code,description,bud_year,budget_period_1,'+
     'budget_period_2,budget_period_3,budget_period_4,budget_period_5,'+
     'budget_period_6,budget_period_7,budget_period_8,budget_period_9,'+
     'budget_period_10,budget_period_11,budget_period_12 '+
     'from data0362 where rkey is null';
     open;
    Append;
    FieldByName('code').AsString:=edit1.Text;
    FieldByName('description').AsString:=edit2.Text;
    FieldByName('bud_year').AsInteger:=SpinEdit1.Value;

    for i := 1 to 12 do               //预算值
     Fieldbyname('BUDGET_PERIOD_'+inttostr(i)).AsString := editor1.Cells[1,i];
    Post;
    rkey362:=FieldByName('rkey').AsInteger;
   end;

   with dm.ADOQuery1 do
   begin
    for i:=1 to stringgrid1.RowCount-2  do
    begin
      close;
      SQL.Text:='insert into data0363(USER_PTR,BUDGET_PTR) '+
         'values('+stringgrid1.Cells[2,i]+','+inttostr(rkey362)+')';
      ExecSQL;
       
    end;
   end;

   dm.ADOConnection1.CommitTrans;
   ModalResult:=mrok;
  
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;

  end;

 end
else
if self.v_status=1  then
 begin
  try
  dm.ADOConnection1.BeginTrans;

   with dm.ADOQuery1 do
   begin
    Close;
    sql.Text:=
    'select rkey,code,description,bud_year,budget_period_1,'+
    'budget_period_2,budget_period_3,budget_period_4,budget_period_5,'+
     'budget_period_6,budget_period_7,budget_period_8,budget_period_9,'+
     'budget_period_10,budget_period_11,budget_period_12 '+
     'from data0362 where rkey='+inttostr(rkey362);
    open;
    Edit;
    FieldByName('code').AsString:=edit1.Text;
    FieldByName('description').AsString:=edit2.Text;
    FieldByName('bud_year').AsInteger:=SpinEdit1.Value;
    for i := 1 to 12 do               //预算值
    Fieldbyname('BUDGET_PERIOD_'+inttostr(i)).AsString := editor1.Cells[1,i];
    Post;
   end;

   with dm.ADOQuery1 do
   begin
     close;
     SQL.Text:='delete data0363 where BUDGET_PTR='+inttostr(rkey362);
     ExecSQL;
   end;
   with dm.ADOQuery1 do
   begin
    for i:=1 to stringgrid1.RowCount-2  do
    begin
      close;
      SQL.Text:='insert into data0363(USER_PTR,BUDGET_PTR) '+
         'values('+stringgrid1.Cells[2,i]+','+inttostr(rkey362)+')';
      ExecSQL;
    end;
   end;
   dm.ADOConnection1.CommitTrans;
   ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;
 end;



function Tform_budget.find_code(code: string): Boolean;
begin
 with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select rkey from data0362 where code='''+code+'''';
    open;
    if IsEmpty then
    Result:=False
    else
    Result:=true;
  end;

end;



end.

unit assign_split;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Menus, Buttons, DB, ADODB;

type
  TForm11 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    StringGrid2: TStringGrid;
    ADO52: TADOStoredProc;
    ADO52WORK_ORDER_NUMBER: TStringField;
    ADO52location: TStringField;
    ADO52qty_on_hand: TFloatField;
    ADO52qty_alloc: TFloatField;
    ADO52rkey53: TIntegerField;
    ADO52quan_shp: TFloatField;
    ADO52rkey52: TAutoIncField;
    ADO52qty_avail: TFloatField;
    Edit7: TEdit;
    Label8: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function find52_rkey(rkey52: integer):boolean;
    function find52_rkey_1(rkey52: integer):boolean;
    function max_SHIPMENT_NO(rkey60: integer):integer;    
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses damo, add_packlist, wo_split, pack_list,common;

{$R *.dfm}

procedure TForm11.FormActivate(Sender: TObject);
var
 i:integer;
begin
stringgrid1.Cells[0,0]:='作业单';
stringgrid1.Cells[1,0]:='仓库';
stringgrid1.Cells[2,0]:='数量';

stringgrid2.Cells[0,0]:='作业单';
stringgrid2.Cells[1,0]:='仓库';
stringgrid2.Cells[2,0]:='数量';

  with ADO52 do
   begin
    close;
    Parameters[1].Value:=form5.StringGrid2.Cells[0,form5.StringGrid1.Row];
    open;
    stringgrid1.RowCount:=RecordCount+2;
    for i:=1 to RecordCount do
     begin
      stringgrid1.Cells[0,i]:=ADO52WORK_ORDER_NUMBER.Value;
      stringgrid1.Cells[1,i]:=ADO52location.Value;
      stringgrid1.Cells[2,i]:=ADO52quan_shp.AsString;
      stringgrid1.Cells[3,i]:=ADO52rkey52.AsString;
      stringgrid1.Cells[4,i]:=ADO52rkey53.AsString;
      next;
     end;
   end;
  ado52.Close;
   
end;

procedure TForm11.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
if (stringgrid1.Row=stringgrid1.RowCount-1) then exit;

if (not self.find52_rkey(strtoint(stringgrid1.Cells[3,stringgrid1.row])))  then
begin
 stringgrid2.Rows[stringgrid2.RowCount-1].Text := stringgrid1.Rows[stringgrid1.row].Text;
 stringgrid2.RowCount := stringgrid2.RowCount+1;

 edit6.Text := inttostr(strtoint(edit6.Text)-
               strtoint(stringgrid1.Cells[2,stringgrid1.row]));

 edit7.Text := inttostr(strtoint(edit7.Text)+
               strtoint(stringgrid1.Cells[2,stringgrid1.row]));

 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 if not button1.Enabled then button1.Enabled:=not button1.Enabled;
end
else
 begin
  for i:=1 to stringgrid2.RowCount-2 do
   if strtoint(stringgrid2.Cells[3,i])=strtoint(stringgrid1.Cells[3,stringgrid1.row]) then
    begin
     stringgrid2.Cells[2,i]:=inttostr(strtoint(stringgrid2.Cells[2,i])+
                             strtoint(stringgrid1.Cells[2,stringgrid1.row]));
     stringgrid2.Cells[5,i]:='';
    end;
  edit6.Text := inttostr(strtoint(edit6.Text)-
               strtoint(stringgrid1.Cells[2,stringgrid1.row]));

  edit7.Text := inttostr(strtoint(edit7.Text)+
               strtoint(stringgrid1.Cells[2,stringgrid1.row]));

  for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
 end;

end;

function TForm11.find52_rkey(rkey52: integer):boolean;
var
 i:integer;
begin
 Result:=false;

 for i:=1 to stringgrid2.RowCount-2 do
  if strtoint(stringgrid2.Cells[3,i])=rkey52 then
   Result:=true;

end;

procedure TForm11.BitBtn2Click(Sender: TObject);
var
 i:integer;
begin
if (stringgrid2.Row=stringgrid2.RowCount-1) then exit;

if (not self.find52_rkey_1(strtoint(stringgrid2.Cells[3,stringgrid2.row])))  then
begin
 stringgrid1.Rows[stringgrid1.RowCount-1].Text:=stringgrid2.Rows[stringgrid2.row].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount+1;

 edit6.Text:=inttostr(strtoint(edit6.Text)+
              strtoint(stringgrid2.Cells[2,stringgrid2.row]));

 edit7.Text:=inttostr(strtoint(edit7.Text)-
              strtoint(stringgrid2.Cells[2,stringgrid2.row]));

 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;

 if stringgrid2.RowCount=2 then button1.Enabled:=false;
end
else
 begin
  for i:=1 to stringgrid1.RowCount-2 do
   if strtoint(stringgrid1.Cells[3,i])=strtoint(stringgrid2.Cells[3,stringgrid2.row]) then
    stringgrid1.Cells[2,i]:=inttostr(strtoint(stringgrid1.Cells[2,i])+
                            strtoint(stringgrid2.Cells[2,stringgrid2.row]));

  edit6.Text := inttostr(strtoint(edit6.Text)+
               strtoint(stringgrid2.Cells[2,stringgrid2.row]));

  edit7.Text:=inttostr(strtoint(edit7.Text)-
              strtoint(stringgrid2.Cells[2,stringgrid2.row]));
              
  for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
   stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;

  stringgrid2.RowCount:=stringgrid2.RowCount-1;
  
  if stringgrid2.RowCount=2 then button1.Enabled:=false;
 end;
end;

function TForm11.find52_rkey_1(rkey52: integer):boolean;
var
 i:integer;
begin
 Result:=false;

 for i:=1 to stringgrid1.RowCount-2 do
  if strtoint(stringgrid1.Cells[3,i])=rkey52 then
   Result:=true;

end;

procedure TForm11.Button1Click(Sender: TObject);
var
 i:integer;
begin
if stringgrid1.RowCount=2 then
 showmessage('指派拆分后不能为零!')
else
if messagedlg('装运指派的拆分将是不可逆操作,您确定吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 try
 dm.ADOConnection1.BeginTrans;    //起动事物
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0064');
   sql.Add('where rkey='+form5.StringGrid2.Cells[0,form5.StringGrid1.Row]);
   open;
   edit;
   fieldvalues['QUAN_SHIPPED']:=strtoint(edit6.Text);
   post;
  end;

 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0052');
   sql.Add('where SO_SHP_PTR='+form5.StringGrid2.Cells[0,form5.StringGrid1.Row]);
   open;
  end;

 while not dm.adoquery2.Eof do
  begin
   for i:=1 to stringgrid1.RowCount-2 do
    if (strtoint(stringgrid1.Cells[3,i])=dm.ADOQuery2.FieldValues['rkey']) and
       (strtoint(stringgrid1.Cells[2,i])<>dm.ADOQuery2.FieldValues['QUAN_SHP']) then
     begin
      dm.ADOQuery2.Edit;
      dm.ADOQuery2.FieldValues['quan_shp']:=strtofloat(stringgrid1.Cells[2,i]);
      dm.adoquery2.Post;
     end;
   dm.ADOQuery2.Next;
  end; //完成旧指派的编辑及作业单的修改

 with dm.ADOQuery3 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0064 where rkey is null');
   open;
   append;
   fieldvalues['SO_PTR']:=dm.ADOQuery1.FieldValues['SO_PTR'];
   fieldvalues['ENT_EMPL_PTR']:= form4.empl_ptr;
   fieldvalues['ENT_CSI_USER_PTR']:= rkey73;
   fieldvalues['DATE_ASSIGN']:= dm.ADOQuery1.FieldValues['DATE_ASSIGN']; //指派日期
   fieldvalues['SHIPMENT_NO']:= self.max_SHIPMENT_NO(fieldvalues['so_ptr']);
   fieldvalues['QUAN_SHIPPED']:= strtoint(edit7.Text);
   fieldvalues['part_price']:=dm.ADOQuery1.FieldValues['part_price'];
   fieldvalues['rush_charge']:=dm.ADOQuery1.FieldValues['rush_charge'];
   fieldvalues['prod_tax_flag']:=dm.ADOQuery1.FieldValues['prod_tax_flag'];
   fieldvalues['tool_tax_flag']:=dm.ADOQuery1.FieldValues['tool_tax_flag'];
   fieldvalues['discount']:=dm.ADOQuery1.FieldValues['discount'];
   fieldvalues['TAX_2']:=dm.ADOQuery1.FieldValues['TAX_2'];
   fieldvalues['assign_type']:=dm.ADOQuery1.FieldValues['assign_type'];
   fieldvalues['REPORT_UNIT_VALUE1']:=dm.ADOQuery1.FieldValues['REPORT_UNIT_VALUE1'];
   post;
  end;
  
  for i:=1 to stringgrid2.RowCount-2 do
   begin
    if trim(stringgrid2.Cells[5,i])='' then
     begin                                //编辑52出仓作业单
      with dm.ADOupdate52 do
       begin
        close;
        sql.Clear;
        sql.Add('update data0052');
        sql.Add('set SO_SHP_PTR='+dm.ADOQuery3.fieldbyname('rkey').AsString+'');
        sql.Add('where rkey='+stringgrid2.Cells[3,i]);
        ExecSQL;
       end;
     end
    else  //增加data0052记录
     begin
      with dm.ADOupdate52 do
       begin
        close;                  //记录销售订单数量更改情况(日志文件)
        sql.Clear;
        sql.Add('insert into data0052 (DATA0053_PTR,SO_SHP_PTR,QUAN_SHP)');
        sql.Add('values ('+stringgrid2.Cells[4,i]+',');
        sql.Add(''+dm.ADOQuery3.fieldbyname('rkey').AsString+',');
        sql.add(''''+stringgrid2.Cells[2,i]+''')');
        ExecSQL;
       end;
     end;
   end;
  dm.ADOConnection1.CommitTrans;
  self.ModalResult:=mrok;
 except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
 end;
end;
end;

procedure TForm11.N1Click(Sender: TObject);
begin
if not self.find52_rkey(strtoint(stringgrid1.Cells[3,stringgrid1.row])) then
begin
form12:=tform12.Create(application);
form12.Edit1.Text:=stringgrid1.Cells[0,stringgrid1.row];
form12.Edit2.Text:=stringgrid1.Cells[1,stringgrid1.row];
form12.Edit3.Text:=stringgrid1.Cells[2,stringgrid1.row];
form12.Label5.Caption:=form12.Edit3.Text;
if form12.ShowModal=mrok then
 begin
  stringgrid1.Cells[2,stringgrid1.row]:=form12.Edit3.Text;

  stringgrid2.Rows[stringgrid2.RowCount-1].Text := stringgrid1.Rows[stringgrid1.row].Text;
  stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form12.Edit4.Text;
  stringgrid2.Cells[5,stringgrid2.RowCount-1]:='A';

  stringgrid2.RowCount := stringgrid2.RowCount+1;

  edit6.Text := inttostr(strtoint(edit6.Text)-strtoint(form12.Edit4.Text));
  edit7.Text := inttostr(strtoint(edit7.Text)+strtoint(form12.Edit4.Text));

  if not button1.Enabled then button1.Enabled:=not button1.Enabled;
 end;
form12.Free;
end
else
 showmessage('该作业单已被拆分不能再拆分了');
end;


function TForm11.max_SHIPMENT_NO(rkey60: integer):integer;
begin
 with dm.ADOupdate52 do
  begin
   close;
   sql.Clear;
   sql.Add('select max(SHIPMENT_NO) as max_no from data0064');
   sql.Add('where so_ptr='+inttostr(rkey60));
   open;
   Result:=fieldvalues['max_no']+1;
  end;
end;

procedure TForm11.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

procedure TForm11.StringGrid1MouseDown(Sender: TObject;
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

end.

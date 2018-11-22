unit confirmation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, ADODB, Menus, DBGrids, ExtCtrls;

type
  TForm2 = class(TForm)
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    StringGrid2: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_note1060(so,rkey10:string);
    procedure showform8(rkey:integer);
    procedure StringGrid1Click(Sender: TObject);
    procedure StringGrid2Click(Sender: TObject);
  private
    { Private declarations }
  po_note:tstringlist; //评审记事本
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses damo, note, detail, common;
{$R *.dfm}
procedure TForm2.showform8(rkey: integer);
begin
 try
  form8:=tform8.Create(application);
  dm.ADOQuery3.Active:=false;
  dm.ADOQuery3.Parameters[1].Value := rkey;
  dm.ADOQuery3.Active:=true;
  dm.ado89.Open;
  dm.ado360.open;
  with dm.ADOQuery4 do
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011 where SOURCE_TYPE=1060 and');
    sql.Add('FILE_POINTER='+dm.ADOQuery1.fieldbyname('rkey').AsString); //+dm.ADOQuery3PURCHASE_ORDER_PTR.AsString);
    open;
    if not isempty then form8.Memo1.Text:=fieldvalues['memo_text'];
   end;

  with dm.ADOQuery4 do
   begin
    close;
    sql.Clear;
    sql.Text:='SELECT dbo.Data0015.ABBR_NAME'+#13+
              'FROM dbo.Data0015 INNER JOIN'+#13+
        'dbo.Data0060 ON dbo.Data0015.RKEY = dbo.Data0060.SHIP_REG_TAX_ID'+#13+
        'where data0060.SALES_ORDER='+quotedstr(dm.ADOQuery3SALES_ORDER.Value);
    open;
    if not isempty then form8.edit3.Text:=fieldvalues['ABBR_NAME'];
   end;

  form8.ShowModal;
  dm.ADOQuery3.Close;
  dm.ado89.Close;
  dm.ADO360.Close;
 finally
  form8.free;
 end;
end;


procedure TForm2.FormActivate(Sender: TObject);
var
 i:integer;
begin
stringgrid1.Cells[0,0] := '销售订单';
stringgrid1.Cells[1,0] := '下单日期';
stringgrid1.Cells[2,0] := '计划交期';
stringgrid1.Cells[3,0] := '回复交期';
stringgrid1.Cells[4,0] := '数量Pcs';
stringgrid1.Cells[5,0] := '客户代码';
stringgrid1.Cells[6,0] := '客户简称';
stringgrid1.Cells[7,0] := '客户订单号';
stringgrid1.Cells[8,0] := '本厂编号';
stringgrid1.Cells[9,0] := '客户型号';
StringGrid1.Cells[12,0]:= '客户交期';
StringGrid1.Cells[13,0]:= '原始客户交期';
StringGrid1.Cells[14,0]:= '关联原客户';
StringGrid1.Cells[15,0]:= '工厂简称';
StringGrid1.Cells[16,0]:= '加工形式';
stringgrid1.ColWidths[10]:=-1;
stringgrid1.ColWidths[11]:=-1;


stringgrid2.Cells[0,0] := '销售订单';
stringgrid2.Cells[1,0] := '下单日期';
stringgrid2.Cells[2,0] := '计划交期';
stringgrid2.Cells[3,0] := '回复交期';
stringgrid2.Cells[4,0] := '数量Pcs';
stringgrid2.Cells[5,0] := '客户代码';
stringgrid2.Cells[6,0] := '客户简称';
stringgrid2.Cells[7,0] := '客户订单号';
stringgrid2.Cells[8,0] := '本厂编号';
stringgrid2.Cells[9,0] := '客户型号';
StringGrid2.Cells[12,0]:= '客户交期';
StringGrid2.Cells[13,0]:= '原始客户交期';
StringGrid2.Cells[14,0]:= '关联原客户';
StringGrid2.Cells[15,0]:= '工厂简称';
StringGrid2.Cells[16,0]:= '加工形式';
stringgrid2.ColWidths[10]:=-1;
stringgrid2.ColWidths[11]:=-1;

 stringgrid1.RowCount := dm.ADOQuery1.RecordCount+2;
 for i:= 1 to dm.ADOQuery1.RecordCount do
  begin
   stringgrid1.Cells[0,i] := dm.ADOQuery1.fieldbyname('sales_order').AsString;
   stringgrid1.Cells[1,i] := dm.ADOQuery1.fieldbyname('ent_date').AsString;
   stringgrid1.Cells[2,i] := dm.ADOQuery1.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString;
   stringgrid1.Cells[3,i] := dm.ADOQuery1.fieldbyname('sch_date').AsString;
   stringgrid1.Cells[4,i] := dm.ADOQuery1.fieldbyname('PARTS_ORDERED').AsString;

   stringgrid1.Cells[5,i] := dm.ADOQuery1.fieldbyname('cust_code1').AsString;
   stringgrid1.Cells[6,i] := dm.ADOQuery1.fieldbyname('cust_code').AsString;
   stringgrid1.Cells[7,i] := dm.ADOQuery1.fieldbyname('po_number').AsString;
   stringgrid1.Cells[8,i] := dm.ADOQuery1.fieldbyname('manu_part_number').AsString;
   stringgrid1.Cells[9,i] := dm.ADOQuery1.fieldbyname('manu_part_desc').AsString;
   stringgrid1.Cells[12,i] := dm.ADOQuery1.fieldbyname('ORIG_REQUEST_DATE').AsString;
   stringgrid1.Cells[13,i] := dm.ADOQuery1.fieldbyname('DUE_DATE').AsString;
   stringgrid1.Cells[14,i] := dm.ADOQuery1.fieldbyname('ORIG_CUSTOMER').AsString;
   stringgrid1.Cells[15,i] := dm.ADOQuery1.fieldbyname('ABBR_NAME').AsString;
   stringgrid1.Cells[16,i] := dm.ADOQuery1.fieldbyname('sotp').AsString;
   stringgrid1.Cells[10,i] := inttostr(i);
   stringgrid1.Cells[11,i] := dm.ADOQuery1.fieldbyname('rkey').AsString;

   dm.ADOQuery1.Next;
  end;
  self.WindowState:=wsMaximized;
  po_note:=tstringlist.Create;
end;

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
  if row<>0 then stringgrid1.Row:=row;
 end;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then
 begin
  n1.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
 end
else
 begin
  n1.Enabled:=true;
  n3.Enabled:=true;
  n4.Enabled:=true;
  n5.Enabled:=true;
 end;
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
if stringgrid2.Row=stringgrid2.RowCount-1 then
 begin
  n6.Enabled:=false;
  n8.Enabled:=false;
  n9.Enabled:=false;
  n10.Enabled:=false;
 end
else
 begin
  n6.Enabled:=true;
  n8.Enabled:=true;
  n9.Enabled:=true;
  n10.Enabled:=true;
 end;
end;

procedure TForm2.N1Click(Sender: TObject);
var
 i:integer;
begin

 stringgrid2.Rows[stringgrid2.RowCount-1].Text:=stringgrid1.Rows[stringgrid1.row].Text;
 stringgrid2.RowCount:= stringgrid2.RowCount+1;

 for i:= stringgrid1.row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;

 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 button1.Enabled := true;
end;

procedure TForm2.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;
begin
if button=mbright then
 begin
   stringgrid2.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid2.Row:=row;
 end;
end;

procedure TForm2.StringGrid1DblClick(Sender: TObject);
begin
 if stringgrid1.Row<>stringgrid1.RowCount-1 then
  n1click(sender);
end;

procedure TForm2.N6Click(Sender: TObject);
var
 i,j:integer;
begin
if stringgrid1.RowCount=2 then
  stringgrid1.Rows[1].Text := stringgrid2.Rows[stringgrid2.row].Text;
for i:=1 to stringgrid1.RowCount-2 do
 if strtoint(stringgrid1.Cells[10,i])>strtoint(stringgrid2.Cells[10,stringgrid2.row]) then
  begin
    for j:=stringgrid1.RowCount-1 downto i do
     if j<>i then
      stringgrid1.Rows[j].Text := stringgrid1.Rows[j-1].Text
     else
      stringgrid1.Rows[j].Text := stringgrid2.Rows[stringgrid2.row].Text;
    break;
  end
 else
  if i=stringgrid1.RowCount-2 then
   stringgrid1.Rows[i+1].Text := stringgrid2.Rows[stringgrid2.row].Text;
 stringgrid1.RowCount := stringgrid1.RowCount+1;
 for i:= stringgrid2.row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 if stringgrid2.RowCount=2 then button1.Enabled := false;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
self.edit_note1060(stringgrid1.Cells[0,stringgrid1.row],Stringgrid1.Cells[11,stringgrid1.row]);
end;

procedure TForm2.N10Click(Sender: TObject);
begin
self.edit_note1060(stringgrid2.Cells[0,stringgrid2.row],Stringgrid2.Cells[11,stringgrid2.row]);
end;

procedure TForm2.N4Click(Sender: TObject);

begin
   try
   edit_note:=Tedit_note.Create(application);
   edit_note.Caption:='销售定单记事本:'+stringgrid1.Cells[0,stringgrid1.row];
   with dm.AQ1060 do
    begin
     if active=true then active:=false;
     sql.Clear;
     SQL.Add('select RemarkSO from data0060 where Rkey='+Stringgrid1.Cells[11,stringgrid1.row]);
//     sql.Add('select * from data0011 where source_type=60');
//     sql.Add('and file_pointer='+Stringgrid1.Cells[11,stringgrid1.row]);
     active:=true;
     if not isempty then
      edit_note.Memo1.Text := fieldvalues['RemarkSO'];
    end;
    edit_note.BitBtn1.Visible:=false;
    edit_note.Button3.Visible:=true;
    edit_note.Memo1.ReadOnly :=true;
    edit_note.Memo1.Color := cl3dlight;
    edit_note.Button1.Visible :=false;
    edit_note.Button2.Visible :=false;
    edit_note.ShowModal;
     finally
     edit_note.free;
    end;
end;

procedure TForm2.N9Click(Sender: TObject);
var
  i:integer;
begin
 try
  edit_note:=Tedit_note.Create(application);
  edit_note.Caption:='销售定单记事本:'+stringgrid2.Cells[0,stringgrid2.row];
  with dm.AQ1060 do
   begin
    if active=true then active:=false;
    sql.Clear;
    SQL.Add('select RemarkSO from data0060 where Rkey='+Stringgrid2.Cells[11,stringgrid2.row]);
//    sql.Add('select * from data0011 where source_type=60');
//    sql.Add('and file_pointer='+Stringgrid2.Cells[11,stringgrid2.row]);
    active:=true;
    if not isempty then
    begin
        edit_note.Memo1.Text:=fieldvalues['RemarkSO'];
        i:=Length(edit_note.memo1.Text);
        edit_note.memo1.SelStart:=i;
        edit_note.memo1.SelLength:=10;
     end;//edit_note.Memo1.Text := fieldvalues['memo_text'];
   end;
   edit_note.BitBtn1.Visible:=false;
   edit_note.Button3.Visible:=true;
   edit_note.Memo1.ReadOnly :=true;
   edit_note.Memo1.Color := cl3dlight;
   edit_note.Button1.Visible :=false;
   edit_note.Button2.Visible :=false;
   edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
 self.showform8(strtoint(stringgrid1.Cells[11,stringgrid1.row]));
end;

procedure TForm2.N8Click(Sender: TObject);
begin
if stringgrid2.Row<>stringgrid2.RowCount-1 then
 self.showform8(strtoint(stringgrid2.Cells[11,stringgrid2.row]));
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i:integer;
 v_date:tdatetime;
begin
v_date:=getsystem_date(dm.ADOQuery4,0);
 for i:=1 to stringgrid2.RowCount-2 do
   with dm.ADOQuery2 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select sales_order,conf_by_empl_ptr,prod_rel,conf_date,');
     sql.Add('to_be_confirmed,data0060.status,RemarkAudit');
     sql.Add('from data0060');
     sql.Add('where data0060.sales_order='+quotedstr(stringgrid2.Cells[0,i]));
     active:=true;
     if not IsEmpty then
     if (fieldvalues['status']=2) or (fieldvalues['status']=3) then
      begin
       showmessage('销售订单:'+fieldvalues['sales_order']+'已被暂缓或关闭确认无效!');
       continue;
      end
     else
      begin
       edit;
       fieldvalues['conf_date'] := v_date; //长日期格式
       fieldvalues['prod_rel'] := '2';  //使成为确认
       fieldvalues['conf_by_empl_ptr'] := user_ptr;
       fieldvalues['to_be_confirmed'] := 0;
       fieldvalues['RemarkAudit']:=po_note.Text; //评审记事本
       post;
      end;
    end;

 close;
end;

procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.adoquery1.SQL.Text);
end;

procedure TForm2.edit_note1060(so,rkey10: string);
var
 i:integer;
begin
  try
   edit_note:=Tedit_note.Create(application);
   edit_note.Caption:='确认记事本:'+so;
   edit_note.Memo1.Lines.Assign(po_note);
   if edit_note.ShowModal=mrok then
   begin
     if trim(edit_note.Memo1.Text)<>'' then
     begin
       po_note.Text:=trim(edit_note.Memo1.Text);
     end;
   end;
//   with dm.AQ1060 do
//    begin
//     if active=true then active:=false;
//     sql.Clear;
//     sql.Add('select * from data0011 where source_type=1060');
//     sql.Add('and file_pointer='+rkey10);
//     active:=true;
//     if not isempty then
//     begin
//        edit_note.Memo1.Text:=fieldvalues['memo_text'];
//        i:=Length(edit_note.memo1.Text);
//        edit_note.memo1.SelStart:=i;
//        edit_note.memo1.SelLength:=10;
//     end;
//     //edit_note.Memo1.Lines.Add(dm.AQ1060.fieldbyname('MEMO_TEXT').AsString);
//     {for i:=1 to 4 do
//     edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString); }
//    end;
//     if edit_note.ShowModal=mrok then
//      begin
//    if (not dm.AQ1060.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
//     begin             //原记录有记事本而且修改了
//      dm.AQ1060.Edit;
//      dm.AQ1060.fieldbyname('MEMO_TEXT').AsString:=edit_note.Memo1.Text;
//      {for i:=1 to 4 do
//      if edit_note.Memo1.Lines.Count>=i then
//       dm.AQ1060.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1]
//      else
//       dm.AQ1060.fieldbyname('note_pad_line_'+inttostr(i)).asstring:='';   }
//      dm.AQ1060.Post;
//     end
//    else
//     if (not dm.AQ1060.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
//       dm.AQ1060.Delete
//     else
//      if (dm.AQ1060.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有本，但新增了记事本
//       begin
//        dm.AQ1060.Append;
//        dm.AQ1060.FieldByName('file_pointer').AsString:=rkey10;
//        dm.AQ1060.Fieldvalues['source_type']:=1060;
//        dm.AQ1060.fieldbyname('MEMO_TEXT').AsString:=edit_note.Memo1.Text;
//        {for i:=1 to edit_note.memo1.Lines.Count do
//        dm.AQ1060.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1]; }
//        dm.AQ1060.post;
//       end;
//      end;
    finally
     edit_note.free;
    end;
end;


procedure TForm2.StringGrid1Click(Sender: TObject);
begin
  if ((StringGrid1.RowCount>=2) and (Trim(StringGrid1.Cells[0,stringgrid1.row])<>'')) then
  begin
    with dm.AQ1060 do
    begin
      if active=true then active:=false;
      sql.Clear;
      SQL.Add('select RemarkAudit from data0060 where Rkey='+Trim(Stringgrid1.Cells[11,stringgrid1.row]));
      active:=true;
      if not isempty then
      begin
        po_note.Clear;
        po_note.Text := fieldvalues['RemarkAudit'];
      end;
    end;
  end;
end;

procedure TForm2.StringGrid2Click(Sender: TObject);
begin
  if ((StringGrid2.RowCount>=2) and (Trim(StringGrid2.Cells[0,stringgrid2.row])<>'')) then
  with dm.AQ1060 do
  begin
    if active=true then active:=false;
    sql.Clear;
    SQL.Add('select RemarkAudit from data0060 where Rkey='+Trim(Stringgrid2.Cells[11,stringgrid2.row]));
    active:=true;
    if not isempty then
    begin
      po_note.Clear;
      po_note.Text := fieldvalues['RemarkAudit'];
    end;
  end;
end;

end.

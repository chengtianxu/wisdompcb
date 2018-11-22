unit stop_po;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Menus;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    StringGrid2: TStringGrid;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Lab_rkey10: TLabel;
    lab_rkey97: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses cust_search, purchase_search,damo, note;

{$R *.dfm}

procedure TForm9.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin

try
 frm_cust:=tfrm_cust.Create(application);
 frm_cust.ADOQuery1.Close;
 frm_cust.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
 frm_cust.ADOQuery1.Open;
 if frm_cust.ADOQuery1.IsEmpty then
    begin
     messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
     edit1.SetFocus;
     exit;
    end;
 if frm_cust.ShowModal=mrok then
  begin
   edit1.Text := frm_cust.ADOQuery1.fieldbyname('cust_code').AsString;
   edit1.Font.Color := clwindowtext;
   label5.Caption := frm_cust.ADOQuery1.fieldbyname('customer_name').AsString;
   lab_rkey10.Caption := frm_cust.ADOQuery1.fieldbyname('rkey').AsString;
   edit2.SetFocus;
  end
 else
  edit1.SetFocus;  
finally
 frm_cust.free;
end;

end;

procedure TForm9.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
try
 form_po:=tform_po.Create(application);
 with form_po.ADOQuery1 do
  begin
   close;
   Parameters[1].Value:=lab_rkey10.Caption;
   open;
  end;

  form_po.Edit1.Text:=trim(edit2.Text);
  if form_po.ADOQuery1.IsEmpty then
    begin
     messagedlg('没有找到记录!',MtInformation,[mbok],0);
     edit2.SetFocus;
     exit;
    end;
 if form_po.ShowModal=mrok then
  begin
   edit2.Text := trim(form_po.ADOQuery1.fieldbyname('po_number').AsString);
   edit2.Font.Color := clwindowtext;
   lab_rkey97.Caption := form_po.ADOQuery1.fieldbyname('rkey').AsString;
   if edit1.Text = '' then
   with dm.ADOQuery3 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select rkey,cust_code,customer_name from data0010');
     sql.Add('where rkey='+form_po.ADOQuery1.fieldbyname('customer_ptr').AsString);
     active:=true;
     edit1.Text := trim(fieldbyname('cust_code').AsString);
     edit1.Font.Color := clwindowtext;
     label5.Caption := fieldbyname('customer_name').AsString;
     lab_rkey10.Caption := fieldbyname('rkey').AsString;
    end;
   for i:=1 to stringgrid1.RowCount-2 do
    stringgrid1.Rows[i].Clear;
    stringgrid1.RowCount:=2;
   with dm.ADOQuery2 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select sales_order,customer_part_number,cp_rev,ent_date,CUSTOMER_CONTACT');
     sql.Add('from data0060,data0050');
     sql.Add('where cust_part_ptr=data0050.rkey');
     sql.Add('and status=1 and PROD_REL=''1''');
     sql.Add('and PURCHASE_ORDER_PTR='+lab_rkey97.Caption);
     active:=true;
     if not isempty then
     for i:=1 to RecordCount do
      begin
       stringgrid1.Cells[0,i]:=fieldbyname('sales_order').AsString;
       stringgrid1.Cells[1,i]:=fieldbyname('customer_part_number').AsString;
       stringgrid1.Cells[2,i]:=fieldbyname('cp_rev').AsString;
       stringgrid1.Cells[3,i]:=fieldbyname('ent_date').AsString;
       stringgrid1.Cells[4,i]:=fieldbyname('customer_contact').AsString;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       next;
      end;
    end;

  end;
finally
 form_po.free;
end;

end;

procedure TForm9.Edit1Click(Sender: TObject);
begin

if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color :=clblue;
 end;

end;

procedure TForm9.Edit1Exit(Sender: TObject);
begin

 if (activecontrol.Name<>'BitBtn1') then
 try
  frm_cust:=tfrm_cust.Create(application);
 frm_cust.ADOQuery1.Close;
 frm_cust.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
 frm_cust.ADOQuery1.Open;
  if comparetext(trim(edit1.text),trim(frm_cust.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
   begin
   edit1.Font.Color := clwindowtext;
   label5.Caption := frm_cust.ADOQuery1.fieldbyname('customer_name').AsString;
   lab_rkey10.Caption := frm_cust.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   if trim(edit1.Text)<>'' then
   begin
    messagedlg('请输入正确的客户编号!',mtwarning,[mbcancel],0);
    label5.Caption := '';
    lab_rkey10.Caption := '0';
    edit1.Text := '';
   end
   else
    begin
    label5.Caption := '';
    lab_rkey10.Caption := '0';
    end;
 finally
   frm_cust.free;
 end
 else
  if (trim(edit1.Text)='') then
   begin
    label5.Caption := '';
    lab_rkey10.Caption := '0';
   end;

end;

procedure TForm9.Edit2Exit(Sender: TObject);
var
 i:byte;
begin
if (activecontrol.Name<>'BitBtn2') and (trim(edit2.text)<>'') then
try
 form_po:=tform_po.Create(application);
 with form_po.ADOQuery1 do
  begin
   close;
   Parameters[1].Value:=lab_rkey10.Caption;
   open;
  end;
  form_po.Edit1.Text:=trim(edit2.Text);

 if comparetext(trim(edit2.text),trim(form_po.ADOQuery1.Fieldbyname('po_number').AsString))=0 then
  begin
   edit2.Font.Color := clwindowtext;
   lab_rkey97.Caption := form_po.ADOQuery1.fieldbyname('rkey').AsString;
   if edit1.Text = '' then
   with dm.ADOQuery3 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select rkey,cust_code,customer_name from data0010');
     sql.Add('where rkey='+form_po.ADOQuery1.fieldbyname('customer_ptr').AsString);
     active:=true;
     edit1.Text := trim(fieldbyname('cust_code').AsString);
     edit1.Font.Color := clwindowtext;
     label5.Caption := fieldbyname('customer_name').AsString;
     lab_rkey10.Caption := fieldbyname('rkey').AsString;
    end;
   for i:=1 to stringgrid1.RowCount-2 do
    stringgrid1.Rows[i].Clear;
    stringgrid1.RowCount:=2;
   with dm.ADOQuery2 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select sales_order,customer_part_number,cp_rev,ent_date,CUSTOMER_CONTACT');
     sql.Add('from data0060,data0050');
     sql.Add('where cust_part_ptr=data0050.rkey');
     sql.Add('and status=1 and PROD_REL=''1''');
     sql.Add('and PURCHASE_ORDER_PTR='+lab_rkey97.Caption);
     active:=true;
     if not isempty then
     for i:=1 to RecordCount do
      begin
       stringgrid1.Cells[0,i]:=fieldbyname('sales_order').AsString;
       stringgrid1.Cells[1,i]:=fieldbyname('customer_part_number').AsString;
       stringgrid1.Cells[2,i]:=fieldbyname('cp_rev').AsString;
       stringgrid1.Cells[3,i]:=fieldbyname('ent_date').AsString;
       stringgrid1.Cells[4,i]:=fieldbyname('customer_contact').AsString;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       next;
      end;
    end;

  end
 else
  begin
   edit2.Text := '';
   lab_rkey97.Caption := '';
  end;
finally
 form_po.free;
end;

end;

procedure TForm9.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='销售定单';
 stringgrid1.Cells[1,0]:='客户部件';
 stringgrid1.Cells[2,0]:='修订本';
 stringgrid1.Cells[3,0]:='输入日期';
 stringgrid1.Cells[4,0]:='联络人';
 stringgrid2.Cells[0,0]:='销售定单';
 stringgrid2.Cells[1,0]:='客户部件';
 stringgrid2.Cells[2,0]:='修订本';
 stringgrid2.Cells[3,0]:='输入日期';
 stringgrid2.Cells[4,0]:='联络人';

end;


procedure TForm9.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color :=clblue;
 end;
end;

procedure TForm9.PopupMenu1Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
    N1.Enabled:=false
 else
    N1.Enabled:=true;
end;

procedure TForm9.PopupMenu2Popup(Sender: TObject);
begin
 if stringgrid2.Row=stringgrid2.RowCount-1 then
    N2.Enabled:=false
 else
    N2.Enabled:=true;
end;

procedure TForm9.StringGrid1MouseDown(Sender: TObject;
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

procedure TForm9.StringGrid2MouseDown(Sender: TObject;
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

procedure TForm9.N1Click(Sender: TObject);
var
 i:byte;
begin
 stringgrid2.Rows[stringgrid2.RowCount-1].Text:=stringgrid1.Rows[stringgrid1.row].Text;
 stringgrid2.RowCount:= stringgrid2.RowCount+1;
 for i:= stringgrid1.row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 button1.Enabled := true;
end;

procedure TForm9.N2Click(Sender: TObject);
var
 i:byte;
begin
 stringgrid1.Rows[stringgrid1.RowCount-1].Text:=stringgrid2.Rows[stringgrid2.row].Text;
 stringgrid1.RowCount:= stringgrid1.RowCount+1;
 for i:= stringgrid2.row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 if stringgrid2.RowCount=2 then
    button1.Enabled:=false;
end;

procedure TForm9.StringGrid1DblClick(Sender: TObject);
begin
if stringgrid1.Row<>stringgrid1.RowCount-1 then
 N1click(sender);
end;

procedure TForm9.Button1Click(Sender: TObject);
var
 i:byte;
begin
if messagedlg('要修改这些SO的记事本吗?',mtConfirmation,[mbyes,mbno],0)=mrno then
 for i:=1 to stringgrid2.RowCount-2 do
  begin
    with dm.ADOQuery2 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select status');
     sql.Add('from data0060');
     sql.Add('where sales_order=:so');
     Parameters[0].Value:=trim(stringgrid2.Cells[0,i]);
     active:=true;
     edit;
     fieldvalues['status']:=2;  //使成为暂缓
     post;
    end;
  end
else
 for i:=1 to stringgrid2.RowCount-2 do
  begin
    with dm.ADOQuery2 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select rkey,status');
     sql.Add('from data0060');
     sql.Add('where sales_order=:so');
     Parameters[0].Value:=trim(stringgrid2.Cells[0,i]);
     active:=true;

     try
     edit_note:=Tedit_note.Create(application);
     edit_note.Caption:='置于暂缓:'+stringgrid2.Cells[0,2];
      with dm.AQ9711 do
       begin
        if active=true then active:=false;
        sql.Clear;
        sql.Add('select * from data0011 where source_type=60');
        sql.Add('and file_pointer='+dm.ADOQuery2.fieldbyname('RKEY').AsString);
        active:=true;
        if not isempty then edit_note.Memo1.Text := fieldvalues['memo_text'];
       end;
     if edit_note.ShowModal=mrok then
      begin
       if (not dm.AQ9711.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
        begin             //原记录有记事本而且修改了
         dm.AQ9711.Edit;
         dm.AQ9711.FieldValues['memo_text']:=edit_note.Memo1.Text;
         dm.AQ9711.Post;
        end
       else
        if (not dm.AQ9711.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
         dm.AQ9711.Delete
        else
         if (dm.AQ9711.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
          begin
          dm.AQ9711.Append;
          dm.AQ9711.FieldByName('file_pointer').AsString:=dm.ADOQuery2.fieldbyname('rkey').AsString;
          dm.AQ9711.Fieldvalues['source_type']:=60;
          dm.AQ9711.FieldValues['memo_text']:=edit_note.Memo1.Text;
          dm.AQ9711.post;
          end;
       edit;
       fieldvalues['status']:=2; //使成为暂缓
       post;
     end;
    finally
     edit_note.free;
    end;
   end;
  end;
 ModalResult:=mrok;
end;

end.

unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls, Menus,
  ExtCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SO1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SO1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses damo, add_ship, add_packlist, note, conf_note;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 i:byte;
begin

with form5 do
 begin
  for i := 1 to stringgrid2.RowCount-2 do //比较是否重复
  if strtoint(stringgrid2.Cells[0,i])=dm.ADOTa64rkey64.Value then
   begin
    messagedlg('该批指派已在装箱单中!',mtinformation,[mbok],0);
    exit;
   end;
 end;

if (dm.ADO0439ship_addr_ptr.Value>0) and
   (dm.ADO0439ship_addr_ptr.Value<>dm.ADOTa64CUST_SHIP_ADDR_PTR.Value) then
 begin
  if messagedlg('装箱单中的地址与SO中的地址不一致,是否继续?',mtconfirmation,[mbyes,mbno],0)<>mryes then
   exit;
 end;


if (form5.po_number.Caption<>'') and
   (form5.po_number.Caption<>dm.ADOTa64PO_NUMBER.Value) then
 begin
  if messagedlg('现有订单客户订单号与被选择订单的客户订单号不一致,是否继续?',mtconfirmation,[mbyes,mbno],0)<>mryes then
   exit;
 end;
 form1.ModalResult:=mrok;

end;

procedure TForm1.N1Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='销售定单记事本:'+dbgrid1.Columns[0].Field.value;
  edit_note.BitBtn1.Enabled:=false;
  edit_note.Memo1.ReadOnly:=true;
  edit_note.Memo1.Color:=cl3dlight;
  edit_note.Button1.Visible:=false;
  edit_note.Button2.Visible:=false;
  edit_note.Button3.Visible:=true;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=60 and');
    sql.Add('file_pointer='+dm.ADOTa64rkey60.AsString);
    open;
    if not isempty then
     edit_note.Memo1.Text := FieldValues['memo_text'];
   end;
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='销售定单确认记事本:'+dbgrid1.Columns[0].Field.value;
  edit_note.BitBtn1.Enabled:=false;
  edit_note.Memo1.ReadOnly:=true;
  edit_note.Memo1.Color:=cl3dlight;
  edit_note.Button1.Visible:=false;
  edit_note.Button2.Visible:=false;
  edit_note.Button3.Visible:=true;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=1060 and');
    sql.Add('file_pointer='+dm.ADOTa64rkey60.AsString);
    open;
    if not isempty then
    for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='销售定单装运指派记事本:'+dbgrid1.Columns[0].Field.value;
  edit_note.BitBtn1.Enabled:=false;
  edit_note.Memo1.ReadOnly:=true;
  edit_note.Memo1.Color:=cl3dlight;
  edit_note.Button1.Visible:=false;
  edit_note.Button2.Visible:=false;
  edit_note.Button3.Visible:=true;
  with dm.ADOquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=64 and file_pointer='+dm.ADOTa64rkey64.AsString);
    open;
   if not isempty then
    for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm1.SO1Click(Sender: TObject);
var
 i:byte;
begin
 try
  form7 := Tform7.Create(application);
  form7.Caption:='销售定单装运记事本: '+dbgrid1.Columns[0].Field.value;
  with dm.ADOQuery1 do      //查找销售定单装运记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0179');
    sql.Add('where so_ptr='+dm.ADOTa64rkey60.AsString);
    active := true;
    if not isempty then
    for i:=1 to 10 do
     form7.Memo1.Lines.Add(Fieldbyname('LINE_'+inttostr(i)).AsString);
   end;
  form7.ShowModal;
 finally
  form7.free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
try
 form2:=tform2.Create(application);
 form2.ShowModal;
finally
 form2.Free;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
dm.ADOTa64.Close;
dm.ADOTa64.Open;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>'QUAN_SHIPPED') and
   (column.FieldName<>'SHIPMENT_NO')  then
 begin
  label1.Caption:=column.Title.Caption;
  label2.Caption:=column.FieldName;
  edit1.SetFocus;
  edit1.Text:='';
 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 DM.ADOTa64.Filter:= label2.Caption+' like '''+trim(edit1.Text)+'%'''
else
 dm.ADOTa64.Filter:='';
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(dm.ADOTa64.SQL.Text);
 if (key=13) and (not dm.ADOTa64.IsEmpty) then  button1click(sender);
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then button1click(sender);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
if dm.ADOTa64.Filter<>'' then dm.ADOTa64.Filter:='';
end;

end.

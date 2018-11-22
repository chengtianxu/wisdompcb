unit supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
uses damo;
{$R *.dfm}

procedure TForm6.FormShow(Sender: TObject);
var
 i:byte;
begin
with dm.ADOQuery2 do
 begin
  active:=false;
  sql.Clear;
  sql.Add('select rkey,supplier_name,contact_name_1,CONT_PHONE_1,');
  sql.Add('BILLING_ADDRESS_1');
  sql.Add('from data0023 where rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
  active:=true;
  edit2.Text := fieldvalues['supplier_name'];
  edit1.Text := fieldbyname('contact_name_1').AsString;
  edit3.Text := fieldbyname('cont_phone_1').AsString;
  edit4.Text := fieldbyname('BILLING_ADDRESS_1').AsString;

 end;
with dm.ADOQuery1 do
 begin
  active:=false;          //读取一般记事本
  sql.Clear;
  sql.Add('select * from data0011');
  sql.Add('where source_type=4023 and');
  sql.Add('file_pointer='+dm.ADO70SUPPLIER_POINTER.AsString);
  active:=true;
  if not isempty then
   for i:=1 to 4 do
    memo1.Lines.Add(fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
 end;
with dm.ADOQuery1 do
 begin
  active:=false;          //读取一般记事本
  sql.Clear;
  sql.Add('select * from data0011');
  sql.Add('where source_type=5023 and');
  sql.Add('file_pointer='+dm.ADO70SUPPLIER_POINTER.AsString);
  active:=true;
  if not isempty then
   for i:=1 to 4 do
    memo2.Lines.Add(fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
 end;
end;

end.

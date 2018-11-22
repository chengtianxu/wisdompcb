unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, Menus;

type
  TForm1 = class(TForm)
    BitBtncancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    ADO465: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    BitBnpost: TBitBtn;
    Edit4: TEdit;
    Label6: TLabel;
    ADO415: TADOQuery;
    ADO415rkey: TAutoIncField;
    ADO415number: TStringField;
    ADO415type: TWordField;
    ADO415status: TWordField;
    ADO415empl_ptr: TIntegerField;
    ADO415custpart_ptr: TIntegerField;
    ADO415sys_date: TDateTimeField;
    ADO415quantity: TIntegerField;
    ADO415reference: TStringField;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    ADO465QUANTITY: TIntegerField;
    ADO465REFERENCE: TStringField;
    ADO415rma_ptr: TIntegerField;
    Label3: TLabel;
    Edit3: TEdit;
    ADO465WORK_ORDER_NUMBER: TStringField;
    ADO465ABBR_NAME: TStringField;
    ADO465LOCATION: TStringField;
    ADO465REFERENCE_NUMBER: TStringField;
    procedure BitBtncancelClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBnpostEnter(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   v_close:byte;

  public
    { Public declarations }
   rkey50:integer;
  end;

var
  Form1: TForm1;
   function Power(x, y : extended) : extended;
implementation

uses main_one;

{$R *.dfm}

procedure TForm1.BitBtncancelClick(Sender: TObject);
begin
self.v_close:=1;
close;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color = clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color := clblue;
 end;
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TForm1.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit6.SetFocus;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
ADO465.Close;
ADO465.Parameters[0].Value:=ADO415rkey.Value;
ADO465.open;
 if (ADO415type.Value=3) and (ADO415rma_ptr.Value>0) then
  with adoquery1 do
  begin
   close;
   sql.Text:='select rkey,RMA_NUMBER  from data0098 where rkey='+ADO415rma_ptr.AsString;
   open;
   edit3.Text:=fieldbyname('rma_number').AsString;
  end;

  edit4.Text:=self.ADO415number.Value;
  edit5.Text:=self.ADO415sys_date.AsString;
  edit6.Text:=self.ADO415reference.AsString;
  edit7.Text:=self.ADO415quantity.AsString;
  edit1.Text:=form4.AQ415cust_code.Value;
  label4.Caption:=form4.AQ415CUSTOMER_NAME.Value;
  edit2.Text:=form4.AQ415MANU_PART_NUMBER.Value;
  label5.Caption:=form4.AQ415MANU_PART_DESC.Value;
//  edit3.Text:=form4.AQ415CP_REV.Value;
  rkey50:=self.ADO415custpart_ptr.Value;

  edit1.Enabled:=false;
  edit2.Enabled:=false;
  bitbtn2.Enabled:=false;
  bitbtn3.Enabled:=false;

end;

procedure TForm1.BitBnpostEnter(Sender: TObject);
begin
if (trim(edit4.Text)='') then
 begin
  showmessage('出仓单号不能为空!');
  edit4.SetFocus;
  exit;
 end;

if strtoint(edit7.Text)=0 then
 begin
  messagedlg('出仓数量不能为零!',mtinformation,[mbok],0);
  dbgrid1.SetFocus;
  exit;
 end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm1.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit1.SetFocus;
end;

procedure TForm1.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid1.SetFocus;
end;

end.

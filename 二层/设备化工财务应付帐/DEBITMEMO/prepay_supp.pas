unit prepay_supp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    aq129: TADOQuery;
    DataSource1: TDataSource;
    aq129CODE: TStringField;
    aq129SUPPLIER_NAME: TStringField;
    aq129SRCE_PTR: TIntegerField;
    aq129CHECK_NUMBER: TStringField;
    aq129CURR_PTR: TIntegerField;
    aq129EX_RATE: TBCDField;
    aq129CURR_CODE: TStringField;
    aq129CURR_NAME: TStringField;
    aq129BANK_NAME: TStringField;
    aq129AMOUNT: TBCDField;
    aq129RKEY: TIntegerField;
    DBGrid1: TDBGrid;
    aq129abbr_name: TStringField;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
   field_name:string;    
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses datamd;

{$R *.dfm}

procedure TForm3.NewGridWnd(var Message: TMessage);
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

procedure TForm3.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 self.aq129.Open;
 if aq129.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
 field_name:='CHECK_NUMBER';     //Éè±¸¹ýÂË×Ö¶Î
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  aq129.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  aq129.Filter:='';
 if aq129.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(Aq129.SQL.Text);
 if (key=13) and (not aq129.IsEmpty) then ModalResult:=mrok;  
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

procedure TForm3.DBGrid1DblClick(Sender: TObject);
begin
 if (not aq129.IsEmpty) then ModalResult:=mrok;
end;

end.

unit selout_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids, ComCtrls;

type
  TForm_selout = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dt1Exit(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_selout: TForm_selout;

implementation

uses damo,main;
{$R *.dfm}

procedure TForm_selout.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (field_name<>column.FieldName)and (column.ReadOnly)  then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

procedure TForm_selout.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADOout557.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADOout557.filter := '';
end;

procedure TForm_selout.BitBtn3Click(Sender: TObject);
begin
form1.CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_selout.BitBtn2Click(Sender: TObject);
begin
dm.ADOOUT557.Close;
dm.ADOOUT557.Open;
end;

procedure TForm_selout.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_selout.FormCreate(Sender: TObject);
begin
field_name:='mat_code';
dt2.Date:=strtodatetime(form1.sys_time);
dt1.Date:=dt2.Date-5;
with dm.ADOOUT557 do
 begin
 close;
 parameters[0].Value:=dt1.Date;
 parameters[1].Value:=dt2.Date+1;
 open;
 end;
end;

procedure TForm_selout.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssalt in shift) and ((KEY=ord('s'))or(KEY=ord('S')))then
SHOWMESSAGE(dm.ADOOUT557.CommandText);
end;

procedure TForm_selout.dt1Exit(Sender: TObject);
begin
dm.ADOOUT557.Close;
dm.ADOOUT557.Parameters[0].Value:=dt1.Date;
dm.ADOOUT557.Parameters[1].Value:=dt2.Date+1;
dm.ADOOUT557.Open;
end;

end.

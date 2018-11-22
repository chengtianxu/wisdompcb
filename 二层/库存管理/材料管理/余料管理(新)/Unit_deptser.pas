unit Unit_deptser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_deptser = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    ADOQuery1ctype: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    field_name :string;
  public
    { Public declarations }
  end;

var
  Form_deptser: TForm_deptser;

implementation

{$R *.dfm}

procedure TForm_deptser.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_deptser.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  adoquery1.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
 adoquery1.Filter:='';
end;

procedure TForm_deptser.DBGrid1TitleClick(Column: TColumn);
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

procedure TForm_deptser.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_deptser.FormCreate(Sender: TObject);
begin
self.ADOQuery1.Open;
field_name:='dept_code';
end;

procedure TForm_deptser.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_deptser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then button1.click;
end;

end.

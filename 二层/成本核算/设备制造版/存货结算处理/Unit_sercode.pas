unit Unit_sercode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TForm_Sercode = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1ctype: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Sercode: TForm_Sercode;
  field_name :string;

implementation

uses uDM;

{$R *.dfm}

procedure TForm_Sercode.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_Sercode.Button1Click(Sender: TObject);
begin
 modalresult:=mrok;
end;

procedure TForm_Sercode.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_Sercode.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   self.ADOQuery1.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else self.ADOQuery1.filter := '';
 if adoquery1.IsEmpty then
   button1.Enabled:=false
 else button1.Enabled:=true;
end;

procedure TForm_Sercode.DBGrid1TitleClick(Column: TColumn);
var i:byte;
begin
 if (field_name<>column.FieldName)and (column.ReadOnly)  then
 begin
  label1.Caption:=column.Title.Caption+':';
  field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
 else edit1.SetFocus;
end;

procedure TForm_Sercode.FormCreate(Sender: TObject);
begin
  field_name:='dept_code';
  self.ADOQuery1.Open;
  if adoquery1.IsEmpty then
   button1.Enabled:=false
  else button1.Enabled:=true;
end;

procedure TForm_Sercode.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then
   modalresult:=mrok;
end;

procedure TForm_Sercode.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

end.

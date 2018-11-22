unit AccSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls;

type
  TFRMAccSearch = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1CURR_TP: TWordField;
    ADOQuery1CURR_PTR: TIntegerField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1GL_ACC_NUMBER: TStringField;
    ADOQuery1description_2: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
    field_name :string;
  public
    { Public declarations }
  end;

var
  FRMAccSearch: TFRMAccSearch;

implementation

uses main ,edititem;
{$R *.dfm}

procedure TFRMAccSearch.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TFRMAccSearch.Button1Click(Sender: TObject);
begin
ModalResult:=mrOK;
end;

procedure TFRMAccSearch.Button2Click(Sender: TObject);
begin
frmaccsearch.Close;
end;

procedure TFRMAccSearch.Edit1Change(Sender: TObject);
begin
IF TRIM(EDIT1.TEXT)<>'' THEN
 if self.RadioGroup1.ItemIndex=0 then
  adoQUERY1.Filter := field_name+' like '''+trim(EDIT1.TEXT)+'%'''
 else
  adoQUERY1.Filter := field_name+' like ''%'+trim(EDIT1.TEXT)+'%'''
ELSE
  adoQUERY1.FILTER := '';

end;

procedure TFRMAccSearch.DBGrid1DblClick(Sender: TObject);
begin
ModalResult:=mrok;
end;

procedure TFRMAccSearch.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;



procedure TFRMAccSearch.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
 if (column.ReadOnly) and (column.FieldName<>self.field_name) then
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

procedure TFRMAccSearch.RadioGroup1Click(Sender: TObject);
begin
 edit1.SetFocus;
end;

procedure TFRMAccSearch.FormCreate(Sender: TObject);
begin
field_name :='gl_acc_number';
self.ADOQuery1.Open;
end;

procedure TFRMAccSearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.

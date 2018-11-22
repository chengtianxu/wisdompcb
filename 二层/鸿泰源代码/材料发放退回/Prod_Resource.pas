unit Prod_Resource;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ADODB, ExtCtrls;

type
  Tform_dept = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    ADOQuery1ctype: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  form_dept: Tform_dept;

implementation

{$R *.DFM}
USES damo;

procedure Tform_dept.BitBtn1Click(Sender: TObject);
begin
 EDIT1.TEXT:='';
 edit1.SetFocus;
end;

procedure Tform_dept.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter:=field_name+ ' LIKE ''%'+TRIM(EDIT1.TEXT)+'%'''
 ELSE
  Adoquery1.FILTER:='';
end;

procedure Tform_dept.DBGrid1DblClick(Sender: TObject);
begin
if not self.ADOQuery1.IsEmpty then  Modalresult:=mrOK;
end;

procedure Tform_dept.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and ( not self.ADOQuery1.IsEmpty) then modalresult:=mrok;
end;

procedure Tform_dept.FormCreate(Sender: TObject);
begin
 self.field_name:='dept_code';
  Adoquery1.Open ;
end;

procedure Tform_dept.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  self.Edit1.SetFocus;
 end;
end;

procedure Tform_dept.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure Tform_dept.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(self.ADOQuery1.SQL.Text);
end;

end.

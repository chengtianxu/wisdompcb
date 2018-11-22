unit dpment_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TForm_dept = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOStoredProc;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    PreColumn: TColumn;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_dept: TForm_dept;

implementation

uses damo,common;

{$R *.dfm}

procedure TForm_dept.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    ADOQuery1.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    ADOQuery1.Filter:='';
  
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_dept.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_dept.DBGrid1DblClick(Sender: TObject);
begin
if  (not adoquery1.IsEmpty) then
 ModalResult:=mrok;
end;

procedure TForm_dept.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then  ModalResult:=mrok;
end;

procedure TForm_dept.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_dept.DBGrid1TitleClick(Column: TColumn);
begin


  if (PreColumn.FieldName<>column.FieldName)  and
    (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
  edit1.SetFocus;
end;

procedure TForm_dept.FormShow(Sender: TObject);
begin
  PreColumn:= DBGrid1.Columns[0];
  PreColumn.title.Color := clred;
end;

end.

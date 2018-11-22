unit employee_search;

interface

uses
  SysUtils, Classes, Controls, Forms, 
  Db, DBGrids, Buttons, StdCtrls, ADODB, ExtCtrls, Grids;

type
  TForm_Employee = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOStoredProc;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   fieldname:string; 
  public
    { Public declarations }
  end;

var
  Form_Employee: TForm_Employee;

implementation

{$R *.DFM}

procedure TForm_Employee.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter := fieldname+' like ''%'+edit1.text+'%'''
 else
  Adoquery1.filter := '';
end;

procedure TForm_Employee.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.setfocus;
end;

procedure TForm_Employee.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult := mrOK;
end;

procedure TForm_Employee.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrOK;
end;

procedure TForm_Employee.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 fieldname:='empl_code';
end;

procedure TForm_Employee.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;
end;

procedure TForm_Employee.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.fieldname then
 begin
  label1.Caption:=column.Title.Caption;
  fieldname:=column.FieldName;
  edit1.SetFocus;
 end;
end;

end.

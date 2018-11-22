unit employee_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ADODB, ExtCtrls;

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
    ADOQuery1rkey: TIntegerField;
    ADOQuery1empl_code: TStringField;
    ADOQuery1employee_name: TStringField;
    RadioGroup1: TRadioGroup;
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Employee: TForm_Employee;

implementation
uses damo;
{$R *.DFM}

procedure TForm_Employee.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  if radiogroup1.ItemIndex=0 then
   Adoquery1.Filter :='empl_code like '''+edit1.text+'%'''
  else
   Adoquery1.Filter :='employee_name like ''%'+edit1.text+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_Employee.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.setfocus;
end;

procedure TForm_Employee.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult:=mrOK;
end;

procedure TForm_Employee.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrok;
end;

procedure TForm_Employee.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
end;

procedure TForm_Employee.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption := '雇员代码:'
else
 label1.Caption := '雇员姓名:';
 edit1.SetFocus;
end;

end.

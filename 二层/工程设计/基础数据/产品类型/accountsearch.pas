unit accountsearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, DBTables, StdCtrls, Grids, DBGrids, ADODB;

type
  TForm_acct = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOStoredProc;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1gl_acc_number: TStringField;
    ADOQuery1gl_description: TStringField;
    ADOQuery1db_cr: TStringField;
    ADOQuery1active_flag: TStringField;
    ADOQuery1type: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_acct: TForm_acct;

implementation
uses main;
{$R *.dfm}

procedure TForm_acct.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  adoQUERY1.Filter:='gl_acc_number like '''+trim(EDIT1.TEXT)+'%'''
 ELSE
  adoQUERY1.FILTER:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure TForm_acct.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_acct.ADOQuery1CalcFields(DataSet: TDataSet);
begin
if adoquery1.Fieldvalues['db_cr']='D' then
  adoquery1.FieldValues['type']:='½èÏî' else
if adoquery1.Fieldvalues['db_cr']='C' then
  adoquery1.FieldValues['type']:='´ûÏî';
end;

procedure TForm_acct.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_acct.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrok;
end;

procedure TForm_acct.FormCreate(Sender: TObject);
begin
adoquery1.Open;
end;

end.

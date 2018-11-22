unit AcctSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, DBTables, StdCtrls, Grids, DBGrids, ADODB, ExtCtrls;

type
  TForm_Acct = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1CURR_TP: TWordField;
    ADOQuery1CURR_PTR: TIntegerField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1GL_ACC_NUMBER: TStringField;
    ADOQuery1GL_DESCRIPTION: TStringField;
    ADOQuery1description_2: TStringField;
    RadioGroup1: TRadioGroup;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;

var
  Form_Acct: TForm_Acct;

implementation
uses  damo;
{$R *.dfm}

procedure TForm_Acct.Edit1Change(Sender: TObject);
begin
IF TRIM(EDIT1.TEXT)<>'' THEN
 if self.RadioGroup1.ItemIndex=0 then
  adoQUERY1.Filter := field_name+' like '''+trim(EDIT1.TEXT)+'%'''
 else
  adoQUERY1.Filter := field_name+' like ''%'+trim(EDIT1.TEXT)+'%'''
ELSE
  adoQUERY1.FILTER := '';

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_Acct.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_Acct.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if adoquery1.Fieldvalues['db_cr']='D' then
  adoquery1.FieldValues['type']:='½èÏî' else
 if adoquery1.Fieldvalues['db_cr']='C' then
  adoquery1.FieldValues['type']:='´ûÏî';
end;

procedure TForm_Acct.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then button1click(sender);
end;

procedure TForm_Acct.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name:='gl_acc_number';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_Acct.Button1Click(Sender: TObject);
begin
  ModalResult:=mrok;
end;

procedure TForm_Acct.DBGrid1DblClick(Sender: TObject);
begin
if (not adoquery1.IsEmpty) then button1click(sender);
end;

procedure TForm_Acct.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (column.FieldName<>self.field_name) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
 end;
end;

end.

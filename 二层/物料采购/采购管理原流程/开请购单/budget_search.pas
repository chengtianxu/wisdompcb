unit budget_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm_budget = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    edit1: TEdit;
    ADOQuery1: TADOStoredProc;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1CODE: TStringField;
    ADOQuery1DESCRIPTION: TStringField;
    ADOQuery1bud_year: TIntegerField;
    ADOQuery1GL_PTR: TIntegerField;
    ADOQuery1BUDGET_PERIOD_1: TFloatField;
    ADOQuery1BUDGET_PERIOD_2: TFloatField;
    ADOQuery1BUDGET_PERIOD_3: TFloatField;
    ADOQuery1BUDGET_PERIOD_4: TFloatField;
    ADOQuery1BUDGET_PERIOD_5: TFloatField;
    ADOQuery1BUDGET_PERIOD_6: TFloatField;
    ADOQuery1BUDGET_PERIOD_7: TFloatField;
    ADOQuery1BUDGET_PERIOD_8: TFloatField;
    ADOQuery1BUDGET_PERIOD_9: TFloatField;
    ADOQuery1BUDGET_PERIOD_10: TFloatField;
    ADOQuery1BUDGET_PERIOD_11: TFloatField;
    ADOQuery1BUDGET_PERIOD_12: TFloatField;
    ADOQuery1BUDGET_PERIOD_13: TFloatField;
    ADOQuery1USED_PERIOD_1: TFloatField;
    ADOQuery1USED_PERIOD_2: TFloatField;
    ADOQuery1USED_PERIOD_3: TFloatField;
    ADOQuery1USED_PERIOD_4: TFloatField;
    ADOQuery1USED_PERIOD_5: TFloatField;
    ADOQuery1USED_PERIOD_6: TFloatField;
    ADOQuery1USED_PERIOD_7: TFloatField;
    ADOQuery1USED_PERIOD_8: TFloatField;
    ADOQuery1USED_PERIOD_9: TFloatField;
    ADOQuery1USED_PERIOD_10: TFloatField;
    ADOQuery1USED_PERIOD_11: TFloatField;
    ADOQuery1USED_PERIOD_12: TFloatField;
    ADOQuery1USED_PERIOD_13: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_budget: TForm_budget;

implementation
uses damo;
{$R *.dfm}

procedure TForm_budget.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_budget.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter := 'CODE like '''+trim(edit1.Text)+'%'''
 else
  Adoquery1.Filter := '';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_budget.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then ModalResult := mrok;
end;

procedure TForm_budget.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrok;
end;

end.

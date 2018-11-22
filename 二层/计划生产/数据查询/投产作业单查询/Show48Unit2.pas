unit Show48Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShowUnit1, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TShow48Form2 = class(TShowForm1)
    ADOStoredProc1INTIME: TDateTimeField;
    ADOStoredProc1DEPT_NAME: TStringField;
    ADOStoredProc1OUTTIME: TDateTimeField;
    ADOStoredProc1dptname: TStringField;
    ADOStoredProc1QTY_PROD: TIntegerField;
    ADOStoredProc1QTY_REJECT: TFloatField;
    ADOStoredProc1EMPLOYEE_NAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Show48Form2: TShow48Form2;

implementation

{$R *.dfm}

end.

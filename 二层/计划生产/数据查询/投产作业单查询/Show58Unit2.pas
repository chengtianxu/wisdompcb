unit Show58Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShowUnit1, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TShow58Form2 = class(TShowForm1)
    ADOStoredProc1REJECT_DESCRIPTION: TStringField;
    ADOStoredProc1DEPT_NAME: TStringField;
    ADOStoredProc1resp_dept_name: TStringField;
    ADOStoredProc1QTY_REJECT: TFloatField;
    ADOStoredProc1PANELS: TIntegerField;
    ADOStoredProc1TDATETIME: TDateTimeField;
    ADOStoredProc1EMPLOYEE_NAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Show58Form2: TShow58Form2;

implementation

{$R *.dfm}

end.

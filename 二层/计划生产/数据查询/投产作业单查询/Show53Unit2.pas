unit Show53Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShowUnit1, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TShow53Form2 = class(TShowForm1)
    ADOStoredProc1QUANTITY: TFloatField;
    ADOStoredProc1MFG_DATE: TDateTimeField;
    ADOStoredProc1WAREHOUSE_NAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Show53Form2: TShow53Form2;

implementation

{$R *.dfm}

end.

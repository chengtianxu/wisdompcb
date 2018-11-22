unit Show38Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShowUnit1, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TShow38Form2 = class(TShowForm1)
    ADOStoredProc1STEP_NUMBER: TSmallintField;
    ADOStoredProc1DEPT_CODE: TStringField;
    ADOStoredProc1dptname: TStringField;
    ADOStoredProc1tooling_rev: TStringField;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    ADOStoredProc2: TADOStoredProc;
    DataSource2: TDataSource;
    ADOStoredProc2STEP_NUMBER: TSmallintField;
    ADOStoredProc2DEPT_CODE: TStringField;
    ADOStoredProc2DEPT_NAME: TStringField;
    ADOStoredProc2PARAMETER_NAME: TStringField;
    ADOStoredProc2PARAMETER_DESC: TStringField;
    ADOStoredProc2UNIT_CODE: TStringField;
    ADOStoredProc2UNIT_NAME: TStringField;
    ADOStoredProc2rkey: TAutoIncField;
    ADOStoredProc2PARAMETER_VALUE: TStringField;
    ADOStoredProc1rkey38: TIntegerField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Show38Form2: TShow38Form2;

implementation

{$R *.dfm}

procedure TShow38Form2.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ADOStoredProc1.Active then
      if ADOStoredProc1.RecordCount >0 then
          begin
              if ADOStoredProc2.Active then ADOStoredProc2.Close;
              ADOStoredProc2.Parameters.ParamValues['@RETURN_VALUE'] := 0;
              ADOStoredProc2.Parameters.ParamValues['@STEP_NUMBER'] := ADOStoredProc1STEP_NUMBER.Value;
              ADOStoredProc2.Parameters.ParamValues['@rkey38'] := ADOStoredProc1rkey38.Value;
              ADOStoredProc2.Open;
          end;
end;

end.

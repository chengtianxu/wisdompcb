unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOTMP: TADOQuery;
    Q_salary: TADOQuery;
    DS_Q_salary: TDataSource;
    qryModel: TADOQuery;
    dsModel: TDataSource;
    ADOTMP2: TADOQuery;
    procedure Q_salaryAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    check_flag: integer;
    change_flag: integer;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.Q_salaryAfterScroll(DataSet: TDataSet);
begin
  //dm.check_flag :=1;
  if not dm.Q_salary.Eof then
  begin
    check_flag:=DataSet.FieldValues['…Û∫À'];
    change_flag:=dataset.FieldValues['±‰÷µÀ¯∂®'];
  end;
end;

end.

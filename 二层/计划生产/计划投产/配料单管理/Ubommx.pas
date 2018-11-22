unit Ubommx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, ADODB;

type
  TForm_shomx = class(TForm)
    ADOQuery1: TADOQuery;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1alloc_datetime: TDateTimeField;
    ADOQuery1cp492_ptr: TIntegerField;
    ADOQuery1quan_alloc: TBCDField;
  private
    { Private declarations }
  public
    cp492rkey :Integer;
    { Public declarations }
  end;

var
  Form_shomx: TForm_shomx;

implementation

uses DmUnit1;

{$R *.dfm}

end.

unit deptinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons;

type
  TForm_deptinfo = class(TForm)
    ADO90: TADOQuery;
    ADO90DEPT_NAME: TStringField;
    ADO90EMPLOYEE_NAME: TStringField;
    ADO90auth_date: TDateTimeField;
    ADO90rkey: TAutoIncField;
    ADO90auth_flag: TStringField;
    ADO90dept_ptr: TIntegerField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADO360: TADOQuery;
    ADO360rkey: TAutoIncField;
    ADO360so_ptr: TIntegerField;
    ADO360quantity: TIntegerField;
    ADO360sch_date: TDateTimeField;
    DBGrid6: TDBGrid;
    DBGrid3: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADO90CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_deptinfo: TForm_deptinfo;

implementation

uses damo,common;

{$R *.dfm}

procedure TForm_deptinfo.FormActivate(Sender: TObject);
begin
self.ADO90.Open;
self.ADO360.Open;
OpenQuery(dm.ADOQuery1,
'select memo_text from data0011 where source_type = 97 and file_pointer = '+dm.ADS60PURCHASE_ORDER_PTR.AsString);
if not dm.ADOQuery1.IsEmpty then
 memo1.Text:=dm.ADOQuery1.fieldbyname('memo_text').AsString;
end;

procedure TForm_deptinfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
self.ADO90.Close;
self.ADO360.Close;
dm.ADOQuery1.Close;
end;

procedure TForm_deptinfo.ADO90CalcFields(DataSet: TDataSet);
begin
 if ado90auth_date.AsVariant = null then
  ado90auth_flag.Value := '¥˝…Û≈˙'
 else
  ado90auth_flag.Value := '“—∆¿…Û';
end;

end.

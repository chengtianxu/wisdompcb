unit 	Credit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls, DB, Grids, DBGrids, ADODB;

type
  TCreditForm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADO310: TADOQuery;
    ADO310Record_number: TIntegerField;
    ADO310cust_ptr: TIntegerField;
    ADO310APPR_BY: TWideStringField;
    ADO310ENT_date: TDateTimeField;
    ADO310Record: TWideStringField;
    procedure Button1Click(Sender: TObject);
    procedure ADO310AfterInsert(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreditForm: TCreditForm;

implementation

uses damo,common, main;

{$R *.dfm}

procedure TCreditForm.Button1Click(Sender: TObject);
begin
 ADO310.UpdateBatch();
 ModalResult:=mrok;
end;

procedure TCreditForm.ADO310AfterInsert(DataSet: TDataSet);
begin
 ADO310cust_ptr.Value:=dm.ads10rkey.Value;
 ADO310Record_number.Value:=self.ado310.RecordCount+1;
 ADO310ENT_date.Value:=common.getsystem_date(dm.aqtmp,0);
 with dm.aqtmp do
  begin
   close;
   sql.Text:='select EMPLOYEE_NAME from data0005 where rkey='+common.user_ptr;
   open;
  end;
 ADO310APPR_BY.Value:=dm.aqtmp.fieldbyname('EMPLOYEE_NAME').asstring;
end;

procedure TCreditForm.Button2Click(Sender: TObject);
begin
// self.ADO310.Cancel;
// self.ADO310.CancelBatch();
end;

end.

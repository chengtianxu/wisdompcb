unit PasInCollectQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TFrmInCollectQuery = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1QUANTITY: TBCDField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1PRODUCT_DESC: TStringField;
    Label2: TLabel;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInCollectQuery: TFrmInCollectQuery;

implementation

uses udm,common;

{$R *.dfm}

procedure TFrmInCollectQuery.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInCollectQuery.BitBtn2Click(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.Active then
    if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
        Export_dbGridEH_to_Excel(DBGridEh1,'Èë²Ö»ã×Ü') ;
end;



end.

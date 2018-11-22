unit PasOutCollectQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TFrmOutCollectQuery = class(TForm)
    DataSource2: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1PRODUCT_GROUP_NAME: TStringField;
    ADOQuery1quantity: TBCDField;
    ADOQuery1CPTatal: TBCDField;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1PRODUCT_DESC: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOutCollectQuery: TFrmOutCollectQuery;

implementation

uses udm,common;

{$R *.dfm}

procedure TFrmOutCollectQuery.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmOutCollectQuery.BitBtn2Click(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.Active then
    if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
        Export_dbGridEH_to_Excel(DBGridEh1,'³ö²Ö»ã×Ü') ;
end;

end.

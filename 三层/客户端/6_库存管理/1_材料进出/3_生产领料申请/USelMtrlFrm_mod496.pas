unit USelMtrlFrm_mod496;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseSinglePickListFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,uCommFunc,
  Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmSelMaterial_mod496 = class(TfrmSinglePickList)
    lbl1: TLabel;
    cbbWH: TComboBox;
    cdstemp: TClientDataSet;
    procedure edtFilterChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbWHChange(Sender: TObject);
    procedure edtFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelMaterial_mod496: TFrmSelMaterial_mod496;

implementation

{$R *.dfm}

procedure TFrmSelMaterial_mod496.cbbWHChange(Sender: TObject);
begin
  inherited;
   cdspick.Filter := '工厂='''+trim(cbbWH.text)+''' '  ;
   cdspick.Filtered:=true;
end;

procedure TFrmSelMaterial_mod496.edtFilterChange(Sender: TObject);
var
  fDate: Tdatetime;
begin

  if (FHotColumn.Field.DataType in [ftDate, ftDateTime]) and (trim(edtFilter.text)<>'') then
    if not TryStrToDate(trim(edtFilter.text), fDate) then
    begin
      Showmessage(trim(edtFilter.text) + '不是日期格式！');
      exit;
    end;
  inherited;

end;

procedure TFrmSelMaterial_mod496.edtFilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if Key<>13 then exit;

   btnOKClick(btnOK);
end;

procedure TFrmSelMaterial_mod496.FormCreate(Sender: TObject);
var
Lsql:string;
begin
  inherited;
 Lsql:='select rkey,ABBR_NAME from data0015 order by rkey';
   gSvrintf.IntfGetDataBySql(Lsql,cdsTemp);
   cdsTemp.First;
    while not cdsTemp.eof do
    begin
      cbbWH.Items.AddObject(cdstemp.FieldByName('ABBR_NAME').AsString,
      TObject(cdstemp.FieldByName('rkey').asinteger));
     cdsTemp.next;
    end;
    cbbWH.itemindex:=0;
end;

end.

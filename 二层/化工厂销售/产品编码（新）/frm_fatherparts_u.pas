unit frm_fatherparts_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  Tfrm_fatherparts = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btn2: TButton;
    btn1: TBitBtn;
    qryD08: TADOQuery;
    qryD08RKEY: TIntegerField;
    qryD08PROD_CODE: TStringField;
    qryD08PRODUCT_NAME: TStringField;
    qryD08PRODUCT_DESC: TStringField;
    qryD08PR_GRP_POINTER: TIntegerField;
    qryD08unit_ptr: TIntegerField;
    qryD08DEPT_PTR: TIntegerField;
    qryD08new_price: TBCDField;
    qryD08qty_onhand: TBCDField;
    qryD08min_qty: TBCDField;
    qryD08max_qty: TBCDField;
    qryD08TTYPE: TWordField;
    qryD08PR_GRP_CODE: TStringField;
    qryD08PRODUCT_GROUP_NAME: TStringField;
    qryD08UNIT_CODE: TStringField;
    qryD08UNIT_NAME: TStringField;
    qryD08DEPT_CODE: TStringField;
    qryD08DEPT_NAME: TStringField;
    qryD08ttype_c: TStringField;
    qryD08remark: TMemoField;
    qryD08total_cost: TBCDField;
    qryD08WORKHOUSE: TBCDField;
    qryD08create_date: TDateTimeField;
    qryD08employee_name: TStringField;
    dsDS1_1: TDataSource;
    conADOCon_1: TADOConnection;
    dbgrid1: TDBGridEh;
    edt1: TEdit;
    lbl1: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure dbgrid1TitleClick(Column: TColumnEh);
    procedure edt1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsSearch:string;
  public
    procedure init;
  end;

var
  frm_fatherparts: Tfrm_fatherparts;

implementation

uses DM_u,common;

{$R *.dfm}
procedure Tfrm_fatherparts.init;
begin
   qryD08.Connection := dm.ADOCon;
   qryD08.Parameters[0].Value := DM.D08.fieldbyname('rkey').Value;
   qryD08.Open;
   field_name := dbgrid1.Columns[0].FieldName;
   PreColumn := dbgrid1.Columns[0];
   dbgrid1.Columns[0].Title.Color := clred ;
end;



procedure Tfrm_fatherparts.btn2Click(Sender: TObject);
begin
 close;
end;

procedure Tfrm_fatherparts.dbgrid1TitleClick(Column: TColumnEh);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qryD08.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qryD08.Sort:=Column.FieldName+' DESC';
  end;

  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edt1Change(Edt1);
  end else
    edt1.SetFocus;
end;

procedure Tfrm_fatherparts.edt1Change(Sender: TObject);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edt1.text) <> '' then
    begin
      if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt1.text) + '%'')'
      else if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt1.text,0))+')';
    end else
      dbgrid1.DataSource.DataSet.Filter:='';
  end;

end;

procedure Tfrm_fatherparts.btn1Click(Sender: TObject);
begin
  if not qryD08.IsEmpty then
    Export_dbGridEH_to_Excel(dbgrid1,DM.D08.fieldbyname('product_name').AsString +'父类部件清单');
end;

end.

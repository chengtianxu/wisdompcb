unit UAllMtrls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, DB, ADODB, Buttons,
  ComCtrls;

type
  TfrmAllMtrls = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl2: TLabel;
    edt_PCode: TEdit;
    lbl3: TLabel;
    edt_PName: TEdit;
    btn_exit: TButton;
    btn_refresh: TButton;
    qry495: TADOQuery;
    ds495: TDataSource;
    qry495inv_part_number: TStringField;
    qry495INV_NAME: TStringField;
    qry495INV_PART_DESCRIPTION: TStringField;
    qry495UNIT_NAME: TStringField;
    qry495quantity: TFloatField;
    btn_Export1: TBitBtn;
    pnl3: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    eh495: TDBGridEh;
    eh495Detail: TDBGridEh;
    qry495_detail: TADOQuery;
    ds495_detail: TDataSource;
    qry495_detailpart_name: TStringField;
    qry495_detailinv_part_number: TStringField;
    qry495_detailINV_NAME: TStringField;
    qry495_detailINV_PART_DESCRIPTION: TStringField;
    qry495_detailUNIT_NAME: TStringField;
    lbl_field: TLabel;
    edt_value: TEdit;
    qry495_detailquantity: TBCDField;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure eh495KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_Export1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure eh495DetailTitleClick(Column: TColumnEh);
    procedure eh495TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    
  private
    { Private declarations }
    PreColumn: TColumnEh;
  public
    { Public declarations }
    procedure GetMtrls(rk08:integer);
  end;

var
  frmAllMtrls: TfrmAllMtrls;

implementation
uses DM_u,ConstVar,common;

{$R *.dfm}

procedure TfrmAllMtrls.btn_exitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAllMtrls.btn_refreshClick(Sender: TObject);
begin
 GetMtrls(DM.D08RKEY.asinteger);
end;

//   Lsql:=Format('declare @sql nvarchar(max)'
//  +#13#10 + 'set @sql='''  +'with bomlist(parentptr,ior,rk08,rk140, rk148,quantity,repl_invt_ptr) as  '
//  +#13#10 + '(select  a.part_ptr,b.invent_or,b.invent_ptr as rk08 ,a.rkey as rk140,b.rkey as rk148,b.quan_bom  as quantity,b.repl_invt_ptr'
//  +#13#10 + 'from data0140 as a join  '
//  +#13#10 + 'data0148 as b  on a.rkey =b.part_ptr '
//  +#13#10 + 'where  a.part_ptr= %d '
//  +#13#10 + 'union all   '
//  +#13#10 + 'select  a.part_ptr,b.invent_or,b.invent_ptr,a.rkey as rk140,b.rkey as rk148, b.quan_bom*e.quantity as quan_bom ,b.repl_invt_ptr'
//  +#13#10 + 'from data0140 as a  '
//  +#13#10 + 'join data0148 as b  on a.rkey=b.part_ptr '
//  +#13#10 + 'join  bomlist e on e.rk08= a.part_ptr '
//  +#13#10 + 'where  e.ior=1 and a.status=1)   '
//  +#13#10 + 'select d17.inv_part_number,d17.INV_NAME,d17.INV_PART_DESCRIPTION, d02.UNIT_NAME,sum(a.quantity)quantity  '
//  +#13#10 + 'from   bomlist a  '
//  +#13#10 + 'inner join data0017 d17 on  a.rk08=d17.rkey   '
//  +#13#10 + 'inner join data0002 d02 on d17.stock_unit_ptr=d02.rkey  '
//  +#13#10 + 'where  a.ior=0    '
//  +#13#10 + 'group by  d17.inv_part_number,d17.INV_NAME,d17.INV_PART_DESCRIPTION, d02.UNIT_NAME '''
//  + #13#10 + 'exec sp_executesql @sql' + #13#10,[DM.D08RKEY.asinteger]);
//  // ShowMessage(Lsql);

procedure TfrmAllMtrls.GetMtrls(rk08: integer);
var
  Lsql:string;
begin

 Lsql:=' select d17.inv_part_number,d17.INV_NAME,d17.INV_PART_DESCRIPTION, d02.UNIT_NAME,sum(b.QUAN_BOM)quantity '
+#13#10 + 'from  wzcp0494 a             '
+#13#10 + 'inner join wzcp0495 b on a.rkey=b.partBOm_ptr '
+#13#10 + 'inner join data0017 d17 on  b.INVENT_PTR=d17.rkey    '
+#13#10 + 'inner join data0002 d02 on d17.stock_unit_ptr=d02.rkey  '
+#13#10 + ' where a.status=1 and  a.part_ptr='+DM.D08RKEY.AsString
+#13#10 + 'group by  d17.inv_part_number,d17.INV_NAME,d17.INV_PART_DESCRIPTION, d02.UNIT_NAME ';

  try
  //if not common.OpenQuery(qry495,Lsql) then exit;

  qry495.Close;
  qry495.SQL.Clear;
  qry495.SQL.Text:=Lsql;
  qry495.open;

  qry495_detail.Close;
  qry495_detail.SQL.Clear;
  qry495_detail.SQL.Text:='select a.part_name, d17.inv_part_number,d17.INV_NAME,d17.INV_PART_DESCRIPTION, d02.UNIT_NAME,(b.QUAN_BOM)quantity '
            +#13#10 + 'from  wzcp0494 a             '
            +#13#10 + 'inner join wzcp0495 b on a.rkey=b.partBOm_ptr '
            +#13#10 + 'inner join data0017 d17 on  b.INVENT_PTR=d17.rkey    '
            +#13#10 + 'inner join data0002 d02 on d17.stock_unit_ptr=d02.rkey  '
            +#13#10 + ' where a.status=1 and  a.part_ptr='+DM.D08RKEY.AsString;
  qry495_detail.open;



  except  on e: Exception  do
  begin
  ShowMessage('错误：'+e.Message);
  exit;
  end;
 end;

end;

procedure TfrmAllMtrls.eh495KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(qry495.sql.Text);
end;

procedure TfrmAllMtrls.btn_Export1Click(Sender: TObject);
var
  eh:TDBGridEh;
begin
   if (pgc1.ActivePageIndex =0) and (not qry495_detail.IsEmpty)then
   eh:=eh495detail
   else if (pgc1.ActivePageIndex =1) and (not qry495.IsEmpty)then
    eh:=eh495
   else
   exit;  

 if not  qry495.isempty then
 common.Export_dbGridEH_to_Excel(eh,'BOM资料');
end;

procedure TfrmAllMtrls.FormShow(Sender: TObject);
begin
 pgc1.ActivePageIndex:=0;
 PreColumn:=eh495Detail.Columns[0];
 eh495Detail.Columns[0].Title.Color := clred ;

end;

procedure TfrmAllMtrls.pgc1Change(Sender: TObject);
begin


 if  pgc1.ActivePageIndex=0 then
 begin
 PreColumn:=eh495Detail.Columns[0];
 eh495Detail.Columns[0].Title.Color := clred ;
   lbl_field.caption:='BOM名称';
 end
 else
 begin
   PreColumn:=eh495.Columns[0];
 eh495.Columns[0].Title.Color := clred ;
 lbl_field.caption:='物料编码';
 end;
     edt_value.text:='';
     qry495.Filtered:=false;
     qry495_detail.Filtered:=false;


end;

procedure TfrmAllMtrls.eh495DetailTitleClick(Column: TColumnEh);
begin
 if eh495Detail.DataSource.DataSet.IsEmpty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry495_detail.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry495_detail.Sort:=Column.FieldName+' DESC';
  end;

  if eh495Detail.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (self.PreColumn.FieldName <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_valueChange(edt_value);
  end else
    edt_value.SetFocus;
end;

procedure TfrmAllMtrls.eh495TitleClick(Column: TColumnEh);
begin
 if eh495.DataSource.DataSet.IsEmpty then exit;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry495.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry495.Sort:=Column.FieldName+' DESC';
  end;

  if eh495.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (self.PreColumn.FieldName <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_valueChange(edt_value);
  end else
    edt_value.SetFocus;
end;

procedure TfrmAllMtrls.edt_valueChange(Sender: TObject);
var
  eh:TDBGridEh;
begin
   if pgc1.ActivePageIndex =0 then
   eh:=eh495detail
   else eh:=eh495;

  if eh.DataSource.DataSet.Filtered = False then eh.DataSource.DataSet.Filtered := True;
  if eh.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if eh.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in  [ftString, ftWideString]  then
        eh.DataSource.DataSet.Filter:=' (' +  PreColumn.FieldName + ' like ''%' + trim(edt_value.text) + '%'')'
      else if eh.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in  [ftSmallint, ftInteger]  then
        eh.DataSource.DataSet.Filter:=' (' + PreColumn.FieldName+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
    end else
      eh.DataSource.DataSet.Filter:='';
  end;

end;

end.

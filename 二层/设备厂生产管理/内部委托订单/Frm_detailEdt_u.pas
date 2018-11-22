unit Frm_detailEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  TFrm_detailEdt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Grd1: TDBGridEh;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
    Fdept:integer;
  public
    class function InitEdt(iDept:integer;Grd:TStringGrid):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iDept:integer;Grd:TStringGrid): boolean;
var i:integer;
    s:string;
begin
  with TFrm_detailEdt.Create(nil) do
  begin
    s:='';
    for i:=1 to Grd.RowCount-2 do s:=s+Grd.Cells[8,i]+',';   //rkey08 唯一
    s:=s+'0';
    DM.ADO08.Filter:='';
    DM.ADO08.Close;
    DM.ADO08.SQL.Text:='SELECT dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC,'+
                       'dbo.Data0008.new_price,dbo.Data0008.qty_onhand,'+
                       'case when Data0008.TTYPE=0 then ''半成品'' '+
                            'when Data0008.TTYPE=1 then ''成品'' end type_c,'+
                       'dbo.Data0008.rkey '+
                       'FROM dbo.Data0008 INNER JOIN dbo.Data0034 ON dbo.Data0008.DEPT_PTR = dbo.Data0034.RKEY '+
                       'where Data0008.TTYPE=0 and Data0034.RKEY='+inttostr(iDept)+' and not dbo.Data0008.RKEY in ('+s+') '+
                       ' ORDER BY dbo.Data0008.PROD_CODE';
    DM.ADO08.Open;
    if DM.ADO08.IsEmpty then
    begin
      showmessage('没有可新加的产品档案...');
      result:=false;
      free;
    end else begin
      Fdept:=iDept;
      field_name:='PROD_CODE';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;

      showmodal;
      free;
      DM.ADO08.Close;
      result:=true;
    end;
  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  with TFrm_out.Create(nil) do
  try
    Edit1.Text:=DM.ADO08.Fieldbyname('PROD_CODE').AsString;
    Edit2.Text:=DM.ADO08.Fieldbyname('PRODUCT_NAME').AsString;
    Edit3.Text:=DM.ADO08.Fieldbyname('PRODUCT_DESC').AsString;
    Edit4.Text:=DM.ADO08.Fieldbyname('qty_onhand').AsString;
    DateTimePicker1.date:=date()+5;
    i:=FGrd.RowCount-1;
    if showmodal=mrok then
    begin
      FGrd.Cells[0,i]:=Edit1.Text;
      FGrd.Cells[1,i]:=Edit2.Text;
      FGrd.Cells[2,i]:=Edit3.Text;
      FGrd.Cells[3,i]:=Edit5.Text;
      FGrd.Cells[4,i]:=Edit6.Text;
      FGrd.Cells[5,i]:=Edit7.Text;
      FGrd.Cells[7,i]:=Edit8.Text;
      FGrd.Cells[6,i]:=datetostr(DateTimePicker1.date);
      FGrd.Cells[8,i]:=DM.ADO08.Fieldbyname('rkey').AsString;
      FGrd.RowCount:=FGrd.RowCount+1;
      DM.ADO71_1.Append;
      DM.ADO71_1.FieldByName('prod_PTR').AsString:=FGrd.Cells[8,i];
      DM.ADO71_1.FieldByName('quantity').AsFloat:=strtofloat(Edit5.Text);
      DM.ADO71_1.FieldByName('price').AsFloat:=strtofloat('0'+Edit6.Text);
      DM.ADO71_1.FieldByName('tax_rate').AsFloat:=strtofloat('0'+Edit7.Text);
      DM.ADO71_1.FieldByName('complete_date').AsDateTime:=DateTimePicker1.date;
      DM.ADO71_1.FieldByName('remark').AsString:=edit8.Text;
      DM.ADO71_1.Post;
      DM.ADO08.Delete;
    end;
  finally
    free;
    if DM.ADO08.IsEmpty then self.close;
  end;

end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO08.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO08.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    if not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
      label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_detailEdt.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_detailEdt.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

end.

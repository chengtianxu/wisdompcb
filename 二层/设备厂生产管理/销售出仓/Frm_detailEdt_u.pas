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
    ADO08: TADOQuery;
    ADO08RKEY: TAutoIncField;
    ADO08PROD_CODE: TStringField;
    ADO08PRODUCT_NAME: TStringField;
    ADO08PRODUCT_DESC: TStringField;
    ADO08CODE: TStringField;
    ADO08LOCATION: TStringField;
    ADO08rkeycp01: TAutoIncField;
    ADO08location_ptr: TIntegerField;
    ADO08qty_on_hand: TBCDField;
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
  public
    class function InitEdt:boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt: boolean;
var i:integer;
    s:string;
begin
  result:=false;
  with TFrm_detailEdt.Create(nil) do
  try
    ADO08.Filter:='';
    ADO08.Close;
    ADO08.Parameters[0].Value:=DM.ADO71prod_ptr.AsInteger;
    ADO08.Open;
    if ADO08.IsEmpty then
      showmessage('此产品没有库存...')
    else begin
      PreColumn:=Grd1.Columns[0];
      field_name:=Grd1.Columns[0].Field.fullname;
      result:=showmodal=mrok;
    end;
  finally
    free;
  end;
end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADO08.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADO08.Sort:=Column.FieldName+' DESC';
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

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var Qty:Double;
begin
  Frm_out:=TFrm_out.Create(self);
  try
    Frm_out.Edit1.Text:=DM.ADO71PROD_CODE.AsString;
    Frm_out.Edit2.Text:=DM.ADO71PRODUCT_NAME.AsString;
    Frm_out.Edit3.Text:=DM.ADO71PRODUCT_DESC.AsString;
    Frm_out.Edit7.Text:=DM.ADO71price.AsString;
    Frm_out.Edit10.Text:=DM.ADO71tax_rate.AsString;
    Frm_out.Edit9.Text:=ADO08LOCATION.AsString;
    Frm_out.Edit4.Text:=ADO08qty_on_hand.AsString;

//2014-09-04tang修改.显示492最后一次生产单号------------------------------
    DM.Ado492.Close;
    dm.Ado492.Parameters.ParamByName('Rkey71').Value:=dm.ADO71rkey.Value;
    dm.Ado492.Parameters.ParamByName('Rkey08').Value:=ADO08RKEY.Value;
    dm.Ado492.Open;
    if (not DM.Ado492.IsEmpty) then
    Frm_out.Edit8.Text:=DM.Ado492.fieldBYName('CUT_NO').AsString;
//end tang ---------------------------------------

    Frm_out.Edit6.Text:=FloatToStr(DM.ADO71quantity.AsFloat + DM.ADO71returen_qty.AsFloat -DM.ADO71parts_shipped.AsFloat);
    DM.ADO63_1.Filter:='prod_ptr='+DM.ADO71prod_ptr.AsString;
    DM.ADO63_1.First;
    Qty:=0.0;
    while not DM.ADO63_1.Eof do
    begin
      Qty:=Qty+DM.ADO63_1.FieldByName('quantity').AsFloat;
      DM.ADO63_1.Next;
    end;
    Frm_out.FQty := Qty;
    DM.ADO63_1.Filter:='';

    if ADO08qty_on_hand.AsInteger>=DM.ADO71quantity.AsFloat-DM.ADO71parts_shipped.AsFloat-Qty then
      Frm_out.Edit5.Text:=floattostr(DM.ADO71quantity.AsFloat-DM.ADO71parts_shipped.AsFloat-Qty)
    else
      Frm_out.Edit5.Text:=Frm_out.Edit4.Text;


    if Frm_out.ShowModal=mrok then
    begin
      if DM.ADO63_1.Locate('prod_ptr;location_ptr',VarArrayOf([DM.ADO71prod_ptr.AsInteger,ADO08location_ptr.AsInteger]),[]) then
      begin
        DM.ADO63_1.Edit;
        DM.ADO63_1.FieldByName('quantity').AsFloat:=DM.ADO63_1.FieldByName('quantity').AsFloat + StrToFloat(Frm_out.Edit5.Text);
        DM.ADO63_1.FieldByName('remark').AsString:=Frm_out.Edit8.Text;
        DM.ADO63_1.FieldByName('price').AsString:=Frm_out.Edit7.Text;

        DM.ADO63_2.Locate('prod_ptr;location_ptr',VarArrayOf([DM.ADO71prod_ptr.AsInteger,ADO08location_ptr.AsInteger]),[]);
        DM.ADO63_2.Edit;
        DM.ADO63_2.FieldByName('quantity').AsFloat:=DM.ADO63_2.FieldByName('quantity').AsFloat + StrToFloat(Frm_out.Edit5.Text);
        DM.ADO63_2.FieldByName('remark').AsString:=Frm_out.Edit8.Text;
        DM.ADO63_2.FieldByName('price').AsString:=Frm_out.Edit7.Text;
        DM.ADO63_2.FieldByName('tax_rate').AsFloat:=StrToFloat(Frm_out.Edit10.Text); //
      end
      else
      begin
        DM.ADO63_1.Append;
        DM.ADO63_1.FieldByName('prod_ptr').AsInteger:=DM.ADO71prod_ptr.AsInteger;
        DM.ADO63_1.FieldByName('location_ptr').AsInteger:=ADO08location_ptr.AsInteger;
        DM.ADO63_1.FieldByName('cp71_ptr').AsInteger:=DM.ADO71rkey.AsInteger;
        DM.ADO63_1.FieldByName('quantity').AsFloat := StrToFloat(Frm_out.Edit5.Text);
        DM.ADO63_1.FieldByName('price').AsFloat:= StrToFloat(Frm_out.Edit7.Text);//DM.ADO71price.AsFloat;
        DM.ADO63_1.FieldByName('tax_rate').AsFloat:=StrToFloat(Frm_out.Edit10.Text);//DM.ADO71tax_rate.AsFloat;
        DM.ADO63_1.FieldByName('remark').AsString:=Frm_out.Edit8.Text;

        DM.ADO63_2.Append;
        DM.ADO63_2.FieldByName('prod_ptr').AsInteger:=DM.ADO71prod_ptr.AsInteger;
        DM.ADO63_2.FieldByName('location_ptr').AsInteger:=ADO08location_ptr.AsInteger;
        DM.ADO63_2.FieldByName('cp71_ptr').AsInteger:=DM.ADO71rkey.AsInteger;
        DM.ADO63_2.FieldByName('quantity').AsFloat := StrToFloat(Frm_out.Edit5.Text);
        DM.ADO63_2.FieldByName('price').AsFloat:=StrToFloat(Frm_out.Edit7.Text);//DM.ADO71price.AsFloat;
        DM.ADO63_2.FieldByName('tax_rate').AsFloat:=StrToFloat(Frm_out.Edit10.Text);//DM.ADO71tax_rate.AsFloat;
        DM.ADO63_2.FieldByName('remark').AsString:=Frm_out.Edit8.Text;
        DM.ADO63_2.FieldByName('PROD_CODE').AsString:=DM.ADO71PROD_CODE.AsString;
        DM.ADO63_2.FieldByName('PRODUCT_NAME').AsString:=DM.ADO71PRODUCT_NAME.AsString;
        DM.ADO63_2.FieldByName('PRODUCT_DESC').AsString:=DM.ADO71PRODUCT_DESC.AsString;
        DM.ADO63_2.FieldByName('location').AsString:=ADO08LOCATION.AsString;
      end;
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'update wzcp0071 set tax_rate = ' + Frm_out.Edit10.Text + ' where rkey= ' + IntToStr(DM.ADO71rkey.value);
        ExecSQL;
        DM.ADO71.Close;
        DM.ADO71.Open;
      end;
      DM.ADO63_1.Post;
      DM.ADO63_2.Post;
      ADO08.Delete;
    end;
  finally
    Frm_out.Free;
    if ADO08.IsEmpty then self.Close;
  end;
end;

end.

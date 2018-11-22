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
    Label8: TLabel;
    CBFac: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBFacChange(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
    Fdept:integer;
    s:string;
    Ffac:array[0..10] of integer;
    function CheckKZXM: Boolean;//检查控制项目
  public
    class function InitEdt(iDept:integer;Grd:TStringGrid;whouse_ptr:integer):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u, Frm_detail_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iDept:integer;Grd:TStringGrid;whouse_ptr:integer): boolean;
var i:integer;

begin
  with TFrm_detailEdt.Create(nil) do
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,abbr_name from data0015 where active_flag = ' + QuotedStr('Y');
    DM.tmp.Open;
    i:=0;
    while not DM.tmp.Eof do
    begin
      Ffac[i]:=DM.tmp.Fields[0].AsInteger;
      CBFac.Items.Append(DM.tmp.Fields[1].asstring);
      DM.tmp.Next;
      inc(i);
    end;
    CBFac.ItemIndex :=  whouse_ptr;
    s:='';
    for i:=1 to Grd.RowCount-2 do
      s:=s+Grd.Cells[5,i]+',';   //rkey17 唯一
    s:=s+'0';
    DM.ADO17.Filter:='';
    DM.ADO17.Close;
    DM.ADO17.SQL.Text:=' ( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,  '+
                       '         SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,  '+
                       '         dbo.data0016.LOCATION ,'''+'普通库存'+''' AS XY '+
                       '         FROM         dbo.Data0017 INNER JOIN  '+
                       '                                dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN  '+
                       '                                dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
                       '                                dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+
                       '                                dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+
                       '                                dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+
                       '         WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0022.QUAN_ON_HAND > 0) AND '+
                       '         dbo.Data0456.warehouse_ptr =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
                       '         GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, '+
                       '         dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION '+
                       '         )  '+
                       '         union all  '+
                       '         (    '+
                       '         SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, '+
                       '         SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,dbo.Data0023.ABBR_NAME, '+
                       '         dbo.Data0016.LOCATION , '''+'VMI库存'+''' AS XY_1 '+
                       '         FROM         dbo.DATA0134 INNER JOIN '+
                       '         dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN '+
                       '         dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+
                       '         dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN '+
                       '         dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
                       '         dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN  '+
                       '         dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY  '+
                       '         WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0134.QUAN_ON_HAND > 0) AND dbo.Data0133.warehouse_ptr  '+
                       '         =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
                       '         GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,    '+
                       '         dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION  '+
                       '         )   '+
                       '         ORDER BY  dbo.Data0017.INV_PART_NUMBER  '+#13;
   { DM.ADO17.SQL.Text:='SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty,'+
                        'dbo.Data0017.rkey,data0002.unit_name,data0023.abbr_NAME,data0017.MANUFACTURER_CODE,  dbo.Data0456.warehouse_ptr '+
                        'FROM dbo.Data0017 INNER JOIN '+
                        'dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN '+
                        'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
                        'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY LEFT OUTER JOIN dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY AND dbo.Data0017.PREF_SUPPLIER_PTR = dbo.Data0023.RKEY '+
                        'where not dbo.Data0017.RKEY in ('+s+') '+
                        'GROUP BY dbo.Data0017.rkey,dbo.Data0017.INV_PART_NUMBER,dbo.Data0017.INV_PART_DESCRIPTION,data0002.unit_name,data0023.abbr_NAME,data0017.MANUFACTURER_CODE, dbo.Data0456.warehouse_ptr '+
                        'HAVING (SUM(dbo.Data0022.QUAN_ON_HAND) > 0) '+whouse_ptr+' '+
                        'ORDER BY dbo.Data0017.INV_PART_NUMBER';  }
    DM.ADO17.Open;

      Fdept:=iDept;
      field_name:='location_code';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      showmodal;
      free;
      DM.ADO17.Close;

  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  if not CheckKZXM then Exit;
  with TFrm_out.Create(nil) do
  try
    if not DM.ADO17.IsEmpty then
    begin
    Edit1.Text:=DM.ADO17.Fieldbyname('INV_PART_NUMBER').AsString;
    Edit2.Text:=DM.ADO17.Fieldbyname('INV_part_description').AsString;
    Edit3.Text:=DM.ADO17.Fieldbyname('unit_name').AsString;
    Edit4.Text:=DM.ADO17.Fieldbyname('Qty').AsString;
    ComboBox1.Text:=DM.ADO17.Fieldbyname('abbr_NAME').AsString;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT dbo.Data0023.abbr_NAME '+
                     'FROM dbo.Data0023 INNER JOIN '+
                     'dbo.Data0028 ON dbo.Data0023.RKEY = dbo.Data0028.SUPPLIER_PTR '+
                     'where data0028.INVENTORY_PTR='+DM.ADO17.Fieldbyname('rkey').AsString;
    DM.tmp.Open;
    while not DM.tmp.Eof do
    begin
      ComboBox1.Items.Append(DM.tmp.Fields[0].asstring);
      DM.tmp.Next;
    end;
    DM.tmp.Close;
    
    i:=FGrd.RowCount-1;
    if showmodal=mrok then
    begin
      FGrd.Cells[0,i]:=Edit1.Text;
      FGrd.Cells[1,i]:=Edit2.Text;
      FGrd.Cells[2,i]:=Edit5.Text;
      FGrd.Cells[3,i]:=ComboBox1.Text;    //备注
      FGrd.Cells[4,i]:=DM.ADO17.Fieldbyname('unit_name').AsString;
      FGrd.Cells[5,i]:=DM.ADO17.Fieldbyname('rkey').AsString;
      FGrd.Cells[6,i]:=DM.ADO17.Fieldbyname('XY').AsString;
      s:=s+' , '+DM.ADO17.Fieldbyname('rkey').AsString;
      FGrd.RowCount:=FGrd.RowCount+1;

      DM.ADO468_1.Append;
      DM.ADO468_1.FieldByName('INVENT_PTR').AsString:=FGrd.Cells[5,i];
      DM.ADO468_1.FieldByName('quan_bom').AsString:=Edit5.Text;
      DM.ADO468_1.FieldByName('VENDOR').AsString:=ComboBox1.Text;

      DM.ADO468_1.FieldByName('step').AsInteger:=0;
      DM.ADO468_1.FieldByName('dept_ptr').AsInteger:=Fdept;
      DM.ADO468_1.FieldByName('invent_or').AsInteger:=0;
      DM.ADO468_1.Post;
      DM.ADO17.Delete;
    end;
    end;
  finally
    free;
    if DM.ADO17.IsEmpty then self.close;
  end;

end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO17.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO17.Sort:=Column.FieldName+' DESC';
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

procedure TFrm_detailEdt.CBFacChange(Sender: TObject);
begin
    DM.ADO17.Filter:='';
    DM.ADO17.Close;
    DM.ADO17.SQL.Text:=' ( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,  '+
                       '         SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,  '+
                       '         dbo.data0016.LOCATION ,'''+'普通库存'+''' AS XY '+
                       '         FROM         dbo.Data0017 INNER JOIN  '+
                       '                                dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN  '+
                       '                                dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
                       '                                dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+
                       '                                dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+
                       '                                dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+
                       '         WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0022.QUAN_ON_HAND > 0) AND '+
                       '         dbo.Data0456.warehouse_ptr =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
                       '         GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, '+
                       '         dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION '+
                       '         )  '+
                       '         union all  '+
                       '         (    '+
                       '         SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, '+
                       '         SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,dbo.Data0023.ABBR_NAME, '+
                       '         dbo.Data0016.LOCATION , '''+'VMI库存'+''' AS XY_1 '+
                       '         FROM         dbo.DATA0134 INNER JOIN '+
                       '         dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN '+
                       '         dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+
                       '         dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN '+
                       '         dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
                       '         dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN  '+
                       '         dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY  '+
                       '         WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0134.QUAN_ON_HAND > 0) AND dbo.Data0133.warehouse_ptr  '+
                       '         =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
                       '         GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,    '+
                       '         dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION  '+
                       '         )   '+
                       '         ORDER BY  dbo.Data0017.INV_PART_NUMBER  '+#13;

      DM.ADO17.Open;
end;

procedure TFrm_detailEdt.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (ssAlt in Shift)  and  (Key=86) then
        showmessage(DM.ADO17.SQL.Text);
end;

function TFrm_detailEdt.CheckKZXM: Boolean;
var
  LS: TStringList;
  I: Integer;
  tmpIndex: Integer;
  bHasExist: Boolean;
begin
  Result := True;
  DM.adsKZXM.Close;
  DM.adsKZXM.Parameters.ParamByName('PRKey17').Value := DM.ADO17.fieldbyname('RKey').AsInteger;
  DM.adsKZXM.Parameters.ParamByName('PRKey15').Value := Ffac[Frm_detail.CBFac.ItemIndex];
  DM.adsKZXM.Parameters.ParamByName('PRKey34').Value := Frm_detail.EdtDept.Tag;
  DM.adsKZXM.Open;

  if DM.adsKZXM.IsEmpty then Exit;
  if Frm_detail.cbbKZXM.Items.Count = 0 then
  begin
    while not DM.adsKZXM.Eof do
    begin
      Frm_detail.cbbKZXM.AddItem(DM.adsKZXM.fieldbyname('control_name').AsString,Pointer(DM.adsKZXM.fieldbyname('RKey').asInteger));
      DM.adsKZXM.Next;
    end;
    Frm_detail.cbbKZXM.ItemIndex := 0;
  end
  else
  begin
    DM.adsKZXM.First;
    while not DM.adsKZXM.Eof do
    begin
      bHasExist := False;
      for I := 0 to Frm_detail.cbbKZXM.Items.Count - 1 do
      begin
        if Integer(Frm_detail.cbbKZXM.Items.Objects[I]) = DM.adsKZXM.fieldbyname('RKey').asInteger then
        begin
          bHasExist := True;
          Break;
        end;
      end;
      if not bHasExist then
      begin
        Frm_detail.cbbKZXM.AddItem(DM.adsKZXM.fieldbyname('control_name').AsString,Pointer(DM.adsKZXM.fieldbyname('RKey').asInteger));
      end;
      DM.adsKZXM.Next;
    end;

//
//    LS := TStringList.Create;
//    try
//    while not DM.adsKZXM.Eof do
//    begin
//      for I := 0 to Frm_detail.cbbKZXM.Items.Count - 1 do
//      begin
//        if Integer(Frm_detail.cbbKZXM.Items.Objects[I]) = DM.adsKZXM.fieldbyname('RKey').asInteger then
//        begin
//          LS.AddObject(Frm_detail.cbbKZXM.Items[I],Frm_detail.cbbKZXM.Items.Objects[I]);
//        end;
//      end;
//      DM.adsKZXM.Next;
//    end;
//    if LS.Count = 0 then
//    begin
//      ShowMessage('一张配料单中不能有2种不同控制项目的材料');
//      Result := False;
//    end else
//    begin
//      tmpIndex := Frm_detail.cbbKZXM.ItemIndex;
//      Frm_detail.cbbKZXM.Items.Clear;
//      Frm_detail.cbbKZXM.Items.Assign(LS);
//      if Frm_detail.cbbKZXM.Items.Count -1 >= tmpIndex then
//      begin
//        Frm_detail.cbbKZXM.ItemIndex := tmpIndex;
//      end else
//        Frm_detail.cbbKZXM.ItemIndex := 0;
//    end;
//    finally
//      LS.Free;
//    end;
  end;
end;

end.

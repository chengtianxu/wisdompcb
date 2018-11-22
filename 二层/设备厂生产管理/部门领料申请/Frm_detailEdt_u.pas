unit Frm_detailEdt_u;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  TFrm_detailEdt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    CBFac: TComboBox;
    Grd1: TDBGridEh;
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
  public
    class function InitEdt(iDept:integer;Grd:TStringGrid;whouse_ptr:integer):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iDept:integer;Grd:TStringGrid;whouse_ptr:integer): boolean;
var i:integer;

begin
  with TFrm_detailEdt.Create(nil) do
  begin

    DM.tmp.Close;
        DM.tmp.SQL.Text:='select rkey,abbr_name from data0015';
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
    DM.ADO17.SQL.Text:=' SELECT Data0017.QUAN_ON_HAND,dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,'+
                      ' dbo.Data0017.INV_PART_DESCRIPTION,(Data0017.QUAN_ON_HAND - Data0017.QUAN_ASSIGN)as yx,'+
                      ' SUM(dbo.Data0022.QUAN_ON_HAND-dbo.Data0022.QUAN_TO_BE_STOCKED) AS Qty, '+
                      ' dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, dbo.data0016.LOCATION,max(case when 1=1 then dbo.Data0022.spec_place end) as sp_place  '+
                      ' FROM         dbo.Data0017 INNER JOIN '+
                      ' dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN '+
                      ' dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '+
                      ' dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+
                      ' dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+
                      ' dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+
                      ' WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0022.QUAN_ON_HAND-dbo.Data0022.QUAN_TO_BE_STOCKED > 0) AND dbo.Data0456.warehouse_ptr =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
                      ' GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,'+
                      ' dbo.Data0017.INV_PART_DESCRIPTION,Data0017.QUAN_ON_HAND,Data0017.QUAN_ASSIGN,'+
                      ' dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, dbo.data0016.LOCATION '+
                      ' ORDER BY  dbo.Data0017.INV_PART_NUMBER ';

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
   { if DM.ADO17.IsEmpty then
    begin
      showmessage('当前没有可用库存...');
      result:=false;
      free;
    end else begin}
      Fdept:=iDept;
      field_name:='location_code';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      showmodal;
      free;
      DM.ADO17.Close;
    //end;
  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i:integer;
  v_INV_PART_NUMBER,v_INV_PART_NUMBER_1:string;
begin
  with TFrm_out.Create(nil) do
  try
    if not DM.ADO17.IsEmpty then
    begin
      Edit1.Text:=DM.ADO17.Fieldbyname('INV_PART_NUMBER').AsString;
      Edit2.Text:=DM.ADO17.Fieldbyname('INV_part_description').AsString;
      Edit3.Text:=DM.ADO17.Fieldbyname('unit_name').AsString;
      Edit4.Text:=DM.ADO17.Fieldbyname('Qty').AsString;
      Edit6.Text:=DM.ADO17.Fieldbyname('yx').AsString;
     // ComboBox1.Text:=DM.ADO17.Fieldbyname('abbr_NAME').AsString;
     ComboBox1.Text := DM.ADO17.fieldbyname('ABBR_NAME').AsString + '  '+DM.ADO17.fieldbyname('LOCATION').AsString + '  ' +dm.ado17.fieldbyname('sp_place').AsString;
      DM.tmp.Close;
      DM.tmp.SQL.Text :=' SELECT  dbo.Data0017.RKEY,dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION,max(case when 1=1 then dbo.Data0022.spec_place end) as sp_place ' +
                        ' FROM dbo.Data0017 INNER JOIN ' +
                        ' dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN ' +
                        ' dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN ' +
                        ' dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN ' +
                        ' dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN  ' +
                        ' dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
                        ' where (dbo.Data0022.QUAN_ON_HAND > 0) and (dbo.Data0017.RKEY='+quotedstr(DM.ADO17.Fieldbyname('rkey').AsString)+' )  ' +
                        ' GROUP BY dbo.Data0017.RKEY, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION ' +
                        ' ORDER BY  dbo.Data0023.ABBR_NAME' ;

      DM.tmp.Open;
      while not DM.tmp.Eof do
      begin
        ComboBox1.Items.Append(DM.tmp.Fields[1].asstring + '  ' +DM.tmp.Fields[2].asstring + '  '+DM.tmp.Fields[3].asstring);
        DM.tmp.Next;
      end;
      DM.tmp.Close;

     { DM.tmp.Close;
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
      DM.tmp.Close; }
    
      i:=FGrd.RowCount-1;
      if showmodal=mrok then
      begin
        FGrd.Cells[0,i]:=Edit1.Text;
        FGrd.Cells[1,i]:=Edit2.Text;
        FGrd.Cells[2,i]:=Edit5.Text;
        FGrd.Cells[3,i]:=ComboBox1.Text;    //备注
        FGrd.Cells[4,i]:=DM.ADO17.Fieldbyname('unit_name').AsString;

        FGrd.Cells[5,i]:=DM.ADO17.Fieldbyname('rkey').AsString;
        FGrd.Cells[6,i]:=DM.ADO17.Fieldbyname('yx').AsString;   //总有效库存
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
//        DM.ADO17.Delete;
                                   //以下代码实现选择一行材料编码之后，该材料编码都全部删除
        v_INV_PART_NUMBER := DM.ADO17.FieldByName('INV_PART_NUMBER').Value;
        while not DM.ADO17.Eof do
        begin
          if UpperCase(Trim(v_INV_PART_NUMBER)) = UpperCase(Trim(DM.ADO17.FieldByName('INV_PART_NUMBER').Value))then
            DM.ADO17.Next
          else
          begin
            v_INV_PART_NUMBER_1 := DM.ADO17.FieldByName('INV_PART_NUMBER').Value;
            break ;
          end;
        end;          
        DM.ADO17.DisableControls;
        DM.ADO17.First;
        while not DM.ADO17.Eof do
        begin
          if UpperCase(Trim(v_INV_PART_NUMBER)) = UpperCase(Trim(DM.ADO17.FieldByName('INV_PART_NUMBER').Value))then
            DM.ADO17.Delete
          else
            DM.ADO17.Next;
        end;
        DM.ADO17.Locate('INV_PART_NUMBER',v_INV_PART_NUMBER_1,[]);
      end;
    end;
  finally
    free;
    DM.ADO17.EnableControls;
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
    DM.ADO17.SQL.Text:=' SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, SUM(dbo.Data0022.QUAN_ON_HAND-dbo.Data0022.QUAN_TO_BE_STOCKED) AS Qty, '+
                      ' dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, dbo.data0016.LOCATION,max(case when 1=1 then dbo.Data0022.spec_place end) as sp_place,max(Data0017.QUAN_ON_HAND - Data0017.QUAN_ASSIGN)as yx  '+
                      ' FROM         dbo.Data0017 INNER JOIN '+
                      ' dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN '+
                      ' dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN  '+
                      ' dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+
                      ' dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+
                      ' dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+
                      ' WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0022.QUAN_ON_HAND > 0) AND dbo.Data0456.warehouse_ptr =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
                      ' GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, dbo.data0016.LOCATION '+
                      ' ORDER BY  dbo.Data0017.INV_PART_NUMBER ';
      DM.ADO17.Open;
end;

procedure TFrm_detailEdt.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (ssAlt in Shift)  and  (Key=86) then
        showmessage(DM.ADO17.SQL.Text);
end;

end.

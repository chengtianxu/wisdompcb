unit USelMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB,UMtrlCheck;

type

   
  TfrmSelMaterial = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn_OK: TBitBtn;
    btn_close: TBitBtn;
    lbl_field: TLabel;
    edt_value: TEdit;
    lbl2: TLabel;
    cbb_fac: TComboBox;
    eh17: TDBGridEh;
    ds17: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure eh17TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure cbb_facChange(Sender: TObject);
    procedure eh17DblClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    preColumn :TColumnEh;
    Fstr:string;
  public
    { Public declarations }
   FCallBack:TFrmCallBack;
   procedure GetData(AStr17: string);
  end;

var
  frmSelMaterial: TfrmSelMaterial;

implementation
   uses UDM;
{$R *.dfm}

procedure TfrmSelMaterial.FormShow(Sender: TObject);
var
  Lsql:string;
begin
   dm.qry17.Filtered:=false;
   Lsql:='select rkey, abbr_name from data0015 where active_flag=''Y'' ' ;
   dm.OpenQry(dm.qrytemp,Lsql);
   dm.qrytemp.First;
   while not dm.qrytemp.Eof do
   begin
    cbb_fac.Items.Add(dm.qrytemp.fieldbyname('abbr_name').asstring);
    //cbb_fac.Items.AddObject(dm.qry_temp.fieldByName('abbr_name').AsString, Tobject(dm.qry_temp.fieldbyname('rkey').asinteger));
    dm.qrytemp.Next;
   end;
   preColumn:= eh17.Columns[0];
   field_name:=eh17.Columns[0].FieldName;
   eh17.Columns[0].Title.Color:=clRed;
end;

procedure TfrmSelMaterial.eh17TitleClick(Column: TColumnEh);
begin
  if eh17.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.qry17.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.qry17.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    if not (eh17.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then

    lbl_field.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_valueChange(edt_value);
  end else
    edt_value.SetFocus;
end;

procedure TfrmSelMaterial.edt_valueChange(Sender: TObject);
//var
 //Fstr2:string;
begin
  if eh17.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin

    if (trim(edt_value.text) <> '') and (cbb_fac.Text<>'') then
    begin
      if eh17.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      begin
        Fstr:= ' (' +  field_name + ' like ''%' + trim(edt_value.text) + '%'')';
        eh17.DataSource.DataSet.Filter:= Fstr+' and 工厂='''+cbb_fac.Text+''' ';
      end
      else if eh17.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
      begin
        Fstr:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
        eh17.DataSource.DataSet.Filter:= Fstr+' and 工厂='''+cbb_fac.Text+''' ';
      end;
    end
    else  if (trim(edt_value.text) <> '') and (cbb_fac.Text='') then
    begin
      if eh17.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      begin
        Fstr:= ' (' +  field_name + ' like ''%' + trim(edt_value.text) + '%'')';
        eh17.DataSource.DataSet.Filter:= Fstr ;//+' and 工厂='''+cbb_fac.Text+''' ';
      end
      else if eh17.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
      begin
        Fstr:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_value.text,0))+')';
        eh17.DataSource.DataSet.Filter:= Fstr ;//+' and 工厂='''+cbb_fac.Text+''' ';
      end;
    end
     else   if (trim(edt_value.text) = '') and (cbb_fac.Text<>'') then
    begin
      Fstr:='';
      eh17.DataSource.DataSet.Filter:='  工厂='''+cbb_fac.Text+''' ';
    end
    else   if (trim(edt_value.text) = '') and (cbb_fac.Text='') then
    begin
      Fstr:='';
      eh17.DataSource.DataSet.Filter:='';
    end;
    eh17.DataSource.DataSet.Filtered:=true;
  end;
end;

procedure TfrmSelMaterial.cbb_facChange(Sender: TObject);
begin
  if Fstr<>'' then
  dm.qry17.Filter:=Fstr+' and 工厂='''+cbb_fac.Text+''' '
  else
  dm.qry17.Filter:=' 工厂='''+cbb_fac.Text+''' '
end;

procedure TfrmSelMaterial.GetData(AStr17: string);
var
  Lsql:string;
begin
      LSql:=' ( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,data0017.inv_name,dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.INV_PART_DESCRIPTION, '+ #13+#10+
                       '   SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,Data0023.rkey as rkey23,  '+ #13+#10+
                       '  dbo.data0016.LOCATION ,'''+'普通库存'+''' AS XY,d15.abbr_name as 工厂, d496.GROUP_DESC '+ #13+#10+
                         ' ,data0002.rkey as rkey02 '+ #13+#10+
                       '  FROM  dbo.Data0017 INNER JOIN  '+ #13+#10+
                        '  data0496 d496  on data0017.GROUP_PTR=d496.rkey  INNER JOIN   '+#13+#10+
                       ' dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN  '+ #13+#10+
                       '  dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN '+#13+#10+   //STOCK_UNIT_PTR
                       '  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+ #13+#10+
                       '   dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+ #13+#10+
                       '  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+#13+#10+
                       ' inner join data0015 d15 on dbo.Data0456.warehouse_ptr=d15.rkey  '+  #13+#10+
                       ' left join data0391 d391 on data0022.rkey391=d391.rkey '+#13+#10+
                       '  WHERE   dbo.Data0017.RKEY not in '+AStr17+' AND (dbo.Data0022.QUAN_ON_HAND > 0)  '+ #13+#10+
                      // '  AND  dbo.Data0456.warehouse_ptr =  '+inttostr(FFac[CBFac.ItemIndex])+' '+ #13+#10+
                       '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,data0017.inv_name,dbo.Data0017.INV_DESCRIPTION, '+ #13+#10+
                       '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, '+ #13+#10+
                       '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d496.GROUP_DESC,data0002.rkey )  '+#13+#10+
       //VMI库存---------------------------------
                       '  union all  '+  #13+#10+
                       '  (    '+   #13+#10+
                       '  SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,data0017.inv_name,dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.INV_PART_DESCRIPTION,  '+#13+#10+
                       '  SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,dbo.Data0023.ABBR_NAME,Data0023.rkey as rkey23, '+ #13+#10+
                       '  dbo.Data0016.LOCATION , '''+'VMI库存'+''' AS XY_1,d15.abbr_name  , d496.GROUP_DESC '+ #13+#10+
                       ' ,data0002.rkey as rkey02 '+#13+#10+
                       '  FROM   dbo.DATA0134 INNER JOIN '+ #13+#10+
                       '  dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN '+  #13+#10+
                       '  dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+#13+#10+
                       '  data0496 d496  on data0017.GROUP_PTR=d496.rkey  INNER JOIN   '+#13+#10+
                       '   dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN '+ #13+#10+
                       '  dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+ #13+#10+
                       '   dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN  '+ #13+#10+
                       '    dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY  '+#13+#10+
                        ' inner join data0015 d15 on dbo.Data0133.warehouse_ptr=d15.rkey  '+ #13+#10+
                         ' left join data0391 d391 on DATA0134.rkey391=d391.rkey '+ #13+#10+
                       '  WHERE   dbo.Data0017.RKEY not in '+AStr17+' AND (dbo.Data0134.QUAN_ON_HAND > 0) '+ #13+#10+
                     //  '   AND dbo.Data0133.warehouse_ptr  =  '+inttostr(FFac[CBFac.ItemIndex])+' '+#13+#10+
                       '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,data0017.inv_name,dbo.Data0017.INV_DESCRIPTION,    '+ #13+#10+
                       '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,  '+#13+#10+
                       '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d496.GROUP_DESC,data0002.rkey  )    '+#13+#10+
                       '  ORDER BY    data0017.INV_PART_NUMBER  ';
    // showmessage(Lsql);
    dm.OpenQry(dm.qry17,Lsql);

end;

procedure TfrmSelMaterial.eh17DblClick(Sender: TObject);
begin
  // self.ModalResult:=mrOk ;
end;

procedure TfrmSelMaterial.btn_OKClick(Sender: TObject);
var
   Lfrm:TfrmMtrlCheck;
begin
         Lfrm:=TfrmMtrlCheck.create(self);
       try
         //self.FCallBack:=Lfrm.FCallBack;
         Lfrm.edt_Mcode.tag:=dm.qry17.fieldbyname('rkey').asinteger;
         Lfrm.edt_MCode.text:=dm.qry17.fieldbyname('inv_part_number').asstring;
         Lfrm.edt_MDesc.text:=dm.qry17.fieldbyname('INV_PART_DESCRIPTION').asstring;
        // LFrm.lbl_desc.caption:=dm.qry17.fieldbyname('INV_DESCRIPTION').asstring;
         Lfrm.edt_Qty.text:=dm.qry17.fieldbyname('qty').asstring;
         Lfrm.edt_MunitName.tag:=dm.qry17.fieldbyname('rkey02').asinteger;
         Lfrm.edt_MunitName.text:=dm.qry17.fieldbyname('unit_name').asstring;
         Lfrm.cbb_Vendor.text:=dm.qry17.fieldbyname('abbr_name').asstring;
         Lfrm.cbb_Vendor.tag:=dm.qry17.fieldbyname('rkey23').asinteger;
         LFrm.FY:=dm.qry17.fieldbyname('XY').asstring;
         if Lfrm.showmodal=mrok then
         begin
          if dm.qry468.locate('INVENT_PTR;supplier_ptr',vararrayof([Lfrm.edt_Mcode.tag,Lfrm.cbb_Vendor.tag]),[])  then
          begin
           dm.qry468.edit;
           dm.qry468.FieldByName('QUAN_BOM').value:=dm.qry468.FieldByName('QUAN_BOM').value+StrToFloat(Lfrm.edt_RQty.text);
           dm.qry468.post;
          end
          else
          begin
          dm.qry468.append;  //DEPT_PTR,INVENT_PTR,QUAN_BOM,PRINTIT,VENDOR,Invent_or,supplier_ptr,Runit
          dm.qry468.FieldByName('INV_part_NUMBER').value :=Lfrm.edt_MCode.text;
          dm.qry468.FieldByName('INV_name').value :=dm.qry17.fieldbyname('inv_name').asstring;
          dm.qry468.FieldByName('INV_DESCRIPTION').value :=dm.qry17.fieldbyname('INV_DESCRIPTION').asstring;//
          dm.qry468.FieldByName('unit_name').value :=Lfrm.edt_MunitName.text;
          dm.qry468.FieldByName('QUAN_BOM').value :=Lfrm.edt_Qty.text;
          dm.qry468.FieldByName('VENDOR').value :=Lfrm.cbb_Vendor.text;
          dm.qry468.FieldByName('STEP').value :=0;
          dm.qry468.FieldByName('INVENT_PTR').value:=Lfrm.edt_Mcode.tag ;
          dm.qry468.FieldByName('QUAN_BOM').value:=StrToFloat(Lfrm.edt_RQty.text);
          dm.qry468.FieldByName('VENDOR').value:= Lfrm.cbb_Vendor.text;
          dm.qry468.FieldByName('Invent_or').value:= 0;
          dm.qry468.FieldByName('supplier_ptr').value:= Lfrm.cbb_Vendor.tag;
          dm.qry468.FieldByName('Runit').value:= Lfrm.edt_MunitName.tag;
         //
          if  dm.qry17.fieldbyname('XY').asstring='普通库存' then
          dm.qry468.FieldByName('PRINTIT').value := 'Y'
          else   dm.qry468.FieldByName('PRINTIT').value := 'N';
          dm.qry468.post;
          end;
          dm.qry17.Delete;
         end;
       finally
       Lfrm.free;
       end;
end;

end.

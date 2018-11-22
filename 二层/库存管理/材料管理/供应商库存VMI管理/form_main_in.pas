unit form_main_in;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, DB, ADODB;

type
  TForm_mainin = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnBrush: TBitBtn;
    BtnQry: TBitBtn;
    Grd1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    PO1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    PO2: TMenuItem;
    N6: TMenuItem;
    Panel2: TPanel;
    Grd2: TDBGridEh;
    ADO133_1: TADOQuery;
    ADO133_1RKEY: TAutoIncField;
    ADO133_1GRN_NUMBER: TStringField;
    ADO133_1DELIVER_NUMBER: TStringField;
    ADO133_1warehouse_ptr: TIntegerField;
    ADO133_1SUPP_PTR: TIntegerField;
    ADO133_1currency_ptr: TIntegerField;
    ADO133_1exch_rate: TBCDField;
    ADO133_1PO_PTR: TIntegerField;
    ADO133_1TTYPE: TSmallintField;
    ADO133_1CREATE_DATE: TDateTimeField;
    ADO133_1CREATE_BY: TIntegerField;
    ADO133_1ship_DATE: TDateTimeField;
    ADO133_1ship_BY: TStringField;
    ADO133_1REF_NUMBER: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BtnBrushClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnQryClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure PO1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    FsSearch:string;
    procedure item_click(sender:TObject);
    function find_quan_hand_error(rkey133:integer):boolean;
  public
    { Public declarations }
     stock_flag:string;
      procedure init;
  end;

var
  Form_mainin: TForm_mainin;

implementation
 uses common,demo,Frm_QrySet_u,PoInWh, DirectIn, Main, PoSearch;
{$R *.dfm}

procedure TForm_mainin.FormCreate(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    form_main.sys_longdate := fieldvalues['v_dt']; //长格式
    form_main.sys_sortdate:=strtodate(datetostr(form_main.sys_longdate));
   end;
    dm.ADS133.Close;
    dm.ADS133.Parameters[0].Value:=form_main.sys_sortdate-15;
    dm.ADS133.Parameters[1].Value:=form_main.sys_sortdate+1;
    dm.ADS133.SQL.Text:=dm.ADS133.SQL.Text;
    dm.ADS133.Open;
    dm.ADS134.Close;
    dm.ADS134.Open;
    init;
end;

procedure TForm_mainin.BtnBrushClick(Sender: TObject);
var
  i:integer;
begin
  i:=0;
  if not dm.ADS133.IsEmpty then  i:=dm.ADS133RKEY.Value;
  dm.ADS133.Close;
  dm.ADS133.Open;

  Grd1TitleClick(PreColumn);
  Grd1TitleClick(PreColumn);
  dm.ADS133.Locate('RKEY',i,[]);
end;

procedure TForm_mainin.init;
var i:integer;
    item:TmenuItem;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  for i := 1 to Grd1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := Grd1.Columns[i - 1].Title.Caption;
    item.Checked := Grd1.Columns[i - 1].Visible;
    item.OnClick := item_click;
    self.PopupMenu2.Items.Add(item);
  end;

  dm.ADS133.Open;
  DM.tmp.SQL.Text:='select getdate()';
  DM.tmp.Open;
  DM.FCurrDate:=DM.tmp.Fields[0].AsDateTime;
  DM.tmp.Close;

end;

procedure TForm_mainin.item_click(sender: TObject);
var
  i:integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := true;
      break;
    end ;
  end else begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TForm_mainin.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(dm.ADS133.SQL.Text);
end;

procedure TForm_mainin.BtnQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if FsSearch='' then FsSearch:=dm.ADS133.SQL.Text;
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    dm.ADS133.Parameters[0].Value:=formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date);
    dm.ADS133.Parameters[1].Value:=formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date+1);
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    dm.ADS133.SQL.Text:=FsSearch+Sqlstr+'order by Data0133.grn_number';
    dm.ADS133.Open;
  end;

end;

procedure TForm_mainin.Grd1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADS133.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS133.Sort:=Column.FieldName+' DESC';
  end;

  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
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

procedure TForm_mainin.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
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

procedure TForm_mainin.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_mainin.BtnExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Grd1,'VMI材料');
end;

procedure TForm_mainin.PO1Click(Sender: TObject);
var
 i:word;
 append_flag:boolean;
begin
append_flag:=true;
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 Form_posearch:=tForm_posearch.Create(application);
repeat
if Form_posearch.ShowModal=mrok then
 begin
  form_poin:=tform_poin.Create(application);
  with form_poin do
   begin
    EdtPO.Text:=dm.ADS70PO_NUMBER.Value;
    EdtCurr.Text:=dm.ADS70CURR_CODE.Value;
    Label4.Caption:=dm.ADS70CURR_NAME.Value;
    EdtFac.Text:=dm.ADS70WAREHOUSE_CODE.Value;
    label6.Caption :=dm.ADS70WAREHOUSE_NAME.Value;
    EdtVend.Text:=dm.ADS70CODE.Value;
    label8.Caption:=dm.ADS70SUPPLIER_NAME.Value;
    po_type:=dm.ADS70PO_TYPE.Value;
    warehouse_ptr := dm.ADS70WAREHOUSE_POINTER.Value; //工厂15.rkey
    po_ptr := dm.ADS70RKEY.Value;                  //采购70.rkey
    supp_ptr := dm.ADS70SUPPLIER_POINTER.Value;    //供应商23.rkey
    curr_ptr := dm.ADS70CURRENCY_PTR.Value;        //货币01.rkey
    EdtRate.Text := dm.ADS70EXCHANGE_RATE.AsString; //汇率 从01表中读取实时汇率
     aded_flag:=1;
     strgrid1.Visible:=true;
     CBLoc.Visible:=true;
     strgrid1.RowCount:=dm.ADO71.RecordCount+1;
     strgrid2.RowCount:=dm.ADO71.RecordCount+1;
     dm.ADO71.First;
     for i:=1 to dm.ADO71.RecordCount do
     begin
      strgrid1.Cells[0,i] := dm.ADO71inv_part_number.value;
      strgrid1.Cells[1,i] := dm.ADO71INV_NAME.Value;
      strgrid1.Cells[2,i] := dm.ADO71INV_DESCRIPTION.Value;
      strgrid1.Cells[3,i] := dm.ADO71QUAN_ORD.AsString;
      strgrid1.Cells[4,i] := dm.ADO71CONVERSION_FACTOR.AsString;
      strgrid1.Cells[5,i] := dm.ADO71QUAN_RECD.AsString;
      strgrid1.Cells[6,i] := dm.ADO71pr_unitname.Value;
      strgrid2.Cells[2,i] := dm.ADO71WO_PTR.AsString;
      strgrid2.Cells[3,i] :=formatfloat('0.000',
                            dm.ADO71tax_PRICE.value/
                            dm.ADO71CONVERSION_FACTOR.Value);
      strgrid1.Cells[7,i] := '0';  //当前接收
      strgrid1.Cells[8,i] := '';   //位置
      strgrid1.Cells[9,i] := '';   //原制造商
      strgrid1.Cells[10,i] := '';   //备注
      strgrid1.Cells[11,i] := '';   //备注
      strgrid1.Cells[12,i] := dm.ADO71avl_flag.Value;

      strgrid1.Cells[13,i] :=          //有效期
          datetostr(form_main.sys_sortdate+dm.ADO71SHELF_LIFE.Value);
      strgrid1.Cells[14,i] := dm.ADO71rohs.Value;   //环保标识

      strgrid2.Cells[0,i] := dm.ADO71rkey.AsString;
      strgrid2.Cells[1,i] := dm.ADO71INVT_PTR.AsString;
      strgrid2.Cells[4,i] := dm.ADO71TAX_2.AsString;
      strgrid2.Cells[6,i] := dm.ADO71SHELF_LIFE.asstring;
      strgrid2.Cells[7,i] := dm.ADO71STOCK_BASE.AsString;
      dm.ADO71.Next;
     end;
    end;
   if form_poin.ShowModal=mrok then
   begin
    dm.ADO133.Close;
    dm.ADO133.Open;
    dm.ADO133.Locate('rkey',dm.ADO133RKEY.Value,[]);
    dm.ADO133.Close;
   end;
   form_poin.Free;
 end
else
 append_flag:=false;

until not append_flag

finally
 Form_posearch.Free;
end;

end;


procedure TForm_mainin.N3Click(Sender: TObject);
begin
if dm.ADS133TTYPE.Value=1 then//按PO入库
begin
try
Form_PoIn:=TForm_PoIn.Create(application);
Form_PoIn.aded_flag:=2;     //编辑
if Form_PoIn.ShowModal=mrok then
 begin
  dm.ads133.Close;
  dm.ads133.Open;
  dm.ads133.Locate('rkey',dm.ado133rkey.Value,[]);
  dm.ADO133.Close;
 end;
finally
Form_PoIn.Free;
end;
end;
if dm.ADS133TTYPE.Value=3 then//直接入库
begin
try
form_directin:=tform_directin.Create(nil);
form_directin.aded_flag:=2; //编辑
form_directin.ShowModal;
finally
form_poin.Free;
end;
end;
end;
procedure TForm_mainin.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  self.ADO133_1.Close;
  self.ADO133_1.Parameters[0].Value :=dm.ADS133RKEY.Value;
  self.ADO133_1.Open;
  if (not find_quan_hand_error(self.ADO133_1RKEY.Value)) then
  begin
  dm.ADOConnection1.BeginTrans;
  try
   if dm.ADS133TTYPE.Value=1 then //按PO入库
   begin
    with dm.ADOQuery1 do         //更新71已收货数量
    begin
     close;
     sql.Clear;
     sql.Add('update data0071');
     sql.Add('set QUAN_RECD=QUAN_RECD-data0134.quantity/data0071.CONVERSION_FACTOR');
     sql.Add('from data0134 inner join data0071');
     sql.Add('on data0134.SOURCE_PTR=data0071.rkey');
     sql.Add('where  data0134.GRN_PTR='+dm.ADS133RKEY.AsString);
     ExecSQL;
    end;
    with dm.adoquery1 do     //更新70状态
     begin
      close;
      sql.clear;
      sql.Add('update data0070');
      sql.Add('set status=5');
      sql.Add('where rkey='+dm.ADS133PO_PTR.AsString);
      execsql;
     end;
   end;
   self.ADO133_1.Delete;
   dm.ADOConnection1.CommitTrans;
   messagedlg('数据删除成功!',mtinformation,[mbcancel],0);
   dm.ADS133.Close;
   dm.ADS133.Open;
   self.ADO133_1.Close;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
  end
  else
   messagedlg('数据删除不成功!入库单状态已发生更改或者已发放',mtwarning,[mbcancel],0);
 end;
end;
function TForm_mainin.find_quan_hand_error(rkey133:integer):boolean;
begin
result:=false;
with dm.adoquery1 do
 begin
  close;
  sql.Text:='select rkey from data0134'+#13+
            'where quantity<>quan_on_hand'+#13+
            'and grn_ptr='+inttostr(rkey133);
  open;
  if not IsEmpty then result:=true;
 end;
end;

procedure TForm_mainin.N4Click(Sender: TObject);//检查数据
begin
if dm.ADS133TTYPE.Value=1 then//按PO入库
begin
try
form_poin:=tform_poin.Create(application);
form_poin.aded_flag:=3; //检查
form_poin.BtnSave.Enabled:=false;
form_poin.Button1.Enabled:=false;
form_poin.CBLoc.Enabled:=false;
form_poin.dtpk1.Enabled:=false;
form_poin.Edit1.Enabled:=false;
form_poin.Edit2.Enabled:=false;
form_poin.Edit3.Enabled:=false;
form_poin.Edit4.Enabled:=false;
form_poin.StrGrid1.Options:=form_poin.StrGrid1.Options-[goEditing];
form_poin.ShowModal;
finally
form_poin.Free;
end;
end;
if dm.ADS133TTYPE.Value=3 then//直接入库
begin
try
form_directin:=tform_directin.Create(application);
form_directin.aded_flag:=3; //检查
form_directin.BtnSave.Enabled:=false;
form_directin.Edit2.Enabled:=false;
form_directin.Edit3.Enabled:=false;
form_directin.Edit4.Enabled:=false;
form_directin.DateTimePicker1.Enabled:=false;
form_directin.ShowModal;
finally
form_poin.Free;
end;
end;
end;

procedure TForm_mainin.N6Click(Sender: TObject);
begin
      Form_directin:=TForm_directin.Create(Application);
      try
        Form_DirectIn.aded_flag:=1;
        Form_directin.initd;
        Form_directin.ShowModal;
      finally
        Form_directin.Free;
      end;
end;

end.

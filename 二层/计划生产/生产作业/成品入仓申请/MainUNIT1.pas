unit MainUNIT1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils,
  DBGridEh, ComCtrls ;


type
  TMainForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    PopupMenu2: TPopupMenu;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    sgrid1: TStringGrid;
    N7: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGridEh3: TDBGridEh;
    DBGridEh2: TDBGridEh;
    PopupMenu3: TPopupMenu;
    N2: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
                               Shift: TShiftState);
    procedure N7Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    user_ptrCaption,vprevCaption :string;

    ADOQALL2sql,FsSql56 :string;

    procedure item_click(sender:TObject);
//    function findqty_error(rkey,qty:integer):boolean;
    function findtobeqty_error(rkey,qty:integer):boolean;

  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;

implementation

USES
   common ,MyClass,DmUnit1  ,IF_Unit1,ConstVar,EditUnit1;

{$R *.dfm}

procedure TMainForm1.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOConnection1 ) then
   begin
      ShowMsg('程序起动失败请联系管理员',1);
      application.Terminate;
   end;
  Caption := application.Title;
  user_ptrCaption := user_ptr;
  vprevCaption := vprev;


 // dm.ADOConnection1.Open;
 // user_ptrCaption := '785';
 // vprevCaption := '4';
  
  MyDataClass :=TMyDataClass.Create(dm.ADOConnection1);
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;
  {
function TMainForm1.findqty_error(rkey,qty: integer): boolean;
begin
 result:=false;
 dm.TemADOQuery1.Close;
 dm.TemADOQuery1.SQL.Text:='select data0056.QTY_BACKLOG-data0006.QUAN_ALLREJ as qty'+#13+
                           'from data0056 inner join data0006 on'+#13+
                           'data0056.wo_ptr=data0006.rkey'+#13+
                           'where data0056.rkey='+inttostr(rkey);
 dm.TemADOQuery1.Open;
 if not dm.TemADOQuery1.IsEmpty then
 if dm.TemADOQuery1.FieldValues['qty']<>qty then
  result:=true;
end;    }

function TMainForm1.findtobeqty_error(rkey,qty: integer): boolean;
begin
 result:=false;
 dm.TemADOQuery1.Close;
 dm.TemADOQuery1.SQL.Text:='select data0056.to_be_stocked as qty'+#13+
                           'from data0056'+#13+
                           'where data0056.rkey='+inttostr(rkey);
 dm.TemADOQuery1.Open;
 if not dm.TemADOQuery1.IsEmpty then
 if dm.TemADOQuery1.FieldValues['qty']<>qty then
  result:=true;
end;

procedure TMainForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
      begin
          IF DBGridEh1.DataSource.DataSet.Active THEN
              IF DBGridEh1.DataSource.DataSet.RecordCount > 0 THEN
                  Export_dbGridEH_to_Excel(DBGridEh1,'产成品入仓处理') ;
      end
  else if PageControl1.ActivePageIndex = 2 then
      begin
          IF DBGridEh2.DataSource.DataSet.Active THEN
              IF DBGridEh2.DataSource.DataSet.RecordCount > 0 THEN
                  Export_dbGridEH_to_Excel(DBGridEh2,'汇总查询') ;
      end
  else if PageControl1.ActivePageIndex = 1 then
      begin
          IF DBGridEh3.DataSource.DataSet.Active THEN
              IF DBGridEh3.DataSource.DataSet.RecordCount > 0 THEN
                  Export_dbGridEH_to_Excel(DBGridEh3,'明细查询') ;
      end ;
end;

procedure TMainForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMainForm1.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
if pagecontrol1.ActivePageIndex=0 then
 begin
  i:=dm.ADOQALL2RKEY.Value;
  dm.ADOQALL2.Close;
  dm.ADOQALL2.Open;
  if i > 0 then dm.ADOQALL2.Locate('rkey',i,[]);
 end
else
 if pagecontrol1.ActivePageIndex=1 then
  begin
   dm.ADOQD0056.Close;
   dm.ADOQD0056.Open;
  end
 else
  begin
   dm.ADOQS0056.Close;
   dm.ADOQS0056.Open;
  end;
end;

procedure TMainForm1.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];

  for i := 1 to DBGridEh1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := DBGridEh1.Columns[i - 1].Title.Caption;
    if DBGridEh1.Columns[i - 1].Visible then item.Checked := true;
    item.OnClick := item_click;
    self.PopupMenu2.Items.Add(item);
  end;

  ADOQALL2sql := dm.ADOQALL2.CommandText;

  FsSql56:=dm.ADOQD0056.SQL.Text;
  dm.ADOQD0056.SQL.Text:=dm.ADOQD0056.SQL.Text+
 'ORDER BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0006.WORK_ORDER_NUMBER';

  dm.ADOQALL2.close ;
  dm.ADOQALL2.Prepared;
  dm.ADOQALL2.Open ;

  dm.ADOQS0056.Prepared ;
  dm.ADOQS0056.Open ;

  dm.ADOQD0056.Prepared ;
  dm.ADOQD0056.Open ;
end;

procedure TMainForm1.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true;
                      break;
                  end;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false;
                      break;
                  end;
      end;
end;

procedure TMainForm1.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind <> fkCalculated then
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then   //, ftWord,
  begin
    DBGridEh1.DataSource.DataSet.Filter := '';
    if trim(Edit1.text) <> '' then
        begin
            if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
                begin
                    if DBGridEh1.DataSource.DataSet.Filter <> '' then
                        DBGridEh1.DataSource.DataSet.Filter := DBGridEh1.DataSource.DataSet.Filter + ' and ' +  field_name + ' like ''%' + trim(edit1.text) + '%'''
                    else
                        DBGridEh1.DataSource.DataSet.Filter := field_name+' like ''%' + trim(edit1.text) + '%''' ;
                end
            else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
                begin
                    if DBGridEh1.DataSource.DataSet.Filter <> '' then
                        DBGridEh1.DataSource.DataSet.Filter := DBGridEh1.DataSource.DataSet.Filter + ' and ' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))
                    else
                        DBGridEh1.DataSource.DataSet.Filter := field_name + ' >= ' + inttostr(strtointdef(edit1.text,0)) ;
                end;
        end ;
  end;
end;

procedure TMainForm1.BitBtn4Click(Sender: TObject);
var
  i:integer;
  sSql:string;
begin
  with TIf_Form1.Create(nil) do
  try
    if ShowModal = mrok then
    begin
      dm.ADOQALL2.Close ;
      for i := 1 to sgrid1.RowCount - 2  do sSql:=sSql+trim(sgrid1.Cells[2,i])+#13;
      dm.ADOQALL2.CommandText:=ADOQALL2SQL+sSql;
      dm.ADOQALL2.Prepared;
      dm.ADOQALL2.Open ;

      dm.ADOQD0056.close ;
      dm.ADOQD0056.SQL.Text:=FsSql56+sSql+' ORDER BY Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0006.WORK_ORDER_NUMBER';
      dm.ADOQD0056.Prepared;
      dm.ADOQD0056.Open;
    end ;
  finally
    Free ;
  end;
end;

procedure TMainForm1.PopupMenu1Popup(Sender: TObject);
begin
 if DBGridEh1.DataSource.DataSet.IsEmpty then
   n7.Enabled := false
 else
  if (vprevCaption = '2') or (vprevCaption = '4') then
   if dm.ADOQALL2QTY_BACKLOG.Value>0 then
    n7.Enabled := true
   else
    n7.Enabled := false
  else
   n7.Enabled := false;
end;

procedure TMainForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
                                      Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage(dm.ADOQALL2.CommandText)
  else if (key = 46) and (ssCtrl in shift) then
       abort();
end;

procedure TMainForm1.N7Click(Sender: TObject);
var s:string;
begin
 if IS_Stock_Inventorying then
  showmsg('在线产品正在盘点,当前不能提交入库',1)
 else
  if (vprevCaption = '1') or (vprevCaption = '3') then
   showmessage('你只有检查权限，不能更改数数据！！')
  else
  try
    BitBtn3Click(nil);
    s:=trim(dm.ADOQALL2MANU_PART_NUMBER.AsString);
    s:=copy(s,1,length(s)-2);
    EditForm1 := TEditForm1.Create(application) ;
    if dm.ADOQALL2TO_BE_STOCKED.AsInteger > 0 then
    begin
      showmsg('在线产品已有提交数量,请先入库或者取消提交!',1);
      exit;
    end;
    DM.TemADOQuery1.Close;
    DM.TemADOQuery1.SQL.Text:='SELECT sum(dbo.Data0060.PARTS_ORDERED) Qty_ord,'+
    ' sum(dbo.Data0060.PARTS_ORDERED-dbo.Data0060.PARTS_SHIPPED+dbo.Data0060.PARTS_RETURNED-data0060.RETURNED_SHIP) Qty_own '+
   'FROM dbo.Data0060 INNER JOIN dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY '+
   'where (dbo.Data0025.MANU_PART_NUMBER LIKE '''+s+'%'') and DATA0060.STATUS=1';
    DM.TemADOQuery1.Open;
    EditForm1.Edit9.Text :=DM.TemADOQuery1.Fields[0].AsString;   //订单总数
    EditForm1.Edit10.Text:=DM.TemADOQuery1.Fields[1].AsString;
    DM.TemADOQuery1.Close;
    DM.TemADOQuery1.SQL.Text:='SELECT  sum(dbo.Data0056.TO_BE_STOCKED) qTY FROM dbo.Data0025 INNER JOIN '+
                              'dbo.Data0006 ON dbo.Data0025.RKEY = dbo.Data0006.BOM_PTR INNER JOIN '+
                              'dbo.Data0056 ON dbo.Data0006.RKEY = dbo.Data0056.WO_PTR '+
                              'where (dbo.Data0025.MANU_PART_NUMBER LIKE '''+s+'%'')';
    DM.TemADOQuery1.Open;
    EditForm1.Edit11.Text :=DM.TemADOQuery1.Fields[0].AsString;  //入库待审pcs
    DM.TemADOQuery1.Close;
    DM.TemADOQuery1.SQL.Text:='SELECT SUM(dbo.Data0053.QTY_ON_HAND-data0053.QTY_ALLOC) QTY FROM dbo.Data0025 INNER JOIN '+
                              'dbo.Data0053 ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR '+
                              'where (dbo.Data0025.MANU_PART_NUMBER LIKE '''+s+'%'')';
    DM.TemADOQuery1.Open;
    EditForm1.Edit13.Text :=DM.TemADOQuery1.Fields[0].AsString;   //当前库存
    DM.TemADOQuery1.Close;

    DM.ado53.SQL.Text:='SELECT dbo.Data0016.CODE, dbo.Data0016.LOCATION,dbo.Data0015.WAREHOUSE_code,'+
                       'SUM(dbo.Data0053.QTY_ON_HAND-data0053.QTY_ALLOC) qTY '+
                       'FROM dbo.Data0025 INNER JOIN '+
                       'dbo.Data0053 ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR INNER JOIN '+
                       'dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY INNER JOIN '+
                       'dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY '+
                       'where (dbo.Data0025.MANU_PART_NUMBER LIKE '''+s+'%'') '+
                       'Group BY dbo.Data0016.CODE, dbo.Data0016.LOCATION,dbo.Data0015.WAREHOUSE_code';
    dm.ADO53.Prepared;
    DM.ado53.Open;            //库存分仓明细

    EditForm1.Edit2.Text := dm.ADOQALL2work_order_number.Value ;
    EditForm1.Edit4.Text := dm.ADOQALL2QTYBACKLOG.AsString; //在线PCS
    EditForm1.Edit1.Text := EditForm1.Edit4.Text;
    EditForm1.Edit5.Text := dm.ADOQALL2TO_BE_STOCKED.AsString ;
    EditForm1.Edit3.Text := dm.ADOQALL2allPANELS.AsString;  //当前在线数panel:
    EditForm1.Edit7.Text := EditForm1.Edit3.Text;
    EditForm1.Edit6.Text := dm.ADOQALL2TO_BE_CANCD.AsString;
    EditForm1.Edit12.Text:= dm.ADOQALL2PARTS_PER_PANEL.AsString;
    EditForm1.Edit7.Enabled:=EditForm1.Edit3.Text<>'0';
    EditForm1.edit8.Text := DM.ADOQALL2REFERENCE.AsString;

    EditForm1.edit15.Text := DM.ADOQALL2Cut_NO.AsString;
    EditForm1.edit16.Text := DM.ADOQALL2ORD_REQ_QTY.AsString;
    EditForm1.Label21.Caption := DM.ADOQALL2issued_qty.AsString;
    EditForm1.Label22.Caption :=DM.ADOQALL2WIP_QTY.AsString;
    EditForm1.Label23.Caption := DM.ADOQALL2FG_QTY.AsString;
    EditForm1.Label24.Caption := DM.ADOQALL2waitfor_release.AsString;
    EditForm1.Label25.Caption := DM.ADOQALL2QTY_reject.AsString;

    DM.TemADOQuery1.Close;
    DM.TemADOQuery1.SQL.Text:='SELECT Data0060.PARTS_ORDERED+data0060.PARTS_RETURNED as qty_ordered,'+
      'Data0060.PARTS_ORDERED - Data0060.PARTS_SHIPPED + data0060.PARTS_RETURNED - Data0060.RETURNED_SHIP as parts_margin,'+
      'isnull(data0060.REPUT_APPR_BY,0) as REPUT_APPR_BY,data0097.po_number '+         //已提交数量
      'FROM Data0060 INNER JOIN '+
      'Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY  '+
      'WHERE (Data0060.STATUS = 1) and (isnull(data0060.REPUT_APPR_BY,0) < Data0060.PARTS_ORDERED+data0060.PARTS_RETURNED)'+
      'and (Data0060.rkey = '+inttostr(DM.ADOQALL2rkey60.Value)+')';
     DM.TemADOQuery1.Open;
     if not DM.TemADOQuery1.IsEmpty then
     begin
      EditForm1.Label31.Caption:=DM.TemADOQuery1.Fieldbyname('qty_ordered').AsString;   //订单加退货数
      EditForm1.Label32.Caption:=DM.TemADOQuery1.Fieldbyname('parts_margin').AsString;  //订单欠数
      EditForm1.Label33.Caption:=DM.TemADOQuery1.Fieldbyname('REPUT_APPR_BY').AsString; //已提交数量
      EditForm1.edit14.Text :=DM.TemADOQuery1.Fieldbyname('po_number').AsString;    //97客户订单号
      EditForm1.Edit17.Text := DM.ADOQALL2sales_order.Value;
      EditForm1.Edit17.Tag := dm.ADOQALL2rkey60.Value;
     end;

     DM.TemADOQuery1.Close;
     DM.TemADOQuery1.SQL.Text:='select sum(QTY_ON_HAND) from data0053 where po_number='''+EditForm1.Edit14.text+'''';
     DM.TemADOQuery1.Open;
      if DM.TemADOQuery1.Fields[0].IsNull then
        EditForm1.Label34.Caption:='0'
      else
       EditForm1.Label34.Caption:=DM.TemADOQuery1.Fields[0].AsString;   //库存数

    if EditForm1.ShowModal = mrok then
     begin
      if findtobeqty_error(dm.ADOQALL2RKEY.Value,dm.ADOQALL2TO_BE_STOCKED.AsInteger) then
       begin
        showmsg('当前在线数量发生改变,提交操作不成功!',1);
        BitBtn3Click(sender);
       end
      else
      try
        dm.ADOConnection1.BeginTrans;
         dm.ADOQALL2.Edit;
         dm.ADOQALL2to_be_stocked.AsInteger := dm.ADOQALL2to_be_stocked.AsInteger+strtoint(EditForm1.Edit1.Text);
         dm.ADOQALL2qty_backlog.AsInteger := dm.ADOQALL2qty_backlog.AsInteger-strtoint(EditForm1.Edit1.Text);
         dm.ADOQALL2TO_BE_CANCD.Value:=dm.ADOQALL2TO_BE_CANCD.Value+strtoint(EditForm1.Edit7.Text);
         dm.ADOQALL2PANELS.Value:=dm.ADOQALL2PANELS.Value-strtoint(EditForm1.Edit7.Text);
         dm.ADOQALL2employee_ptr.AsString := user_ptrCaption;
         dm.ADOQALL2tobestock_date.AsDateTime := getsystem_date(dm.TemADOQuery1,0);
         DM.ADOQALL2REFERENCE.Value := trim(EditForm1.Edit8.Text);
         DM.ADOQALL2PO_NUMBER56.AsString:=EditForm1.edit14.Text;    //56客户订单号
         dm.ADOQALL2UNIT_PTR.Value:=EditForm1.Edit17.Tag;        //销售订单60.rkey
         dm.ADOQALL2.Post;
         if dm.ADOQALL2QTY_BACKLOG.Value > 0 then BitBtn3Click(sender);

        if EditForm1.Edit17.Tag > 0  then
         begin
          DM.TemADOQuery1.Close;
          DM.TemADOQuery1.SQL.Text:='update data0060 set REPUT_APPR_BY=isnull(REPUT_APPR_BY,0)+'+EditForm1.Edit1.Text+
                                    'where rkey='+inttostr(EditForm1.Edit17.Tag);
          DM.TemADOQuery1.ExecSQL;
         end;

        dm.ADOConnection1.CommitTrans;
      except
        dm.ADOConnection1.RollbackTrans;
        ShowMessage('当前在线数发生改变，提交操作不成功！');
        BitBtn3Click(sender);
      end;
     end ;
  finally
    EditForm1.Free ;
    DM.ado53.close;
  end;
end;

procedure TMainForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
if (column.FieldName <> dm.ADOQALL2.IndexFieldNames) then
 dm.ADOQALL2.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;

end;

procedure TMainForm1.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage((DBGridEh2.DataSource.DataSet as TADOQuery).SQL.Text)
  else if (key = 46) and (ssCtrl in shift) then
       abort();
end;

procedure TMainForm1.DBGridEh3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage((DBGridEh3.DataSource.DataSet as TADOQuery).SQL.Text)
  else if (key = 46) and (ssCtrl in shift) then
       abort();
end;

procedure TMainForm1.N2Click(Sender: TObject);
begin
 if (vprevCaption = '1') or (vprevCaption = '3') then
  showmessage('你只有检查权限，不能更改数数据！！')
 else
  begin
    if self.findtobeqty_error(dm.ADOQD0056RKEY.Value,dm.ADOQD0056TO_BE_STOCKED.AsInteger) then
     begin
      showmsg('当前待入仓数量发生改变,提交操作不成功!',1);
      BitBtn3Click(sender);
     end
    else
    try
      dm.ADOConnection1.BeginTrans;
      if dm.ADOQD0056UNIT_PTR.Value > 0  then
        begin
          DM.TemADOQuery1.Close;
          DM.TemADOQuery1.SQL.Text:='update data0060 set REPUT_APPR_BY=isnull(REPUT_APPR_BY,0)-'+dm.ADOQD0056TO_BE_STOCKED.AsString+
                                    'where rkey='+inttostr(dm.ADOQD0056UNIT_PTR.Value);
          DM.TemADOQuery1.ExecSQL;
        end;

       dm.ADOQD0056.Edit;
       dm.ADOQD0056qty_backlog.Value := dm.ADOQD0056qty_backlog.Value+
                                        dm.ADOQD0056TO_BE_STOCKED.Value;
       dm.ADOQD0056to_be_stocked.Value := 0;
       dm.ADOQD0056panels.Value:=dm.ADOQD0056panels.Value+
                                  dm.ADOQD0056to_be_cancd.Value;
       dm.ADOQD0056to_be_cancd.Value:=0;
       dm.ADOQD0056UNIT_PTR.Value:=0;    //提交的订单
       dm.ADOQD0056po_number.Value:='';   //客户订单号
       dm.ADOQD0056.Post;
       showmsg('取消操作成功!',1);
       dm.ADOQD0056.Close;
       dm.ADOQD0056.Open;
      dm.ADOConnection1.CommitTrans;
    except
      dm.ADOConnection1.RollbackTrans;
      showmsg('当前待入仓数量发生改变,提交操作不成功!',1);
      BitBtn3Click(sender);
    end;
  end;
end;


procedure TMainForm1.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=1 then
 begin
  dm.ADOQD0056.Close;
  dm.ADOQD0056.Prepared;
  dm.ADOQD0056.Open;
 end
else
if pagecontrol1.ActivePageIndex=2 then
 begin
  dm.ADOQS0056.Close;
  dm.ADOQS0056.Prepared;
  dm.ADOQS0056.Open;
 end;

end;

procedure TMainForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

end.

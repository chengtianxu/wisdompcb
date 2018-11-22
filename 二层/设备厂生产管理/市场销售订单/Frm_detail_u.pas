unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    Panel2: TPanel;
    SGrid: TStringGrid;
    N2: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    EdtSale: TEdit;
    Label10: TLabel;
    BtnSave: TBitBtn;
    EdtDept: TEdit;
    SpeedButton1: TSpeedButton;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdtCust: TEdit;
    Label11: TLabel;
    EdtCurr: TEdit;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit3: TDBEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    Label16: TLabel;
    DBEdit5: TDBEdit;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    Label18: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    LBCust: TLabel;
    LBCurr: TLabel;
    LBSale: TLabel;
    LBDept: TLabel;
    DBComboBox1: TDBComboBox;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DateTimePicker1: TDateTimePicker;
    SpeedButton6: TSpeedButton;
    Label6: TLabel;
    dbedtPO_NO: TDBEdit;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EdtCustEnter(Sender: TObject);
    procedure EdtCurrEnter(Sender: TObject);
    procedure EdtDeptEnter(Sender: TObject);
    procedure EdtSaleEnter(Sender: TObject);
    procedure EdtCustExit(Sender: TObject);
    procedure EdtCurrExit(Sender: TObject);
    procedure EdtSaleExit(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Fcust,Fcurr,Fdept,Fsale:string;
    FinValid:boolean;
    Ftax:real;
  public
    Ftag:integer;
    FGrd:TDBGridEh;
    procedure initd;
  end;

implementation
  uses DM_u,common,Pick_Item_Single,ConstVar,address_search,Frm_detailEdt_u;

{$R *.dfm}

procedure TFrm_detail.initd;
var i,j:integer;
begin
  SGrid.ColCount:=8;
  SGrid.RowCount:=2;
  for i:=0 to 6 do
  begin
    SGrid.Cells[i,0]:=FGrd.Columns[i].Title.Caption;
    SGrid.ColWidths[i]:=FGrd.Columns[i].Width;
  end;
  SGrid.ColWidths[5]:=94;
  SGrid.Cells[7,0]:='rkey08';
  SGrid.ColWidths[7]:=-1;
  if Ftag=0 then
  begin
    self.Caption:='订单-新增';
    DM.GetNo(MaskEdit1,'17',0);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DM.ADO70_1.Close;
    DM.ADO70_1.Parameters[0].Value:=-1;
    DM.ADO70_1.Open;
    DM.ADO70_1.Append;
    DM.ADO70_1.FieldByName('type').AsInteger:=1;
    DM.ADO70_1.FieldByName('sales_date').AsString:=formatdatetime('YYYY/MM/DD',DM.tmp.Fields[0].AsDateTime);
    DM.ADO70_1.FieldByName('tax_cate').AsString:='普通收据';
    DM.ADO70_1.FieldByName('ent_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
    DM.ADO71_1.Close;
    DM.ADO71_1.Parameters[0].Value:=-1;
    DM.ADO71_1.Open;
  end
  else
  begin
    if Ftag =1 then
    begin
      self.Caption:='订单-修改';
    end
    else
    if Ftag = 2 then
    begin
      BtnSave.Enabled:=false;
      SpeedButton1.Enabled:=false;
      SpeedButton2.Enabled:=false;
      SpeedButton3.Enabled:=false;
      SpeedButton4.Enabled:=false;
      SpeedButton5.Enabled:=false;
      SpeedButton6.Enabled:=false;
      Edtcust.Enabled:=false;
      EdtCurr.Enabled:=false;
      EdtDept.Enabled:=false;
      EdtSale.Enabled:=false;
      self.Caption:='订单-查看';
      dbedtPo_no.Enabled := false;
    end
    else
    if Ftag=10 then
      self.Caption:='订单-复制';
    MaskEdit1.ReadOnly:=true;
    DM.ADO71.Close;
    DM.ADO71.Open;
    if Ftag<>10 then
    begin
      DM.ADO70_1.Close;
      DM.ADO70_1.Parameters[0].Value:=DM.ADO70rkey.Value;
      DM.ADO70_1.Open;
      DM.ADO71_1.Close;
      DM.ADO71_1.Parameters[0].Value:=DM.ADO70rkey.Value;
      DM.ADO71_1.Open;
      MaskEdit1.Text:=DM.ADO70.Fieldbyname('SALES_ORDER').AsString;
    end else begin    //COPY
      DM.ADO70_1.Close;
      DM.ADO70_1.Parameters[0].Value:=-1;
      DM.ADO70_1.Open;
      DM.ADO70_1.Append;
      for i:=0 to DM.ADO70_1.FieldCount-1 do
         if (uppercase(DM.ADO70_1.Fields[i].FullName)<>'RKEY') and (uppercase(DM.ADO70_1.Fields[i].FullName)<>'SALSE_ORDER') and
            (uppercase(DM.ADO70_1.Fields[i].FullName)<>'ENT_USER_PTR') and (uppercase(DM.ADO70_1.Fields[i].FullName)<>'CONF_BY_EMPL_PTR')
            and (uppercase(DM.ADO70_1.Fields[i].FullName)<>'CONF_DATE')
         then
           DM.ADO70_1.Fields[i].Value:=DM.ADO70.fieldbyname(DM.ADO70_1.Fields[i].FullName).Value;
      DM.GetNo(MaskEdit1,'17',0);
      DM.ADO70_1.Fieldbyname('status').asinteger:=1;
      DM.tmp.Close;
      DM.tmp.SQL.Text:='select getdate()';
      DM.tmp.Open;
      DM.ADO70_1.FieldByName('sales_date').AsString:=formatdatetime('YYYY/MM/DD',DM.tmp.Fields[0].AsDateTime);
      DM.ADO70_1.FieldByName('ent_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
      DM.ADO71_1.Close;
      DM.ADO71_1.Parameters[0].Value:=-1;
      DM.ADO71_1.Open;
      while not DM.ADO71.Eof do
      begin
        DM.ADO71_1.Append;
        for i:=0 to DM.ADO71_1.FieldCount-1 do
           if (uppercase(DM.ADO71_1.Fields[i].FullName)<>'RKEY') and (uppercase(DM.ADO71_1.Fields[i].FullName)<>'QTY_PLAND')
              and (uppercase(DM.ADO71_1.Fields[i].FullName)<>'PARTS_SHIPPED') and (uppercase(DM.ADO71_1.Fields[i].FullName)<>'RETUREN_QTY') then
             DM.ADO71_1.Fields[i].Value:=DM.ADO71.fieldbyname(DM.ADO71_1.Fields[i].FullName).Value;
        DM.ADO71.Next;
      end;
    end;

    Edtcust.Text:=DM.ADO70.Fieldbyname('cust_code').AsString;
    LBcust.Caption:=DM.ADO70.Fieldbyname('CUSTOMER_NAME').AsString;
    Edtcust.Tag:=DM.ADO70.Fieldbyname('customer_ptr').AsInteger;

    Edtcurr.Text:=DM.ADO70.Fieldbyname('curr_code').AsString;
    LBcurr.Caption:=DM.ADO70.Fieldbyname('CUrr_NAME').AsString;
    Edtcurr.Tag:=DM.ADO70.Fieldbyname('currency_ptr').AsInteger;

    EdtDept.Text:=DM.ADO70.Fieldbyname('dept_code').AsString;
    LBDept.Caption:=DM.ADO70.Fieldbyname('Dept_name').AsString;
    EdtDept.Tag:=DM.ADO70.Fieldbyname('produce_Deptptr').AsInteger;

    Edtsale.Text:=DM.ADO70.Fieldbyname('REP_CODE').AsString;
    LBsale.Caption:=DM.ADO70.Fieldbyname('sales_rep_name').AsString;
    Edtsale.Tag:=DM.ADO70.Fieldbyname('SALES_REP_ptr').AsInteger;

    j:=1;
    DM.ADO71.First;
    while not DM.ADO71.Eof do
    begin
      for i:=0 to 6 do
         SGrid.Cells[i,j]:=FGrd.Columns[i].Field.AsString;
      SGrid.Cells[7,j]:=DM.ADO71.fieldbyname('prod_PTR').AsString; //rkey08;
      SGrid.RowCount:=SGrid.RowCount+1;
      inc(j);
      DM.ADO71.Next;
    end;
  end;
  EdtDept.Enabled:=SGrid.RowCount=2;
  SpeedButton1.Enabled:=EdtDept.Enabled;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
    sumAm:real;
begin
  MaskEdit1.SetFocus;
  if SGrid.RowCount=2 then
  begin
    showmessage('不能保存空记录...');
    exit;
  end;
  if MaskEdit1.Text='' then
  begin
    showmessage('订单号不能为空...');
    exit;
  end;
  if EdtCust.Text='' then
  begin
    showmessage('客户不能为空...');
    exit;
  end;
  if EdtDept.Text='' then
  begin
    showmessage('生产部门不能为空...');
    exit;
  end;
  if DBEdit1.Text='' then
  begin
    showmessage('送货地址不能为空...');
    exit;
  end;
  if EdtCurr.Text='' then
  begin
    showmessage('货币不能为空...');
    exit;
  end;
  if DBEdit3.Text='' then
  begin
    showmessage('汇率不能为空...');
    exit;
  end;
  if FinValid then exit;

  for i:=1 to SGrid.RowCount-2 do
  begin
    if strtofloat('0'+trim(SGrid.Cells[2,i]))=0 then
    begin
      showmessage('第'+inttostr(i)+'条记录订单数量不能为0...');
      exit;
    end;
    if strtofloat('0'+trim(SGrid.Cells[4,i]))>=100 then
    begin
      showmessage('第'+inttostr(i)+'条记录订单税率不能大于100...');
      exit;
    end;
    if strtodate(SGrid.Cells[5,i])<DM.ADO70_1.FieldByName('sales_date').AsDateTime then
    begin
      showmessage('第'+inttostr(i)+'条记录完工日期不能先于下单日期...');
      exit;
    end;    
  end;

  DM.ADO70_1.Edit;
  DM.ADO70_1.FieldByName('customer_ptr').AsInteger:=EdtCust.Tag;
  DM.ADO70_1.FieldByName('type').AsInteger:=1;
  DM.ADO70_1.FieldByName('status').AsInteger:=1;
  if EdtSale.Text<>'' then
    DM.ADO70_1.FieldByName('sales_rep_ptr').AsInteger:=EdtSale.Tag     
  else
    DM.ADO70_1.FieldByName('sales_rep_ptr').Value:=null;
  DM.ADO70_1.FieldByName('ent_user_PTR').AsString:=user_ptr;
  DM.ADO70_1.FieldByName('currency_ptr').AsInteger:=EdtCurr.Tag;
  DM.ADO70_1.FieldByName('produce_deptptr').AsInteger:=EdtDept.Tag;
  DM.ADOCon.BeginTrans;
  try
    if ((Ftag=0) or (Ftag=10)) and not DM.GetNo(MaskEdit1,'17',1) then abort;
    DM.ADO70_1.FieldByName('sales_order').AsString:=MaskEdit1.Text;
    DM.ADO70_1.Post;
    DM.ADO70_1.UpdateBatch(arAll);
    sumAm:=0;
    for i:=1 to SGrid.RowCount-2 do
      if DM.ADO71_1.Locate('prod_ptr',strtoint(sGrid.Cells[7,i]),[]) then
      begin
        DM.ADO71_1.Edit;
        DM.ADO71_1.FieldByName('so_ptr').AsInteger:=DM.ADO70_1.FieldByName('rkey').AsInteger;

        DM.ADO71_1.FieldByName('quantity').AsFloat := strtofloat(SGrid.Cells[2,i]);

        DM.ADO71_1.FieldByName('price').AsFloat:=strtofloat('0'+trim(SGrid.Cells[3,i]));
        DM.ADO71_1.FieldByName('tax_rate').AsFloat:=strtofloat('0'+trim(SGrid.Cells[4,i]));
        DM.ADO71_1.FieldByName('complete_date').AsString:=SGrid.Cells[5,i];
        DM.ADO71_1.FieldByName('remark').AsString:=SGrid.Cells[6,i];
        sumAm:=sumAm+DM.ADO71_1.FieldByName('quantity').AsFloat*DM.ADO71_1.FieldByName('price').AsFloat;
        DM.ADO71_1.Post;
      end else begin
        DM.ADOCon.RollbackTrans;
        showmessage('错误...');
        abort;
      end;
    DM.ADO71_1.UpdateBatch(arAll);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='update wzcp0070 set total_amount='+floattostr(sumAm)+' where rkey='+DM.ADO70_1.FieldByName('rkey').AsString;
    DM.tmp.ExecSQL;
    
    DM.ADOCon.CommitTrans;
    Frkey70:=DM.ADO70_1.FieldByName('rkey').asinteger;
    Ftag:=2;
    modalresult:=mrok;
  except
    on e:exception do
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('保存数据失败:'+e.Message);
    end;
  end;
end;

procedure TFrm_detail.N5Click(Sender: TObject);
begin
  if (Trim(EdtDept.Text)<>'') and (Trim(DBEdit1.Text)<>'') then
  begin
    TFrm_detailEdt.InitEdt(edtDept.Tag,sGrid,Ftax);
    EdtDept.Enabled := SGrid.RowCount=2;
    SpeedButton1.Enabled := EdtDept.Enabled;

  end
  else
  begin
    showmessage('请先输入生产部门和送货地址！');

  end;

end;

procedure TFrm_detail.N2Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid.RowCount <= 2 then exit;
  if DM.ADO71_1.Locate('prod_PTR',strtoint(sGrid.Cells[7,sgrid.Row]),[]) then
  begin
    DM.ADO71_1.Delete;
    for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
    sgrid.RowCount:=sgrid.RowCount-1;
    EdtDept.Enabled:=SGrid.RowCount=2;
    SpeedButton1.Enabled:=EdtDept.Enabled;
  end;
end;


procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) and not (self.ActiveControl is TStringGrid) then
    self.SelectNext(self.ActiveControl,true,true)
  else if (key=vk_return) and (self.ActiveControl is TStringGrid) then
    postmessage(self.ActiveControl.Handle,wm_keydown,vk_tab,0);
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  if Ftag=2 then abort;
  N2.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));
end;

procedure TFrm_detail.SGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
{ if button=mbright then
 begin
  SGrid.MouseToCell(x,y,column,row);
  if row<>0 then SGrid.Row:=row;
 end;
}
end;

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'CUST_CODE/客户编码/150,CUSTOMER_NAME/客户名称/250';
      InputVar.Sqlstr :='SELECT dbo.Data0010.RKEY rkey10,dbo.Data0010.CUST_CODE ,dbo.Data0010.CUSTOMER_NAME,dbo.Data0010.FED_TAX_ID_NO,dbo.Data0005.RKEY rkey05,'+
                        'dbo.Data0005.EMPL_CODE,dbo.Data0005.employee_name, dbo.Data0001.RKEY rkey01,'+
                        'dbo.Data0001.CURR_CODE,dbo.Data0001.CURR_NAME,dbo.Data0001.base_to_other,'+
                        'dbo.Data0001.EXCH_RATE '+
                        'FROM dbo.Data0010 left JOIN '+
                        'dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0005.RKEY left JOIN '+
                        'dbo.Data0001 ON dbo.Data0010.CURRENCY_PTR = dbo.Data0001.RKEY '+
                        'where data0010.CUSTOMER_TYPE<>4 order by Data0010.CUST_CODE';
      inputvar.KeyField:='CUST_CODE';
      InputVar.InPut_value:=EdtCust.Text;
    end;
    2:
    begin
      InputVar.Fields := 'CURR_CODE/货币编码/200,CURR_NAME/货币名称/250,base_to_other/汇率/150';
      InputVar.Sqlstr :='SELECT RKEY, CURR_CODE, CURR_NAME,base_to_other FROM dbo.Data0001 order by 2';
      inputvar.KeyField:='CURR_CODE';
    end;
    3:
    begin
      InputVar.Fields := 'Dept_code/部门编码/200,dept_name/部门名称/250';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name '+
                        'from data0034 where (ttype in (4,5) or is_cost_dept=1)'+
                        'and (ACTIVE_FLAG=0) order by 2';
      inputvar.KeyField:='Dept_code';
      InputVar.InPut_value:=EdtDept.Text;
    end;
    4:
    begin
      InputVar.Fields := 'EMPL_CODE/业务员代码/200,employee_name/业务员名称/250';
      InputVar.Sqlstr :='SELECT RKEY, EMPL_CODE, employee_name FROM dbo.Data0005 order by EMPL_CODE';
      inputvar.KeyField:='EMPL_CODE';
      InputVar.InPut_value:=Edtsale.Text;
    end;
    5:
    begin
      InputVar.Fields := 'CODE/代码/200,description/方法描述/250';
      InputVar.Sqlstr :='select rkey,code,description from data0370 order by 2';
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtCust.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_CODE']);
         LBCust.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME']);
         EdtCust.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey10').AsInteger;

         EdtCurr.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_CODE']);
         LBCurr.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_NAME']);
         EdtCurr.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey01').AsInteger;

         EdtSale.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['empl_code']);
         LBSale.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['employee_name']);
         EdtSale.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey05').AsInteger;

         DM.ADO70_1.Edit;
         DBEdit3.Field.AsFloat:=frmPick_Item_Single.adsPick.Fieldbyname('base_to_other').AsFloat;  //汇率
         DBEdit5.Field.AsString:=frmPick_Item_Single.adsPick.Fieldbyname('FED_TAX_ID_NO').AsString; //装运方法

         Ftax:=0;
         Dm.tmp.Close;
         Dm.tmp.SQL.Text:='SELECT dbo.Data0012.SHIP_TO_ADDRESS_1,dbo.Data0012.SHIP_SHIPPING_METHOD,dbo.Data0012.LANGUAGE_FLAG,dbo.Data0189.STATE_TAX '+
                          'FROM dbo.Data0012 left JOIN '+
                          'dbo.Data0189 ON dbo.Data0012.SHIP_CTAX_PTR = dbo.Data0189.RKEY '+
                          'where dbo.Data0012.CUSTOMER_PTR='+frmPick_Item_Single.adsPick.Fieldbyname('rkey10').AsString+' order by data0012.rkey';
         Dm.tmp.Open;
         if Dm.tmp.Locate('LANGUAGE_FLAG','Y',[]) then
         begin
           DBEdit1.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_TO_ADDRESS_1').AsString;
           DBEdit7.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_SHIPPING_METHOD').AsString;
           Ftax:=Dm.tmp.Fieldbyname('STATE_TAX').AsFloat;   //税率
         end else if not Dm.tmp.IsEmpty then begin
           DBEdit1.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_TO_ADDRESS_1').AsString;
           DBEdit7.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_SHIPPING_METHOD').AsString;
           Ftax:=Dm.tmp.Fieldbyname('STATE_TAX').AsFloat;
         end;
         DBEdit1.SetFocus;
       end;
     2:begin
         EdtCurr.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_CODE']);
         LBCurr.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_NAME']);
         EdtCurr.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         DM.ADO70_1.Edit;
         DBEdit3.Field.AsFloat:=frmPick_Item_Single.adsPick.Fieldbyname('base_to_other').AsFloat;  //汇率
         DBEdit3.SetFocus;
       end;
     3:begin
         EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
         LBDept.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
         EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         EdtSale.SetFocus;
       end;
     4:begin
         EdtSale.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['empl_code']);
         LBSale.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['employee_name']);
         EdtSale.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         DBEdit8.SetFocus;
       end;
     5:begin
         DM.ADO70_1.Edit;
         DBEdit7.Field.AsString:=frmPick_Item_Single.adsPick.Fieldbyname('description').AsString;
         DBEdit2.SetFocus;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_detail.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if Ftag=2 then exit;
  DateTimePicker1.Visible:=false;
  if (ARow<>SGrid.RowCount-1) and (ACol in [2,3,4,6]) then
    sGrid.Options:=sGrid.Options+[goEditing]
  else
    sGrid.Options:=sGrid.Options-[goEditing];
  if (Ftag<>2) and (ARow<>SGrid.RowCount-1) and (ACol=5)  then
  begin
    DateTimePicker1.Left:=SGrid.ColWidths[0]+SGrid.ColWidths[1]+SGrid.ColWidths[2]+SGrid.ColWidths[3]+SGrid.ColWidths[4]+6;
    DateTimePicker1.Top:=SGrid.Top+(SGrid.DefaultRowHeight+1)*ARow+1;
    DateTimePicker1.Visible:=true;
    DateTimePicker1.Date:=strtodate(SGrid.Cells[ACol, ARow]);  
  end;
end;

procedure TFrm_detail.DateTimePicker1Change(Sender: TObject);
begin
  SGrid.Cells[SGrid.Col, SGrid.Row]:=datetostr(DateTimePicker1.Date);
end;

procedure TFrm_detail.SGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Ftag<>2 then
  begin
    if sGrid.Col in [3,4] then
    begin
      if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',sGrid.Cells[sGrid.col,SGrid.Row])>0)) then abort;
    end else if sGrid.Col=2 then
      if not (key in ['0'..'9','.',#8]) then abort;
  end;
end;

procedure TFrm_detail.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  CellString : string;
begin

  CellString := SGrid.Cells[ACol,ARow];
  if  ARow=0 then
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)) div 2,
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString)
  else if (ARow>0) and (ACol in [2,3,4]) then    //数字居右
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)),
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString);
  if SGrid.RowCount <= 2 then
  begin
    SpeedButton3.Enabled := True;
    SpeedButton4.Enabled := True;
  end
  else
  begin
    SpeedButton3.Enabled := False;
    SpeedButton4.Enabled := False;
  end;
end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
begin
  if trim(EdtCust.Text)='' then
    messagedlg('请先选择客户!!!',mterror,[mbcancel],0)
  else
  begin
    form_address:=tform_address.Create(application);
    form_address.ADOQuery1.Close;
    form_address.ADOQuery1.Parameters[0].Value:=EdtCust.tag;
    form_address.ADOQuery1.Open;
    if form_address.ShowModal=mrok then
    begin
      DBEdit1.Text:=form_address.ADOQuery1ship_to_address_1.Value;
      DBEdit7.Text:=form_address.ADOQuery1SHIP_SHIPPING_METHOD.Value;
      DBEdit7.SetFocus;
    end;
    form_address.Free;
  end;
end;

procedure TFrm_detail.EdtCustEnter(Sender: TObject);
begin
  Fcust:=EdtCust.Text;
end;

procedure TFrm_detail.EdtCurrEnter(Sender: TObject);
begin
   Fcurr:=EdtCurr.Text;
end;

procedure TFrm_detail.EdtDeptEnter(Sender: TObject);
begin
  Fdept:=EdtDept.Text;
end;

procedure TFrm_detail.EdtSaleEnter(Sender: TObject);
begin
  Fsale:=EdtSale.Text;
end;

procedure TFrm_detail.EdtCustExit(Sender: TObject);
begin
  if (Fcust<>Edtcust.Text) and (Edtcust.Text<>'') then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text :='SELECT dbo.Data0010.RKEY rkey10,dbo.Data0010.CUST_CODE,dbo.Data0010.CUSTOMER_NAME ,Data0010.FED_TAX_ID_NO, dbo.Data0005.RKEY rkey05,'+
                      'dbo.Data0005.empl_code,dbo.Data0005.employee_name, dbo.Data0001.RKEY rkey01,'+
                      'dbo.Data0001.CURR_CODE,dbo.Data0001.CURR_NAME,dbo.Data0001.base_to_other,'+
                      'dbo.Data0001.EXCH_RATE '+
                      'FROM dbo.Data0010 left JOIN '+
                      'dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0005.RKEY left JOIN '+
                      'dbo.Data0001 ON dbo.Data0010.CURRENCY_PTR = dbo.Data0001.RKEY '+
                      'where data0010.CUSTOMER_TYPE<>4 and Data0010.CUST_CODE='''+Edtcust.Text+'''';
    DM.Tmp.Open;
    if DM.Tmp.IsEmpty then
    begin
      showmessage('客户代码不存在...');
      Edtcust.SetFocus;
      Fcust:='';
      FinValid:=true;
      abort;
    end else begin
      EdtCust.Text:=trim(DM.Tmp.FieldValues['cust_CODE']);
      LBCust.Caption:=trim(DM.Tmp.FieldValues['CUSTOMER_NAME']);
      EdtCust.tag:=DM.Tmp.Fieldbyname('rkey10').AsInteger;

      EdtCurr.Text:=DM.Tmp.Fieldbyname('CURR_CODE').AsString;
      LBCurr.Caption:=DM.Tmp.Fieldbyname('CURR_NAME').AsString;
      EdtCurr.tag:=DM.Tmp.Fieldbyname('rkey01').AsInteger;

      EdtSale.Text:=DM.Tmp.Fieldbyname('empl_code').AsString;
      LBSale.Caption:=DM.Tmp.Fieldbyname('employee_name').AsString;
      EdtSale.tag:=DM.Tmp.Fieldbyname('rkey05').AsInteger;

      DM.ADO70_1.Edit;
      DBEdit3.Field.AsFloat:=DM.Tmp.Fieldbyname('base_to_other').AsFloat;  //汇率
      DBEdit5.Field.AsString:=DM.Tmp.Fieldbyname('FED_TAX_ID_NO').AsString; //装运方法
      Ftax:=0;
      Dm.tmp.SQL.Text:='SELECT dbo.Data0012.SHIP_TO_ADDRESS_1,dbo.Data0012.SHIP_SHIPPING_METHOD,dbo.Data0012.LANGUAGE_FLAG,dbo.Data0189.STATE_TAX '+
                        'FROM dbo.Data0012 left JOIN '+
                        'dbo.Data0189 ON dbo.Data0012.SHIP_CTAX_PTR = dbo.Data0189.RKEY '+
                        'where dbo.Data0012.CUSTOMER_PTR='+DM.Tmp.Fieldbyname('rkey10').AsString+' order by data0012.rkey';
      Dm.tmp.Close;
      Dm.tmp.Open;
      if Dm.tmp.Locate('LANGUAGE_FLAG','Y',[]) then
      begin
        DBEdit1.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_TO_ADDRESS_1').AsString;
        DBEdit7.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_SHIPPING_METHOD').AsString;
        Ftax:=Dm.tmp.Fieldbyname('STATE_TAX').AsFloat;   //税率
      end else if not Dm.tmp.IsEmpty then begin
        DBEdit1.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_TO_ADDRESS_1').AsString;
        DBEdit7.Field.AsString:=Dm.tmp.Fieldbyname('SHIP_SHIPPING_METHOD').AsString;
        Ftax:=Dm.tmp.Fieldbyname('STATE_TAX').AsFloat;
      end;
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_detail.EdtCurrExit(Sender: TObject);
begin
  if (Fcurr<>Edtcurr.Text) and (Edtcurr.Text<>'') then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='SELECT RKEY, CURR_CODE, CURR_NAME FROM dbo.Data0001 where CURR_CODE='''+Edtcurr.Text+'''';
    DM.Tmp.Open;
    if DM.Tmp.IsEmpty then
    begin
      showmessage('货币代码不存在...');
      Edtcurr.SetFocus;
      Fcurr:='';
      FinValid:=true;
      abort;
    end else begin
      EdtCurr.Text:=trim(DM.Tmp.FieldValues['CURR_CODE']);
      LBCurr.Caption:=trim(DM.Tmp.FieldValues['CURR_NAME']);
      EdtCurr.tag:=DM.Tmp.Fieldbyname('rkey').AsInteger;
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_detail.EdtDeptExit(Sender: TObject);
begin
  if (Fdept<>EdtDept.Text) and (EdtDept.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (ttype in (4,5) or is_cost_dept=1) '+
                     'and dept_code='''+EdtDept.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      messagedlg('部门代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      EdtDept.SetFocus;
      Fdept:='';
      FinValid:=true;
      abort;
    end else begin
      EdtDept.Text:=DM.tmp.FieldValues['dept_code'];
      LBDept.Caption:=DM.tmp.FieldValues['dept_name'];
      EdtDept.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_detail.EdtSaleExit(Sender: TObject);
begin
  if (Fsale<>EdtSale.Text) and (EdtSale.Text<>'') then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='SELECT RKEY, empl_code, employee_name FROM dbo.Data0005 where empl_code='''+EdtSale.Text+'''';
    DM.Tmp.Open;
    if DM.Tmp.IsEmpty then
    begin
      showmessage('业务员代码不存在...');
      EdtSale.SetFocus;
      Fsale:='';
      FinValid:=true;
      abort;
    end else begin
      EdtSale.Text:=trim(DM.Tmp.FieldValues['REP_CODE']);
      LBsale.Caption:=trim(DM.Tmp.FieldValues['SALES_REP_NAME']);
      EdtSale.tag:=DM.Tmp.Fieldbyname('rkey').AsInteger;
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_detail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=(Ftag=2) or (Application.MessageBox('确认不保存退出吗?', PChar('提示'),MB_YESNO)=6);
end;

end.

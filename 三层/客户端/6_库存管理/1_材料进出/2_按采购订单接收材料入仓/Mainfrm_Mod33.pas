unit Mainfrm_Mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, EditRemark, PasReport_mod33,
  JoinReport_mod33, PasVariousPrt_mod33, PasCLoseOrders, PasLogoCard_Rp33,
  PasSetLocat_Mod33;

type
  TfrmMain_Mod33 = class(TfrmBaseMain)
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label3: TLabel;
    ComboBox1: TComboBox;
    N1: TMenuItem;
    PO1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    VMI1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Label2: TLabel;
    cdsDetail1: TClientDataSet;
    dsDetail1: TDataSource;
    DBGridEh2: TDBGridEh;
    cdsDetail2: TClientDataSet;
    dsDetail2: TDataSource;
    cds456: TClientDataSet;
    cds134: TClientDataSet;
    cds70: TClientDataSet;
    cds391: TClientDataSet;
    cds71: TClientDataSet;
    cds17: TClientDataSet;
    cds72: TClientDataSet;
    cds724: TClientDataSet;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    N15: TMenuItem;
    cds28: TClientDataSet;
    cds70_Close: TClientDataSet;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N16: TMenuItem;
    cds134_2: TClientDataSet;
    cds207: TClientDataSet;
    procedure btnQryClick(Sender: TObject);
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure PO1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure VMI1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
  private
    LwhereTmp:string;
    stock_flag:string;//接收数量不能大于订购数量
    { Private declarations }
    function find_quanhang_error(ttype,rkey456:integer):boolean;
    function ifDateCaseEdit(Ldate: TDateTime): Boolean;
    function GetStatusWhere():string;
    function GetWAREHOUSE_15():string;
  public
    { Public declarations }
    procedure GetData();override;
    procedure getRefreshClick(cds:TClientDataSet);
  end;

var
  frmMain_Mod33: TfrmMain_Mod33;

implementation

{$R *.dfm}

uses PoSearch_Mod33, POruku_Mod33, zhiruku_Mod33, Zazhiruku_Mod33,
  Zazhishuru_Mod33, VMIrucang_mod33;

{ TfrmMain_Mod33 }
function TfrmMain_Mod33.ifDateCaseEdit(Ldate: TDateTime): Boolean;
var Lcds:TClientDataSet;
    Lstr:string;
begin
  Lcds:=TClientDataSet.Create(Self);
  try
    Result:=True;
    Lstr:='select Max(cut_date) as max_cut_date from data0171';
    gSvrIntf.IntfGetDataBySql(Lstr,Lcds);
    if not Lcds.IsEmpty then
    begin
      if Lcds.FieldByName('max_cut_date').Value>Ldate then Result:=False;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod33.MenuItem1Click(Sender: TObject);
var Lsq22:string;
    Lcds:TClientDataSet;
begin
  inherited;
  Lcds:=TClientDataSet.Create(Self);
  try
    frmEditRemark := TfrmEditRemark.Create(Self);
    frmEditRemark.Edit1.Text:=cdsDetail1.FieldByName('SUPPLIER2').AsString;//原供应商生产批号
    frmEditRemark.Edit2.Text:=cdsDetail1.FieldByName('rohs').AsString;//环保标识
    frmEditRemark.Edit3.Text:=cdsDetail1.FieldByName('spec_place').AsString;//详细位置
    frmEditRemark.Edit4.Text:=cdsDetail1.FieldByName('cust_decl').AsString;//报关单号
    frmEditRemark.Edit5.Text:=cdsDetail1.FieldByName('STOCK_BASE').AsString;//单位重量KG
    frmEditRemark.Edit6.Text:=cdsDetail1.FieldByName('BARCODE_ID').AsString;//备注
    if frmEditRemark.ShowModal = mrOk then
    begin
      LSq22 := 'select * from data0022 where rkey = ' + cdsDetail1.FieldByName('rkey').AsString;
      gSvrIntf.IntfGetDataBySql(LSq22,Lcds);
      if not Lcds.IsEmpty  then
      begin
        Lcds.Edit;
        Lcds.FieldByName('SUPPLIER2').Value:=frmEditRemark.Edit1.Text;
        Lcds.FieldByName('rohs').Value:=frmEditRemark.Edit2.Text;
        Lcds.FieldByName('spec_place').Value:=frmEditRemark.Edit3.Text;
        Lcds.FieldByName('cust_decl').Value:=frmEditRemark.Edit4.Text;
        Lcds.FieldByName('STOCK_BASE').Value:=frmEditRemark.Edit5.Text;
        Lcds.FieldByName('BARCODE_ID').Value:=frmEditRemark.Edit6.Text;
        Lcds.Post;
      end;
      if (Lcds.ChangeCount>0) then
      if gSvrIntf.IntfPostDataByTable('data0022',Lcds.delta) then
      begin
        Lcds.MergeChangeLog;
        ShowMessage('修改成功');
        btnRefreshClick(nil);
      end;
    end;
  finally
    LCds.Free;
  end;
end;

procedure TfrmMain_Mod33.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain_Mod33.btnDYClick(Sender: TObject);
var Lsq70:string;
begin
  inherited;
  frmCLoseOrders := TfrmCLoseOrders.Create(Self);
  frmCLoseOrders.GetData;
  if frmCLoseOrders.ShowModal = mrOk then
  begin
    if (frmCLoseOrders.cdsMain.FieldByName('rkey').AsInteger<>0) then
    begin
      Lsq70 := 'select * from data0070 where rkey = ' +frmCLoseOrders.cdsMain.FieldByName('rkey').AsString;
      gSvrIntf.IntfGetDataBySql(Lsq70,cds70_Close);
      if not cds70_Close.IsEmpty then
      begin
        cds70_Close.Edit;
        cds70_Close.FieldByName('status').Value:=6;//关闭
        cds70_Close.Post;
      end;
      if (cds70_Close.ChangeCount>0) then
      if gSvrIntf.IntfPostDataByTable('data0070',cds70_Close.delta) then
      begin
        cds70_Close.MergeChangeLog;
      end;
    end;
  end;
end;

procedure TfrmMain_Mod33.btnQryClick(Sender: TObject);
begin
  if cdsMainWhereInit.IsEmpty then
  begin
    cdsMainWhereInit.Append;
    cdsMainWhereInit.FieldByName('FieldName').AsString := 'Data0456.SHIP_DATE';
    cdsMainWhereInit.FieldByName('Oper').AsString := '区间';
    cdsMainWhereInit.FieldByName('FieldValue').AsString := FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime-3) +
                                  ' AND ' + FormatDateTime('YYYY-MM-DD',gFunc.GetSvrDateTime+1);
    cdsMainWhereInit.FieldByName('SeqNo').AsString := '0';
    cdsMainWhereInit.Post;
  end;
  inherited;
end;

procedure TfrmMain_Mod33.cdsMainAfterScroll(DataSet: TDataSet);
var
  lsql:string;
begin
  inherited;
  if (ehMain.DataSource.DataSet.IsEmpty) then
  begin
    cdsDetail1.Active:=False;
    cdsDetail2.Active:=False;
  end;
  if ((DataSet.FieldByName('TTYPE').AsInteger=2) or (DataSet.FieldByName('TTYPE').AsInteger=6)) then
  begin
    DBGridEh1.Visible:=True;
    DBGridEh2.Visible:=False;
    lsql:='SELECT dbo.Data0235.*, dbo.Data0002.UNIT_NAME,data0072.rkey as SOURCE_PTR,'
         +'        dbo.Data0016.LOCATION,dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'
         +'         dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,Data0072.DESCRIPTION,'
         +'         Data0072.GUI_GE,Data0072.DESCRIPTION2,data0072.QUAN_ORD,data0072.QUANTITY_RECEIVED'
         +'   FROM  dbo.Data0235  INNER JOIN'
         +'         dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY INNER JOIN'
         +'         dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY LEFT OUTER JOIN'
         +'         dbo.Data0072 ON dbo.Data0235.D0072_ptr=dbo.Data0072.rkey  LEFT OUTER JOIN'
         +'         dbo.Data0068 LEFT OUTER JOIN'
         +'         dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN'
         +'         dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RIGHT OUTER JOIN'
         +'         dbo.Data0204 ON dbo.Data0068.RKEY = dbo.Data0204.PURCHASE_REQ_PTR ON dbo.Data0072.rkey204 = dbo.Data0204.RKEY'
         +'   where data0235.grn_ptr='+Inttostr(Dataset.FieldByName('RKEY').AsInteger);
    gSvrintf.IntfGetDataBySql(lsql,cdsDetail2);
  end else
  begin
    DBGridEh2.Visible:=True;
    DBGridEh1.Visible:=False;
    lsql:='SELECT data0022.*,dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,Data0017.SHELF_LIFE, dbo.Data0016.LOCATION,'
         +'       dbo.Data0017.SHELF_LIFE,dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME, dbo.Data0005.EMPL_CODE,data0002.UNIT_NAME,'
         +'       dbo.Data0034.DEPT_CODE,data0071.QUAN_ORD,data0071.CONVERSION_FACTOR,(data0071.QUAN_RECD-data0022.QUANTITY/data0071.CONVERSION_FACTOR) as QUAN_RECD,D02_1.UNIT_NAME AS pr_unitname,'
         +'       data0071.avl_flag,data0071.IF_CAF,Data0071.INVT_PTR,Data0071.WO_PTR,0 as mark,Data0071.extra_req,'
         +'       Data0071.QUAN_RETN,data0022.QUAN_ON_HAND as QUAN_ON_HAND2,data0134.rkey as rkey134,Data0134.QUAN_ON_HAND as VMI_ON_HAND,data0391.status as status391'
         +'   FROM  dbo.Data0022 INNER JOIN'
         +'   data0456 on data0022.GRN_PTR=data0456.rkey inner join'
         +'         dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
         +'         dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'
         +'         dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY LEFT OUTER JOIN'
         +'         dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY LEFT OUTER JOIN'
         +'         dbo.Data0068 LEFT OUTER JOIN'
         +'         dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN'
         +'         dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RIGHT OUTER JOIN'
         +'         dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY left JOIN'
         +'   Data0002 D02_1 ON Data0071.WO_PTR = D02_1.RKEY left join '
         +'    data0134 on data0022.D0134_PTR=data0134.rkey  left join  '
         +'  dbo.data0391 on data0391.rkey = dbo.data0022.rkey391'
         +'   where Data0022.grn_ptr='+Inttostr(Dataset.FieldByName('RKEY').AsInteger)+''
         +'   order by data0022.inventory_ptr';
    gSvrintf.IntfGetDataBySql(lsql,cdsDetail1);
  end;
end;

procedure TfrmMain_Mod33.CheckBox1Click(Sender: TObject);
begin
  inherited;
  GetData;
end;

function TfrmMain_Mod33.find_quanhang_error(ttype, rkey456: integer): boolean;
var Lcds:TClientDataSet;
    Lsq:string;
begin
  result:=false;
  Lcds:=TClientDataSet.Create(Self);
  try
    if ttype<>2 then
    begin
      Lsq:='select rkey from data0022 where quantity<>quan_on_hand and grn_ptr='+inttostr(rkey456);
      gSvrIntf.IntfGetDataBySql(Lsq,Lcds);
      if not Lcds.IsEmpty then
      begin
        Result:=true;
      end;
    end else
    begin
      Lsq:='select rkey from data0235 where quan_recd<>quan_on_hand and grn_ptr='+inttostr(rkey456);
      gSvrIntf.IntfGetDataBySql(Lsq,Lcds);
      if not Lcds.IsEmpty then
      begin
        Result:=true;
      end;
    end;
  finally
    Lcds.Free;
  end;
end;

procedure TfrmMain_Mod33.GetData;
var LSql:string;
    Lcds:TClientDataSet;
begin
  Label2.Visible:=False;
  Lcds:=TClientDataSet.Create(Self);
  try
    if (ComboBox1.Items.Count<2) then
    begin
      Lsql:='select rkey,abbr_name from data0015';
      if not gSvrIntf.IntfGetDataBySql(Lsql,Lcds) then Exit;
      ComboBox1.Items.Clear;
      ComboBox1.Items.AddObject('所有',Pointer(0));
      while not Lcds.Eof do
      begin
        ComboBox1.Items.AddObject(Lcds.fieldBYName('abbr_name').AsString,Pointer(Lcds.fieldBYName('Rkey').AsInteger));
        Lcds.Next;
      end;
      ComboBox1.ItemIndex:=0;
    end;
    LSql:='SELECT dbo.Data0092.PHY_COUNT_NO, dbo.Data0092.TDATE,'+#13+
          'dbo.Data0005.EMPLOYEE_NAME'+#13+
          'FROM dbo.Data0005 INNER JOIN'+#13+
          'dbo.Data0092 ON dbo.Data0005.RKEY = dbo.Data0092.EMPLOYEE_PTR'+#13+
          'WHERE (dbo.Data0092.STATUS = ''0'')';
    if not gSvrIntf.IntfGetDataBySql(Lsql,Lcds) then Exit;
    if not Lcds.IsEmpty then
    begin
      messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码:'+
      lcds.fieldvalues['PHY_COUNT_NO']+'盘点人员:'+lcds.fieldvalues['EMPLOYEE_NAME'],
      mtinformation,[mbcancel],0);
      Exit;
    end;
    lsql:='select stock_in_flag from data0192';
    if not gSvrIntf.IntfGetDataBySql(Lsql,Lcds) then Exit;
    stock_flag:=Lcds.FieldByName('stock_in_flag').AsString;
  finally
    Lcds.Free;
  end;

  FMainFrmSql := cdsMain.CommandText;

  if FMainWhere.Trim = '' then
    FMainWhere := ' AND Data0456.SHIP_DATE BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));
    LwhereTmp:= ' Data0456.SHIP_DATE BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));
    FWhere2:= GetStatusWhere;
    if (ComboBox1.ItemIndex=0) then FWhere3:='' else
    FWhere3:=GetWAREHOUSE_15;
  FOrderby := ' order by Data0456.RKEY desc ';
  inherited;
end;

procedure TfrmMain_Mod33.getRefreshClick(cds: TClientDataSet);
begin
  btnRefreshClick(nil);
end;

function TfrmMain_Mod33.GetStatusWhere: string;
begin
  Result := ' AND DATA0456.STATUS in ( 99';
  if CheckBox1.Checked then Result:= Result + ',1';
  if CheckBox2.Checked then Result:= Result + ',2';
  if CheckBox3.Checked then Result:= Result + ',3';
  if CheckBox4.Checked then Result:= Result + ',4';
  if CheckBox5.Checked then Result:= Result + ',5';
  if CheckBox6.Checked then Result:= Result + ',6';
  Result:= Result + ')';
end;

function TfrmMain_Mod33.GetWAREHOUSE_15: string;
begin
  if integer(ComboBox1.items.objects[ComboBox1.itemindex])=0 then Result:=''
  else
  begin
    Result:=' and data0015.rkey in (-1';
    Result:=Result+','+IntToStr(integer(ComboBox1.items.objects[ComboBox1.itemindex]));
    Result:=Result + ')';
  end;
end;

procedure TfrmMain_Mod33.N10Click(Sender: TObject);
var i:Integer;
    LFrm:TfrmReport_mod33;
    LFrm2:TfrmVariousPrt_mod33;
    LFileName:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,33) then Exit;
  frmJoinReport_mod33 := TfrmJoinReport_mod33.Create(Self);
  try
    cdsMain.DisableControls;
    frmJoinReport_mod33.Init_UI;
    cdsMain.First;
    while not cdsMain.Eof do
    begin
      if (cdsMain.FieldByName('PRINTED').Value='N') then
      begin
        frmJoinReport_mod33.sg1.Cells[0,frmJoinReport_mod33.sg1.RowCount-1]:= cdsMain.FieldByName('GRN_NUMBER').AsString;
        frmJoinReport_mod33.sg1.Cells[1,frmJoinReport_mod33.sg1.RowCount-1]:= cdsMain.FieldByName('ABBR_NAME').AsString;
        frmJoinReport_mod33.sg1.Cells[2,frmJoinReport_mod33.sg1.RowCount-1]:= cdsMain.FieldByName('rkey').AsString;
        frmJoinReport_mod33.sg1.Cells[3,frmJoinReport_mod33.sg1.RowCount-1]:= IntToStr(frmJoinReport_mod33.sg1.RowCount-2);
        frmJoinReport_mod33.sg1.RowCount:=  frmJoinReport_mod33.sg1.RowCount + 1;
      end;
      cdsMain.Next;
    end;
  finally
    cdsMain.EnableControls;
  end;

  if frmJoinReport_mod33.ShowModal = mrOk then
  begin
    LFrm:=TfrmReport_mod33.Create(Self);
    LFrm2:=TfrmVariousPrt_mod33.Create(Self);
    for I := 1 to frmJoinReport_mod33.SG2.RowCount-2 do
    begin
      if (cdsMain.FieldByName('ttype').AsInteger<>2) and (cdsMain.FieldByName('ttype').AsInteger<>6) then
      begin
        LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
        LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
          'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
          '编码入库单报表.fr3';
        LFrm.frxReport1.LoadFromFile(LFileName, true);
        LFrm.frxReport1.PrintOptions.ShowDialog := False;
        LFrm.frxReport1.PrepareReport(True);
        LFrm.frxReport1.Print;
      end else
      begin
        LFrm2.GetData(cdsMain.FieldByName('rkey').AsString);
        LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
          'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
          '杂项入库单报表.fr3';
        LFrm2.frxReport1.LoadFromFile(LFileName, true);
//        LFrm2.frxReport1.PreviewOptions.ShowCaptions:=False;
        LFrm2.frxReport1.PrintOptions.ShowDialog := False;
        LFrm2.frxReport1.PrepareReport(True);
        LFrm2.frxReport1.Print;
      end;
    end;
  end;
end;

procedure TfrmMain_Mod33.N11Click(Sender: TObject);
var Lcds:TClientDataSet;
    Lsq:string;
  LSq70,LSq71,LSq391,LSq17,Lsql456,LSql207: string;
  LRkey71str,Lrkey391str,LRkey17str,Lrkey72str,LRkey22:string;
  LPostData: OleVariant;
  LRkey134str:string;
  LSq456,LSq724,LSq134:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(6,33) then Exit;
  Lcds:=TClientDataSet.Create(Self);
  try
    if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      if ((cdsMain.FieldByName('STATUS').AsInteger=1) and (not find_quanhang_error(cdsMain.FieldByName('ttype').AsInteger,cdsMain.FieldByName('RKEY').AsInteger))) then
      begin
        if (cdsMain.FieldByName('ttype').AsInteger<>5) then //其它入库
        begin
           if (cdsMain.FieldByName('create_date').Value<frmPOruku_Mod33.find_maxdate) then
           begin
             ShowMessage('送货日期必须大于财务库存截数最大日期!');
             Exit;
           end;
        end else
        begin
          Lsq:='select * from data0171 where status=0';    //VMI入库
          gSvrIntf.IntfGetDataBySql(Lsq,Lcds);
          if not Lcds.IsEmpty then
          begin
            ShowMessage('VMI仓库正在截数,不能操作,请联系财务部!');
            Exit;
          end else
          if not (ifDateCaseEdit(cdsMain.FieldByName('create_date').Value)) then
          begin
            ShowMessage('已经截数，不能再删除！！');
            Exit;
          end;
        end;

        if (cdsMain.FieldByName('ttype').AsInteger=1) then //编码入库：更新71已收货数量 更新70状态 更新17当前库存总数据 更新391 删除456
        begin
          LRkey71str:='';
          Lrkey391str:='';
          LRkey17str:='';
          LRkey22:='';
          cdsDetail1.First;
          while not cdsDetail1.Eof do
          begin
            if (cdsDetail1.FieldByName('SOURCE_PTR').AsString<>'') then//71
            LRkey71str:=LRkey71str+cdsDetail1.FieldByName('SOURCE_PTR').AsString+',';
            if (cdsDetail1.FieldByName('Rkey391').AsString<>'') then   //391
            Lrkey391str:=Lrkey391str+cdsDetail1.FieldByName('Rkey391').AsString+',';
            if (cdsDetail1.FieldByName('INVENTORY_PTR').AsString<>'') then//17
            LRkey17str:=LRkey17str+cdsDetail1.FieldByName('INVENTORY_PTR').AsString+',';
            LRkey22:= LRkey22 + cdsDetail1.FieldByName('rkey').AsString +',';
            cdsDetail1.Next;
          end;
          // data0070
          LSq70 := 'select * from data0070 where Rkey = ' + cdsMain.FieldByName('PO_PTR').AsString;
          // data0071
          LSq71 := 'select * from data0071 where rkey in (' + LRkey71str+'-1)';
          // data0391
          LSq391 := 'select * from data0391 where rkey in (' + Lrkey391str+'-1)';
          //data0017
          LSq17:='select * from data0017 where Rkey in (' + LRkey17str+'-1)';
          //data0456
          Lsql456:='select * from data0456 where rkey=' + cdsMain.FieldByName('Rkey').AsString;
          //data0207
          LSql207:= 'select * from data0207 where D0022_PTR in (' + LRkey22 + '-1)';

          if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSq70,LSq71,LSq391,LSq17,Lsql456,LSql207]),[cds70,cds71,cds391,cds17,cds456,cds207]) then Exit;
          //add by zsp 20170728
          if not cds207.IsEmpty then
          begin
            cds207.First;
            while not cds207.eof do
            begin
              cds207.Edit;
              cds207.FieldByName('D0022_PTR').AsVariant := null;
              cds207.Post;
              cds207.Next;
            end;
          end;
          //end

          cdsDetail1.First;
          while not cdsDetail1.Eof do
          begin
          //edit391
            cds391.Filtered:=False;
            cds391.Filter:='';
            cds391.Filter:='Rkey ='+cdsDetail1.FieldByName('Rkey391').AsString;
            cds391.Filtered:=True;
            if not cds391.IsEmpty then
            begin
              cds391.Edit;
              cds391.FieldByName('stock_over').Value:=0;
              cds391.Post;
            end;
          //edit71
            if cds71.Locate('rkey',cdsDetail1.FieldByName('SOURCE_PTR').AsInteger,[]) then
            begin
              cds71.Edit;
              cds71.FieldByName('QUAN_RECD').Value:=cds71.FieldByName('QUAN_RECD').Value-cdsDetail1.FieldByName('QUANTITY').Value/cdsDetail1.FieldByName('CONVERSION_FACTOR').AsFloat; //已接收的数量
              cds71.Post;
            end;
          //edit17
            if cds17.Locate('rkey',cdsDetail1.FieldByName('INVENTORY_PTR').AsInteger,[]) then
            begin
              cds17.Edit;
              cds17.FieldByName('QUAN_ON_HAND').Value:=cds17.FieldByName('QUAN_ON_HAND').Value-cdsDetail1.FieldByName('QUAN_ON_HAND').Value;
              cds17.Post;
            end;
            cdsDetail1.Next;
          end;
          //edit70
          cds70.Edit;
          cds70.FieldByName('status').Value:=5;
          cds70.Post;
          //delete 456
          cds456.Delete;

          if cds71.State in [dsEdit,dsInsert] then cds71.Post;
          if cds391.State in [dsEdit,dsInsert] then cds391.Post;
          if cds70.State in [dsEdit,dsInsert] then cds70.Post;
          if cds17.State in [dsEdit,dsInsert] then cds17.Post;
          if cds456.State in [dsEdit,dsInsert] then cds456.Post;
          if cds207.State in [dsEdit,dsInsert] then cds207.Post;

          LPostData := VarArrayCreate([0,5],varVariant);
          if cds71.ChangeCount > 0 then
            LPostData[0] := cds71.Delta;
          if cds391.ChangeCount > 0 then
            LPostData[1] := cds391.Delta;
          if cds70.ChangeCount > 0 then
            LPostData[2] := cds70.Delta;
          if cds17.ChangeCount > 0 then
            LPostData[3] := cds17.Delta;
          if cds456.ChangeCount > 0 then
            LPostData[4] := cds456.Delta;
          if cds207.ChangeCount > 0 then
            LPostData[5] := cds207.Delta;
          if gSvrIntf.IntfPostModData('公共基础',33,LPostData,5) then
          begin
            if cds71.ChangeCount > 0 then cds71.MergeChangeLog;
            if cds391.ChangeCount > 0 then cds391.MergeChangeLog;
            if cds70.ChangeCount > 0 then cds70.MergeChangeLog;
            if cds17.ChangeCount > 0 then cds17.MergeChangeLog;
            if cds456.ChangeCount > 0 then cds456.MergeChangeLog;
            if cds207.ChangeCount > 0 then cds207.MergeChangeLog;
            ShowMessage('删除成功');
            btnRefreshClick(nil);
          end;
        end else
        if (cdsMain.FieldByName('ttype').AsInteger=2) then //杂项入库  更新72已收货数量 更新70状态  删除456
        begin
          Lrkey72str:='';
          LRkey22:='';
          cdsDetail2.First;
          while not cdsDetail2.Eof do
          begin
            if (cdsDetail2.FieldByName('D0072_PTR').AsString<>'') then//71
            Lrkey72str:=Lrkey72str+cdsDetail2.FieldByName('D0072_PTR').AsString+',';
            LRkey22:= LRkey22 + cdsDetail2.FieldByName('rkey').AsString+',';
            cdsDetail2.Next;
          end;
          // data0070
          LSq70 := 'select * from data0070 where Rkey = ' + cdsMain.FieldByName('PO_PTR').AsString;
          // data0072
          LSq71 := 'select * from data0072 where rkey in (' + Lrkey72str+'-1)';
          //data0456
          Lsql456:='select * from data0456 where rkey=' + cdsMain.FieldByName('Rkey').AsString;

          LSql207:= 'select * from data0208 where SOURCE_PTR in (' + LRkey22 +'-1)';
          if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSq70,LSq71,Lsql456,LSql207]),[cds70,cds72,cds456,cds207]) then Exit;
          //add by zsp 20170728
          if not cds207.IsEmpty then
          begin
            cds207.First;
            while not cds207.eof do
            begin
              cds207.Edit;
              cds207.FieldByName('SOURCE_PTR').AsVariant := null;
              cds207.Post;
              cds207.Next;
            end;
          end;
          //end

          cdsDetail2.First;
          while not cdsDetail2.Eof do
          begin
          //edit72
            if cds72.Locate('rkey',cdsDetail2.FieldByName('D0072_PTR').AsInteger,[]) then
            begin
              cds72.Edit;
              cds72.FieldByName('QUANTITY_RECEIVED').Value:=cds72.FieldByName('QUANTITY_RECEIVED').Value-cdsDetail2.FieldByName('QUAN_RECD').Value;
              cds72.Post;
            end;
            cdsDetail2.Next;
          end;

          //edit70
          cds70.Edit;
          cds70.FieldByName('status').Value:=5;
          cds70.Post;

          //delete 456
          cds456.Delete;

          if cds72.State in [dsEdit,dsInsert] then cds72.Post;
          if cds70.State in [dsEdit,dsInsert] then cds70.Post;
          if cds456.State in [dsEdit,dsInsert] then cds456.Post;
          if cds207.State in  [dsEdit,dsInsert] then cds207.Post;


          LPostData := VarArrayCreate([0,3],varVariant);
          if cds72.ChangeCount > 0 then
            LPostData[0] := cds72.Delta;
          if cds70.ChangeCount > 0 then
            LPostData[1] := cds70.Delta;
          if cds456.ChangeCount > 0 then
            LPostData[2] := cds456.Delta;
          if cds207.ChangeCount > 0 then
            LPostData[3] := cds207.Delta;
          if gSvrIntf.IntfPostModData('公共基础',33,LPostData,6) then
          begin
            if cds72.ChangeCount > 0 then cds72.MergeChangeLog;
            if cds70.ChangeCount > 0 then cds70.MergeChangeLog;
            if cds456.ChangeCount > 0 then cds456.MergeChangeLog;
            if cds207.ChangeCount > 0 then cds207.MergeChangeLog;
            ShowMessage('删除成功');
            btnRefreshClick(nil);
          end;
        end else
        if (cdsMain.FieldByName('ttype').AsInteger=5) then //VMI入库 更新134VMI库存数 删除VMI出库记录724 更新17当前库存总数据 删除456
        begin
          LRkey134str:='';
          LRkey17str:='';
          LRkey22:='';
          cdsDetail1.First;
          while not cdsDetail1.Eof do
          begin
            if (cdsDetail1.FieldByName('rkey134').AsString<>'') then   //134
            LRkey134str:=LRkey134str+cdsDetail1.FieldByName('Rkey134').AsString+',';
            if (cdsDetail1.FieldByName('INVENTORY_PTR').AsString<>'') then//17
            LRkey17str:=LRkey17str+cdsDetail1.FieldByName('INVENTORY_PTR').AsString+',';
            LRkey22:=  LRkey22 + cdsDetail1.FieldByName('rkey').AsString+',';
            cdsDetail1.Next;
          end;
          // data0456
          LSq456 := 'select * from data0456 where Rkey = ' + cdsMain.FieldByName('rkey').AsString;
          // data0724
          LSq724 := 'select * from data0724 where Rkey = ' + cdsMain.FieldByName('rkey724').AsString;
          // data0134
          LSq134 := 'select * from data0134 where rkey in (' + LRkey134str+'-1)';
          //data0017
          LSq17:='select * from data0017 where Rkey in (' + LRkey17str+'-1)';
          //data0207
          LSql207:= 'select * from data0207 where D0022_PTR in (' + LRkey22 + '-1)';

          //data0134_2
//          LSql134_2:='select data0149.D0134_PTR from data0149 inner join data0134 on data0149.D0134_PTR=data0134.rkey where data0149.gon_ptr='+ cdsMain.FieldByName('rkey724').AsString;
          if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSq456,LSq724,LSq134,LSq17,LSql207]),[cds456,cds724,cds134,cds17,cds207]) then Exit;
          //add by zsp 20170728
          if not cds207.IsEmpty then
          begin
            cds207.First;
            while not cds207.eof do
            begin
              cds207.Edit;
              cds207.FieldByName('D0022_PTR').AsVariant := null;
              cds207.Post;
              cds207.Next;
            end;
          end;
          //end
          //如果22不存在134的特殊处理
//          if (LRkey134str='') then
//          begin
//            if cds134_2.IsEmpty then
//            begin
//              ShowMessage('该数据存在异常，请联系ERP！(149与134对应不上)');
//              Exit;
//            end;
//            cds134_2.First;
//            while not cds134_2.Eof do
//            begin
//              if (cds134_2.FieldByName('D0134_PTR').AsString<>'') then   //134从149中取
//              LRkey134str:=LRkey134str+cds134_2.FieldByName('D0134_PTR').AsString+',';
//              cds134_2.Next;
//            end;
//            gSvrIntf.IntfGetDataBySql(LSq134,cds134);
//          end;
          if (cds134.RecordCount=0) then
          begin
            ShowMessage('该数据存在异常，请联系ERP！(134没数据)');
            Exit;
          end;
          //end如果--------

          cdsDetail1.First;
          while not cdsDetail1.Eof do
          begin
          //edit134
//            cds134.Filtered:=False;
//            cds134.Filter:='';
//            cds134.Filter:='Rkey ='+cdsDetail1.FieldByName('Rkey134').AsString;
//            cds134.Filtered:=True;
            if cds134.Locate('rkey',cdsDetail1.FieldByName('Rkey134').AsInteger,[]) then
            begin
              cds134.Edit;
              cds134.FieldByName('QUAN_ON_HAND').Value:=cds134.FieldByName('QUAN_ON_HAND').Value + cdsDetail1.FieldByName('QUANTITY').Value;
              cds134.Post;
            end;
          //edit17
            if cds17.Locate('rkey',cdsDetail1.FieldByName('INVENTORY_PTR').AsInteger,[]) then
            begin
              cds17.Edit;
              cds17.FieldByName('QUAN_ON_HAND').Value:=cds17.FieldByName('QUAN_ON_HAND').Value - cdsDetail1.FieldByName('QUANTITY').Value;
              cds17.Post;
            end;
            cdsDetail1.Next;
          end;
          //delete 456
          cds456.Delete;
          //delete 724
          cds724.Delete;

          if cds134.State in [dsEdit,dsInsert] then cds134.Post;
          if cds17.State in [dsEdit,dsInsert] then cds17.Post;
          if cds456.State in [dsEdit,dsInsert] then cds456.Post;
          if cds724.State in [dsEdit,dsInsert] then cds724.Post;
          if cds207.State in [dsEdit,dsInsert] then cds207.Post;

          LPostData := VarArrayCreate([0,4],varVariant);
          if cds17.ChangeCount > 0 then
            LPostData[0] := cds17.Delta;
          if cds207.ChangeCount > 0 then
            LPostData[1] := cds207.Delta;
          if cds456.ChangeCount > 0 then
            LPostData[2] := cds456.Delta;
          if cds724.ChangeCount > 0 then
            LPostData[3] := cds724.Delta;
          if cds134.ChangeCount > 0 then
            LPostData[4] := cds134.Delta;
          if gSvrIntf.IntfPostModData('公共基础',33,LPostData,7) then
          begin
            if cds134.ChangeCount > 0 then cds134.MergeChangeLog;
            if cds17.ChangeCount > 0 then cds17.MergeChangeLog;
            if cds724.ChangeCount > 0 then cds724.MergeChangeLog;
            if cds456.ChangeCount > 0 then cds456.MergeChangeLog;
            if cds207.ChangeCount > 0 then cds207.MergeChangeLog;
            ShowMessage('删除成功');
            btnRefreshClick(nil);
          end;
        end else
        if (cdsMain.FieldByName('ttype').AsInteger=3) then //直接入仓  更新17当前库存总数据  删除456
        begin
          LRkey17str:='';
          LRkey22:='';
          cdsDetail1.First;
          while not cdsDetail1.Eof do
          begin
            if (cdsDetail1.FieldByName('INVENTORY_PTR').AsString<>'') then//17
            LRkey17str:=LRkey17str+cdsDetail1.FieldByName('INVENTORY_PTR').AsString+',';
            LRkey22:= LRkey22 + cdsDetail1.FieldByName('rkey').AsString + ',';
            cdsDetail1.Next;
          end;
          // data0456
          LSq456 := 'select * from data0456 where Rkey = ' + cdsMain.FieldByName('rkey').AsString;
          //data0017
          LSq17:='select * from data0017 where Rkey in (' + LRkey17str+'-1)';
          //data0207
          LSql207:= 'select * from data0207 where D0022_PTR in (' + LRkey22 + '-1)';
          if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSq456,LSq17,LSql207]),[cds456,cds17,cds207]) then Exit;
          //add by zsp 20170728
          if not cds207.IsEmpty then
          begin
            cds207.First;
            while not cds207.eof do
            begin
              cds207.Edit;
              cds207.FieldByName('D0022_PTR').AsVariant := null;
              cds207.Post;
              cds207.Next;
            end;
          end;
          //end
          cdsDetail1.First;
          while not cdsDetail1.Eof do
          begin
            if cds17.Locate('rkey',cdsDetail1.FieldByName('INVENTORY_PTR').AsInteger,[]) then
            begin
              cds17.Edit;
              cds17.FieldByName('QUAN_ON_HAND').Value:=cds17.FieldByName('QUAN_ON_HAND').Value-cdsDetail1.FieldByName('QUAN_ON_HAND').Value;
              cds17.Post;
            end;
            cdsDetail1.Next;
          end;
          //delete 456
          cds456.Delete;

          if cds17.State in [dsEdit,dsInsert] then cds17.Post;
          if cds456.State in [dsEdit,dsInsert] then cds456.Post;
          if cds207.State in [dsEdit,dsInsert] then cds207.Post;

          LPostData := VarArrayCreate([0,2],varVariant);
          if cds17.ChangeCount > 0 then
            LPostData[0] := cds17.Delta;
          if cds456.ChangeCount > 0 then
            LPostData[1] := cds456.Delta;
          if cds207.ChangeCount > 0 then
            LPostData[2] := cds207.Delta;
          if gSvrIntf.IntfPostModData('公共基础',33,LPostData,8) then
          begin
            if cds17.ChangeCount > 0 then cds17.MergeChangeLog;
            if cds456.ChangeCount > 0 then cds456.MergeChangeLog;
            if cds207.ChangeCount > 0 then cds456.MergeChangeLog;
            ShowMessage('删除成功');
            btnRefreshClick(nil);
          end;
        end else
        if (cdsMain.FieldByName('ttype').AsInteger=6) then //杂项直入  直接删除456
        begin
          LRkey22:='';
          cdsDetail1.First;
          while not cdsDetail1.Eof do
          begin
            LRkey22:= LRkey22 + cdsDetail1.FieldByName('rkey').AsString + ',';
            cdsDetail1.Next;
          end;
          // data0456
          LSq456 := 'select * from data0456 where Rkey = ' + cdsMain.FieldByName('rkey').AsString;
          //data0208
          LSql207:= 'select * from data0208 where SOURCE_PTR in (' + LRkey22 + '-1)';

          if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSq456,LSql207]),[cds456,cds207]) then Exit;
          //add by zsp 20170728
          if not cds207.IsEmpty then
          begin
            cds207.First;
            while not cds207.eof do
            begin
              cds207.Edit;
              cds207.FieldByName('SOURCE_PTR').AsVariant := null;
              cds207.Post;
              cds207.Next;
            end;
          end;
          //end
          cds456.Delete;

          if cds456.State in [dsEdit,dsInsert] then cds456.Post;
          if cds207.State in [dsEdit,dsInsert] then cds207.Post;

          LPostData := VarArrayCreate([0,1],varVariant);
          if cds207.ChangeCount > 0 then
            LPostData[1] := cds207.Delta;
          if cds456.ChangeCount > 0 then
            LPostData[0] := cds456.Delta;

          if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['data0456','data0208']),LPostData) then
          begin
            cds456.MergeChangeLog;
            if cds207.ChangeCount >0 then cds207.MergeChangeLog;
            ShowMessage('删除成功');
            btnRefreshClick(nil);
          end;
        end;
      end else
      begin
        ShowMessage('数据删除不成功!入库单状态已发生更改或者已发放');
        Exit;
      end;
    end;
  finally
    Lcds.Free;
  end;
end;

procedure TfrmMain_Mod33.N12Click(Sender: TObject);
var
  LFrm:TfrmReport_mod33;
  LFileName:string;
begin
  inherited;
    LFrm:=TfrmReport_mod33.Create(Self);
    try
      LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
        '编码入库单报表.fr3';
      LFrm.frxReport1.LoadFromFile(LFileName, true);
      LFrm.frxReport1.DesignReport;
    finally
      LFrm.Free;
    end;
end;

procedure TfrmMain_Mod33.N13Click(Sender: TObject);
var
  LFrm2:TfrmVariousPrt_mod33;
  LFileName:string;
begin
  inherited;
  LFrm2:=TfrmVariousPrt_mod33.Create(Self);
  try
    LFrm2.GetData(cdsMain.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '杂项入库单报表.fr3';
    LFrm2.frxReport1.LoadFromFile(LFileName, true);
    LFrm2.frxReport1.DesignReport;
  finally
    LFrm2.Free;
  end;
end;

procedure TfrmMain_Mod33.N14Click(Sender: TObject);
begin
  inherited;
  frmSetLocat_Mod33 := TfrmSetLocat_Mod33.Create(Self);
  frmSetLocat_Mod33.getdata;
  if frmSetLocat_Mod33.ShowModal = mrOk then
  begin

  end;
end;

procedure TfrmMain_Mod33.N15Click(Sender: TObject);
var
  LFrm:TfrmLogoCard_Rp33;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmLogoCard_Rp33.Create(Self);
  try
    LFrm.GetData(cdsDetail1.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '物料标识卡.fr3';
    LFrm.frxReport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.ShowReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod33.N16Click(Sender: TObject);
var
  LFrm:TfrmLogoCard_Rp33;
  LFileName:string;
begin
  inherited;
  LFrm:=TfrmLogoCard_Rp33.Create(Self);
  try
    LFrm.GetData(cdsDetail1.FieldByName('rkey').AsString);
    LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
      'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
      '物料标识卡.fr3';
    LFrm.frxReport1.LoadFromFile(LFileName, true);
    LFrm.frxReport1.DesignReport;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain_Mod33.N2Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,33) then Exit;
  if frmzhiruku_Mod33 = nil then
  begin
    frmzhiruku_Mod33 := Tfrmzhiruku_Mod33.Create(Self);
    frmzhiruku_Mod33.refresh:= self.getRefreshClick;
    frmzhiruku_Mod33.AddLookup22;
  end;
  frmzhiruku_Mod33.getdata('0');
  frmzhiruku_Mod33.Append456;
  frmzhiruku_Mod33.FEditType:=0;
  frmzhiruku_Mod33.Show;
end;

procedure TfrmMain_Mod33.N3Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,33) then Exit;
  if frmZazhiruku_Mod33 = nil then
  begin
    frmZazhiruku_Mod33 := TfrmZazhiruku_Mod33.Create(Self);
    frmZazhiruku_Mod33.refresh:= self.getRefreshClick;
    frmZazhiruku_Mod33.AddLookup235;
  end;
  frmZazhiruku_Mod33.getdata('0');
  frmZazhiruku_Mod33.Append456;
  frmZazhiruku_Mod33.FEditType:=0;
  frmZazhiruku_Mod33.Show;
end;

procedure TfrmMain_Mod33.N4Click(Sender: TObject);
var Lsql28:string;
    i,j:Integer;
begin
  inherited;
  if not gFunc.CheckUserAuth(2,33) then Exit;
  i:=0;
  if ((cdsMain.FieldByName('TTYPE').AsInteger<>3) and (cdsMain.FieldByName('TTYPE').AsInteger<>5) and (cdsMain.FieldByName('TTYPE').AsInteger<>6)) then
  begin
    if frmPOruku_Mod33 = nil then
    begin
      frmPOruku_Mod33 := TfrmPOruku_Mod33.Create(Self);
      frmPOruku_Mod33.refresh:= self.getRefreshClick;
    end;
    frmPOruku_Mod33.WindowState:= wsMaximized;
    frmPOruku_Mod33.stock_flag:=stock_flag;
    frmPOruku_Mod33.Panel1.Enabled:=True;
    frmPOruku_Mod33.EnableButton(True);
    frmPOruku_Mod33.FEditType:=1;
    frmPOruku_Mod33.GetData(cdsMain.FieldByName('rkey').AsString);
    frmPOruku_Mod33.EnableEdit;
    frmPOruku_Mod33.get_location;
    frmPOruku_Mod33.dtpReqDate.DateTime:=cdsMain.FieldByName('ship_DATE').Value;
    frmPOruku_Mod33.CBloc.Visible:=False;
    frmPOruku_Mod33.ComboBox3.Visible:=False;
    if (cdsMain.FieldByName('PO_TYPE').Value='S') then   //编码入库
    begin
      frmPOruku_Mod33.if22or235:=22;
      frmPOruku_Mod33.init;
      frmPOruku_Mod33.StringGrid1.Visible:=True;
      frmPOruku_Mod33.StringGrid2.Visible:=False;
//      frmPOruku_Mod33.Button2.Enabled:=False;
      if not cdsDetail1.IsEmpty then
      begin
        cdsDetail1.First;
        while not cdsDetail1.Eof do
        begin
          for j := 0 to frmPOruku_Mod33.str_list.Count -1 do
          begin
            if (cdsDetail1.FieldByName(frmPOruku_Mod33.str_list.Values[frmPOruku_Mod33.StringGrid1.Cells[j,0]]).IsNull = False) then
              frmPOruku_Mod33.StringGrid1.Cells[j,i+1] := cdsDetail1.FieldByName(frmPOruku_Mod33.str_list.Values[frmPOruku_Mod33.StringGrid1.Cells[j,0]]).Value;
          end;
          Lsql28:='select qte_price2 from data0028 where inventory_ptr = '
          + Trim(cdsDetail1.FieldByName('INVT_PTR').AsString)
          +' and supplier_ptr='+cdsMain.FieldByName('SUPP_PTR').AsString;
          gSvrIntf.IntfGetDataBySql(Lsql28,cds28);
          if not cds28.IsEmpty then
          begin
            frmPOruku_Mod33.StringGrid1.Cells[frmPOruku_Mod33.str_list.IndexOfName('材料有效期'),i+1] := cds28.FieldByName('qte_price2').AsString;
          end;
          frmPOruku_Mod33.StringGrid1.Cells[frmPOruku_Mod33.str_list.IndexOfName('已接收'),i+1] := cdsDetail1.FieldByName('QUAN_RECD').Value;
//          frmPOruku_Mod33.StringGrid1.Cells[frmPOruku_Mod33.str_list.IndexOfName('已接收'),i+1] := cdsDetail1.FieldByName('QUAN_RECD').Value-cdsDetail1.FieldByName('QUANTITY').Value/cdsDetail1.FieldByName('CONVERSION_FACTOR').Value;
          frmPOruku_Mod33.StringGrid1.Cells[frmPOruku_Mod33.str_list.IndexOfName('含税价'),i+1] :=formatfloat('0.000',cdsDetail1.FieldByName('tax_PRICE').Value/cdsDetail1.FieldByName('CONVERSION_FACTOR').Value);
          i:=i+1;
          frmPOruku_Mod33.StringGrid1.RowCount:=frmPOruku_Mod33.StringGrid1.RowCount+1;
          cdsDetail1.Next;
        end;
      end;
      frmPOruku_Mod33.StringGrid1.RowCount:=frmPOruku_Mod33.StringGrid1.RowCount-1;
    end;
    if (cdsMain.FieldByName('PO_TYPE').Value='M') then //直接入库
    begin
      frmPOruku_Mod33.if22or235:=235;
      frmPOruku_Mod33.init2;
      frmPOruku_Mod33.StringGrid1.Visible:=False;
      frmPOruku_Mod33.StringGrid2.Visible:=True;
      frmPOruku_Mod33.Button2.Visible:=False;
      if not cdsDetail2.IsEmpty then
      begin
        cdsDetail2.First;
        while not cdsDetail2.Eof do
        begin
          for j := 0 to frmPOruku_Mod33.str_list2.Count -1 do
          begin
            if (cdsDetail2.FieldByName(frmPOruku_Mod33.str_list2.Values[frmPOruku_Mod33.StringGrid2.Cells[j,0]]).IsNull = False) then
              frmPOruku_Mod33.StringGrid2.Cells[j,i+1] := cdsDetail2.FieldByName(frmPOruku_Mod33.str_list2.Values[frmPOruku_Mod33.StringGrid2.Cells[j,0]]).Value;
          end;
          frmPOruku_Mod33.StringGrid2.Cells[frmPOruku_Mod33.str_list2.IndexOfName('已接收'),i+1] := cdsDetail2.FieldByName('QUANTITY_RECEIVED').Value-cdsDetail2.FieldByName('QUAN_RECD').Value;
          i:=i+1;
          frmPOruku_Mod33.StringGrid2.RowCount:=frmPOruku_Mod33.StringGrid2.RowCount+1;
          cdsDetail2.Next;
        end;
      end;
      frmPOruku_Mod33.StringGrid2.RowCount:=frmPOruku_Mod33.StringGrid2.RowCount-1;
    end;
    frmPOruku_Mod33.Show;
  end else
  if (cdsMain.FieldByName('TTYPE').AsInteger=3) then //直接入库
  begin
    if frmzhiruku_Mod33 = nil then
    begin
      frmzhiruku_Mod33 := Tfrmzhiruku_Mod33.Create(Self);
      frmzhiruku_Mod33.refresh:= self.getRefreshClick;
      frmzhiruku_Mod33.AddLookup22;
    end;
    frmzhiruku_Mod33.getdata(cdsMain.FieldByName('rkey').AsString);
    frmzhiruku_Mod33.FEditType:=1;
    if cdsMain.FieldByName('PRINTED').AsString='Y' then
      frmzhiruku_Mod33.CheckBox2.Checked:=True
    else
      frmzhiruku_Mod33.CheckBox2.Checked:=False;
    frmzhiruku_Mod33.Panel1.Enabled:=True;
    frmzhiruku_Mod33.btnSave.Enabled:=True;
    frmzhiruku_Mod33.DBGridEh1.ReadOnly:=False;
    frmzhiruku_Mod33.dtpReqDate.Date:=cdsMain.FieldByName('ship_DATE').Value;
    frmzhiruku_Mod33.redt1.ReadOnly:=True;
    frmzhiruku_Mod33.Show;
  end else
  if (cdsMain.FieldByName('TTYPE').AsInteger=6) then //杂项直入
  begin
    if frmZazhiruku_Mod33 = nil then
    begin
      frmZazhiruku_Mod33 := TfrmZazhiruku_Mod33.Create(Self);
      frmZazhiruku_Mod33.refresh:= self.getRefreshClick;
      frmZazhiruku_Mod33.AddLookup235;
    end;
    frmZazhiruku_Mod33.getdata(cdsMain.FieldByName('rkey').AsString);
    frmZazhiruku_Mod33.FEditType:=1;
    if cdsMain.FieldByName('PRINTED').AsString='Y' then
      frmZazhiruku_Mod33.CheckBox2.Checked:=True
    else
      frmZazhiruku_Mod33.CheckBox2.Checked:=False;
    frmZazhiruku_Mod33.dtpReqDate.Date:=cdsMain.FieldByName('ship_DATE').Value;
    frmZazhiruku_Mod33.redt1.ReadOnly:=True;
    frmZazhiruku_Mod33.Panel1.Enabled:=True;
    frmZazhiruku_Mod33.btnSave.Enabled:=True;
    frmZazhiruku_Mod33.DBGridEh1.ReadOnly:=False;
    frmZazhiruku_Mod33.Show;
  end else
  if (cdsMain.FieldByName('TTYPE').AsInteger=5) then  //MVI入库
  begin
    if frmVMIrucang_mod33 = nil then
    begin
      frmVMIrucang_mod33 := TfrmVMIrucang_mod33.Create(Self);
      frmVMIrucang_mod33.refresh:= self.getRefreshClick;
    end;
    frmVMIrucang_mod33.getdata(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('rkey724').AsString);
    frmVMIrucang_mod33.BitBtn3.Enabled:=False;
    frmVMIrucang_mod33.btnSave.Enabled:=True;
    frmVMIrucang_mod33.StringGrid1.Enabled:=True;
    frmVMIrucang_mod33.Panel1.Enabled:=True;
    frmVMIrucang_mod33.FEditType:=1;
    frmVMIrucang_mod33.init;
    if cdsMain.FieldByName('PRINTED').AsString='Y' then
      frmVMIrucang_mod33.CheckBox2.Checked:=True
    else
      frmVMIrucang_mod33.CheckBox2.Checked:=False;
    frmVMIrucang_mod33.dtpReqDate.Date:=cdsMain.FieldByName('ship_DATE').Value; //
    frmVMIrucang_mod33.edit9.ReadOnly:=True;
    frmVMIrucang_mod33.Edit2.Text:=cdsMain.FieldByName('GRN_NUMBER').AsString; //
    frmVMIrucang_mod33.Edit3.Text:=cdsMain.FieldByName('gon_number').AsString; //
    frmVMIrucang_mod33.Edit5.Text:=cdsMain.FieldByName('DELIVER_NUMBER').AsString; //
    frmVMIrucang_mod33.Edit6.Text:=cdsMain.FieldByName('ship_BY').AsString; //
    frmVMIrucang_mod33.Edit7.Text:=cdsMain.FieldByName('PO_NUMBER').AsString; //采购单号
    frmVMIrucang_mod33.Edit8.Text:=cdsMain.FieldByName('CURR_CODE').AsString; //
    frmVMIrucang_mod33.Edit9.Text:=cdsMain.FieldByName('exch_rate').AsString; //
    frmVMIrucang_mod33.Edit10.Text:=cdsMain.FieldByName('CODE').AsString; //
    frmVMIrucang_mod33.Edit11.Text:=cdsMain.FieldByName('WAREHOUSE_CODE').AsString; //
    frmVMIrucang_mod33.Edit12.Text:=cdsMain.FieldByName('REF_NUMBER').AsString; //
    frmVMIrucang_mod33.Label13.Caption:=cdsMain.FieldByName('SUPPLIER_NAME').AsString; //
    frmVMIrucang_mod33.Label14.Caption:=cdsMain.FieldByName('WAREHOUSE_NAME').AsString; //
    frmVMIrucang_mod33.Label15.Caption:=cdsMain.FieldByName('CURR_NAME').AsString; //

    if not cdsDetail1.IsEmpty then
    begin
      cdsDetail1.First;
      while not cdsDetail1.Eof do
      begin
        for j := 0 to frmVMIrucang_mod33.str_list.Count -1 do
        begin
          if (cdsDetail1.FieldByName(frmVMIrucang_mod33.str_list.Values[frmVMIrucang_mod33.StringGrid1.Cells[j,0]]).IsNull = False) then
            frmVMIrucang_mod33.StringGrid1.Cells[j,i+1] := cdsDetail1.FieldByName(frmVMIrucang_mod33.str_list.Values[frmVMIrucang_mod33.StringGrid1.Cells[j,0]]).Value;
        end;
        i:=i+1;
        frmVMIrucang_mod33.StringGrid1.RowCount:=frmVMIrucang_mod33.StringGrid1.RowCount+1;
        cdsDetail1.Next;
      end;
    end;
    frmVMIrucang_mod33.StringGrid1.RowCount:=frmVMIrucang_mod33.StringGrid1.RowCount-1;
    frmVMIrucang_mod33.Show;
  end;
end;

procedure TfrmMain_Mod33.N5Click(Sender: TObject);
var
  i,j:Integer;
begin
  inherited;
  if not gFunc.CheckUserAuth(3,33) then Exit;
  if ((cdsMain.FieldByName('TTYPE').AsInteger<>3) and (cdsMain.FieldByName('TTYPE').AsInteger<>5) and (cdsMain.FieldByName('TTYPE').AsInteger<>6)) then
  begin
    if frmPOruku_Mod33 = nil then
    begin
      frmPOruku_Mod33 := TfrmPOruku_Mod33.Create(Self);
    end;
    frmPOruku_Mod33.WindowState:= wsMaximized;
    frmPOruku_Mod33.FEditType:=3;
    frmPOruku_Mod33.GetData(cdsMain.FieldByName('rkey').AsString);
    frmPOruku_Mod33.EnableEdit;
    frmPOruku_Mod33.get_location;
    frmPOruku_Mod33.dtpReqDate.DateTime:=cdsMain.FieldByName('ship_DATE').Value;
    if frmPOruku_Mod33.FEditType=3 then
    begin
      frmPOruku_Mod33.Panel1.Enabled:=False;
      frmPOruku_Mod33.EnableButton(false);
    end;
    i:=0;
    if (cdsMain.FieldByName('PO_TYPE').Value='S') then
    begin
      frmPOruku_Mod33.if22or235:=22;
      frmPOruku_Mod33.init;
      frmPOruku_Mod33.StringGrid1.Visible:=True;
      frmPOruku_Mod33.StringGrid2.Visible:=False;
      if not cdsDetail1.IsEmpty then
      begin
        cdsDetail1.First;
        while not cdsDetail1.Eof do
        begin
          for j := 0 to frmPOruku_Mod33.str_list.Count -1 do
          begin
            if (cdsDetail1.FieldByName(frmPOruku_Mod33.str_list.Values[frmPOruku_Mod33.StringGrid1.Cells[j,0]]).IsNull = False) then
              frmPOruku_Mod33.StringGrid1.Cells[j,i+1] := cdsDetail1.FieldByName(frmPOruku_Mod33.str_list.Values[frmPOruku_Mod33.StringGrid1.Cells[j,0]]).Value;
          end;
          frmPOruku_Mod33.StringGrid1.Cells[frmPOruku_Mod33.str_list.IndexOfName('已接收'),i+1] := cdsDetail1.FieldByName('QUAN_RECD').Value;
          frmPOruku_Mod33.StringGrid1.Cells[frmPOruku_Mod33.str_list.IndexOfName('含税价'),i+1] :=formatfloat('0.000',cdsDetail1.FieldByName('tax_PRICE').Value/cdsDetail1.FieldByName('CONVERSION_FACTOR').Value);
          i:=i+1;
          frmPOruku_Mod33.StringGrid1.RowCount:=frmPOruku_Mod33.StringGrid1.RowCount+1;
          cdsDetail1.Next;
        end;
      end;
      frmPOruku_Mod33.StringGrid1.RowCount:=frmPOruku_Mod33.StringGrid1.RowCount-1;
    end;
    if (cdsMain.FieldByName('PO_TYPE').Value='M') then
    begin
      frmPOruku_Mod33.if22or235:=235;
      frmPOruku_Mod33.init2;
      frmPOruku_Mod33.StringGrid1.Visible:=False;
      frmPOruku_Mod33.StringGrid2.Visible:=True;
      if not cdsDetail2.IsEmpty then
      begin
        cdsDetail2.First;
        while not cdsDetail2.Eof do
        begin
          for j := 0 to frmPOruku_Mod33.str_list2.Count -1 do
          begin
            if (cdsDetail2.FieldByName(frmPOruku_Mod33.str_list2.Values[frmPOruku_Mod33.StringGrid2.Cells[j,0]]).IsNull = False) then
              frmPOruku_Mod33.StringGrid2.Cells[j,i+1] := cdsDetail2.FieldByName(frmPOruku_Mod33.str_list2.Values[frmPOruku_Mod33.StringGrid2.Cells[j,0]]).Value;
          end;
          frmPOruku_Mod33.StringGrid2.Cells[frmPOruku_Mod33.str_list2.IndexOfName('已接收'),i+1] := cdsDetail2.FieldByName('QUANTITY_RECEIVED').Value-cdsDetail2.FieldByName('QUAN_RECD').Value;
          i:=i+1;
          frmPOruku_Mod33.StringGrid2.RowCount:=frmPOruku_Mod33.StringGrid2.RowCount+1;
          cdsDetail2.Next;
        end;
      end;
      frmPOruku_Mod33.StringGrid2.RowCount:=frmPOruku_Mod33.StringGrid2.RowCount-1;
    end;
    frmPOruku_Mod33.Show;
  end else
  if (cdsMain.FieldByName('TTYPE').AsInteger=3) then //直接入库
  begin
    if frmzhiruku_Mod33 = nil then
    begin
      frmzhiruku_Mod33 := Tfrmzhiruku_Mod33.Create(Self);
      frmzhiruku_Mod33.AddLookup22;
    end;
    frmzhiruku_Mod33.getdata(cdsMain.FieldByName('rkey').AsString);
    frmzhiruku_Mod33.FEditType:=3;
    if cdsMain.FieldByName('PRINTED').AsString='Y' then
      frmzhiruku_Mod33.CheckBox2.Checked:=True
    else
      frmzhiruku_Mod33.CheckBox2.Checked:=False;
    frmzhiruku_Mod33.dtpReqDate.Date:=cdsMain.FieldByName('ship_DATE').Value;
    frmzhiruku_Mod33.redt1.ReadOnly:=True;
    if (frmzhiruku_Mod33.FEditType=3) then
    begin
      frmzhiruku_Mod33.Panel1.Enabled:=False;
      frmzhiruku_Mod33.btnSave.Enabled:=False;
      frmzhiruku_Mod33.DBGridEh1.ReadOnly:=True;
    end;
    frmzhiruku_Mod33.Show;
  end else
  if (cdsMain.FieldByName('TTYPE').AsInteger=6) then //杂项直入
  begin
    if frmZazhiruku_Mod33 = nil then
    begin
      frmZazhiruku_Mod33 := TfrmZazhiruku_Mod33.Create(Self);
      frmZazhiruku_Mod33.AddLookup235;
    end;
    frmZazhiruku_Mod33.getdata(cdsMain.FieldByName('rkey').AsString);
    frmZazhiruku_Mod33.FEditType:=3;
    if cdsMain.FieldByName('PRINTED').AsString='Y' then
      frmZazhiruku_Mod33.CheckBox2.Checked:=True
    else
      frmZazhiruku_Mod33.CheckBox2.Checked:=False;
    frmZazhiruku_Mod33.dtpReqDate.Date:=cdsMain.FieldByName('ship_DATE').Value;
    frmZazhiruku_Mod33.redt1.ReadOnly:=True;
    if (frmZazhiruku_Mod33.FEditType=3) then
    begin
      frmZazhiruku_Mod33.Panel1.Enabled:=False;
      frmZazhiruku_Mod33.btnSave.Enabled:=False;
      frmZazhiruku_Mod33.DBGridEh1.ReadOnly:=True;
    end;
    frmZazhiruku_Mod33.Show;
  end else
  if (cdsMain.FieldByName('TTYPE').AsInteger=5) then  //MVI入库
  begin
    if frmVMIrucang_mod33 = nil then
    begin
      frmVMIrucang_mod33 := TfrmVMIrucang_mod33.Create(Self);
      frmVMIrucang_mod33.refresh:= self.getRefreshClick;
    end;
    frmVMIrucang_mod33.getdata(cdsMain.FieldByName('rkey').AsString,cdsMain.FieldByName('rkey724').AsString);
    frmVMIrucang_mod33.BitBtn3.Enabled:=False;
    frmVMIrucang_mod33.FEditType:=3;
    frmVMIrucang_mod33.init;
    if cdsMain.FieldByName('PRINTED').AsString='Y' then
      frmVMIrucang_mod33.CheckBox2.Checked:=True
    else
      frmVMIrucang_mod33.CheckBox2.Checked:=False;
    frmVMIrucang_mod33.btnSave.Enabled:=False;
    frmVMIrucang_mod33.StringGrid1.Enabled:=False;
    frmVMIrucang_mod33.Panel1.Enabled:=False;
//    for i:=0 to frmVMIrucang_mod33.Panel1.ControlCount-1 do              //遍历控件设置成只读
//      if frmVMIrucang_mod33.Panel1.Controls[i] is TEdit then
//        (frmVMIrucang_mod33.Panel1.Controls[i] as TEdit).Enabled:= False;
    frmVMIrucang_mod33.dtpReqDate.Date:=cdsMain.FieldByName('ship_DATE').Value; //
    frmVMIrucang_mod33.edit9.ReadOnly:=True;
    frmVMIrucang_mod33.Edit2.Text:=cdsMain.FieldByName('GRN_NUMBER').AsString; //
    frmVMIrucang_mod33.Edit3.Text:=cdsMain.FieldByName('gon_number').AsString; //
    frmVMIrucang_mod33.Edit5.Text:=cdsMain.FieldByName('DELIVER_NUMBER').AsString; //
    frmVMIrucang_mod33.Edit6.Text:=cdsMain.FieldByName('ship_BY').AsString; //
    frmVMIrucang_mod33.Edit7.Text:=cdsMain.FieldByName('PO_NUMBER').AsString; //采购单号
    frmVMIrucang_mod33.Edit8.Text:=cdsMain.FieldByName('CURR_CODE').AsString; //
    frmVMIrucang_mod33.Edit9.Text:=cdsMain.FieldByName('exch_rate').AsString; //
    frmVMIrucang_mod33.Edit10.Text:=cdsMain.FieldByName('CODE').AsString; //
    frmVMIrucang_mod33.Edit11.Text:=cdsMain.FieldByName('WAREHOUSE_CODE').AsString; //
    frmVMIrucang_mod33.Edit12.Text:=cdsMain.FieldByName('REF_NUMBER').AsString; //
    frmVMIrucang_mod33.Label13.Caption:=cdsMain.FieldByName('SUPPLIER_NAME').AsString; //
    frmVMIrucang_mod33.Label14.Caption:=cdsMain.FieldByName('WAREHOUSE_NAME').AsString; //
    frmVMIrucang_mod33.Label15.Caption:=cdsMain.FieldByName('CURR_NAME').AsString; //
    i:=0;
    if not cdsDetail1.IsEmpty then
    begin
      cdsDetail1.First;
      while not cdsDetail1.Eof do
      begin
        for j := 0 to frmVMIrucang_mod33.str_list.Count -1 do
        begin
          if (cdsDetail1.FieldByName(frmVMIrucang_mod33.str_list.Values[frmVMIrucang_mod33.StringGrid1.Cells[j,0]]).IsNull = False) then
            frmVMIrucang_mod33.StringGrid1.Cells[j,i+1] := cdsDetail1.FieldByName(frmVMIrucang_mod33.str_list.Values[frmVMIrucang_mod33.StringGrid1.Cells[j,0]]).Value;
        end;
        i:=i+1;
        frmVMIrucang_mod33.StringGrid1.RowCount:=frmVMIrucang_mod33.StringGrid1.RowCount+1;
        cdsDetail1.Next;
      end;
    end;
    frmVMIrucang_mod33.StringGrid1.RowCount:=frmVMIrucang_mod33.StringGrid1.RowCount-1;
    frmVMIrucang_mod33.Show;
  end;
end;

procedure TfrmMain_Mod33.N6Click(Sender: TObject);
var
  LSq456: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(4,33) then Exit;

  if (cdsMain.FieldByName('ttype').Value = 1) or (cdsMain.FieldByName('ttype').Value = 5) then
  begin
    cdsDetail1.DisableControls;
    try
      cdsDetail1.First;
      while not cdsDetail1.Eof do
      begin
        if not (cdsDetail1.FieldByName('status391').IsNull or cdsDetail1.FieldByName('status391').Value = 2) then
        begin
          ShowMessage('有材料没有通过IQC审核，请审核后再试！！');
          exit;
        end;
        cdsDetail1.Next;
      end;
    finally
      cdsDetail1.EnableControls;
    end;
  end;

  LSq456 := 'select * from data0456 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(LSq456,cds456);
  if not cds456.IsEmpty then
  begin
    if (cds456.FieldByName('status').Value<>1) then
    begin
      ShowMessage('待审核只针对未提交状态');
      Exit;
    end;
    cds456.Edit;
    cds456.FieldByName('status').Value:=2;//提交审核
    cds456.Post;
  end;
  if (cds456.ChangeCount>0) then
  if gSvrIntf.IntfPostDataByTable('data0456',cds456.delta) then
  begin
    cds456.MergeChangeLog;
    btnRefreshClick(nil);
    cdsMain.Locate('rkey',cdsMain.FieldByName('rkey').AsString,[]);
  end;
end;

procedure TfrmMain_Mod33.N7Click(Sender: TObject);
var
  LSq456: string;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,33) then Exit;
  if messagedlg('你确定要将该申请取消提交，重新提交吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    LSq456 := 'select * from data0456 where rkey = ' + cdsMain.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySql(LSq456,cds456);
    if not cds456.IsEmpty then
    begin
      if (cds456.FieldByName('status').Value<>2) then
      begin
        ShowMessage('未提交只针对待审核状态');
        Exit;
      end;
      cds456.Edit;
      cds456.FieldByName('status').Value:=1;//提交审核
      cds456.Post;
    end;
    if (cds456.ChangeCount>0) then
    if gSvrIntf.IntfPostDataByTable('data0456',cds456.delta) then
    begin
      cds456.MergeChangeLog;
      btnRefreshClick(nil);
    end;
  end;
end;

procedure TfrmMain_Mod33.N9Click(Sender: TObject);
var
  LFrm:TfrmReport_mod33;
  LFrm2:TfrmVariousPrt_mod33;
  LFileName:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(5,33) then Exit;
  if (cdsMain.FieldByName('ttype').AsInteger<>2) and (cdsMain.FieldByName('ttype').AsInteger<>6) then
  begin
    LFrm:=TfrmReport_mod33.Create(Self);
    try
      LFrm.GetData(cdsMain.FieldByName('rkey').AsString);
      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
        '编码入库单报表.fr3';
      LFrm.frxReport1.LoadFromFile(LFileName, true);
      LFrm.frxReport1.ShowReport;
    finally
      LFrm.Free;
    end;
  end else
  begin
    LFrm2:=TfrmVariousPrt_mod33.Create(Self);
    try
      LFrm2.GetData(cdsMain.FieldByName('rkey').AsString);
      LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
        'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
        '杂项入库单报表.fr3';
      LFrm2.frxReport1.LoadFromFile(LFileName, true);
      LFrm2.frxReport1.ShowReport;
    finally
      LFrm2.Free;
    end;
  end;
end;

procedure TfrmMain_Mod33.pmMainPopup(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    N1.Enabled:=True;
    N4.Enabled:=False;
    N5.Enabled:=False;
    N6.Enabled:=False;
    N7.Enabled:=False;
    N9.Enabled:=False;
    N10.Enabled:=False;
    N11.Enabled:=False;
  end else
  begin
    N1.Enabled:=True;
    N4.Enabled:=cdsMain.FieldByName('STATUS').Value=1;
    N5.Enabled:=True;
    N6.Enabled:=cdsMain.FieldByName('STATUS').Value=1;
    N7.Enabled:=cdsMain.FieldByName('STATUS').Value=2;
    N9.Enabled:=cdsMain.FieldByName('PRINTED').Value='N';
    N10.Enabled:=True;
    N11.Enabled:=cdsMain.FieldByName('STATUS').Value=1;
  end;
end;

procedure TfrmMain_Mod33.PO1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,33) then Exit;
  if frmPoSearch_Mod33 = nil then
  begin
    frmPoSearch_Mod33 := TfrmPoSearch_Mod33.Create(pnlMain,FModID);
//    frmPoSearch_Mod33 := TfrmPoSearch_Mod33.Create(Self);
//    frmPoSearch_Mod33.refresh:= self.getRefreshClick;
  end;
  frmPoSearch_Mod33.stock_flag:=stock_flag;
  frmPoSearch_Mod33 := TfrmPoSearch_Mod33.Create(pnlMain,FModID);
  frmPoSearch_Mod33.GetData;
//  frmPoSearch_Mod33.Show;
end;

procedure TfrmMain_Mod33.PopupMenu2Popup(Sender: TObject);
begin
  inherited;
  if (cdsMain.FieldByName('TTYPE').AsInteger<>2) then
    N11.Enabled:=(DBGridEh2.DataSource.DataSet.RecordCount>0)
  else
    N11.Enabled:=(DBGridEh2.DataSource.DataSet.RecordCount>0)
end;

procedure TfrmMain_Mod33.Timer1Timer(Sender: TObject);
var LSql:string;
    Lcds:TClientDataSet;
begin
  inherited;
  Lcds:=TClientDataSet.Create(Self);
  try
    LSql := 'select rkey from data0456 where status=6';
    if not gSvrIntf.IntfGetDataBySql(Lsql,Lcds) then Exit;
    if not Lcds.IsEmpty then
      Label2.Visible:=True
    else
      Label2.Visible:=False;
  finally
    Lcds.Free;
  end;
end;

procedure TfrmMain_Mod33.VMI1Click(Sender: TObject);
var LsName456,LsName724:string;
begin
  inherited;
  if not gFunc.CheckUserAuth(1,33) then Exit;
  if frmVMIrucang_mod33 <> nil then FreeAndNil(frmVMIrucang_mod33);

  frmVMIrucang_mod33 := TfrmVMIrucang_mod33.Create(Self);
  frmVMIrucang_mod33.refresh:= self.getRefreshClick;

  frmVMIrucang_mod33.getdata('0','0');
  frmVMIrucang_mod33.init;
  frmVMIrucang_mod33.FEditType:=0;
  frmVMIrucang_mod33.BitBtn3.Enabled:=True;
  frmVMIrucang_mod33.dtpReqDate.Date:=gFunc.GetSvrDateTime;
  frmVMIrucang_mod33.Edit1.Text:='';
  frmVMIrucang_mod33.LGRName456:=frmVMIrucang_mod33.update04('data0456',LsName456,frmVMIrucang_mod33.cds04_456);
  frmVMIrucang_mod33.Edit2.Text:=LsName456;
  frmVMIrucang_mod33.LGRName724:=frmVMIrucang_mod33.update04('data0724',LsName724,frmVMIrucang_mod33.cds04_724);
  frmVMIrucang_mod33.Edit3.Text:=LsName724;
  frmVMIrucang_mod33.CBLoc.Visible :=false;
  frmVMIrucang_mod33.Show;
end;

end.

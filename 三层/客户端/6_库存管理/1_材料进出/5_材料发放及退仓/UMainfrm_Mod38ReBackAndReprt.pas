unit UMainfrm_Mod38ReBackAndReprt;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB, uBaseSinglePickListFrm,uBaseMainFrm,uCommFunc,
  DBGridEhGrouping, Vcl.ComCtrls,System.DateUtils, frxClass;

type
  TFrmMain_Mod38ReBackAndReprt = class(TfrmBaseMain)
    eh208: TDBGridEh;

    mniReAll: TMenuItem;
    cds207: TClientDataSet;
    ds207: TDataSource;
    cds208: TClientDataSet;
    ds208: TDataSource;
    pm207: TPopupMenu;
    mniRet207: TMenuItem;
    pm208: TPopupMenu;
    mniRet208: TMenuItem;
    btnSendDetail: TBitBtn;
    grp1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    cdstemp: TClientDataSet;
    eh207: TDBGridEh;
    mniPrt: TMenuItem;
    frxrprt1: TfrxReport;
    pm_Rpt: TPopupMenu;
    mni_BM: TMenuItem;
    mni_ORrt: TMenuItem;
    procedure mniReAllClick(Sender: TObject);
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure btnSendDetailClick(Sender: TObject);
    procedure mniRet207Click(Sender: TObject);
    procedure mniRet208Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure dtp2Exit(Sender: TObject);
    procedure dtp1Exit(Sender: TObject);
    procedure dtp2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniPrtClick(Sender: TObject);
    procedure edtFliterChange(Sender: TObject);
    procedure btnDYClick(Sender: TObject);
    procedure mni_BMClick(Sender: TObject);
    procedure mni_ORrtClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

    procedure Getdata(); override;
  public

  end;

var
  FrmMain_Mod38ReBackAndReprt: TFrmMain_Mod38ReBackAndReprt;

implementation
    uses USendDetailFrm_mod38,UReturnFrm_mod38,UMod38Common,uReportFrm_mod38,UReportOtheFrm;
{$R *.dfm}

procedure TFrmMain_Mod38ReBackAndReprt.btnCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmMain_Mod38ReBackAndReprt.btnDYClick(Sender: TObject);
begin
  inherited;
pm_Rpt.Popup(mouse.Cursorpos.X,mouse.Cursorpos.Y);
end;

procedure TFrmMain_Mod38ReBackAndReprt.btnExitClick(Sender: TObject);
begin
//inherited;
 close;
end;

procedure TFrmMain_Mod38ReBackAndReprt.btnRefreshClick(Sender: TObject);
begin
  inherited;
  GetData;
end;

procedure TFrmMain_Mod38ReBackAndReprt.btnSendDetailClick(Sender: TObject);
var
  Lfrm: TfrmSendDetail_mod38;
  Lsql: string;
begin
  inherited;
  Lfrm := TfrmSendDetail_mod38.Create(self);
  try
    Lsql:=' and s.TDATE>='''+formatdatetime('yyyy-MM-dd hh:mm:ss',dtp1.Date)+''' and  s.TDATE<='''+formatdatetime('yyyy-MM-dd hh:mm:ss',self.dtp2.Date)+''' ';
   // showmessage(Lsql);
    Lfrm.InitWithPickID(38,9,Lsql);
     Lfrm.showmodal;
  finally
    Lfrm.free;
  end;

end;

procedure TFrmMain_Mod38ReBackAndReprt.cdsMainAfterScroll(DataSet: TDataSet);
var
Lsql:string;
begin
  inherited;

  if cdsMain.IsEmpty then exit;
  if cdsMain.FieldByName('rkey').AsString='' then exit;
  

  if cdsMain.FieldByName('出仓类型').AsString<>'杂项物品' then
  begin
     eh208.Visible:=true;
     eh207.Visible:=true;
     eh208.Visible:=false;
    Lsql:=
  'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '+
  ' dbo.Data0017.INV_DESCRIPTION, dbo.Data0207.QUANTITY,   '+
  ' dbo.Data0207.RTN_QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data0022.rohs,  '+
  ' dbo.Data0022.SUPPLIER2, dbo.Data0207.D0022_PTR,    '+
  ' dbo.Data0207.STANDARD_COST, dbo.Data0022.QUAN_ON_HAND,   '+
  ' dbo.Data0207.INVENTORY_PTR, dbo.Data0207.RKEY,    '+
  ' dbo.Data0017.QUAN_ON_HAND AS hand17, dbo.Data0207.TTYPE,  '+
  ' dbo.Data0468.QUAN_ISSUED, data0468.STATUS,Data0207.D0468_PTR  '+
  ' FROM dbo.Data0207 INNER JOIN              '+
  ' dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+
  ' dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY INNER JOIN '+
  ' dbo.Data0002 ON  '+
  ' dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY LEFT OUTER JOIN '+
  ' dbo.Data0468 ON dbo.Data0207.D0468_PTR = dbo.Data0468.RKEY '+
  ' where gon_ptr='+cdsMain.FieldByName('rkey').AsString+'';
  gSvrIntf.IntfGetDataBySql(Lsql,cds207);
  eh207.DataSource:=nil;
  eh207.DataSource:=ds207;
  //showmessage(Lsql);
  end
  else
   begin
     eh208.Visible:=true;
     eh207.Visible:=true;
    eh207.Visible:=false;
    Lsql:=
   ' SELECT data0208.rkey, dbo.Data0235.goods_name, dbo.Data0235.goods_guige, '+
'  dbo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0235.rohs,'+
'  dbo.Data0235.REF_NUMBER, dbo.DATA0208.QUANTITY,'+
'  dbo.DATA0208.RTN_QUANTITY, dbo.DATA0208.SOURCE_PTR,'+
'  data0235.QUAN_ON_HAND, data0208.DEPT_PTR, data0208.GON_PTR'+
'  FROM dbo.DATA0208 INNER JOIN'+
'  dbo.Data0235 ON dbo.DATA0208.SOURCE_PTR = dbo.Data0235.RKEY INNER JOIN'+
'  dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'+
'   where data0208.gon_ptr='+cdsMain.FieldByName('rkey').AsString+'';

    gSvrIntf.IntfGetDataBySql(Lsql,cds208);
    eh208.DataSource:=nil;
    eh208.DataSource:=ds208;
  end

end;

procedure TFrmMain_Mod38ReBackAndReprt.dtp1Change(Sender: TObject);
begin
  inherited;
 Getdata();
end;

procedure TFrmMain_Mod38ReBackAndReprt.dtp1Exit(Sender: TObject);
begin
  inherited;
dtp1Change(sender);
end;

procedure TFrmMain_Mod38ReBackAndReprt.dtp2Change(Sender: TObject);
begin
  inherited;
dtp1Change(sender);
end;

procedure TFrmMain_Mod38ReBackAndReprt.dtp2Exit(Sender: TObject);
begin
  inherited;
dtp1Change(sender);
end;

procedure TFrmMain_Mod38ReBackAndReprt.edtFliterChange(Sender: TObject);
var
  fDate: Tdatetime;
begin

  inherited;
end;

procedure TFrmMain_Mod38ReBackAndReprt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
  Action := caFree;
  FrmMain_Mod38ReBackAndReprt := nil;
end;

procedure TFrmMain_Mod38ReBackAndReprt.FormCreate(Sender: TObject);
begin
  inherited;
       dtp2.Date:=gFunc.GetSvrDateTime+1;
       dtp1.Date:=dtp2.Date-dayof(dtp2.Date)+1;
     // Fwhere2:= ' and Data0457.CREATE_DATE>='''+formatdatetime('yyyy-MM-dd hh:mm:ss',self.dtp1.Date)+'''  and Data0457.CREATE_DATE<='''+formatdatetime('yyyy-MM-dd hh:mm:ss',self.dtp2.Date)+''' ' ;

end;

procedure TFrmMain_Mod38ReBackAndReprt.Getdata;
var
Lsql:string;
begin

 FMainFrmSql:=
' SELECT dbo.Data0457.RKEY, dbo.Data0457.GON_NUMBER, dbo.Data0457.REF_NUMBER, dbo.Data0457.CREATE_DATE,dbo.data0457.idkey,    '+
' dbo.Data0015.ABBR_NAME, data0457.TTYPE, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'+
' dbo.Data0005.EMPLOYEE_NAME,  Data0005_1.EMPLOYEE_NAME as 发料人员,'+
' case data0457.ttype when 1 then ''按配料单''  when 2 then ''按部门'' when 3 then ''按领料单''  when 4 then ''物料退仓'''+
' when 5 then ''杂项物品''  when 6 then ''杂项退仓''  end as 出仓类型,  case data0457.status when 0 then ''未审计'''+
' when 1 then ''已审计''  end as 状态,Data0457.dept_ptr'+
' FROM dbo.Data0457'+
' INNER JOIN  dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKEY'+
' INNER JOIN  dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.RKEY'+
' INNER JOIN  dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.RKEY'+
' INNER JOIN  dbo.Data0005 Data0005_1 ON dbo.Data0457.CREATE_BY = Data0005_1.RKEY  where 1=1 '+
'and not exists (select b.RKEY from  Data0207  b where  data0457.RKEY=b.GON_PTR and b.D0022_PTR is null)';

  Fwhere2:=' and Data0457.CREATE_DATE>='''+formatdatetime('yyyy-MM-dd hh:mm:ss',self.dtp1.Date)+''' and  Data0457.CREATE_DATE<='''+formatdatetime('yyyy-MM-dd hh:mm:ss',self.dtp2.Date)+''' ' ;

    inherited;
  cdsMain.First;

 if cdsMain.FieldByName('rkey').asstring='' then
 begin
   if cdsMain.FieldByName('出仓类型').AsString<>'杂项物品' then
    begin
      eh207.Visible:=true ;
      eh208.Visible:=true;
      eh208.Visible:=false;
      Lsql:=
    'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '+
    ' dbo.Data0017.INV_DESCRIPTION, dbo.Data0207.QUANTITY,   '+
    ' dbo.Data0207.RTN_QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data0022.rohs,  '+
    ' dbo.Data0022.SUPPLIER2, dbo.Data0207.D0022_PTR,    '+
    ' dbo.Data0207.STANDARD_COST, dbo.Data0022.QUAN_ON_HAND,   '+
    ' dbo.Data0207.INVENTORY_PTR, dbo.Data0207.RKEY,   '+
    ' dbo.Data0017.QUAN_ON_HAND AS hand17, dbo.Data0207.TTYPE,  '+
    ' dbo.Data0468.QUAN_ISSUED, data0468.STATUS,Data0207.D0468_PTR  '+
    ' FROM dbo.Data0207 INNER JOIN              '+
    ' dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+
    ' dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY INNER JOIN '+
    ' dbo.Data0002 ON  '+
    ' dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY LEFT OUTER JOIN '+
    ' dbo.Data0468 ON dbo.Data0207.D0468_PTR = dbo.Data0468.RKEY '+
    ' where gon_ptr=-1 ';
    gSvrIntf.IntfGetDataBySql(Lsql,cds207);
    //showmessage(Lsql);
     cds207.first;
    end
    else
     begin
      eh207.Visible:=true ;
      eh208.Visible:=true;
      eh207.visible:=false;

      Lsql:=
     ' SELECT data0208.rkey, dbo.Data0235.goods_name, dbo.Data0235.goods_guige, '+
  '  dbo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0235.rohs,'+
  '  dbo.Data0235.REF_NUMBER, dbo.DATA0208.QUANTITY,'+
  '  dbo.DATA0208.RTN_QUANTITY, dbo.DATA0208.SOURCE_PTR,  '+
  '  data0235.QUAN_ON_HAND, data0208.DEPT_PTR, data0208.GON_PTR'+
  '  FROM dbo.DATA0208 INNER JOIN'+
  '  dbo.Data0235 ON dbo.DATA0208.SOURCE_PTR = dbo.Data0235.RKEY INNER JOIN'+
  '  dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'+
  '   where data0208.gon_ptr=-1  ';

      gSvrIntf.IntfGetDataBySql(Lsql,cds208);
      cds208.first;
    end
 end;

end;

procedure TFrmMain_Mod38ReBackAndReprt.mniPrtClick(Sender: TObject);
var
 LfrmReport1: TfrmReport_mod38;
 LfrmReport2: TfrmReportOther_mod38;
 LFileName:string;
begin
  inherited;



     if (cdsMain.FieldByName('ttype').Value=5) or (cdsMain.FieldByName('ttype').Value=6) then
     begin
        LfrmReport2 := TfrmReportOther_mod38.Create(Self);
        LfrmReport2.GetData(cdsMain.FieldByName('rkey').asstring);
       LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
            'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
            '杂物材料出库单.fr3';
     end
     else
     begin
       LfrmReport1 := TfrmReport_mod38.Create(Self);
       LfrmReport1.GetData(cdsMain.FieldByName('rkey').asstring);
       LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
            'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
            '材料出库单.fr3';
     end;

  try
     frxrprt1.LoadFromFile(LFileName, true);
     frxrprt1.ShowReport;
  finally
    LfrmReport1.free;
    LfrmReport2.free;
  end;

end;

procedure TFrmMain_Mod38ReBackAndReprt.mniReAllClick(Sender: TObject);
 var
Lsql:string;
 cds208Save: TClientDataSet;
 cds208Save2: TClientDataSet;
  cds207Save: TClientDataSet;
 cds207Save2: TClientDataSet;
 cds95 :TClientDataSet;
 cds17 :TClientDataSet;
 cds22: TClientDataSet;
 cds468: TClientDataSet;
 cds268: TClientDataSet;
 cds235: TClientDataSet;
 LDSArr: OleVariant;
// LRkeyStr17:string;
 LRkeystr235:string;
 LRkeystr22:string;
   rtn_qty: Double;
 LBK: Tbookmark;
 LS:string;
begin
  inherited;

     if ffunc.IsStockCheck(LS) then
      begin
        messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:' +LS, mtinformation,
          [mbcancel], 0);
        exit;
      end;


   //权限留白
 if eh207.Visible=true  then
 begin
  cds207.disablecontrols;
  cds207.first;
  while not cds207.eof do
  begin
  if (cds207.FieldByName('QUANTITY').value=cds207.FieldByName('rtn_QUANTITY').value) then
  begin
   begin
   showmessage('有物料已退仓完,不能重复退，或者你可以做单项独退仓');
   exit;
   end;
  end;
  cds207.Next;
  end;
  cds207.EnableConstraints;
 end;

 if eh208.Visible=true  then
 begin
  cds208.disablecontrols;
  cds208.first;
  while not cds208.eof do
  begin
  if (cds208.FieldByName('QUANTITY').value=cds208.FieldByName('rtn_QUANTITY').value) then
  begin
   begin
   showmessage('有物料已退仓完,不能重复退，或者你可以做单项独退仓');
   exit;
   end;
  end;
  cds208.Next;
  end;
  cds208.EnableConstraints;
 end;

   cds208Save :=TClientDataSet.Create(nil);
  cds208Save2 :=TClientDataSet.Create(nil);
  cds95 :=TClientDataSet.Create(nil);
  cds207Save :=TClientDataSet.Create(nil);
  cds207Save2 :=TClientDataSet.Create(nil);
  cds17 :=TClientDataSet.Create(nil);
  cds22:=TClientDataSet.Create(nil);
  cds468:=TClientDataSet.Create(nil);
  cds268:=TClientDataSet.Create(nil);
  cds235:=TClientDataSet.Create(nil);

  try
   //if messagedlg('全部退回货仓您确定?',mtconfirmation,[mbyes,mbno],0)=mrno then exit;
   try

   LBK:=cdsMain.Bookmark;

     gSvrIntf.IntfGetDataBySql
     ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);

      //----------------杂项料物
      if (cdsMain.FieldByName('TType').Value=5) or (cdsMain.FieldByName('TType').Value=6) then
      begin
         gSvrIntf.IntfGetDataBySql('select * from data0208 where 1=0',cds208Save);
        if not   gSvrIntf.IntfGetDataBySql('select * from data0208 where gon_ptr='+cdsMain.FieldByName('rkey').asstring,cds208Save2) then
        begin
        showmessage('cds208save2错误!');
        exit;
        end;
            LRkeyStr235:= FFunc.GetRkeyStr(cds208,'SOURCE_PTR');
          gSvrIntf.IntfGetDataBySql('select * from data0235 where rkey in '+LRkeyStr235,cds235);
         cds208.DisableControls;
         cds208.First;
        while not cds208.Eof do
        begin

         if cds208.FieldByName('QUANTITY').value-cds208.FieldByName('RTN_QUANTITY').Value>0 then
         begin
         rtn_qty:= cds208.FieldByName('QUANTITY').value-cds208.FieldByName('RTN_QUANTITY').Value;  //本次退货数量

          if cds208Save2.Locate('rkey',cds208.FieldByName('rkey').asinteger,[]) then
          begin
          cds208Save2.Edit;
          cds208Save2.FieldByName('RTN_QUANTITY').Value:= cds208.FieldByName('QUANTITY').Value;  //208
          cds208Save2.Post;
          end;

          if cds235.Locate('rkey',cds208.FieldByName('SOURCE_PTR').asinteger,[]) then
          begin
           cds235.edit;
           cds235.FieldByName('QUAN_ON_HAND').Value:=cds235.FieldByName('QUAN_ON_HAND').Value+rtn_qty;  //235
           cds235.post;
          end;

          cds208Save.append;
          cds208Save.FieldByName('d457_idkey').Value:=cdsMain.FieldByName('IDKey').Value ;
          cds208Save.FieldByName('SOURCE_PTR').Value:=cds208.FieldByName('SOURCE_PTR').Value ;
          cds208Save.FieldByName('DEPT_PTR').Value:= cds208.FieldByName('DEPT_PTR').Value;
          cds208Save.FieldByName('GON_PTR').Value:=cds208.FieldByName('GON_PTR').Value;
          cds208Save.FieldByName('Tdate').Value:= gFunc.GetSvrDateTime;
          cds208Save.FieldByName('QUANTITY').Value:=-rtn_qty;
          cds208Save.FieldByName('TRANSACTION_PTR').Value:= cds208.FieldByName('rkey').Value;
          cds208Save.FieldByName('RTN_QUANTITY').Value := 0;
          cds208Save.Post;

         end;
          cds208.Next;
        end;


        LDSArr:=VarArrayCreate([0,2],varVariant);
        if cds208Save.ChangeCount>0 then
        LDSArr[0]:=cds208Save.Delta;
        if cds235.ChangeCount>0 then
        LDSArr[1]:=cds235.Delta;
        if cds208Save2.ChangeCount>0 then
        LDSArr[2]:=cds208Save2.Delta;

      if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr,5) then
      begin
        ShowMessage('退料成功!');
        getdata;
        cdsMain.GotoBookmark(Lbk);
      end;
      end
      else   //-生产料物 -------------------------------------------------------------
      begin
           Lsql:=
          ' select INVENTORY_PTR,sum(QUANTITY-RTN_QUANTITY) as total_QUANTITY '+          ' from data0207 '+          ' where data0207.gon_ptr='+cdsMain.fieldbyname('rkey').asstring+' '+    //
          ' and QUANTITY-RTN_QUANTITY>0'+
          ' group by INVENTORY_PTR ' ;        gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);        gSvrIntf.IntfGetDataBySql('select * from data0017 where rkey in '+FFunc.GetRkeyStr(cdstemp,'INVENTORY_PTR'),cds17);
         if not  cdstemp.isempty then
          begin
          cdstemp.first;
          while not cdstemp.eof do
          begin
          if cds17.locate('rkey',cdstemp.fieldbyname('INVENTORY_PTR').asinteger,[]) then
           begin
            cds17.edit;
            cds17.fieldbyname('QUAN_ON_HAND').value:=cds17.fieldbyname('QUAN_ON_HAND').value+cdstemp.fieldbyname('total_QUANTITY').value ;            cds17.post;
           end;
           cdstemp.next;
         end;
         end;

       //更新22
         Lsql:='SELECT data0207.D0022_PTR, SUM(QUANTITY-RTN_QUANTITY) AS qty'+
            ' FROM Data0207'+
             ' WHERE data0207.GON_PTR = '+cdsMain.fieldbyname('rkey').asstring+' '+
            ' and QUANTITY-RTN_QUANTITY>0 '+
            ' GROUP BY data0207.D0022_PTR ';
          gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);
          LRkeyStr22:= FFunc.GetRkeyStr(cdstemp,'D0022_PTR');
          gSvrIntf.IntfGetDataBySql('select * from data0022 where rkey in '+LRkeyStr22,cds22);
         if not  cdstemp.isempty then
          begin
          cdstemp.first;
          while not cdstemp.eof do
          begin
          if cds22.locate('rkey',cdstemp.fieldbyname('D0022_PTR').asinteger,[]) then
           begin
            cds22.edit;
            cds22.fieldbyname('QUAN_ON_HAND').value:=cds22.fieldbyname('QUAN_ON_HAND').value+cdstemp.fieldbyname('qty').value ;
            cds22.post;
           end;
           cdstemp.next;
         end;
         end;

        //更新468
         if (cdsMain.fieldbyname('TType').value=1) or (cdsMain.fieldbyname('TType').value=3) then   //配料单发放
        begin
        Lsql:='SELECT data0207.D0468_PTR, SUM(QUANTITY-RTN_QUANTITY) AS qty'+
            ' FROM dbo.Data0207 '+
            ' WHERE data0207.GON_PTR ='+cdsMain.fieldbyname('rkey').asstring+' '+
            ' and QUANTITY-RTN_QUANTITY>0 '+
            ' GROUP BY data0207.D0468_PTR';

         gSvrIntf.IntfGetDataBySql(Lsql, cdstemp);
         gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey in '+FFunc.GetRkeyStr(cdstemp,'D0468_PTR'),cds468);
         if not  cdstemp.isempty then
          begin
          cdstemp.first;
          while not cdstemp.eof do
          begin
          if cds468.locate('rkey',cdstemp.fieldbyname('D0468_PTR').asinteger,[]) then
           begin
            cds468.edit;
            cds468.fieldbyname('status').value:=0;
            cds468.fieldbyname('quan_issued').value:=cds468.fieldbyname('quan_issued').value-cdstemp.fieldbyname('qty').value ;
            cds468.post;
           end;
           cdstemp.next;
         end;
         end;

          //更新268的状态
        // Lsql:='select * from data0268 where  number='''+cdsMain.FieldByName('REF_NUMBER').asstring+''' ' ;
          gSvrIntf.IntfGetDataBySql('select * from data0268 where status=4 and number='''+cdsMain.FieldByName('REF_NUMBER').asstring+''' ',cds268);

         if not cds268.isempty then
          begin
          cds268.edit;
          cds268.fieldbyname('status').value:=2;
          cds268.Post;
          end;
        end;

         gSvrIntf.IntfGetDataBySql('select * from data0095 where 1=0',cds95);
         gSvrIntf.IntfGetDataBySql('select * from data0207 where 1=0',cds207Save);
          gSvrIntf.IntfGetDataBySql
            ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);

          gSvrIntf.IntfGetDataBySql('select * from data0207 where gon_ptr='+cdsMain.FieldByName('RKEY').asstring,cds207Save2);
         cds207.DisableControls;
         cds207.First;
         while not cds207.eof  do
         begin
         if cds207.fieldbyname('QUANTITY').value-cds207.fieldbyname('RTN_QUANTITY').value>0 then
          begin
          //95append


            cds95.append;
            cds95.FieldByName('TRAN_TP').Value:=16;
            cds95.FieldByName('INVT_PTR').Value := cds207.FieldByName('INVENTORY_PTR').AsInteger;
            cds95.FieldByName('SRCE_PTR').Value := cds207.FieldByName('D0022_PTR').AsInteger;    //22Rkey
            cds95.FieldByName('TRAN_by').Value := gVar.rkey05;
            if not cdstemp.IsEmpty then
            cds95.FieldByName('TRAN_DATE').Value := cdstemp.FieldByName('NDate').Value;
            cds95.FieldByName('QUANTITY').Value :=  cds207.FieldByName('QUANTITY').value-cds207.FieldByName('RTN_QUANTITY').value;
            cds95.Post;

           //207append:

          cds207Save.append;
          cds207Save.FieldByName('d457_idkey').Value:=cdsMain.FieldByName('IDKey').Value ;
          cds207Save.FieldByName('INVENTORY_PTR').Value:=cds207.FieldByName('INVENTORY_PTR').AsInteger;
          cds207Save.FieldByName('GON_PTR').Value := cdsMain.FieldByName('rkey').AsInteger;
          cds207Save.FieldByName('D0022_PTR').Value:=cds207.FieldByName('D0022_PTR').Value;
          cds207Save.FieldByName('QUANTITY').Value := cds207.FieldByName('RTN_QUANTITY').Value-cds207.FieldByName('QUANTITY').Value;
          cds207Save.FieldByName('DEPT_PTR').Value:=cdsMain.FieldByName('dept_ptr').AsInteger;
          if not cdstemp.IsEmpty then
          cds207Save.FieldByName('TDATE').Value := cdstemp.FieldByName('NDate').Value;
          cds207Save.FieldByName('TTYPE').Value := 4;
          cds207Save.FieldByName('STANDARD_COST').Value := cds207.FieldByName('STANDARD_COST').value;
          cds207Save.FieldByName('D0468_PTR').Value := cds207.FieldByName('D0468_PTR').value;
          cds207Save.FieldByName('RTN_QUANTITY').value := 0;
          cds207Save.FieldByName('STANDARD_COST').value := 0;
          cds207Save.FieldByName('Invent_or').value := 0;
          cds207Save.Post;

           //207edit;
           if cds207Save2.locate('rkey',cds207.fieldbyname('rkey').asinteger,[]) then
           begin
           cds207Save2.edit;
           cds207Save2.fieldbyname('RTN_QUANTITY').value:=cds207.FieldByName('QUANTITY').Value;
           cds207Save2.POST;
           end;
          end;
//          else
//           begin
//           showmessage('有物料已全部退仓,不能重复退，或者你可以做单项独退仓');
//           exit;
//           end;
         cds207.Next;
         end;

         //Save
        LDSArr:=VarArrayCreate([0,6],varVariant);
        if cds17.ChangeCount>0 then
        LDSArr[0]:=cds17.Delta;
        if cds22.ChangeCount>0 then
        LDSArr[1]:=cds22.Delta;
        if cds468.ChangeCount>0 then
        LDSArr[2]:=cds468.Delta;
        if cds268.ChangeCount>0 then
        LDSArr[3]:=cds268.Delta;
        if cds95.ChangeCount>0 then
        LDSArr[4]:=cds95.Delta;
        if cds207Save.ChangeCount>0 then
        LDSArr[5]:=cds207Save.Delta;
        if cds207Save2.ChangeCount>0 then
        LDSArr[6]:=cds207Save2.Delta;

      if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr,6) then
      begin
        ShowMessage('退料成功!');
        //cdsMain.last;
        getdata;
        cdsMain.GotoBookmark(Lbk);
      end;

      end;
    except on e:exception do
    begin
    showmessage('错误:'+e.Message);
    exit;
    end;
    end;

  finally
  cds207.enablecontrols;
  cds208.EnableControls;
  cds208Save.free;
  cds208Save2.free;
  cds95.free;
  cds207Save.free;
  cds207Save2.free;
  cds17.free;
  cds22.free;;
  cds468.free;
  cds268.free;
  cds235.free;
  end;

end;

procedure TFrmMain_Mod38ReBackAndReprt.mniRet207Click(Sender: TObject);
var
 Lrkey207:integer;
 Lfrm: TfrmReturn_mod38;
 LBK:TBookmark;
 cds207Save: TClientDataSet;
 cds207Save2: TClientDataSet;
 cds95 :TClientDataSet;
 cds17 :TClientDataSet;
 cds22: TClientDataSet;
 cds268: TClientDataSet;
 cds468: TClientDataSet;
 LDSArr: OleVariant;
 Lsql,LS:string;

 begin
 inherited;
    if ffunc.IsStockCheck(LS) then
      begin
        messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:' +LS, mtinformation,
          [mbcancel], 0);
        exit;
      end;

  if eh207.visible=true  then
 begin
  if (cds207.FieldByName('QUANTITY').value=cds207.FieldByName('rtn_QUANTITY').value) then
    begin
     showmessage('已退仓完,不能重复退！');
     exit;
    end
  else if cds207.FieldByName('QUANTITY').value<0 then
  begin
   showmessage('已退仓完,不能重复退！');
   exit;
  end
 end;


 cds95 :=TClientDataSet.Create(nil);
 cds207Save :=TClientDataSet.Create(nil);
 cds207Save2 :=TClientDataSet.Create(nil);
 cds17 :=TClientDataSet.Create(nil);
 cds22:=TClientDataSet.Create(nil);
 cds268:=TClientDataSet.Create(nil);
 cds468:=TClientDataSet.Create(nil);
  Lfrm:=TfrmReturn_mod38.Create(self);
 try
 if cds207.IsEmpty  then exit;

  Lrkey207:=cds207.FieldByName('rkey').AsInteger;
 if not cds207.Locate('rkey',Lrkey207,[]) then
 begin
 ShowMessage('状态发生变化，退仓失败！');
 exit;
 end;

      LBK:=cdsMain.BookMark;


  Lfrm.edtIssueQty.Text:=cds207.FieldByName('QUANTITY').AsString;
  Lfrm.edtUnit.Text:=cds207.FieldByName('unit_name').AsString;
  Lfrm.edtReturnQty.Text:=formatfloat('0.000',cds207.FieldByName('QUANTITY').value- cds207.FieldByName('rtn_QUANTITY').value);
  Lfrm.edtRReturnQty.Text:=Lfrm.edtReturnQty.Text;

  if Lfrm.ShowModal=mrok then
   begin
   try
     //更新22当前库存
   gSvrIntf.IntfGetDataBySql('select * from data0022 where rkey='+cds207.FieldByName('D0022_PTR').asstring,cds22);
   cds22.Edit;
   cds22.FieldByName('QUAN_ON_HAND').value:=cds207.FieldByName('QUAN_ON_HAND').value+ strtocurr(Lfrm.edtRReturnQty.Text);
   cds22.Post;

   //更新库存17中的退货的数量
   gSvrIntf.IntfGetDataBySql('select * from data0017 where rkey='+cds207.FieldByName('INVENTORY_PTR').asstring,cds17);
   cds17.Edit;
   cds17.FieldByName('QUAN_ON_HAND').value:=cds207.FieldByName('hand17').Value+strtocurr(Lfrm.edtRReturnQty.Text);
   cds17.Post;

   //468
    if (cdsMain.FieldByName('ttype').Value=1) or (cdsMain.FieldByName('ttype').Value=3) then
   begin
    gSvrIntf.IntfGetDataBySql('select * from data0468 where rkey='+cds207.FieldByName('D0468_PTR').asstring,cds468);
    cds468.edit;
    cds468.fieldbyname('QUAN_ISSUED').value:=cds207.FieldByName('QUAN_ISSUED').Value- strtocurr(Lfrm.edtRReturnQty.Text);
    cds468.fieldbyname('status').value:=0;
    cds468.Post;

    //更新268的状态
    Lsql:='select * from data0268 where status=4 and number='''+cdsMain.FieldByName('REF_NUMBER').asstring+''' ';
    gSvrIntf.IntfGetDataBySql('select * from data0268 where status=4 and number='''+cdsMain.FieldByName('REF_NUMBER').asstring+''' ',cds268);
    if not cds268.isempty then
    begin
    cds268.edit;
    cds268.fieldbyname('status').value:=2;
    cds268.Post;
    end;
   end;

    //cds95
     gSvrIntf.IntfGetDataBySql('select cast(getdate() as smalldatetime) as NDate ', cdstemp);
     gSvrIntf.IntfGetDataBySql('select * from data0095 where 1=0',cds95);
    cds95.append;
    cds95.FieldByName('TRAN_TP').Value:=16;
    cds95.FieldByName('INVT_PTR').Value :=
    cds207.FieldByName('INVENTORY_PTR').AsInteger;
    cds95.FieldByName('SRCE_PTR').Value := cds207.FieldByName('D0022_PTR').AsInteger;    //22Rkey
    cds95.FieldByName('TRAN_by').Value := gVar.rkey05;
    if not cdstemp.IsEmpty then
    cds95.FieldByName('Tran_DATE').Value := cdstemp.FieldByName('NDate').Value;
    cds95.FieldByName('QUANTITY').Value := StrToCurr(Trim(Lfrm.edtRReturnQty.Text));
    cds95.Post;

    //207
     gSvrIntf.IntfGetDataBySql('select * from data0207 where 1=0',cds207Save);
    cds207Save.append;
    cds207Save.FieldByName('d457_idkey').Value:=cdsMain.FieldByName('IDKey').Value ;
    cds207Save.FieldByName('INVENTORY_PTR').Value:=cds207.FieldByName('INVENTORY_PTR').AsInteger;
    cds207Save.FieldByName('GON_PTR').Value := cdsMain.FieldByName('rkey').AsInteger;
    cds207Save.FieldByName('D0022_PTR').Value:=cds207.FieldByName('D0022_PTR').Value;
    cds207Save.FieldByName('QUANTITY').Value := -strtocurr(Lfrm.edtRReturnQty.Text);
    cds207Save.FieldByName('DEPT_PTR').Value:=cdsMain.FieldByName('dept_ptr').AsInteger;
    if not cdstemp.IsEmpty then
    cds207Save.FieldByName('TDATE').Value := cdstemp.FieldByName('NDate').Value;
    cds207Save.FieldByName('TTYPE').Value := 4;
    cds207Save.FieldByName('STANDARD_COST').Value := cds207.FieldByName('STANDARD_COST').value;
    cds207Save.FieldByName('D0468_PTR').Value := cds207.FieldByName('D0468_PTR').value;
    cds207Save.FieldByName('RTN_QUANTITY').value := 0;
    cds207Save.FieldByName('STANDARD_COST').value := 0;
    cds207Save.FieldByName('Invent_or').value := 0;
    cds207Save.Post;

//
      //更新207：
    gSvrIntf.IntfGetDataBySql('select * from data0207 where rkey='+cds207.FieldByName('RKEY').asstring,cds207Save2);
    cds207save2.edit;
    cds207save2.fieldbyname('RTN_QUANTITY').value:=cds207.fieldbyname('RTN_QUANTITY').value+strtocurr(Lfrm.edtRReturnQty.Text);
    cds207save2.Post;

    LDSArr:=VarArrayCreate([0,6],varVariant);
    if cds22.ChangeCount>0 then
    LDSArr[0]:=cds22.Delta;
    if cds17.ChangeCount>0 then
    LDSArr[1]:=cds17.Delta;
    if cds468.ChangeCount>0 then
    LDSArr[2]:=cds468.Delta;
    if cds268.ChangeCount>0 then
    LDSArr[3]:=cds268.Delta;
    if cds95.ChangeCount>0 then
    LDSArr[4]:=cds95.Delta;
    if cds207Save.ChangeCount>0 then
    LDSArr[5]:=cds207Save.Delta;
    if cds207Save2.ChangeCount>0 then
    LDSArr[6]:=cds207Save2.Delta;

     if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr,7) then
      begin
//        cds95.MergeChangeLog;
//        cds22.MergeChangeLog;
        ShowMessage('单项退料成功!');
      Getdata;
      cdsMain.gotoBookmark(LBK);
      end;
   except
   on E: Exception do
    begin

     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
   end;

 finally
 Lfrm.free;
 cds95.free;
 cds207Save.free;
 cds207Save2.free;
 cds17.free;
 cds22.free;
 cds268.free;
 cds468.free;

 end;

end;

procedure TFrmMain_Mod38ReBackAndReprt.mniRet208Click(Sender: TObject);
var
 //rkey208:integer;
// v_date:TDateTime;
 LBK:Tbookmark;
 Lfrm: TfrmReturn_mod38;
 cds208Save: TClientDataSet;
 cds208Save2: TClientDataSet;
  cds235: TClientDataSet;
 LDSArr: OleVariant;
 LS:string;
 begin
 inherited;
    if ffunc.IsStockCheck(LS) then
      begin
        messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:' +LS, mtinformation,
          [mbcancel], 0);
        exit;
      end;

 if eh208.Visible=true  then
 begin
  if (cds208.FieldByName('QUANTITY').value=cds208.FieldByName('rtn_QUANTITY').value) then
    begin
     showmessage('已退仓完,不能重复退！');
     exit;
    end
  else if cds208.FieldByName('QUANTITY').value<0 then
  begin
   showmessage('已退仓完,不能重复退！');
   exit;
  end

  end;
  cds208Save :=TClientDataSet.Create(nil);
  cds208Save2 :=TClientDataSet.Create(nil);
  cds235 :=TClientDataSet.Create(nil);
  Lfrm:=TfrmReturn_mod38.Create(self);

 try

 if not cds208.Locate('rkey',cds208.FieldByName('rkey').AsInteger,[]) then
 begin
 ShowMessage('物料有变化，退仓失败!');
 Exit;
 end;

     LBK:=cdsMain.Bookmark;

  Lfrm.edtIssueQty.Text:=cds208.FieldByName('QUANTITY').AsString;
  Lfrm.edtUnit.Text:=cds208.FieldByName('UNIT_NAME').Value;
  Lfrm.edtReturnQty.Text:=formatfloat('0.000',cds208.FieldByName('QUANTITY').Value-
                                                  cds208.FieldByName('RTN_QUANTITY').Value);
  Lfrm.edtRReturnQty.Text:=Lfrm.edtReturnQty.Text;

  if Lfrm.ShowModal=mrok then
   begin
   try
       gSvrIntf.IntfGetDataBySql
    ('select cast(getdate() as smalldatetime) as NDate ', cdstemp);

   gSvrIntf.IntfGetDataBySql('select * from data0208 where 1=0',cds208Save);
   gSvrIntf.IntfGetDataBySql('select * from data0208 where rkey='+cds208.FieldByName('RKEY').asstring,cds208Save2);
   gSvrIntf.IntfGetDataBySql('select * from data0235 where rkey='+cds208.FieldByName('SOURCE_PTR').asstring,cds235);


    cds208Save2.edit;
   cds208Save2.fieldbyname('RTN_QUANTITY').value:=cds208.fieldbyname('RTN_QUANTITY').value+strtocurr(Lfrm.edtRReturnQty.Text);    cds208Save2.Post;

    cds235.edit;
    cds235.fieldbyname('QUAN_ON_HAND').value:=cds235.fieldbyname('QUAN_ON_HAND').value+strtocurr(Lfrm.edtRReturnQty.Text);    cds235.post;

    cds208Save.append;
    cds208Save.FieldByName('d457_idkey').Value:=cdsMain.FieldByName('IDKey').Value ;
    cds208Save.FieldByName('SOURCE_PTR').Value:=cds208.FieldByName('SOURCE_PTR').AsInteger;
    cds208Save.FieldByName('DEPT_PTR').Value := cds208.FieldByName('DEPT_PTR').AsInteger;
    cds208Save.FieldByName('GON_PTR').Value:=cds208.FieldByName('GON_PTR').Value;
    cds208Save.FieldByName('TDate').Value :=cdstemp.FieldByName('NDate').Value;
    cds208Save.FieldByName('QUANTITY').Value:=-strtocurr(Lfrm.edtRReturnQty.Text);
    cds208Save.FieldByName('TRANSACTION_PTR').Value:=cds208.FieldByName('rkey').AsInteger;
     cds208Save.FieldByName('RTN_QUANTITY').Value := 0;
    cds208Save.Post;


    LDSArr:=VarArrayCreate([0,2],varVariant);
    if cds208Save2.ChangeCount>0 then
    LDSArr[0]:=cds208Save2.Delta;
    if cds235.ChangeCount>0 then
    LDSArr[1]:=cds235.Delta;
    if cds208Save.ChangeCount>0 then
    LDSArr[2]:=cds208Save.Delta;


     if gSvrIntf.IntfPostModData('公共基础', 38, LDSArr,8) then
      begin
//        cds95.MergeChangeLog;
//        cds22.MergeChangeLog;
        ShowMessage('单项退料成功!');
       getdata;
        cdsMain.gotoBookmark(LBK);
      end;

   except
   on E: Exception do
    begin

     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
   end;

  finally
    Lfrm.free;
    cds208Save.free;
    cds208Save2.free;
    cds235.free;
  end;


end;

procedure TFrmMain_Mod38ReBackAndReprt.mni_BMClick(Sender: TObject);
var
  LFileName: string;
begin
  inherited;
  if cdsMain.IsEmpty then  exit;

  LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
    'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
    '领料申请单.fr3';
  frxrprt1.Clear;
  frxrprt1.LoadFromFile(LFileName, true);
  frxrprt1.DesignReport();
end;

procedure TFrmMain_Mod38ReBackAndReprt.mni_ORrtClick(Sender: TObject);
var
  LFileName: string;
begin
  inherited;
  if cdsMain.IsEmpty then  exit;

  LFileName := stringReplace(UpperCase(extractfilepath(paramstr(0))),
    'ERP_3_TIER\', 'ERP_3_TIER\REPORTS\库存管理_材料进出\', [rfReplaceAll]) +
    '杂物材料出库单.fr3';
  frxrprt1.Clear;
  frxrprt1.LoadFromFile(LFileName, true);
  frxrprt1.DesignReport();

end;

end.

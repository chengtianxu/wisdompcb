unit editFrm_mod26;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm,uCommFunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient,
  Data.Win.ADODB, Vcl.DBCtrls, Vcl.Menus,IdFTP,QryMtrlFrm_mod26,QryVendorFrm_mod26,QryUnitFrm_mod26,QryCurrFrm_mod26;

type
  TfrmEdit_mod26 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    sg_range: TStringGrid;
    eh_file: TDBGridEh;
    eh_PurPrice: TDBGridEh;
    lbl1: TLabel;
    edt_mtrl: TRKeyRzBtnEdit;
    cds28: TClientDataSet;
    cdstemp: TClientDataSet;
    qrytemp: TADOQuery;
    ds28: TDataSource;
    lbl2: TLabel;
    lbl3: TLabel;
    edt_vendor: TRKeyRzBtnEdit;
    lbl4: TLabel;
    edt_curr: TRKeyRzBtnEdit;
    edt_VMtrl: TRKeyRzBtnEdit;
    lbl5: TLabel;
    edt_VDays: TRKeyRzBtnEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    edt_EDays: TRKeyRzBtnEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    edt_WUnit: TRKeyRzBtnEdit;
    lbl10: TLabel;
    edt_PUinit: TRKeyRzBtnEdit;
    lbl11: TLabel;
    edt_rate: TRKeyRzBtnEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    cbb_Grade: TComboBox;
    cbb_caf: TComboBox;
    lbl14: TLabel;
    edt_Report: TRKeyRzBtnEdit;
    chk_IfRpt: TCheckBox;
    lbl15: TLabel;
    edt_remark: TRKeyRzBtnEdit;
    lbl16: TLabel;
    edt_AVLMan: TRKeyRzBtnEdit;
    lbl17: TLabel;
    edt_ModiDate: TRKeyRzBtnEdit;
    cbb_IfAVL: TComboBox;
    lbl18: TLabel;
    cbb_PMethod: TComboBox;
    lbl19: TLabel;
    lbl20: TLabel;
    edt_MinQM: TRKeyRzBtnEdit;
    lbl21: TLabel;
    edt_SQty: TRKeyRzBtnEdit;
    lbl22: TLabel;
    edt_ATax: TRKeyRzBtnEdit;
    lbl23: TLabel;
    chk_IfTax: TCheckBox;
    lbl24: TLabel;
    lbl25: TLabel;
    edt_SPrice: TRKeyRzBtnEdit;
    lbl26: TLabel;
    edt_ModiMan: TRKeyRzBtnEdit;
    dsPrice: TDataSource;
    cdsPrice: TClientDataSet;
    ds28File: TDataSource;
    cds28File: TClientDataSet;
    strngfldFileName: TStringField;
    cds328: TClientDataSet;
    rg_SMethod: TRadioGroup;
    cds28FileSave: TClientDataSet;
    cdsFTPFileSave: TClientDataSet;
    lbl_WUnit: TLabel;
    pm_file: TPopupMenu;
    mni_upLoad: TMenuItem;
    mni_download: TMenuItem;
    mni_Del: TMenuItem;
    pm_range: TPopupMenu;
    mni_DelR: TMenuItem;
    procedure edt_mtrlButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mni_upLoadClick(Sender: TObject);
    procedure mni_downloadClick(Sender: TObject);
    procedure mni_DelClick(Sender: TObject);
    procedure pm_filePopup(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edt_vendorButtonClick(Sender: TObject);
    procedure edt_MinQMExit(Sender: TObject);
    procedure sg_rangeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_rangeKeyPress(Sender: TObject; var Key: Char);
    procedure sg_rangeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mni_DelRClick(Sender: TObject);
    procedure pm_rangePopup(Sender: TObject);
    procedure sg_rangeExit(Sender: TObject);
    procedure edt_EDaysExit(Sender: TObject);
    procedure cbb_PMethodSelect(Sender: TObject);
    procedure eh_PurPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
     FTPIDKey : string;
     FOld_price:double;
    procedure GetMtrlInfo(Arkey23,Arkey17:string;Afrm:TfrmQryMtrl_mod26);
    procedure GetVendorInfo(Arkey23,Arkey17:string;Afrm:TfrmVendorQry_mod26);
    procedure GetPrice(Arkey23,Arkey17:string);
    procedure Append28;
    function CheckFtpDir(AFtp:TIdFTP;ADir: string): Boolean;
    procedure CreateDir(AFtp: TIdFTP; ADir: string);
  public
    { Public declarations }
    FEditType,FType  :integer;
    Frkey23,Frkey17:string;
    procedure GetData(ARkey:string);
    procedure AppendInfo(AType:integer);
    procedure GetInfo ;
    procedure initCtrlStatus();

  end;

var
  frmEdit_mod26: TfrmEdit_mod26;

implementation

{$R *.dfm}

{ TfrmEdit_mod26 }
procedure TfrmEdit_mod26.CreateDir(AFtp: TIdFTP; ADir: string);
var
  LStrList:TStringList;
  LDir:string;
  i:Integer;
begin
  LDir:='/';
  LStrList:= TStringList.Create;
  try
    LStrList.Delimiter:='/';
    LStrList.DelimitedText:= ADir;
    if AFtp.Connected then
    begin
      for i:=1 to LStrList.Count - 2 do
      begin
        AFtp.ChangeDir(LDir);
        LDir:= LDir + LStrList[i] + '/';
        try
          AFtp.ChangeDir(LDir);
        except
          AFtp.MakeDir(LStrList[i]);
        end;
      end;
    end;
  finally
    LStrList.Free;
  end;
end;



function TfrmEdit_mod26.CheckFtpDir(AFtp:TIdFTP;ADir: string): Boolean;
begin
  Result:= False;
  if AFtp.Connected then
  try
    AFtp.ChangeDir(ADir);
    Result:= True;
  except
    Result:= False;
  end;
end;

procedure TfrmEdit_mod26.Append28;
begin
 //
  chk_IfTax.Checked:=True;
  edt_SQty.Text:='0';
  cds28.Edit;
  cds28.FieldByName('IDKey').Value:=gFunc.CreateIDKey;
  cds28.post;

end;

procedure TfrmEdit_mod26.AppendInfo(AType: integer);
var
Lsql:string;
begin

  chk_IfTax.checked:=true;
  rg_SMethod.ItemIndex:=0;
  edt_MinQM.DataSourceField:='MIN_ORDER_QTY';

  if AType=0 then  //按供应商
  begin
   edt_vdays.Text:='0';
   edt_EDays.Text:='0';
   edt_MinQM.text:='0';
   edt_SQty.text:='0';
   edt_rate.text:='0' ;
   cds28.Edit;
   cds28.FieldByName('SUPPLIER_PTR').Value:=Frkey23;;
   cds28.Post;
  end
  else
  begin
   cds28.Edit;
   cds28.FieldByName('INVENTORY_PTR').Value:=Frkey23;;
   cds28.Post;
   edt_vdays.Text:='0';
   edt_EDays.Text:='0';
   edt_MinQM.text:='0.000';
   edt_SQty.text:='0.000';
   edt_rate.text:='0.000' ;
  end;


   cds28.Edit;
   if AType=0 then  //按供应商
     begin
     // 查找币别：
     Lsql:= ' select data0001.rkey,data0001.curr_code,data0001.curr_name '+
         ' from data0023 inner join data0001'+
         ' on data0023.currency_ptr=data0001.rkey'+
         ' where data0023.rkey='+Frkey23+' ';
     if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
     if not cdstemp.IsEmpty  then
        cds28.FieldByName('CURRENCY_PTR').Value:=cdstemp.FieldByName('rkey').Value;

     // 查找交货时间和价格是否含税 ：
     Lsql:= 'SELECT Data0024.SHIPPING_LEAD_TIME,Data0189.STATE_TAX'+
         ' FROM Data0024 INNER JOIN'+
         ' Data0189 ON Data0024.CITY_TAX_PTR = Data0189.RKEY'+
         ' where Data0024.SUPPLIER_PTR='+Frkey23+
         ' order by data0024.rkey';
       if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
       if not cdstemp.IsEmpty  then
       begin
        cds28.FieldByName('LEAD_TIME').Value:=cdstemp.FieldByName('SHIPPING_LEAD_TIME').Value;
        cds28.FieldByName('TAX_2').Value :=cdstemp.FieldByName('state_tax').Value;
       end;

     end
     else
     begin
      //库存单位
      Lsql:=' SELECT unit_code,unit_name,shelf_life,data0023.code,isnull(CATALOG_NUM,'''') as catalog_num,data0017.manufacturer_name'+
           ' from data0002,data0017 left outer join data0023'+
           ' on data0017.pref_supplier_ptr= data0023.rkey'+
           ' where data0017.stock_unit_ptr=data0002.rkey'+
           ' and data0017.rkey='+Frkey17;
       if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
       if not cdstemp.IsEmpty  then
       begin
        edt_WUnit.Text:=cdstemp.FieldByName('unit_code').asstring;
        lbl_wunit.caption:= cdstemp.FieldByName('unit_name').asstring;
        cds28.FieldByName('qte_price2').Value :=cdstemp.FieldByName('shelf_life').AsString;
        edt_EDays.Enabled:=cdstemp.FieldByName('SHELF_LIFE').AsInteger<>0; //有效期天数为0不允许修改
        //form2.Label22.Caption := '首选供应商: '+fieldbyname('code').AsString;
        if Trim(cdstemp.FieldByName('CATALOG_NUM').Value)='Y' then
        chk_IfRpt.Checked:=True
        else
        chk_IfRpt.Checked:=False;
        edt_Report.Enabled:= chk_IfRpt.Checked ;
        cds28.FieldByName('SUPPLIER_PART_NO').Value := cdstemp.FieldByName('manufacturer_name').AsString;
       end;
       //采购单位：
      Lsql:= 'select data0002.rkey,unit_code,unit_name,avl_flag,stock_purch'+
         ' from data0002,data0017' +
         ' where data0017.purch_unit_ptr=data0002.rkey and' +
         ' data0017.rkey='+Frkey17;
       if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
       if not cdstemp.IsEmpty  then
       begin
        cds28.FieldByName('PURCHASE_UNIT_PTR').Value:= cdstemp.FieldByName('rkey').value;
         cds28.FieldByName('CONVERSION_FACTOR').Value:= cdstemp.fieldvalues['stock_purch'];  //单位转换率 CONVERSION_FACTOR
        if cdstemp.FieldByName('avl_flag').Value='N' then
        begin
          cds28.FieldByName('avl_flag').Value:= 'Y';
          cbb_IfAVL.ItemIndex :=0;
        end
        else
        begin
          cds28.FieldByName('avl_flag').Value:= 'N';
          cbb_IfAVL.ItemIndex :=1;
        end;
        cbb_PMethod.ItemIndex :=0;     //订购方法
        cds28.FieldByName('AMT_QUAN_FLAG').Value :=1;   //给订购方法赋值 默认按数量....
       end;
     end;

  cds28.Post;

      //最后修改人员
  Lsql:=' select employee_name  from data0005 where rkey='+gvar.rkey05;
  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdstemp.isempty then
  edt_ModiMan.text:=cdstemp.fieldbyname('employee_name').asstring;

end;

procedure TfrmEdit_mod26.btnCloseClick(Sender: TObject);
begin
  inherited;
close;
end;

procedure TfrmEdit_mod26.btnSaveClick(Sender: TObject);
var
Lsql,str:string;
LPostData:  OleVariant;
i: integer;
begin
  inherited;

  if (chk_IfRpt.Checked=True) and (Trim(edt_Report.Text)='') then
  begin
   if messagedlg('环境测试报告没有选择,确定要保存吗?',mtconfirmation,[mbyes,mbno],0)=mrno then
   begin
   exit;
   end;
  end;
 try
   cds28.Edit;
  //没有绑定数据的栏位：
   cds28.FieldByName('rohs').value:=cbb_Grade.Text;
   cds28.FieldByName('IF_CAF').value:=cbb_caf.Text;

   //认可标记
  if cbb_IfAVL.Text='已认可' then
    cds28.FieldByName('AVL_FLAG').AsString:='Y'
  else if cbb_IfAVL.Text='未认可' then
    cds28.FieldByName('AVL_FLAG').AsString:='N'
  else
   cds28.FieldByName('AVL_FLAG').AsString:='T' ;

   //是否含税：  tax_flag
   if   chk_IfTax.Checked then
   cds28.FieldByName('tax_flag').AsString:='Y'
   else
   cds28.FieldByName('tax_flag').AsString:='N';

  if cbb_PMethod.Text='数量' then
   cds28.FieldByName('AMT_QUAN_FLAG').value:=1
   else if cbb_PMethod.Text='金额' then
    cds28.FieldByName('AMT_QUAN_FLAG').value:=2;

  cds28.FieldByName('quote_type').asinteger:=rg_SMethod.ItemIndex ;
  //TDATE
  cds28.FieldByName('Tdate').value:=gFunc.GetSvrDateTime(dtdatetime) ;
  cds28.FieldByName('EMPLOYEE_PTR').value :=StrToInt(gvar.rkey05);
  cds28.FieldByName('CSI_USER_PTR').value:=gvar.rkey73;

    if cds28.FieldByName('MIN_ORDER_QTY').asfloat=0 then
      cds28.FieldByName('MIN_ORDER_QTY').asfloat:=0;

    if cds28.FieldByName('MIN_ORDER_AMT').asfloat=0 then
      cds28.FieldByName('MIN_ORDER_AMT').asfloat:=0;


   //没有绑定数据的栏位end

   //按量区分的价格：
   for i:=1 to 5 do
  begin                //范围存盘
    if (sg_range.Cells[1,i]<>'') and (pos('无',sg_range.Cells[1,i])=0) then
      cds28.FieldByName('quan_vol_'+inttostr(i)).AsString:=sg_range.Cells[1,i]
    else
      cds28.FieldValues['quan_vol_'+inttostr(i)]:=0;
  end;
  for i:=1 to 6 do     //价格存盘
    if sg_range.Cells[2,i]<>'' then
      cds28.Fieldbyname('price_'+inttostr(i)).AsString :=sg_range.Cells[2,i]
    else
      cds28.FieldValues['price_'+inttostr(i)] :=0;
  for i:=1 to 6 do        //折扣存盘
    if sg_range.Cells[3,i]<>'' then
      cds28.Fieldbyname('disc_'+inttostr(i)).AsString :=sg_range.Cells[3,i]
    else
      cds28.FieldValues['disc_'+inttostr(i)] :=0;
     cds28.Post;

   //如果价格有变动则保存入328：
   if FEditType=2 then //编辑状态存盘
   begin
    if cds28.FieldByName('PRICE_1').Value<>Fold_price then //PRICE_1
    begin
      if cds28.FieldByName('PRICE_1').value>Fold_price then
      begin
        Lsql:='select AVL_FLAG from data0017 where AVL_FLAG=''Y'' and INV_PART_NUMBER='''+trim(edt_mtrl.Text)+''' ';
        if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
        if cdstemp.RecordCount>0 then  //如果Data0017设置为需要认可,且价格上涨,需重新认可.
          cds28.FieldByName('AVL_FLAG').value :='N';
      end;

        str:=InputBox('价格变动','必须输入价格变动原因','');

      if trim(str)<>'' then
      begin
       cds328.Append;
       cds328.FieldByName('price_ptr').value:=cds28.FieldByName('rkey').value;
       cds328.FieldByName('user_ptr').Value:=gVar.rkey05;
       cds328.FieldByName('old_price').Value:=Fold_price;
       cds328.FieldByName('new_price').Value:=cds28.FieldByName('PRICE_1').value;
       cds328.FieldByName('sys_longdate').Value:= gFunc.GetSvrDateTime;
       cds328.FieldByName('reason').Value:= str;
       cds328.Post;
      end;
    end;
   end;

    LPostData := varArrayCreate([0,1], varVariant);
    if cds28.ChangeCount>0 then
       LPostData[0]:=cds28.Delta;
    if cds328.ChangeCount>0 then
       LPostData[1]:=cds328.Delta;

     if gSvrIntf.IntfPostModData('公共基础',26, LPostData) then
      begin
        cds28.MergeChangeLog;
        cds328.MergeChangeLog;
       end else exit;

   Lsql:='select rkey  from data0028  where  SUPPLIER_PTR= '+Frkey23+' and INVENTORY_PTR='+Frkey17+'';
     if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
   cds28FileSave.first;
   cds28FileSave.DisableControls;
   while not cds28FileSave.eof do
   begin
   cds28FileSave.Edit;
   cds28FileSave.FieldByName('rkey28').Value:=cdsTemp.FieldByName('rkey').AsInteger;
   //cds28FileSave.FieldByName('D28_IDkey').Value:=cds28.FieldByName('IDkey').AsString;
   cds28FileSave.Post;
    cds28FileSave.next;
   end;

   LPostData := varArrayCreate([0,1], varVariant);
    if cdsFTPFileSave.ChangeCount>0 then
       LPostData[0]:=cdsFTPFileSave.Delta;
    if cds28FileSave.ChangeCount>0 then
       LPostData[1]:=cds28FileSave.Delta;

  if gSvrIntf.IntfPostModData('公共基础', 26, LPostData,1) then
  begin
    cdsFTPFileSave.MergeChangeLog;
    cds28FileSave.MergeChangeLog;
    ShowMessage('保存成功！');
    self.ModalResult:=mrok;
   end else exit;
 finally
  cds28FileSave.EnableControls;
 end;

end;

procedure TfrmEdit_mod26.cbb_PMethodSelect(Sender: TObject);
begin
  inherited;
 if cbb_PMethod.ItemIndex=0 then
  edt_MinQM.DataSourceField:='MIN_ORDER_QTY'
  else
  edt_MinQM.DataSourceField:='MIN_ORDER_AMT' ;

end;

procedure TfrmEdit_mod26.edt_EDaysExit(Sender: TObject);
begin
  inherited;
   if Trim(edt_EDays.Text)='' then edt_EDays.Text:='0';

  if StrToInt(Trim(edt_EDays.Text))<0 then
  begin
    ShowMessage('保存期限应大于零!');
    edt_EDays.SetFocus;
    Exit;
  end;
end;

procedure TfrmEdit_mod26.edt_MinQMExit(Sender: TObject);
begin
  inherited;
 edt_MinQM.Text := formatfloat('0.000',strtofloat(edt_MinQM.Text));
 edt_MinQM.Font.Color := clwindowtext;
end;

procedure TfrmEdit_mod26.edt_mtrlButtonClick(Sender: TObject);
var
Lfrm: TfrmQryMtrl_mod26;
begin
  inherited;
   Lfrm:=TfrmQryMtrl_mod26.Create(self);
   try
   LFrm.InitWithPickID(26,2);
   if Lfrm.ShowModal=mrOk then
   begin
    Frkey17:=Lfrm.cdsPick.FieldByName('rkey').AsString;
    if (Frkey23<>'' ) and  (Frkey17<>'' )  then
    GetMtrlInfo(Frkey23,Frkey17,Lfrm);
   end;
  finally
  Lfrm.Free;
  end;
end;

procedure TfrmEdit_mod26.edt_vendorButtonClick(Sender: TObject);
var
Lfrm: TfrmVendorQry_mod26;
begin
  inherited;
   Lfrm:=TfrmVendorQry_mod26.Create(self);
   try
   if Lfrm.ShowModal=mrOk then
   begin
    Frkey23:=Lfrm.cdsPick.FieldByName('rkey').AsString;
    if (Frkey23<>'' ) and  (Frkey17<>'' )  then
    GetVendorInfo(Frkey23,Frkey17,Lfrm);
   end;
  finally
  Lfrm.Free;
  end;
end;

procedure TfrmEdit_mod26.eh_PurPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssAlt in Shift)  and  (Key=86) then
  begin
    showmessage(cdsPrice.CommandText);
  end;
end;

procedure TfrmEdit_mod26.FormShow(Sender: TObject);
var
 i:byte;
begin
 inherited;

 sg_range.Cells[0,0] := '从';
 sg_range.Cells[1,0] := '至';
 sg_range.Cells[2,0] := '供应商价格';
 sg_range.Cells[3,0] := '折扣%';
 sg_range.Cells[0,1] := '0';


sg_range.Cells[2,1] := '0.0000';
sg_range.Cells[3,1] := '0.0000';

 for i:=1 to 5 do
  if cds28.FieldValues['quan_vol_'+inttostr(i)]<>null then     //如果是编辑
   if cds28.FieldValues['quan_vol_'+inttostr(i)]>0 then
    begin
     sg_range.Cells[1,i]:=formatfloat('0',cds28.FieldValues['quan_vol_'+inttostr(i)]);
     sg_range.Cells[2,i+1]:='0.0000';
     sg_range.Cells[3,i+1]:='0.0000';
     sg_range.Cells[0,i+1]:='>'+sg_range.Cells[1,i];
     if i=5 then                     //处理价格折扣
      sg_range.Cells[1,6]:='无限制';
    end
   else  //如果范围结束
    begin
     sg_range.Cells[1,i] := '无限制';
     sg_range.Cells[2,i] := '0.0000';
     sg_range.Cells[3,i] := '0.0000';
     break;
    end
  else  //如果是新增
   begin
    sg_range.Cells[1,i]:='无限制';
    sg_range.Cells[2,i] := '0.0000';
    sg_range.Cells[3,i] := '0.0000';
    break;
   end;

  for i:=1 to 6 do
  if cds28.FieldValues['price_'+inttostr(i)]<>null then
  if cds28.FieldValues['price_'+inttostr(i)]>0 then
  sg_range.Cells[2,i]:=formatfloat('0.0000',cds28.FieldValues['price_'+inttostr(i)]);

  for i:=1 to 6 do
  if cds28.FieldValues['disc_'+inttostr(i)]<>null then
  if cds28.FieldValues['disc_'+inttostr(i)]>0 then
  sg_range.Cells[3,i]:=formatfloat('0.0000',cds28.FieldValues['disc_'+inttostr(i)]);
  pgc1.activepageindex:=0;
end;

procedure TfrmEdit_mod26.GetData(Arkey: string);
var
Lsql28, Lsql328,Lsql28File,LsqlFTPFile,Lsql28FileSave,LsqlFTPFileSave:string;
Lsql:string;
begin
  Lsql28:='select * from data0028 where rkey=' +Arkey ;
  Lsql328:='select * from data0328 where price_ptr='+Arkey;
  Lsql28File:='SELECT Tier3_CustomerFiles.* FROM Data0028_FileList inner join  '+
        ' Tier3_CustomerFiles on Data0028_FileList.FtpIDKey = Tier3_CustomerFiles.IDKey'+
        ' WHERE Data0028_FileList.rkey28='+Arkey;

  Lsql28FileSave:='select * From  Data0028_FileList where 1=2 ' ;
  LsqlFTPFileSave:='select * From  Tier3_CustomerFiles where 1=2 ' ;

  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql28, Lsql328,Lsql28File,Lsql28FileSave,LsqlFTPFileSave]),
  [cds28,cds328,cds28File, cds28FileSave,cdsFTPFileSave]);

  if FEditType in [2,3] then
   GetPrice(cds28.FieldByName('SUPPLIER_PTR').asstring,cds28.FieldByName('INVENTORY_PTR').asstring);
end;

procedure TfrmEdit_mod26.GetInfo;
var
Lsql:string;
begin
   //其它：
 if FEditType in [2,3] then
 begin
   //重新加载存货单位 ：

  if FEditType in  [2,3]then
  begin
     Lsql:='SELECT unit_code,unit_name'+
     ' from data0002,data0017 '+
     ' where data0017.stock_unit_ptr=data0002.rkey'+
     ' and data0017.rkey='+cds28.FieldByName('INVENTORY_PTR').AsString;

  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdstemp.IsEmpty then
  begin
   edt_WUnit.Text:= cdsTemp.FieldByName('unit_code').asstring;
   lbl_WUnit.Caption:= cdsTemp.FieldByName('unit_name').asstring;
  end;

  if FEditType=2 then
  if comparetext(trim(edt_WUnit.text),trim(edt_PUinit.Text))=0 then
   begin
    if cds28.FieldByName('CONVERSION_FACTOR').Value<>1 then
     begin
      showmessage('该项材料的存货单位发生了变发!');
     cds28.Edit;
     cds28.FieldByName('CONVERSION_FACTOR').Value:=1;
     cds28.Post;
     end;

    edt_rate.Enabled := false;
   end;
  end;

   //首选供应商：
//  Lsql:='select code from data0023,data0017'+
//    ' where data0017.pref_supplier_ptr=data0023.rkey'+
//    ' and data0017.rkey='+cds28.FieldByName('INVENTORY_PTR').AsString;
//  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
//  if not cdstemp.IsEmpty then
//  begin
//     bar1.SimpleText := '首选供应商:'+fieldvalues['code']
//    else
//     bar1.SimpleText := '首选供应商:'+'未定义';


   cbb_PMethod.ItemIndex:=cds28.FieldValues['amt_quan_flag']-1;
  if cbb_PMethod.ItemIndex=0 then
   edt_MinQM.Text :=formatfloat('0.000',cds28.FieldValues['min_order_qty'])
  else
   edt_MinQM.Text :=formatfloat('0.000',cds28.FieldValues['min_order_amt']);

   if cds28.FieldByName('rohs').asstring<>'' then
   cbb_Grade.Text:=cds28.FieldByName('rohs').value;

   if cds28.FieldByName('IF_CAF').asstring<>''  then
   cbb_caf.Text:=cds28.FieldByName('IF_CAF').value;

   //认可标记
  if cds28.FieldByName('AVL_FLAG').AsString='Y' then
   cbb_IfAVL.ItemIndex:=0
  else if cds28.FieldByName('AVL_FLAG').AsString='N' then
  cbb_IfAVL.ItemIndex:=1
  else
  cbb_IfAVL.ItemIndex:=2 ;

   //是否含税：  tax_flag
   if cds28.FieldByName('tax_flag').AsString='Y' then
   chk_IfTax.Checked:=True
  else
   chk_IfTax.Checked:=false;

  if cds28.FieldByName('AMT_QUAN_FLAG').asinteger>0 then
  if cds28.FieldByName('AMT_QUAN_FLAG').value=1 then
   cbb_PMethod.Text:='数量'
  else    if cds28.FieldByName('AMT_QUAN_FLAG').value=2 then
  cbb_PMethod.Text:='金额' ;

  rg_SMethod.ItemIndex:= cds28.FieldByName('quote_type').asinteger;

  //最后修改人员
  Lsql:=' select employee_name  from data0005 where rkey='+cds28.fieldbyname('EMPLOYEE_PTR').asstring;
  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdstemp.isempty then
  edt_ModiMan.text:=cdstemp.fieldbyname('employee_name').asstring;

  //审批人员：
  Lsql:=' select USER_FULL_NAME  from data0073 where rkey='+cds28.fieldbyname('EDI_OUT_FORCST').asstring;
  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdstemp.isempty then
  edt_AVLMan.text:=cdstemp.fieldbyname('USER_FULL_NAME').asstring;

   Fold_price:=cds28.FieldByName('PRICE_1').Value; //记录下旧价格 PRICE_1
 end;
end;

procedure TfrmEdit_mod26.GetMtrlInfo(Arkey23,Arkey17:string;Afrm:TfrmQryMtrl_mod26);
var
 Lsql:string;
begin
   Lsql:='select rkey from data0028' +
      ' where supplier_ptr='+frkey23+
      ' and inventory_ptr='+frkey17;
   if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;

  if not cdsTemp.IsEmpty then
  BEGIN
    messagedlg('该材料在供应商: '+edt_vendor.Text+' 已有价格表',mtinformation,[mbcancel],0);
    edt_mtrl.Text := '';
    edt_mtrl.SetFocus;
  END
  else
  begin //
    cds28.edit;
    cds28.FieldByName('INVENTORY_PTR').Value:=Afrm.cdsPick.FieldByName('rkey').AsInteger;
    edt_mtrl.Font.Color := clwindowtext;

    if Trim(Afrm.cdsPick.FieldByName('CATALOG_NUM').Value)='Y' then     //
    chk_IfRpt.Checked:=True
    else
    chk_IfRpt.Checked:=False;

    edt_Report.Enabled:=chk_IfRpt.Checked;

    //库存单位：
    Lsql:=' SELECT unit_code,unit_name,data0023.code,data0017.SHELF_LIFE' +
        ' from data0002,data0017 left outer join data0023'+
        ' on data0017.pref_supplier_ptr= data0023.rkey'+
        ' where data0017.stock_unit_ptr=data0002.rkey'+
        ' and data0017.rkey='+ Afrm.cdsPick.FieldByName('rkey').AsString;
    if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
    if not cdsTemp.IsEmpty then
    BEGIN
      edt_WUnit.Text :=cdsTemp.FieldByName('unit_code').value;
      lbl_WUnit.Caption := cdsTemp.FieldByName('unit_name').value ;
      cds28.FieldByName('qte_price2').Value:=cdsTemp.fieldbyname('SHELF_LIFE').value;
      edt_EDays.Enabled:=cdsTemp.FieldByName('SHELF_LIFE').AsInteger<>0; //有效期天数为0不允许修改
    END;

    //采购单位；

      Lsql:=' select data0002.rkey,unit_code,unit_name,avl_flag,stock_purch'+
      ' from data0002,data0017'+
      ' where data0017.purch_unit_ptr=data0002.rkey and'+
      ' data0017.rkey='+Afrm.cdsPick.FieldByName('rkey').AsString;
      if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
      if not cdsTemp.IsEmpty then
      BEGIN
        cds28.FieldByName('PURCHASE_UNIT_PTR').value := cdsTemp.fieldvalues['rkey'];
        edt_PUinit.Font.Color := clwindowtext;
        cds28.FieldByName('CONVERSION_FACTOR').value := cdsTemp.fieldvalues['stock_purch'];    //单位转换率
      end;

      if Afrm.cdsPick.fieldvalues['avl_flag']='N' then
      begin
         cds28.FieldByName('AVL_FLAG').value  := 'Y';     //AVL_FLAG
        cbb_IfAVL.ItemIndex :=0;
      end
      else
      begin
        cds28.FieldByName('AVL_FLAG').value  := 'N';
        cbb_IfAVL.ItemIndex :=1;
      end;

      if comparetext(trim(edt_WUnit.text),trim(edt_PUinit.Text))<>0 then
        edt_rate.Enabled := true;

    cbb_PMethod.ItemIndex :=0;  //订购方法
    cds28.FieldByName('AMT_QUAN_FLAG').value :=1; // AMT_QUAN_FLAG 给订购方法赋值 默认按数量....

    cds28.post;
    edt_curr.Enabled := true;
    edt_PUinit.Enabled := true;
    pgc1.Enabled := true;

    GetPrice(arkey23,Arkey17);   //取得最新价格
  end;

end;

procedure TfrmEdit_mod26.GetPrice(Arkey23,Arkey17: string);
var
 Lsql:string;
begin
     Lsql:='SELECT  Data0070.PO_NUMBER,Data0071.QUAN_ORD, '+
' Data0071.PRICE, Data0071.DISCOUNT, Data0071.TAX_2,Data0070.PO_DATE,'+
' data0005.employee_name'+
' FROM Data0070 INNER JOIN Data0071 ON Data0071.PO_PTR = Data0070.RKEY'+
' inner join data0005 on data0070.EMPLOYEE_POINTER=data0005.rkey'+
' where data0071.INVT_PTR='+ Arkey17 +
' and data0070.SUPPLIER_POINTER= '+ Arkey23+
' ORDER BY Data0070.PO_DATE DESC' ;

  if not gSvrintf.IntfGetDataBySql(Lsql, cdsPrice) then  exit;

end;

procedure TfrmEdit_mod26.GetVendorInfo(Arkey23, Arkey17: string;Afrm: TfrmVendorQry_mod26);
  var
  Lsql:string;
  begin
  Lsql:='select rkey from data0028'+
    ' where supplier_ptr='+arkey23+
    ' and inventory_ptr='+arkey17;
 if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
 if not cdsTemp.IsEmpty then
  BEGIN
   messagedlg('该供应商已有材料'+trim(edt_mtrl.Text)+' 价格表',mtinformation,[mbcancel],0);
   edt_vendor.Text := '';
   edt_vendor.SetFocus;
  END
 else
 BEGIN
  cds28.edit;
  cds28.FieldByName('supplier_ptr').Value:=Afrm.cdsPick.FieldByName('rkey').Value;
  edt_vendor.Font.Color := clwindowtext;

  //币别；
  Lsql:='select curr_code,curr_name,currency_ptr from data0001,data0023'+
   ' where data0023.currency_ptr=data0001.rkey and'+
   ' data0023.rkey='+arkey23;
  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdsTemp.IsEmpty then
  BEGIN
   cds28.FieldByName('supplier_ptr').Value:=cdsTemp.FieldByName('rkey').Value;
   edt_curr.Enabled:=true;
  end;

  Lsql:='SELECT Data0024.SHIPPING_LEAD_TIME,Data0189.STATE_TAX'+
    ' FROM Data0024 INNER JOIN'+
    ' Data0189 ON Data0024.CITY_TAX_PTR = Data0189.RKEY'+
    ' where Data0024.SUPPLIER_PTR='+arkey23+
    ' order by data0024.rkey';
  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdsTemp.IsEmpty then
  BEGIN
   cds28.FieldByName('LEAD_TIME').Value := cdsTemp.fieldvalues['SHIPPING_LEAD_TIME'];  //LEAD_TIME
   cds28.FieldByName('state_tax').Value :=cdsTemp.fieldvalues['state_tax'];    //TAX_2
  end;

  cds28.post;

 edt_PUinit.Enabled := true;

 if comparetext(trim(edt_PUinit.text),trim(edt_WUnit.Text))<>0 then
  edt_rate.Enabled := true;
  btnSave.Enabled := true;

 pgc1.Enabled := true;
  GetPrice(Arkey23,Arkey17);
 END;
end;

procedure TfrmEdit_mod26.initCtrlStatus;
begin
     if FType=0 then
     begin
       edt_vendor.Enabled:=False;
       edt_mtrl.Enabled:=true;

       edt_curr.Enabled:=false;
       edt_WUnit.Enabled:=true;
       edt_PUinit.Enabled:=false;
       edt_Report.Enabled:=false;
       chk_IfRpt.Enabled:=false;
     end
     else
     begin
      edt_vendor.Enabled:=true;
      edt_mtrl.Enabled:=false;

      edt_curr.Enabled:=false;
      edt_WUnit.Enabled:=false;
      edt_PUinit.Enabled:=false;
      edt_Report.Enabled:=false;
      chk_IfRpt.Enabled:=false;
     end;

    if FEditType in [1,2] then
     begin
     pnl3.Enabled:=True;
     //pgc1.Enabled:=True;
     sg_range.Enabled:=true;
     eh_file.ReadOnly:=false;
     eh_PurPrice.ReadOnly:=false;
     end
     else
     begin
     pnl3.Enabled:=false;
     //pgc1.Enabled:=false;
     sg_range.Enabled:=false;
     eh_file.ReadOnly:=true;
     eh_PurPrice.ReadOnly:=true;
     end;

end;

procedure TfrmEdit_mod26.mni_DelClick(Sender: TObject);
var
LsqlFIle,LsqlFTPFile:string;
Lcds28File,LcdsFTPFile:TClientDataSet;
LPostData: OleVariant;
begin
  inherited;
 //
 if cds28File.IsEmpty then exit;
 Lcds28File:=TClientDataSet.Create(nil);
 LcdsFTPFile:=TClientDataSet.Create(nil);
 try

 LsqlFTPFile:='select * From Tier3_CustomerFiles where IDKey='''+cds28file.FieldByName('IDkey').AsString+'''  ';
 LsqlFIle:='select * From data0028_FileList where FTPIDKey='''+cds28file.FieldByName('IDkey').AsString+'''  ';
 gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LsqlFTPFile,LsqlFIle  ]), [LcdsFTPFile,Lcds28File ]);

  if not Lcds28File.IsEmpty  then Lcds28File.Delete;
  if not LcdsFTPFile.IsEmpty  then LcdsFTPFile.Delete;

  LPostData := varArrayCreate([0,1], varVariant);
  if LcdsFTPFile.ChangeCount>0 then
     LPostData[0]:=LcdsFTPFile.Delta;
  if Lcds28File.ChangeCount>0 then
     LPostData[1]:=Lcds28File.Delta;

  if gSvrIntf.IntfPostModData('公共基础', 26, LPostData,1) then
  begin
    LcdsFTPFile.MergeChangeLog;
    Lcds28File.MergeChangeLog;
   end else exit;
 finally
  Lcds28File.Free;
  LcdsFTPFile.Free;
 end;


end;

procedure TfrmEdit_mod26.mni_DelRClick(Sender: TObject);
var
i:byte;
begin
  inherited;
 for i:= sg_range.Row+1 to sg_range.RowCount-1 do
  sg_range.Rows[i].Clear;
 if sg_range.Row<>1 then
  sg_range.Cells[0,sg_range.Row] := '>'+sg_range.Cells[1,sg_range.Row-1]
 else
  sg_range.Cells[0,sg_range.Row] :='0';
  sg_range.Cells[1,sg_range.Row] := '无限制';
end;

procedure TfrmEdit_mod26.mni_downloadClick(Sender: TObject);
var
  LFTp: TIdFTP;
  LFtpDir,LFileName,LFtpName:string;
  LSaveDlg: TSaveDialog;
  Lsql:string;
begin
 inherited;
  LSaveDlg:= TSaveDialog.Create(nil);

  LFtp:= TIdFTP.Create(nil);
  try

        Lsql:= 'SELECT FileName,Ftp_FileName FROM Tier3_CustomerFiles WHERE IDKey = ' + QuotedStr(cds28File.FieldByName('IDKey').AsString);   //FtpIDKey
        if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;

        if not cdstemp.IsEmpty then
        begin
          LFileName:= cdstemp.Fields[0].AsString;
          LFtpName:= cdstemp.Fields[1].AsString;
          LSaveDlg.FileName:= LFileName;
          if LSaveDlg.Execute then
          begin

             Lsql:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                         ' from tier3_ftplist where rkey = ' + cds28File.FieldByName('Ftp_Ptr').AsString;    //Ftp_Ptr
             if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;

              if not cdsTemp.IsEmpty then
              begin
                LFtp.Host := cdsTemp.Fields[1].AsString;
                LFtp.Username := cdsTemp.Fields[2].AsString;
                LFtp.Password := cdsTemp.Fields[3].AsString;
                LFtpDir := Trim(cdsTemp.Fields[4].AsString);
              end;

            try
              if not LFtp.Connected then LFtp.Connect;
              if LFTp.Connected then
                LFTp.Get(LFtpDir+LFtpName,LSaveDlg.FileName,True);
            except
              ShowMessage('FTP链接失败,下载失败');
              Exit;
            end;
          end;
        end
        else
        begin
          ShowMessage('此文件还没有上传到FTP，请先保存后再下载！');
          exit;
        end;

  finally
    if LFTp.Connected then LFTp.Disconnect;
    LSaveDlg.Free;
    LFTp.Free;
  end;
end;

procedure TfrmEdit_mod26.mni_upLoadClick(Sender: TObject);
   var
  LFtp: TIdFTP;
  LODialog: TOpenDialog;
  LTmp: TADOQuery;
  Lsql,LFilePath,LFtpDir,LRkey:string;
begin
     inherited;
  LODialog:= TOpenDialog.Create(self);

  LFtp:= TIdFTP.Create(nil);

  try

    if LODialog.Execute then
    begin
      LFilePath:= LODialog.FileName;

       Lsql:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                   ',ftpPort from tier3_ftplist where FtpID = 1 order by rkey  desc';  //desc  //lisa
       gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

        if not cdstemp.IsEmpty then
        begin
          LFtp.Host := cdstemp.Fields[1].AsString;
          LFtp.Username := cdstemp.Fields[2].AsString;
          LFtp.Password := cdstemp.Fields[3].AsString;
          LFtp.Port:= cdstemp.Fields[5].Value;
          LFtpDir := Trim(cdstemp.Fields[4].AsString) ;
          LRkey:= cdstemp.Fields[0].AsString;
        end;

       Lsql:= 'SELECT IDkey from Tier3_CustomerFiles where FileName=' + QuotedStr(LFilePath);
        if not gSvrintf.IntfGetDataBySql(Lsql, cdstemp) then exit;

        if not cdstemp.IsEmpty then
        begin
          ShowMessage('已存在此文件');
          Exit;
        end
        else
        begin
          try

           FTPIDKey:= gFunc.CreateIDKey;
            if not LFtp.Connected then LFtp.Connect;
            if LFtp.Connected then
            begin
              cdsFTPFileSave.Append;
              cdsFTPFileSave.FieldByName('IDKey').Value:= FTPIDKey;
               cdsFTPFileSave.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
              cdsFTPFileSave.FieldByName('Ftp_Ptr').Value:= LRkey;
              cdsFTPFileSave.FieldByName('Ftp_FileName').Value:= FTPIDKey;
              cdsFTPFileSave.FieldByName('UPLoadTime').Value:=gFunc.GetSvrDateTime();
              cdsFTPFileSave.FieldByName('UPloadUser_d05ptr').Value:= StrToInt(gVar.rkey05);
              cdsFTPFileSave.FieldByName('GroupIDKey').Value:= FTPIDKey;
              cdsFTPFileSave.FieldByName('BEnable').Value:= 1;
              cdsFTPFileSave.post;

              cds28File.Append;
              cds28File.FieldByName('FileName').Value:= ExtractFileName(LFilePath);
              cds28File.Post;

              cds28FileSave.Append;
              cds28FileSave.FieldByName('FtpIDKey').Value:= FTPIDKey;
              cds28FileSave.Post;


              if not CheckFtpDir(LFtp,LFtpDir) then Self.CreateDir(LFtp,LFtpDir);
               LFtp.Put(LFilePath,LFtpDir + FTPIDKey,True);    //无权限上传暂注释20171010

            end;
          except

            ShowMessage('FTP链接失败,上传失败');
          end;
        end;

    end; //打开文件后
  finally
    if LFtp.Connected then LFtp.Disconnect;
    LODialog.Free;
    LTmp.Free;
    LFtp.Free;
  end;
end;

procedure TfrmEdit_mod26.pm_filePopup(Sender: TObject);
begin
  inherited;

  mni_Del.Enabled:= (not cds28File.IsEmpty);
  mni_upload.Enabled:=(FEditType<>3);
  mni_download.Enabled:=(not cds28file.isempty);

end;

procedure TfrmEdit_mod26.pm_rangePopup(Sender: TObject);
begin
  inherited;
if (sg_range.Cells[1,sg_range.Row]='') or (pos('无',sg_range.Cells[1,sg_range.Row])<>0) then
   mni_DelR.Enabled:=false else
   mni_DelR.Enabled:=true;
end;

procedure TfrmEdit_mod26.sg_rangeExit(Sender: TObject);
var
 i:byte;
begin
  inherited;
if (sg_range.Col=2) or (sg_range.Col=3) then  //如果是在第二,三列
 begin
  if sg_range.Cells[sg_range.Col,sg_range.Row]<>'' then
   sg_range.Cells[sg_range.Col,sg_range.Row]:=
   formatfloat('0.0000',strtofloat(sg_range.Cells[sg_range.Col,sg_range.Row]))
  else
   if sg_range.Cells[1,sg_range.Row]<>'' then
    sg_range.Cells[sg_range.Col,sg_range.Row]:='0.000';
 end
else      //...............如果是在第一列
begin  // 开始....2
 if (sg_range.Row>1) and (sg_range.Cells[1,sg_range.Row]<>'')
  and (pos('无',sg_range.Cells[1,sg_range.Row])=0)  then
  begin   //...yes    //如果不在第一行并且当前行不是空行,并且没有'无限制'
   IF (strtofloat(sg_range.Cells[1,sg_range.Row])<strtofloat(sg_range.Cells[1,sg_range.Row-1])) then
    begin   //向上比较
     sg_range.Cells[1,sg_range.Row]:=sg_range.Cells[1,sg_range.Row-1];
     sg_range.Cells[0,sg_range.Row+1]:='>'+sg_range.Cells[1,sg_range.Row];
     if sg_range.Cells[2,sg_range.Row+1]='' then
      sg_range.Cells[2,sg_range.Row+1]:='0.0000';
     if sg_range.Cells[3,sg_range.Row+1]='' then
      sg_range.Cells[3,sg_range.Row+1]:='0.0000';
     if sg_range.Cells[1,sg_range.Row+1]='' then
      sg_range.Cells[1,sg_range.Row+1]:='无限制';
    end
   else      //向下比较
    begin  //yes
     for i:=sg_range.Row+1 to sg_range.RowCount-1 do
      begin
       if (sg_range.Cells[1,i]<>'无限制') and (sg_range.Cells[1,i]<>'')  then
        begin           //如果是修改原来的范围
         IF (strtofloat(sg_range.Cells[1,sg_range.Row])>strtofloat(sg_range.Cells[1,i])) then
          begin
           sg_range.Cells[0,i]:='>'+sg_range.Cells[1,sg_range.row];
           sg_range.Cells[1,i]:=sg_range.Cells[1,sg_range.row];
           sg_range.Cells[0,i+1]:='>'+sg_range.Cells[1,i];
          end
         else
          sg_range.Cells[0,i]:='>'+sg_range.Cells[1,i-1];
         end
        else   //如果是新增的范围
         begin
          sg_range.Cells[0,i]:='>'+sg_range.Cells[1,i-1];
          sg_range.Cells[1,i]:='无限制';
          if sg_range.Cells[2,i]='' then
             sg_range.Cells[2,i]:='0.0000';
          if sg_range.Cells[3,i]='' then
             sg_range.Cells[3,i]:='0.0000';
          break;
         end;
       end;
    end;  //yes
  end     //...yes
  else    //如果当前行在第一行,或者不在第一行,但是当前行有'无限制',或者当前行是空行
   begin  //bbbyes
    for i:=sg_range.Row+1 to sg_range.RowCount-2 do
     begin
      if (sg_range.Cells[1,i]<>'无限制') and (sg_range.Cells[1,i]<>'') and (pos('无',sg_range.Cells[1,i-1])=0) then
       begin
        IF (strtofloat(sg_range.Cells[1,sg_range.Row])>strtofloat(sg_range.Cells[1,i])) then
         begin
          sg_range.Cells[1,i]:=sg_range.Cells[1,sg_range.row];
          sg_range.Cells[0,i+1]:='>'+sg_range.Cells[1,i];
         end
        else
         sg_range.Cells[0,i]:='>'+sg_range.Cells[1,i-1];
       end;
     end;
   if (sg_range.row=1) and (sg_range.Cells[1,2]='') and (pos('无',sg_range.Cells[1,sg_range.Row])=0) then
    begin
     sg_range.Cells[1,2]:='无限制';
     sg_range.Cells[2,sg_range.Row+1]:='0.0000';
     sg_range.Cells[3,sg_range.Row+1]:='0.0000';
    end;
   if (sg_range.Cells[1,sg_range.Row]<>'') and (pos('无',sg_range.Cells[1,sg_range.Row])=0) then
    sg_range.Cells[0,sg_range.Row+1]:='>'+sg_range.Cells[1,sg_range.Row];
   end; //bbbyes
 end;
end;

procedure TfrmEdit_mod26.sg_rangeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if (sg_range.Col=1) or (sg_range.Col=2) then
  if (length(sg_range.Cells[sg_range.Col,sg_range.row])>=10) and (key <> chr(8)) then
    abort; //第-,二列输入数字不能大于1000000000
 if (key = chr(46)) and (sg_range.Col=1) then
    abort;   //第一列不能输入小数点'.'

 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
 else
 if (key = chr(46)) then
 if pos('.',sg_range.Cells[sg_range.Col,sg_range.row])>0
    then abort;//第二,三列小数点'.'不能重复

  if (sg_range.Row<>1) then
  if (sg_range.Cells[1,sg_range.Row-1]='无限制') or (sg_range.Cells[1,sg_range.Row-1]='') then
    abort;

end;

procedure TfrmEdit_mod26.sg_rangeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if (key=8) or (key=46) then   // del键或 back键
 if (sg_range.Cells[1,sg_range.Row]='') and (sg_range.Col=1) then
    mni_Delclick(sender);

 if (sg_range.Cells[1,sg_range.Row]='0') and (sg_range.Col=1) then
    mni_Delclick(sender);


 if sg_range.Cells[3,sg_range.row]<>'' then  //第三列折扣输入数字不能大于99
 if (strtofloat(sg_range.Cells[3,sg_range.row])>99) and (key <>vk_back) then
   sg_range.Cells[3,sg_range.row]:='0';
end;

procedure TfrmEdit_mod26.sg_rangeSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
 i:byte;
begin
 inherited;
 if (acol=1) and (arow=6) then  //第一列六行不准编辑  没有对应字段值
  canselect:=false;

if (sg_range.Col=2) or (sg_range.Col=3) then  //如果是在第二,三列
 begin
  if sg_range.Cells[sg_range.Col,sg_range.Row]<>'' then
   sg_range.Cells[sg_range.Col,sg_range.Row]:=
   formatfloat('0.0000',strtofloat(sg_range.Cells[sg_range.Col,sg_range.Row]))
  else
   if sg_range.Cells[1,sg_range.Row]<>'' then
    sg_range.Cells[sg_range.Col,sg_range.Row]:='0.0000';
 end
else      //...............如果是在第一列
begin  // 开始....2
 if (sg_range.Row>1) and (sg_range.Cells[1,sg_range.Row]<>'')
  and (pos('无',sg_range.Cells[1,sg_range.Row])=0)  then
  begin   //...yes    //如果不在第一行并且当前行不是空行,并且没有'无限制'
   IF (strtofloat(sg_range.Cells[1,sg_range.Row])<strtofloat(sg_range.Cells[1,sg_range.Row-1])) then
    begin   //向上比较
     sg_range.Cells[1,sg_range.Row]:=sg_range.Cells[1,sg_range.Row-1];
     sg_range.Cells[0,sg_range.Row+1]:='>'+sg_range.Cells[1,sg_range.Row];
     if sg_range.Cells[2,sg_range.Row+1]='' then
      sg_range.Cells[2,sg_range.Row+1]:='0.0000';
     if sg_range.Cells[3,sg_range.Row+1]='' then
      sg_range.Cells[3,sg_range.Row+1]:='0.0000';
     if sg_range.Cells[1,sg_range.Row+1]='' then
      sg_range.Cells[1,sg_range.Row+1]:='无限制';
    end
   else      //向下比较
    begin  //yes
     for i:=sg_range.Row+1 to sg_range.RowCount-1 do
      begin
       if (sg_range.Cells[1,i]<>'无限制') and (sg_range.Cells[1,i]<>'')  then
        begin           //如果是修改原来的范围
         IF (strtofloat(sg_range.Cells[1,sg_range.Row])>strtofloat(sg_range.Cells[1,i])) then
          begin
           sg_range.Cells[0,i]:='>'+sg_range.Cells[1,sg_range.row];
           sg_range.Cells[1,i]:=sg_range.Cells[1,sg_range.row];
           sg_range.Cells[0,i+1]:='>'+sg_range.Cells[1,i];
          end
         else
          sg_range.Cells[0,i]:='>'+sg_range.Cells[1,i-1];
         end
        else   //如果是新增的范围
         begin
          sg_range.Cells[0,i]:='>'+sg_range.Cells[1,i-1];
          sg_range.Cells[1,i]:='无限制';
          if sg_range.Cells[2,i]='' then
             sg_range.Cells[2,i]:='0.0000';
          if sg_range.Cells[3,i]='' then
             sg_range.Cells[3,i]:='0.0000';
          break;
         end;
       end;
    end;  //yes
  end     //...yes
  else    //如果当前行在第一行,或者不在第一行,但是当前行有'无限制',或者当前行是空行
   begin  //bbbyes
    for i:=sg_range.Row+1 to sg_range.RowCount-2 do
     begin
      if (sg_range.Cells[1,i]<>'无限制') and (sg_range.Cells[1,i]<>'') and (pos('无',sg_range.Cells[1,i-1])=0) then
       begin
        IF (strtofloat(sg_range.Cells[1,sg_range.Row])>strtofloat(sg_range.Cells[1,i])) then
         begin
          sg_range.Cells[1,i]:=sg_range.Cells[1,sg_range.row];
          sg_range.Cells[0,i+1]:='>'+sg_range.Cells[1,i];
         end
        else
         sg_range.Cells[0,i]:='>'+sg_range.Cells[1,i-1];
       end;
     end;
   if (sg_range.row=1) and (sg_range.Cells[1,2]='') and (pos('无',sg_range.Cells[1,sg_range.Row])=0) then
    begin
     sg_range.Cells[1,2]:='无限制';
     sg_range.Cells[2,sg_range.Row+1]:='0.0000';
     sg_range.Cells[3,sg_range.Row+1]:='0.0000';
    end;
   if (sg_range.Cells[1,sg_range.Row]<>'') and (pos('无',sg_range.Cells[1,sg_range.Row])=0) then
    sg_range.Cells[0,sg_range.Row+1]:='>'+sg_range.Cells[1,sg_range.Row];
   end; //bbbyes
 end;  // 结束....2
end;

end.

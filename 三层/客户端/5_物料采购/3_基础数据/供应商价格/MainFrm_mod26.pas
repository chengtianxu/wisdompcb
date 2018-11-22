unit MainFrm_mod26;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB,uCommFunc,System.DateUtils,editFrm_mod26,
  Vcl.Mask, Vcl.DBCtrls,System.StrUtils;

type
  TFrmMainVendorPrice_Mod26 = class(TfrmBaseMain)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl_type: TLabel;
    edt_VOrMtrl: TEdit;
    btn_Sel: TButton;
    rg_type: TRadioGroup;
    btn_QryChangeRec: TBitBtn;
    btn_CopyMtrls: TBitBtn;
    qrytemp: TADOQuery;
    strngfld_part_number: TStringField;
    strngfld_part_description: TStringField;
    strngfldCATALOG_NUM: TStringField;
    strngfldqrytempcode: TStringField;
    strngfld_name: TStringField;
    strngfldqrytempmodel: TStringField;
    strngfldqrytemp环测物料名称: TStringField;
    strngfld_name1: TStringField;
    strngfld_code1: TStringField;
    qrytempPRICE_1: TFloatField;
    strngfldTAX_2: TStringField;
    qrytempqte_price: TFloatField;
    intgrfld_price2: TIntegerField;
    strngfld_flag: TStringField;
    strngfld_statu: TStringField;
    cdstemp: TClientDataSet;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniCheck: TMenuItem;
    mniDel: TMenuItem;
    mniPChange: TMenuItem;
    lbl1: TLabel;
    dbedtsupplier_part_no: TDBEdit;
    lbl2: TLabel;
    dbedtsugg_reorder_qty: TDBEdit;
    lbl3: TLabel;
    dbedtlead_time: TDBEdit;
    lbl4: TLabel;
    dbedtcurr_name: TDBEdit;
    lbl5: TLabel;
    dbedtrohs: TDBEdit;
    lbl6: TLabel;
    dbedtIF_CAF: TDBEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    btn_updateTax: TButton;
    btn_UpdateDay: TButton;
    lbl_Name: TLabel;
    procedure rg_typeClick(Sender: TObject);
    procedure btn_SelClick(Sender: TObject);
    procedure btn_QryChangeRecClick(Sender: TObject);
    procedure mniPChangeClick(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniCheckClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_UpdateDayClick(Sender: TObject);
    procedure btn_updateTaxClick(Sender: TObject);
    procedure btn_CopyMtrlsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmMainPopup(Sender: TObject);

  private
    { Private declarations }
      FType : Integer;
      Fsupp_status,FSTOP_PURCH:string;
      procedure  GetValue(Afrm: TfrmEdit_mod26);

  public
    { Public declarations }

    procedure GetData(); override;  //GetSvrDateTime
  end;

var
  FrmMainVendorPrice_Mod26: TFrmMainVendorPrice_Mod26;

implementation
       uses  ChangQryFrm_mod26,ChangeRecFrm_mod26,
       QryMtrlFrm_mod26,QryVendorFrm_mod26,SelPlaceFrm_mod26;
{$R *.dfm}

{ TFrmMainVendorPrice_Mod26 }

procedure TFrmMainVendorPrice_Mod26.btn_UpdateDayClick(Sender: TObject);
var
 str,Lsql,Lfield:string;
 pk:Tbookmark;
 lead_time:integer;
 Lcds28:TClientDataSet;
begin
 inherited;

if not gfunc.CheckUserAuth(2, 25) then exit;

 Lcds28:= TClientDataSet.Create(self);

 try

    if FType=0 then
    Lfield:='SUPPLIER_PTR'
    else
    Lfield:='INVENTORY_PTR';

  if messagedlg('您确定要一次更新供应商所有物料的交付时间吗?',mtconfirmation,[mbYes,mBno],0)=mryes then
   begin
    str:='';
    if inputquery('交货时间天数','请输入要更新的天数:            ',str) then
     if trim(str)<>'' then
      begin
       try
        lead_time:=strtoint(str);
        pk:=cdsMain.GetBookmark;

        Lsql:='select * from data0028  where '+Lfield+'='+inttostr(edt_VOrMtrl.tag);
        if not gSvrintf.IntfGetDataBySql(Lsql, Lcds28) then Exit;

        Lcds28.First;
        while not Lcds28.Eof do
         begin
          Lcds28.Edit;
          Lcds28.FieldValues['lead_time']:=lead_time;
          Lcds28.Post;
          Lcds28.Next;
         end;

         if not gSvrintf.IntfPostDataByTable('data0028', Lcds28.Delta) then exit;

         btnRefreshClick(sender);

         cdsMain.GotoBookmark(pk);
         cdsMain.FreeBookmark(pk);

       except
        showmessage('对不起请输入一个有效的整数!');
       end;
      end;
   end else exit;
 finally
   Lcds28.Free;
 end;
end;

procedure TFrmMainVendorPrice_Mod26.btn_updateTaxClick(Sender: TObject);
var
 str,Lsql,Lfield:string;
 pk:Tbookmark;
 lead_time:integer;
 Lcds28:TClientDataSet;
 Lfrm: TfrmSelPlace_mod26;
begin

 if not gfunc.CheckUserAuth(2, 25) then exit;
  Lcds28:= TClientDataSet.Create(self);


  try
   if messagedlg('您确定要一次更新供应商所有物料的增值税率吗?',mtconfirmation,[mbYes,mBno],0)=mryes then
   begin

        Lsql:='select * from data0028  where SUPPLIER_PTR='+inttostr(edt_VOrMtrl.tag);
        if not gSvrintf.IntfGetDataBySql(Lsql, Lcds28) then Exit;


      Lsql:='select data0189.state_tax,data0189.state_id,data0024.* '+
      ' from data0024  inner join data0189 on data0024.city_tax_ptr=data0189.rkey'+
      ' where data0024.supplier_ptr='+inttostr(edt_VOrMtrl.tag);

       if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;


     if cdsTemp.IsEmpty then
     begin
       MessageDlg('此供应商还没设置装运地点,不能同步更新税率!',mtInformation,[mbOK],1);
       Exit;
     end;


     if cdsTemp.RecordCount=1 then
      begin
        Lcds28.First;
        while not Lcds28.Eof do
         begin
          Lcds28.Edit;
          Lcds28.fieldbyname('TAX_2').Value:=cdsTemp.fieldbyname('state_tax').value;
          Lcds28.Post;
          Lcds28.Next;
         end;
      end
     else
     begin
       Lfrm:=TfrmSelPlace_mod26.Create(self);
       try
         Lfrm.InitWithPickID(26,8,' and supplier_ptr='+inttostr(edt_VOrMtrl.tag));
        if Lfrm.ShowModal=mrok then
        begin
         Lcds28.First;
         while not Lcds28.Eof do
         begin
          Lcds28.Edit;
          Lcds28.fieldbyname('TAX_2').Value:=Lfrm.cdsPick.fieldbyname('state_tax').value;
          Lcds28.Post;
          Lcds28.Next;
         end;

        end;
       finally
       Lfrm.Free ;
       end;
      end;

         if not gSvrintf.IntfPostDataByTable('data0028', Lcds28.Delta) then exit;

         btnRefreshClick(sender);

         cdsMain.GotoBookmark(pk);
         cdsMain.FreeBookmark(pk);

   end else exit;
   finally
   Lcds28.free;
   end;
end;

procedure TFrmMainVendorPrice_Mod26.btn_CopyMtrlsClick(Sender: TObject);
var
Lfrm: TfrmVendorQry_mod26;
Lsql,LNsql:string;
Lcds28:TClientDataSet;
LNrkey23:integer;
LName,LCode:string;
LField:TField;

begin
  inherited;
  if not gfunc.CheckUserAuth(2, 25) then exit;

  LFrm:=TfrmVendorQry_mod26.Create(self);
  Lcds28:=TClientDataSet.Create(self);

  try

     Lfrm.InitWithPickID(26,1,' and supplier_ptr<>'+inttostr(edt_VOrMtrl.tag));

    if Lfrm.ShowModal=mrok then
    begin
        LNrkey23:=Lfrm.cdsPick.FieldByName('rkey').AsInteger;
        Lcode:= Lfrm.cdsPick.FieldByName('code').asstring;
        LName:= Lfrm.cdsPick.FieldByName('SUPPLIER_NAME').asstring;

       Lsql:=' select * from  data0028 where supplier_ptr='+inttostr(LNrkey23);

       if not gSvrintf.IntfGetDataBySql(Lsql, cdstemp) then exit;


      if cdstemp.RecordCount=0 then
      begin
        try
           Lsql:=' select * from  data0028 where 1=2 ';

           if not gSvrintf.IntfGetDataBySql(Lsql, Lcds28) then exit;

           Lsql:=' select * from  data0028 where supplier_ptr='+inttostr(edt_VOrMtrl.tag);
           if not gSvrintf.IntfGetDataBySql(Lsql, cdstemp) then exit;

            cdstemp.First;
            while not cdstemp.eof do
            begin
             Lcds28.Append;
              for LField in Lcds28.Fields do
              begin
                if IndexText(LField.FieldName, ['rkey']) <> -1 then
                  Continue;
                if cdstemp.FindField(LField.FieldName) <> nil then
                begin
                  LField.value := cdstemp.FindField(LField.FieldName).value;
                end;
              end ;
            Lcds28.FieldByName('SUPPLIER_PTR').Value:=LNrkey23;
            Lcds28.Post;
            cdstemp.Next;
           end;
           if not gSvrintf.IntfPostDataByTable('data0028', Lcds28.Delta) then exit;

          ShowMessage('复制成功');

          edt_VOrMtrl.Tag:=LNrkey23;
          edt_VOrMtrl.Text:=LCode;
          lbl_Name.Caption:=LName;
          FMainWhere:=' and  data0028.supplier_ptr='+inttostr(LNrkey23);
          GetData();

        except
          ShowMessage('复制失败');

        end;
      end
      else
      begin
       LNsql:='select * from data0028 where supplier_ptr='+inttostr(LNrkey23);
           if not gSvrintf.IntfGetDataBySql(Lsql, Lcds28) then exit;

       Lsql:='select SUPPLIER_PTR,INVENTORY_PTR,EMPLOYEE_PTR,CSI_USER_PTR,TDATE,isnull(SUPPLIER_PART_NO,''''),SUGG_REORDER_QTY,LEAD_TIME,'+
              'AMT_QUAN_FLAG,MIN_ORDER_QTY,MIN_ORDER_AMT,TAX_1, TAX_2,PRICE_1,PRICE_2,PRICE_3,PRICE_4,PRICE_5,PRICE_6,'+
              'QUAN_VOL_1,QUAN_VOL_2,QUAN_VOL_3,QUAN_VOL_4,QUAN_VOL_5,DISC_1,DISC_2,DISC_3,DISC_4,DISC_5,DISC_6,TAX_3,'+
              'TAX_4,PURCHASE_UNIT_PTR,CONVERSION_FACTOR,AVL_FLAG,CURRENCY_PTR,EDI_OUT_FORCST,qte_price,tax_flag,qte_price2,'+
              'isnull(QTE_PRICE1,0) as QTE_PRICE1,isnull(rohs,'''') as rohs, quote_type from data0028 where supplier_ptr='+inttostr(edt_VOrMtrl.Tag);
           if not gSvrintf.IntfGetDataBySql(Lsql, cdstemp) then exit;

          try

            cdstemp.First;   //inventory_ptr
            while not cdstemp.Eof do
            begin

              if not Lcds28.Locate('inventory_ptr',cdstemp.FieldByName('INVENTORY_PTR').AsInteger,[]) then
              begin
                Lcds28.Append;
              for LField in Lcds28.Fields do
              begin
                if IndexText(LField.FieldName, ['rkey']) <> -1 then
                  Continue;
                if cdstemp.FindField(LField.FieldName) <> nil then
                begin
                  LField.value := cdstemp.FindField(LField.FieldName).value;
                end;
              end ;
              Lcds28.FieldByName('SUPPLIER_PTR').Value:=LNrkey23;
              Lcds28.Post;
              cdstemp.Next;
              end
              else
                cdstemp.Next;
              if cdstemp.Eof then
              begin

                ShowMessage('复制成功');
                edt_VOrMtrl.Text:=lcode;
                lbl_Name.Caption:=LName;
                edt_VOrMtrl.Tag:=LNrkey23;
                FMainWhere:=' and  data0028.supplier_ptr='+inttostr(LNrkey23);
                GetData();

              end;

            end;
          except
            on e:exception do
             application.MessageBox(pchar(e.Message),'Error',0);
          end;

    end;
   end;
  finally
    Lfrm.free;
    Lcds28.free;
  end;

end;

procedure TFrmMainVendorPrice_Mod26.btn_QryChangeRecClick(Sender: TObject);
var
Lfrm:TfrmChangeRec_mod26;
Lsql:string;
begin
  inherited;
 Lfrm:=TfrmChangeRec_mod26.Create(self);
 try
   Lfrm.dtpk1.Date:= IncMonth(gFunc.GetSvrDateTime(),-1);
   Lfrm.dtpk2.Date:= gFunc.GetSvrDateTime();
   Lsql:= ' and data0328.sys_longdate>='''+FormatDateTime('yyyy-MM-dd hh:mm:ss',Lfrm.dtpk1.Date)+''' '+
          ' and data0328.sys_longdate<='''+FormatDateTime('yyyy-MM-dd hh:mm:ss',Lfrm.dtpk2.Date)+''' ';
      Lfrm.InitWithPickID(26,5,Lsql);
   Lfrm.GetData328( FormatDateTime('yyyy-MM-dd hh:mm:ss',Lfrm.dtpk1.Date), FormatDateTime('yyyy-MM-dd hh:mm:ss',Lfrm.dtpk2.Date) );
   Lfrm.eh1.Visible:=True;
   Lfrm.eh_Avg.Visible:=false;
   Lfrm.showmodal;

 finally
   Lfrm.Free;
 end;
end;

procedure TFrmMainVendorPrice_Mod26.btn_SelClick(Sender: TObject);
var
 Lfrm1 : TfrmVendorQry_mod26;
 Lfrm2:TfrmQryMtrl_mod26;
 Lsql:string;
begin
  inherited;
  if rg_type.ItemIndex=0 then
  begin
  Lfrm1:=TfrmVendorQry_mod26.Create(self);
  end
  else
  Lfrm2:=TfrmQryMtrl_mod26.Create(self);

  try
     if rg_type.ItemIndex=0 then
     begin
      Lfrm1.InitWithPickID(26,1);
      if Lfrm1.ShowModal=mrok then
      begin
       edt_VOrMtrl.text:=Lfrm1.cdsPick.FieldByName('CODE').value;
       lbl_Name.caption:=Lfrm1.cdsPick.FieldByName('SUPPLIER_NAME').value;
       edt_VOrMtrl.Tag:=Lfrm1.cdsPick.FieldByName('rkey').asinteger;
       Fsupp_status:=Lfrm1.cdsPick.FieldByName('supper_status').AsString;
       FMainWhere:=' and data0028.supplier_ptr='+Lfrm1.cdsPick.fieldbyname('rkey').AsString;
       FOrderby:='order by inv_part_number';
       GetData();
       //showmessage(cdsmain.commandtext);
      end;
     end
     else
     begin
     Lfrm2.InitWithPickID(26,2);
      if Lfrm2.ShowModal=mrok then
      begin
       edt_VOrMtrl.text:=Lfrm2.cdsPick.FieldByName('INV_PART_NUMBER').value;
       lbl_Name.caption:=Lfrm2.cdsPick.FieldByName('INV_PART_DESCRIPTION').value;
       edt_VOrMtrl.Tag:=Lfrm2.cdsPick.FieldByName('rkey').asinteger;
       FSTOP_PURCH:=Lfrm2.cdsPick.FieldByName('STOP_PURCH').AsString;
       FMainWhere:=' and data0028.inventory_ptr='+Lfrm2.cdsPick.fieldbyname('rkey').AsString;
       FOrderby:='order by code';
       GetData();
      end;
     end ;

    if rg_type.ItemIndex=0 then
    begin
    ehMain.Columns[0].Visible:=false;
    ehMain.Columns[1].Visible:=false;
    ehMain.Columns[2].Visible:=true;
    ehMain.Columns[3].Visible:=true;
    btn_UpdateDay.Enabled:=true;
    btn_updateTax.Enabled:=true;
    end
    else
    begin
    ehMain.Columns[0].Visible:=true;
    ehMain.Columns[1].Visible:=true;
    ehMain.Columns[2].Visible:=False;
    ehMain.Columns[3].Visible:=False;
    btn_UpdateDay.Enabled:=false;
    btn_updateTax.Enabled:=false;;
    end;


  finally
    if rg_type.ItemIndex=0 then
    Lfrm1.Free
    else
    Lfrm2.Free;
  end;



end;

procedure TFrmMainVendorPrice_Mod26.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmMainVendorPrice_Mod26:=nil;
end;

procedure TFrmMainVendorPrice_Mod26.FormCreate(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  rg_type.ItemIndex:=0;
  FType:=0;


end;

procedure TFrmMainVendorPrice_Mod26.GetData;
var
Lsql28:string;
begin

  try
    FMainFrmSql :=
      ' select inv_part_number,inv_part_description,data0017.stock_unit_ptr,isnull(data0017.CATALOG_NUM,'''') as CATALOG_NUM, '+
      ' data0023.code,data0023.supplier_name,data0028.lead_time,data0805.model,data0805.inv_name as 环测物料名称 ,'+
      ' data0001.curr_name,data0001.curr_code, data0023.abbr_name,data0017.inv_name,data0002.unit_code,data0002.unit_name,'+
      ' cast(data0028.TAX_2 as varchar(10))+ ''%'' as TAX_22,'+
      ' case data0023.status when 0 then ''有效'' when 1 then ''无效'' end as supper_statu,data0028.*'+
      ' from   data0028 inner join'+
      ' data0017 on data0028.inventory_ptr=data0017.rkey inner join'+
      ' data0023 on data0028.supplier_ptr=data0023.rkey  inner join'+
      ' data0001 on data0028.currency_ptr=data0001.rkey inner join'+
      ' data0002 on data0028.purchase_unit_ptr=data0002.rkey left join'+
      ' data0805 on data0028.prot_report_ptr=data0805.rkey'+
      ' where  1=1 ';


     if trim(FMainWhere) = '' then
     FMainWhere := ' and 1=2 ';

    FOrderby := ' order by data0028.rkey  ';

  inherited;
       //showmessage(cdsmain.commandtext);
  except on e:Exception do
  begin
  ShowMessage('错误：'+e.Message);
  exit;
  end;

  end;
end;


procedure TFrmMainVendorPrice_Mod26.GetValue(Afrm: TfrmEdit_mod26);
var
Lsql:string;
begin
    if cdsMain.FieldByName('rohs').asstring<>'' then
   Afrm.cbb_Grade.Text:=cdsMain.FieldByName('rohs').value;

   if cdsMain.FieldByName('IF_CAF').asstring<>'' then
   Afrm.cbb_caf.Text:=cdsMain.FieldByName('IF_CAF').value;

   //认可标记
  if cdsMain.FieldByName('AVL_FLAG').AsString='Y' then
   Afrm.cbb_IfAVL.Text:='已认可'
  else if cdsMain.FieldByName('AVL_FLAG').AsString='N' then
  Afrm.cbb_IfAVL.Text:='未认可'
  else
  Afrm.cbb_IfAVL.Text:='暂时认可' ;

   //是否含税：  tax_flag
   if cdsMain.FieldByName('tax_flag').AsString='Y' then
   Afrm.chk_IfTax.Checked:=True
  else
  Afrm.chk_IfTax.Checked:=false;

  if cdsMain.FieldByName('AMT_QUAN_FLAG').asinteger>0 then
  if cdsMain.FieldByName('AMT_QUAN_FLAG').value=1 then
   Afrm.cbb_PMethod.Text:='数量'
  else    if cdsMain.FieldByName('AMT_QUAN_FLAG').value=2 then
  Afrm.cbb_PMethod.Text:='金额' ;

  rg_type.ItemIndex:= cdsMain.FieldByName('quote_type').asinteger;

  //最后修改人员
  Lsql:=' select employee_name  from data0005 where rkey='+cdsmain.fieldbyname('EMPLOYEE_PTR').asstring;
  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdstemp.isempty then
  Afrm.edt_ModiMan.text:=cdstemp.fieldbyname('employee_name').asstring;

  //审批人员：
  Lsql:=' select USER_FULL_NAME  from data0073 where rkey='+cdsmain.fieldbyname('EDI_OUT_FORCST').asstring;
  if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
  if not cdstemp.isempty then
  Afrm.edt_AVLMan.text:=cdstemp.fieldbyname('USER_FULL_NAME').asstring;

end;

procedure TFrmMainVendorPrice_Mod26.mniAddClick(Sender: TObject);
var
Lfrm: TfrmEdit_mod26;
Lsql:string;
begin
  inherited;
  if not gfunc.CheckUserAuth(2, 25) then exit;

  LFrm:=TfrmEdit_mod26.Create(self);

  try
    if ((rg_type.ItemIndex=0) and (Fsupp_status='无效')) or
     ((rg_type.ItemIndex=1) and (FSTOP_PURCH='Y')) then  //按供应商来新增
   begin
    ShowMessage('该供应商或材料不允许新增档案!');
    Exit;
   end;

    if rg_type.ItemIndex=0 then
    begin
    LFrm.FType:=0;
    Lfrm.Frkey23:=IntToStr(edt_VOrMtrl.Tag);
    end
    else
    begin
    LFrm.FType:=1;
    Lfrm.Frkey17:=IntToStr(edt_VOrMtrl.Tag);
    end ;

     LFrm.FEditType:=1;

     Lfrm.initCtrlStatus;
     Lfrm.getdata('-1');
     Lfrm.AppendInfo(FType);


     if Lfrm.ShowModal=mrok then
     begin
       btnRefreshClick(Sender);
       cdsMain.last;
     end;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmMainVendorPrice_Mod26.mniCheckClick(Sender: TObject);
var
Lfrm: TfrmEdit_mod26;
Lrkey:Integer;
begin
  inherited;
  LFrm:=TfrmEdit_mod26.Create(self);

  try
    Lrkey := cdsMain.FieldByName('rkey').AsInteger;
    if rg_type.ItemIndex=0 then
    LFrm.FType:=0
    else
    Lfrm.FType:=1;

    LFrm.FEditType:=3;
    Lfrm.initCtrlStatus;
    Lfrm.getdata(cdsMain.FieldByName('rkey').AsString);
    Lfrm.GetInfo;


     if Lfrm.ShowModal=mrok then
     begin
       btnRefreshClick(Sender);
       cdsMain.Locate('rkey',Lrkey,[]);
     end;

  finally
    LFrm.Free;
  end;
end;

procedure TFrmMainVendorPrice_Mod26.mniDelClick(Sender: TObject);
var
Lsql:string;
Lcds28,Lcds28File,Lcds17:TClientDataSet;
LPostData:OleVariant ;
begin
  inherited;
   if not gfunc.CheckUserAuth(2, 25) then exit;
   if cdsMain.IsEmpty then   exit;

   Lcds28:=TClientDataSet.Create(self);
   Lcds28File:=TClientDataSet.Create(self);
   Lcds17:=TClientDataSet.Create(self);
 try

     //删28/328
    Lsql:='select * from data0028 where rkey='+cdsMain.FieldByName('rkey').AsString;

      gSvrIntf.IntfGetDataBySql(Lsql,Lcds28);

      if not Lcds28.IsEmpty then
      Lcds28.Delete;

     //删data0028_FileList
     Lsql:='select * from data0028_FileList where rkey28='+cdsMain.FieldByName('rkey').AsString;
     gSvrIntf.IntfGetDataBySql(Lsql,Lcds28File);
     if not Lcds28File.IsEmpty  then Lcds28File.Delete;
   
    //更新17的pref_supplier_ptr
    Lsql:='select * '+
        ' from data0017  '+
         ' where data0017.rkey='+cdsmain.FieldByName('INVENTORY_PTR').AsString +
        ' and exists (select rkey from data0023  where  data0017.PREF_SUPPLIER_PTR=data0023.rkey '+
        ' and data0023.rkey='+cdsmain.FieldByName('SUPPLIER_PTR').AsString +')';

     gSvrIntf.IntfGetDataBySql(Lsql,Lcds17);

   if not Lcds17.IsEmpty then
   begin
    Lcds17.Edit;
    Lcds17.FieldByName('pref_supplier_ptr').Value:=null;
    Lcds17.Post;
   end;

        LPostData := varArrayCreate([0, 2], varVariant);
        if Lcds28.ChangeCount>0 then
        LPostData[0] := Lcds28.Delta;
        if Lcds28File.ChangeCount>0 then
        LPostData[1] := Lcds28File.Delta;
        if Lcds17.ChangeCount>0 then
        LPostData[2] := Lcds17.Delta;

          if gSvrIntf.IntfPostModData('公共基础', 26, LPostData,2) then
          begin
            Lcds28.MergeChangeLog;
            Lcds28File.MergeChangeLog;
            Lcds17.MergeChangeLog;
            btnRefreshClick(sender);
           end;

 finally
  Lcds28.free;
  Lcds28File.Free;
  Lcds17.Free;
 end;

end;

procedure TFrmMainVendorPrice_Mod26.mniEditClick(Sender: TObject);
var
Lfrm: TfrmEdit_mod26;
Lrkey:integer;
begin
  inherited;

  if not gfunc.CheckUserAuth(2, 25) then exit;

  LFrm:=TfrmEdit_mod26.Create(self);

  try

    Lrkey:=cdsMain.FieldByName('rkey').AsInteger;

    if rg_type.ItemIndex=0 then
    LFrm.FType:=0
    else
    Lfrm.FType:=1;

     LFrm.FEditType:=2;
     Lfrm.initCtrlStatus;
     Lfrm.getdata(cdsMain.FieldByName('rkey').AsString);

     Lfrm.GetInfo;
     Lfrm.Frkey23:=cdsMain.FieldByName('SUPPLIER_PTR').AsString;
     Lfrm.Frkey17:=cdsMain.FieldByName('INVENTORY_PTR').AsString;

     if Lfrm.ShowModal=mrok then
     begin
       btnRefreshClick(Sender);
       cdsMain.Locate('rkey',Lrkey,[]);
     end;

  finally
    LFrm.Free;
  end;
end;

Procedure TFrmMainVendorPrice_Mod26.mniPChangeClick(Sender: TObject);
var
Lfrm:TfrmChangQry_mod26;
Lsql:string;
T1,T2:string;
begin
  inherited;
 Lfrm:=TfrmChangQry_mod26.Create(self);
 try
   Lfrm.dtpk1.Date:= IncMonth(gFunc.GetSvrDateTime(),-1);
   Lfrm.dtpk2.Date:= gFunc.GetSvrDateTime();
   T1:= FormatDateTime('yyyy-MM-dd hh:mm:ss',Lfrm.dtpk1.Date);
   T2:=FormatDateTime('yyyy-MM-dd hh:mm:ss',Lfrm.dtpk2.Date);
   Lsql:= ' and data0328.sys_longdate>='''+T1+''' '+
          ' and data0328.sys_longdate<='''+T2+''' '+
          ' and data0328.price_ptr='+cdsmain.FieldByName('rkey').AsString +
          ' order by data0328.sys_longdate';
      Lfrm.InitWithPickID(26,6,Lsql);
      Lfrm.eh1.visible:=true;
      Lfrm.pnl_chart.Visible:=false;

      LFrm.Frkey:=cdsMain.FieldByName('rkey').AsString;
     // showmessage(Lsql);
    Lfrm.GetData328(cdsMain.FieldByName('rkey').AsString,T1, T2 );
    Lfrm.showmodal;
 finally
   Lfrm.Free;
 end;
end;

procedure TFrmMainVendorPrice_Mod26.pmMainPopup(Sender: TObject);
begin
  inherited;
  mniAdd.Enabled:=(Trim(edt_VOrMtrl.Text)<>'');
  mniEdit.Enabled:=(cdsMain.RecordCount>0);
  mniCheck.Enabled:=mniEdit.Enabled;
  mniDel.Enabled:=mniEdit.Enabled;
  mniPChange.Enabled:=(Trim(edt_VOrMtrl.Text)<>'');

end;

procedure TFrmMainVendorPrice_Mod26.rg_typeClick(Sender: TObject);
begin
  inherited;
    if rg_type.ItemIndex=0 then
    begin
    lbl_type.Caption:='供应商代码' ;
    ehMain.Columns[0].Visible:=true;
    ehMain.Columns[1].Visible:=true;
    ehMain.Columns[2].Visible:=false;
    ehMain.Columns[3].Visible:=false;
    FType:=0;

    edt_VOrMtrl.text:='';
    lbl_Name.caption:='';
    FMainWhere:=' and 1=2' ;
    GetData();

    end
    else
    begin
    lbl_type.Caption:='材料代码' ;
    ehMain.Columns[2].Visible:=true;
    ehMain.Columns[3].Visible:=true;
    ehMain.Columns[0].Visible:=False;
    ehMain.Columns[1].Visible:=False;
    FType:=1;
    btn_CopyMtrls.Enabled:=false;

       edt_VOrMtrl.text:='';
       lbl_Name.caption:='';
       FMainWhere:=' and 1=2' ;
       GetData();
    end;

end;

end.

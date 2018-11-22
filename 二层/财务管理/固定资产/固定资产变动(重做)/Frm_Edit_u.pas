unit Frm_Edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DBCtrls, Mask,
  ComCtrls, DB, DBCtrlsEh, Menus;

type
  TFrm_Edit = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnSave: TBitBtn;
    DS5: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit21: TDBEdit;
    Panel5: TPanel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    DBGridEh3: TDBGridEh;
    DS2: TDataSource;
    DS3: TDataSource;
    Label2: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label44: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    Panel3: TPanel;
    PageControl5: TPageControl;
    TabSheet5: TTabSheet;
    DBGridEh1: TDBGridEh;
    Label19: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label20: TLabel;
    DBMemo1: TDBMemo;
    DS327: TDataSource;
    DS: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BtAcct: TSpeedButton;
    CBstatus: TComboBox;
    CBfac: TComboBox;
    EdtGL_desc: TEdit;
    EdtGL_number: TEdit;
    CBType: TComboBox;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure BtAcctClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FisEdit:boolean;
    function saveVld:boolean;
  public
    Fopration:integer;
    FArryfac:array of integer;
    FArryStatus : array of integer;
    FArryType : array of integer;
    procedure init;
    { Public declarations }
  end;

var
  Frm_Edit: TFrm_Edit;

implementation
 uses DM_u,common,Frm_tree_u,Frm_origVal_u,Frm_DeprDept_u;
{$R *.dfm}

{ TFrm_Edit }

procedure TFrm_Edit.init;
   procedure init327(isNew:boolean);
   var i:integer;
   begin
     if isNew then
     begin
       DM.ADO327_1.Close;
       DM.ADO327_1.Parameters[0].Value:=0;
       DM.ADO327_1.Open;    //打开空记录

       DM.ADO327_1.Append;   //插入当前值
       DM.ADO327_1.FieldByName('fasset_ptr').Value:=DM.ADO517_1.fieldbyname('rkey').Value;

       DM.tmp.Close;
       DM.tmp.SQL.Text:='select curr_fyear,curr_period from data0508';
       DM.tmp.Open;

       DM.ADO327_1.FieldByName('alter_date').Value:=encodedate(DM.tmp.Fields[0].asinteger,DM.tmp.Fields[1].asinteger,15);
       DM.ADO327_1.FieldByName('alter_type').Value:=Fopration;

       DM.ADO327_1.FieldByName('ORIGINAL_VALUE').Value:=DM.ADO517_1.fieldbyname('ORIGINAL_VALUE').Value;
       DM.ADO327_1.FieldByName('SUMMED_DEPRE').Value:=DM.ADO517_1.fieldbyname('SUMMED_DEPRE').Value;
       DM.ADO327_1.FieldByName('NET_VALUE').Value:=DM.ADO517_1.fieldbyname('NET_VALUE').Value;

       DM.ADO327_1.FieldByName('LOCATION').Value:=DM.ADO517_1.fieldbyname('LOCATION').Value;
       DM.ADO327_1.FieldByName('SURPLUS_RATE').Value:=DM.ADO517_1.fieldbyname('SURPLUS_RATE').Value;
       DM.ADO327_1.FieldByName('SURPLUS').Value:=DM.ADO517_1.fieldbyname('SURPLUS').Value;

       DM.ADO327_1.FieldByName('DEPRE_MTHD_PTR').Value:=DM.ADO517_1.fieldbyname('DEPRE_MTHD_PTR').Value;
       DM.ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS').Value:=DM.ADO517_1.fieldbyname('EXPECTED_LIFE_MONTHS').Value;
       DM.ADO327_1.FieldByName('DEPRED_MONTHS').Value:=DM.ADO517_1.fieldbyname('DEPRED_MONTHS').Value;

       DM.ADO327_1.FieldByName('MONTH_DEPRE_RATE').Value:=DM.ADO517_1.fieldbyname('MONTH_DEPRE_RATE').Value;
       DM.ADO327_1.FieldByName('MONTH_DEPRE_AMT').Value:=DM.ADO517_1.fieldbyname('MONTH_DEPRE_AMT').Value;
       DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR').Value:=DM.ADO517_1.fieldbyname('DEPRE_ACCT_PTR').Value;

       DM.ADO327_1.FieldByName('alter_by_ptr').Value:=strtoint(user_ptr);
       DM.ADO327_1.FieldByName('fasset_type_ptr').Value:=DM.ADO517_1.fieldbyname('fasset_type_ptr').Value;
       DM.ADO327_1.FieldByName('status_ptr').Value:=DM.ADO517_1.fieldbyname('status_ptr').Value;

       DM.ADO327_1.FieldByName('DEPT_PTR').Value:=DM.ADO517_1.fieldbyname('warehouse_ptr').Value; //工厂
       //&&&&&&&&&&&&&&&&&&&&&&&&&&&&

       DM.ADO327_1.FieldByName('LOCATION_1').Value:=DM.ADO327_1.FieldByName('LOCATION').Value;
       DM.ADO327_1.FieldByName('dept_ptr_1').Value:=DM.ADO327_1.FieldByName('DEPT_PTR').Value;
       DM.ADO327_1.FieldByName('fasset_type_ptr_1').Value:=DM.ADO327_1.FieldByName('fasset_type_ptr').Value;
       DM.ADO327_1.FieldByName('status_ptr_1').Value:=DM.ADO327_1.FieldByName('status_ptr').Value;

       DM.ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').Value:=DM.ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS').Value;
       DM.ADO327_1.FieldByName('SURPLUS_RATE_1').Value:=DM.ADO327_1.FieldByName('SURPLUS_RATE').Value;

       DM.ADO327_1.FieldByName('ORIGINAL_VALUE_1').Value:=DM.ADO327_1.FieldByName('ORIGINAL_VALUE').Value;
       DM.ADO327_1.FieldByName('SUMMED_DEPRE_1').Value:=DM.ADO327_1.FieldByName('SUMMED_DEPRE').Value;
       DM.ADO327_1.FieldByName('NET_VALUE_1').Value:=DM.ADO327_1.FieldByName('NET_VALUE').Value;


       DM.ADO327_1.FieldByName('SURPLUS_1').Value:=DM.ADO327_1.FieldByName('SURPLUS').Value;
       DM.ADO327_1.FieldByName('DEPRE_MTHD_PTR_1').Value:=DM.ADO327_1.FieldByName('DEPRE_MTHD_PTR').Value;
       DM.ADO327_1.FieldByName('DEPRED_MONTHS_1').Value:=DM.ADO327_1.FieldByName('DEPRED_MONTHS').Value;

       DM.ADO327_1.FieldByName('MONTH_DEPRE_RATE_1').Value:=DM.ADO327_1.FieldByName('MONTH_DEPRE_RATE').Value;
       DM.ADO327_1.FieldByName('MONTH_DEPRE_AMT_1').Value:=DM.ADO327_1.FieldByName('MONTH_DEPRE_AMT').Value;
       DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR_1').Value:=DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR').Value;
     end else begin   //edit or look
       DS5.DataSet:=DM.ADO327_2;   //变更前
       DM.ADO327_2.Close;
       DM.ADO327_2.Parameters[0].Value:=DM.ADO327rkey.Value;
       DM.ADO327_2.Open;

       DM.ADO325_2.Close;
       DM.ADO325_2.Parameters[0].Value:=-1;
       DM.ADO325_2.Parameters[1].Value:=DM.ADO327rkey.Value;
       DM.ADO325_2.Parameters[2].Value:=1;
       DM.ADO325_2.Open;
       if not DM.ADO325_2.IsEmpty  then DS2.DataSet:=DM.ADO325_2;

       DM.ADO326_2.Close;
       DM.ADO326_2.Parameters[0].Value:=-1;
       DM.ADO326_2.Parameters[1].Value:=DM.ADO327rkey.Value;
       DM.ADO326_2.Parameters[2].Value:=1;
       DM.ADO326_2.Open;
       if not DM.ADO326_2.IsEmpty  then DS3.DataSet:=DM.ADO326_2;

       DM.ADO327_1.Close;
       DM.ADO327_1.Parameters[0].Value:=DM.ADO327rkey.Value;
       DM.ADO327_1.Open;
       DM.ADO327_1.Edit;
     end;

     if DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR_1').AsString<>'' then
     begin
       DM.tmp.Close;
       DM.tmp.SQL.Text:='select gl_acc_number,gl_description from data0103 where rkey='+DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR_1').AsString;
       DM.tmp.Open;
       EdtGL_number.Text:=DM.tmp.fields[0].AsString;  //累计折旧
       EdtGL_desc.Text:=DM.tmp.fields[1].AsString;
     end;

     DM.tmp.Close;
     DM.tmp.SQL.Text:='select rkey,abbr_name from data0015 order by 1';
     DM.tmp.Open;
     i:=0;
     setlength(FArryfac,DM.tmp.RecordCount);
     while not DM.tmp.Eof do                              //工厂
     begin
       FArryfac[i]:=DM.tmp.fields[0].asinteger;
       CBfac.Items.Append(DM.tmp.fields[1].asstring);
       if DM.tmp.fields[0].asinteger=DM.ADO327_1.FieldByName('dept_ptr_1').Value then
         CBfac.ItemIndex:=i;
       DM.tmp.Next;
       inc(i);
     end;

     DM.tmp.Close;
     DM.tmp.SQL.Text:='select rkey,fasset_status from data0516 order by 1';
     DM.tmp.Open;
     i:=0;
     setlength(FArryStatus,DM.tmp.RecordCount);
     while not DM.tmp.Eof do
     begin                                                  //状态
       FArryStatus[i]:=DM.tmp.fields[0].asinteger;
       CBstatus.Items.Append(DM.tmp.fields[1].asstring);
       if DM.tmp.fields[0].asinteger=DM.ADO327_1.FieldByName('status_ptr_1').Value then
         CBstatus.ItemIndex:=i;
       DM.tmp.Next;
       inc(i);
     end;

     DM.tmp.Close;
     DM.tmp.SQL.Text:='select rkey,fasset_type from data0514 order by 1';
     DM.tmp.Open;
     i:=0;
     setlength(FArryType,DM.tmp.RecordCount);
     while not DM.tmp.Eof do                                 //类别
     begin
       FArryType[i]:=DM.tmp.fields[0].asinteger;
       CBtype.Items.Append(DM.tmp.fields[1].asstring);
       if DM.tmp.fields[0].asinteger=DM.ADO327_1.FieldByName('fasset_type_ptr_1').Value then
         CBtype.ItemIndex:=i;
       DM.tmp.Next;
       inc(i);
     end;
   end;

   procedure disableCtl;
   begin
     CBType.Enabled:=false;
     CBstatus.Enabled:=false;
     DBEdit31.Enabled:=false;
     CBfac.Enabled:=false;
     DBEdit35.Enabled:=false;
     DBEdit33.Enabled:=false;
     BtAcct.Enabled:=false;
   end;
begin
  case Fopration of
    1:     //325 add
    begin
      self.Caption:=self.Caption+'  [原值变更]';
      init327(true);
      disableCtl;
      DM.ADO325_1.Close;
      DM.ADO325_1.Parameters[0].Value:=DM.ADO517rkey.Value;
      DM.ADO325_1.Parameters[1].Value:=-1;
      DM.ADO325_1.Parameters[2].Value:=0;
      DM.ADO325_1.Open;
      DS.DataSet:=DM.ADO325_1;
    end ;
    2:    //326 add
    begin
      self.Caption:=self.Caption+'  [部门变更]';
      init327(true);
      disableCtl;
      PageControl5.Pages[0].Caption:='使用部门信息';
      DM.ADO326_1.Close;
      DM.ADO326_1.Parameters[0].Value:=DM.ADO517rkey.Value;
      DM.ADO326_1.Parameters[1].Value:=-1;
      DM.ADO326_1.Parameters[2].Value:=0;
      DM.ADO326_1.Open;
      DS.DataSet:=DM.ADO326_1;
    end;
    3:      //other add
    begin
      self.Caption:=self.Caption+'  [其它变更]';
      DBGridEh1.Visible:=false;
      PageControl5.Visible:=false;
      init327(true);
    end;
    4,8:    //edit or look
    begin
      if Fopration=8 then BtnSave.Enabled:=false;
      init327(false);
      if (DM.ADO327alter_type.Value=1) or (DM.ADO327alter_type.Value=2) then disableCtl;
      if DM.ADO327alter_type.Value=1 then
      begin
        self.Caption:=self.Caption+'  [原值变更]';
        DM.ADO325_1.Close;
        DM.ADO325_1.Parameters[0].Value:=-1;
        DM.ADO325_1.Parameters[1].Value:=DM.ADO327rkey.Value;
        DM.ADO325_1.Parameters[2].Value:=2;
        DM.ADO325_1.Open;
        DS.DataSet:=DM.ADO325_1;
      end else if DM.ADO327alter_type.Value=2 then
      begin
        self.Caption:=self.Caption+'  [部门变更]';
        PageControl5.Pages[0].Caption:='使用部门信息';
        DM.ADO326_1.Close;
        DM.ADO326_1.Parameters[0].Value:=-1;
        DM.ADO326_1.Parameters[1].Value:=DM.ADO327rkey.Value;
        DM.ADO326_1.Parameters[2].Value:=2;
        DM.ADO326_1.Open;
        DS.DataSet:=DM.ADO326_1;
      end else
      begin
        self.Caption:=self.Caption+'  [其它变更]';
        DBGridEh1.Visible:=false;
        PageControl5.Visible:=false;
      end;
    end;

  end;
end;

procedure TFrm_Edit.PopupMenu1Popup(Sender: TObject);
begin
  if Fopration=8 then abort; 
  N2.Enabled:=not DBGridEh1.DataSource.DataSet.IsEmpty;
  N3.Enabled:=N2.Enabled;
end;

function TFrm_Edit.saveVld:boolean;
var Y,M,D:word;
    H:real;
    dept_ptr:integer;
begin
  result:=false;
  if trim(DBMemo1.Text)='' then
  begin
    showmessage('请输入变更原因后再保存');
    exit;
  end;

  if (DBEdit35.Field.AsInteger<1) or (DBEdit35.Field.AsInteger>840) then
  begin
    showmessage('预计使用月份不正确...');
    exit;
  end;
  if (DBEdit33.Field.AsInteger<=0) or (DBEdit33.Field.AsInteger>=100) then
  begin
    showmessage('输入残值率不正确...');
    exit;
  end;
  if trim(EdtGL_number.Text)='' then
  begin
    showmessage('输入累计折旧科目...');
    exit;
  end;

  if DBGridEh1.Visible and DBGridEh1.DataSource.DataSet.IsEmpty then
  begin
    if Fopration=1 then
      showmessage('请输入固定资产原值...')
    else
      showmessage('请输入固定资产使用部门...') ;
    exit;
  end;

  if DBGridEh1.Visible and (DBGridEh1.DataSource.DataSet=DM.ADO326_1) then
  begin
    H:=0;                         //检查使用部门重复及%比合法性
    DM.ADO326_1.First;
    while not DM.ADO326_1.Eof do
    begin
      H:=H+DM.ADO326_1PERCENTS.Value;
      dept_ptr:=DM.ADO326_1dept_ptr.AsInteger;
      DM.ADO326_1.Filter:='dept_ptr='+DM.ADO326_1dept_ptr.AsString;
      DM.ADO326_1.Filtered:=true;
      if DM.ADO326_1.RecordCount >1 then
      begin
        ShowMsg('部门不允许重复',1);
        DM.ADO326_1.Filtered:=false;
        DM.ADO326_1.Filter:='';
        exit;
      end
      else
      begin
        DM.ADO326_1.Filter:='';
        DM.ADO326_1.Filtered:=false;
        DM.ADO326_1.Locate('dept_ptr',dept_ptr,[]);
      end;
      DM.ADO326_1.Next;
    end;
    if H<>100 then
    begin
      showmessage('使用部门%比不合法...');
      exit;
    end;
  end;
  
  DecodeDate(DM.ADO327_1.FieldByName('alter_date').AsDateTime,Y,M,D);
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select curr_fyear,curr_period,depre_flag from data0508';
  DM.tmp.Open;
  if (Y<>DM.tmp.Fields[0].AsInteger) or (M<>DM.tmp.Fields[1].AsInteger) then
  begin
    showmessage('变更日期必须为当前会计期间:'+DM.tmp.Fields[0].asstring+'/'+DM.tmp.Fields[1].asstring);
    exit;
  end;
  if DM.tmp.Fields[2].AsInteger=1 then
  begin
    showmessage('当前会计期间已提取折旧,不能再变更操作,请退出');
    exit;
  end;
  result:=true;
end;

procedure TFrm_Edit.CBTypeChange(Sender: TObject);
begin
  DM.ADO327_1.Edit;
  case TComboBox(Sender).Tag of
    0: DM.ADO327_1.FieldByName('fasset_type_ptr_1').Value:=FArryType[TComboBox(Sender).ItemIndex];
    1: DM.ADO327_1.FieldByName('status_ptr_1').Value:=FArryStatus[TComboBox(Sender).ItemIndex];
    2: DM.ADO327_1.FieldByName('dept_ptr_1').Value:=FArryfac[TComboBox(Sender).ItemIndex];
  end;
end;

procedure TFrm_Edit.BtAcctClick(Sender: TObject);
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='SELECT Rkey, isnull(PARENT_PTR,9999) PARENT ,GL_ACC_NUMBER+'' ''+GL_DESCRIPTION nm,GL_ACC_NUMBER,GL_DESCRIPTION '+
                    'FROM Data0103 where acc_Tp=1 order by GL_ACC_NUMBER';
  DM.tmp.Open;
  if DM.tmp.IsEmpty then
  begin
    DM.tmp.Close;
    showmessage('会计科目档案为空...');
    exit;
  end;

  if TFrm_tree.getStr(DM.tmp,9999,true,'会计科目查找','所有资产类科目') then
  begin
    DM.ADO327_1.Edit;
    EdtGL_number.Text:=DM.tmp.Fields[3].AsString;
    EdtGL_desc.Text:=DM.tmp.Fields[4].AsString;
    DM.ADO327_1.FieldByName('depre_acct_ptr_1').Value:=DM.tmp.Fields[0].AsInteger;
    DM.tmp.Close;
  end;
end;


procedure TFrm_Edit.BtnSaveClick(Sender: TObject);
var evt:TDataSetNotifyEvent;
begin
  if saveVld then
  try
    self.SelectNext(self.ActiveControl,true,true);
    DM.ADOCon.BeginTrans;
    if DM.ADO327_1.State in [dsEdit,dsInsert] then DM.ADO327_1.Post;
    DM.ADO327_1.UpdateBatch;
    if Fopration=1 then  //add 325
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='insert into data0325 (fasset_ptr, curr_ptr, d327_ptr, ex_rate, orig_curr_orig_value, chgType) '+
                       'SELECT null, curr_ptr,'+DM.ADO327_1rkey.AsString+', ex_rate, orig_curr_orig_value, 1 ' +
                       'FROM data0325 where fasset_ptr='+DM.ADO517rkey.asstring+' and chgtype=0';
      DM.tmp.ExecSQL;        //插入变更前325

      DM.ADO325_1.First;
      evt:=DM.ADO325_1.AfterPost;
      DM.ADO325_1.AfterPost:=nil;
      while not DM.ADO325_1.Eof do
      begin
        DM.ADO325_1.Edit;
        Dm.ADO325_1chgType.Value:=0;
        DM.ADO325_1fasset_ptr.value:=DM.ADO517rkey.asinteger;
        DM.ADO325_1d327_ptr.AsVariant:=null;
        DM.ADO325_1.Post;
        DM.ADO325_1.Next;
      end;
      DM.ADO325_1.AfterPost:=evt;
      DM.ADO325_1.UpdateBatch;   //保存当前325


      DM.tmp.Close;            //插入变更后325
      DM.tmp.SQL.Text:='insert into data0325 (fasset_ptr, curr_ptr, d327_ptr, ex_rate, orig_curr_orig_value, chgType) '+
                       'SELECT null, curr_ptr,'+DM.ADO327_1rkey.AsString+', ex_rate, orig_curr_orig_value, 2 ' +
                       'FROM data0325 where fasset_ptr='+DM.ADO517rkey.asstring;
      DM.tmp.ExecSQL;
    end else if Fopration=2 then  //add 326
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='insert into data0326 (fasset_ptr, dept_ptr, FACCU_DEPT_GL_PTR, d327_ptr, PERCENTS, chgType) '+
                       'SELECT null, dept_ptr, FACCU_DEPT_GL_PTR,'+DM.ADO327_1rkey.AsString+', PERCENTS,1 ' +
                       'FROM data0326 where fasset_ptr='+DM.ADO517rkey.asstring+' and chgtype=0';
      DM.tmp.ExecSQL;

      DM.ADO326_1.First;
      while not DM.ADO326_1.Eof do
      begin
        Dm.ADO326_1.Edit;
        Dm.ADO326_1chgType.Value:=0;
        DM.ADO326_1fasset_ptr.value:=DM.ADO517rkey.asinteger;
        DM.ADO326_1d327_ptr.AsVariant:=null;
        DM.ADO326_1.Post;
        DM.ADO326_1.Next;
      end;
      DM.ADO326_1.UpdateBatch;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='insert into data0326 (fasset_ptr, dept_ptr, FACCU_DEPT_GL_PTR, d327_ptr, PERCENTS, chgType) '+
                       'SELECT null, dept_ptr, FACCU_DEPT_GL_PTR,'+DM.ADO327_1rkey.AsString+', PERCENTS,2 ' +
                       'FROM data0326 where fasset_ptr='+DM.ADO517rkey.asstring;
      DM.tmp.ExecSQL;
    end else if Fopration=4 then    //edit
    begin
      if (Dm.ADO327alter_type.AsInteger=1) and FisEdit then   // edit 325
      begin
        DM.ADO325_1.First;
        evt:=DM.ADO325_1.AfterPost;
        DM.ADO325_1.AfterPost:=nil;
        while not DM.ADO325_1.Eof do
        begin
          DM.ADO325_1.Edit;
          Dm.ADO325_1chgType.Value:=2;
          DM.ADO325_1fasset_ptr.AsVariant:=null;
          DM.ADO325_1d327_ptr.Value:=Dm.ADO327rkey.AsInteger;
          DM.ADO325_1.Post;
          DM.ADO325_1.Next;
        end;
        DM.ADO325_1.AfterPost:=evt;
        DM.ADO325_1.UpdateBatch;

        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from data0325 where fasset_ptr='+DM.ADO517rkey.asstring;
        DM.tmp.ExecSQL;           //当前325
        DM.tmp.SQL.Text:='insert into data0325 (fasset_ptr, curr_ptr, d327_ptr, ex_rate, orig_curr_orig_value, chgType) '+
                         'SELECT '+DM.ADO517rkey.asstring+', curr_ptr,null, ex_rate, orig_curr_orig_value, 0 ' +
                         'FROM data0325 where chgType=2 and d327_ptr='+Dm.ADO327rkey.asstring;
        DM.tmp.ExecSQL;
      end else if (Dm.ADO327alter_type.AsInteger=2) and FisEdit  then   //edit 326
      begin
        DM.ADO326_1.First;
        while not DM.ADO326_1.Eof do
        begin
          Dm.ADO326_1.Edit;
          Dm.ADO326_1chgType.Value:=2;
          DM.ADO326_1fasset_ptr.AsVariant:=null;
          DM.ADO326_1d327_ptr.AsInteger:=Dm.ADO327rkey.Value;
          DM.ADO326_1.Post;
          DM.ADO326_1.Next;
        end;
        DM.ADO326_1.UpdateBatch;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from data0326 where fasset_ptr='+DM.ADO517rkey.asstring;
        DM.tmp.ExecSQL;           //当前326
        DM.tmp.SQL.Text:='insert into data0326 (fasset_ptr, dept_ptr, FACCU_DEPT_GL_PTR, d327_ptr, PERCENTS, chgType) '+
                         'SELECT '+DM.ADO517rkey.asstring+', dept_ptr, FACCU_DEPT_GL_PTR,null, PERCENTS,0 ' +
                         'FROM data0326 where chgType=2 and d327_ptr='+Dm.ADO327rkey.asstring;
        DM.tmp.ExecSQL;
      end;
    end;
    
    DM.tmp.Close;
    DM.tmp.SQL.Text:='update data0517 set warehouse_ptr=b.dept_ptr_1, fasset_type_ptr=b.fasset_type_ptr_1,'+
                                          'status_ptr=b.status_ptr_1, ORIGINAL_VALUE=b.ORIGINAL_VALUE_1,'+
                                          'NET_VALUE=b.NET_VALUE_1,LOCATION=b.LOCATION_1,'+
                                          'SURPLUS_RATE=b.SURPLUS_RATE_1, SURPLUS=b.SURPLUS_1,'+
                                          'EXPECTED_LIFE_MONTHS=b.EXPECTED_LIFE_MONTHS_1, MONTH_DEPRE_RATE=b.MONTH_DEPRE_RATE_1,'+
                                          'MONTH_DEPRE_AMT=b.MONTH_DEPRE_AMT_1, DEPRE_ACCT_PTR=b.DEPRE_ACCT_PTR_1 '+
                     'from data0517 d517 inner join data0327 b on d517.rkey=b.fasset_ptr '+
                     'where b.rkey='+DM.ADO327_1rkey.AsString ;

    if DM.tmp.ExecSQL=0 then
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('保存变更失败,记录已被其他人删除...');
    end else DM.ADOCon.CommitTrans;
    modalresult:=mrok;
  except
    on e:exception do
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('保存数据发生错误:'+e.Message);
    end;
  end;

end;

procedure TFrm_Edit.N1Click(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    0,1:
    begin
      if TMenuItem(Sender).Tag=0 then DS.DataSet.Append else DS.DataSet.Edit;
      if DS.DataSet=DM.ADO325_1 then
        with TFrm_origVal.Create(nil) do
        try
          init;
          if showmodal=mrok then begin DS.DataSet.Post;FisEdit:=true;end else DS.DataSet.Cancel;
        finally
           free;
        end
      else
        with TFrm_DeprDept.Create(nil) do
        try
          if showmodal=mrok then begin DS.DataSet.Post;FisEdit:=true; end else DS.DataSet.Cancel;
        finally
           free;
        end
    end;
    2:begin DS.DataSet.Delete;FisEdit:=true;end;
  end;
end;

procedure TFrm_Edit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) and not (ActiveControl is TDBmemo) then
    SelectNext(ActiveControl,true,true);
end;

end.

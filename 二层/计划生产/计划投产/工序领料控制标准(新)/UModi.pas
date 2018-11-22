unit UModi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGridEh, Menus, DB, ADODB;

type
  TfrmModi = class(TForm)
    pnl2: TPanel;
    pnl5: TPanel;
    btn_save: TButton;
    btn_cancel: TButton;
    dbgrdh_process: TDBGridEh;
    dbgrdh_prod: TDBGridEh;
    dbgrdh_man: TDBGridEh;
    pm_process: TPopupMenu;
    pm_man: TPopupMenu;
    pm_prod: TPopupMenu;
    N_addProcess: TMenuItem;
    N_DelProcess: TMenuItem;
    N_AddMateriel: TMenuItem;
    N_DelMateriel: TMenuItem;
    N_AddMan: TMenuItem;
    N_DelMan: TMenuItem;
    lbl19: TLabel;
    lbl21: TLabel;
    pnl1: TPanel;
    qry_process: TADOQuery;
    intgrfld_processcontrol_ptr: TIntegerField;
    intgrfld_processdept_ptr: TIntegerField;
    strngfld_processDSDesigner: TStringField;
    strngfld_processDSDesigner2: TStringField;
    ds_process: TDataSource;
    qry_materiel: TADOQuery;
    intgrfld_materielcontrol_ptr: TIntegerField;
    intgrfld_materielinvt_ptr: TIntegerField;
    strngfld_materielDSDesigner: TStringField;
    strngfld_materielDSDesigner2: TStringField;
    strngfld_materielDSDesigner3: TStringField;
    strngfld_materielDSDesigner4: TStringField;
    fltfld_materielDSDesigner5: TFloatField;
    fltfld_materielDSDesigner6: TFloatField;
    ds_materiel: TDataSource;
    qry_Man: TADOQuery;
    intgrfld_Manrkey136: TIntegerField;
    intgrfld_Mancsi_ptr: TIntegerField;
    strngfld_ManDSDesigner: TStringField;
    strngfld_ManDSDesigner2: TStringField;
    ds_man: TDataSource;
    qry_main: TADOQuery;
    qry_processSave: TADOQuery;
    qry_MaterielSave: TADOQuery;
    qry_ManSave: TADOQuery;
    intgrfld_MaterielSavecontrol_ptr: TIntegerField;
    intgrfld_MaterielSaveinvt_ptr: TIntegerField;
    intgrfld_ManSaverkey136: TIntegerField;
    intgrfld_ManSavecsi_ptr: TIntegerField;
    intgrfld_processSavecontrol_ptr: TIntegerField;
    intgrfld_processSavedept_ptr: TIntegerField;
    atncfld_mainrkey: TAutoIncField;
    strngfld_maincontrol_name: TStringField;
    intgrfld_mainunit_ptr: TIntegerField;
    intgrfld_mainwarehouse_ptr: TIntegerField;
    bcdfld_mainstan_consume: TBCDField;
    intgrfld_mainDeptId_P: TIntegerField;
    intgrfld_mainPurUnit: TIntegerField;
    intgrfld_mainUseUnit: TIntegerField;
    intgrfld_mainCRate: TIntegerField;
    intgrfld_mainPGroupID: TIntegerField;
    strngfld_mainproperty: TStringField;
    strngfld_mainproperty2: TStringField;
    strngfld_mainproperty3: TStringField;
    strngfld_mainproperty4: TStringField;
    blnfld_mainIsfreq: TBooleanField;
    fltfld_mainFDays: TFloatField;
    fltfld_mainFAMountUsed: TFloatField;
    strngfld_mainFRemark: TStringField;
    blnfld_mainIsMCount: TBooleanField;
    intgrfld_mainMCount: TIntegerField;
    fltfld_mainMUsed: TFloatField;
    strngfld_mainMRemark: TStringField;
    blnfld_mainIsSTime: TBooleanField;
    intgrfld_mainTCount: TIntegerField;
    fltfld_mainTUsed: TFloatField;
    strngfld_mainTRemark: TStringField;
    blnfld_mainIsFactor: TBooleanField;
    strngfld_mainFacName: TStringField;
    strngfld_mainFacRemark: TStringField;
    strngfld_mainremark: TStringField;
    intgrfld_mainFac_unit: TIntegerField;
    intgrfld_mainFacDay: TIntegerField;
    pnl6: TPanel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl34: TLabel;
    edt_factory: TEdit;
    edt_Process: TEdit;
    edt_name: TEdit;
    btn_selProcess: TButton;
    btn_selWH: TButton;
    lbl18: TLabel;
    lbl29: TLabel;
    lbl22: TLabel;
    lbl20: TLabel;
    edt_CRate: TEdit;
    edt_PurUnit: TEdit;
    edt_UseUnit: TEdit;
    edt_MType: TEdit;
    btn_MType: TButton;
    btn_SelUseUnit: TButton;
    btn_SelPurUnit: TButton;
    lbl26: TLabel;
    lbl25: TLabel;
    lbl24: TLabel;
    lbl23: TLabel;
    edt_property1: TEdit;
    edt_property2: TEdit;
    edt_property3: TEdit;
    edt_property4: TEdit;
    mmo1: TMemo;
    grp1: TGroupBox;
    lbl27: TLabel;
    blnfld_mainIsFormula: TBooleanField;
    strngfld_mainFormula_ptr: TStringField;
    edt_Facday: TEdit;
    lbl30: TLabel;
    Label3: TLabel;
    lbl31: TLabel;
    edt_FacUse: TEdit;
    qry_ManDSDesigner: TStringField;
    Panel1: TPanel;
    chk_freq: TCheckBox;
    lbl1: TLabel;
    edt_freq: TEdit;
    lbl2: TLabel;
    lbl4: TLabel;
    edt_FUse: TEdit;
    lbl3: TLabel;
    lbl5: TLabel;
    edt_Fremark: TEdit;
    lbl36: TLabel;
    chk_MCount: TCheckBox;
    lbl6: TLabel;
    edt_Mcount: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    edt_MUse: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    edt_Mremark: TEdit;
    lbl37: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    chk_fac: TCheckBox;
    Label1: TLabel;
    edt_FacName: TEdit;
    Label2: TLabel;
    edt_FacUnit: TEdit;
    btn_SelFacUnit: TButton;
    Label5: TLabel;
    edt_OUnit: TEdit;
    btn_Sel: TButton;
    Label6: TLabel;
    edt_facRemark: TEdit;
    Label7: TLabel;
    chk_format: TCheckBox;
    lbl28: TLabel;
    edt_Formula: TEdit;
    btn_SelFormula: TButton;
    chk_time: TCheckBox;
    edt_Tuse: TEdit;
    edt_TRemark: TEdit;
    lbl38: TLabel;
    lbl11: TLabel;
    lbl15: TLabel;
    edt_TCont: TEdit;
    procedure btn_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_selProcessClick(Sender: TObject);
    procedure btn_SelUseUnitClick(Sender: TObject);
    procedure btn_SelPurUnitClick(Sender: TObject);
    procedure btn_MTypeClick(Sender: TObject);
    procedure N_addProcessClick(Sender: TObject);
    procedure N_AddMaterielClick(Sender: TObject);
    procedure N_AddManClick(Sender: TObject);
    procedure N_DelProcessClick(Sender: TObject);
    procedure N_DelMaterielClick(Sender: TObject);
    procedure N_DelManClick(Sender: TObject);
    procedure chk_freqClick(Sender: TObject);
    procedure chk_MCountClick(Sender: TObject);
    procedure chk_timeClick(Sender: TObject);
    procedure chk_facClick(Sender: TObject);
    procedure edt_freqExit(Sender: TObject);
    procedure edt_FremarkExit(Sender: TObject);
    procedure edt_FUseExit(Sender: TObject);
    procedure edt_McountExit(Sender: TObject);
    procedure edt_MUseExit(Sender: TObject);
    procedure edt_MremarkExit(Sender: TObject);
    procedure edt_TuseExit(Sender: TObject);
    procedure edt_TContExit(Sender: TObject);
    procedure edt_TRemarkExit(Sender: TObject);
    procedure edt_FacNameExit(Sender: TObject);
    procedure edt_FacUnitExit(Sender: TObject);
    procedure edt_FacUseExit(Sender: TObject);
    procedure edt_OUnitExit(Sender: TObject);
    procedure edt_FacRemarkExit(Sender: TObject);
    procedure btn_SelFacUnitClick(Sender: TObject);
    procedure btn_SelOUnitClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_selWHClick(Sender: TObject);
    procedure btn_SelFormulaClick(Sender: TObject);
    procedure edt_RRateExit(Sender: TObject);
    procedure chk_formatClick(Sender: TObject);
  private
    { Private declarations }
    LSelSql:string;
    control_ptr:string;
   function  YesOrNo(txt: string;chk:TCheckBOx;info:string):BOOLean;
  public
    { Public declarations }
  end;

var
  frmModi: TfrmModi;

implementation
uses udm,common, Pick_Item_Single,ConstVar, UMain, USelProcess,
  USelMateriel, USelMan;

{$R *.dfm}

procedure TfrmModi.btn_cancelClick(Sender: TObject);
begin
close;
end;

procedure TfrmModi.FormShow(Sender: TObject);
var
  ssql: string;
begin
  LSelSql:= DM.qry_selProcess.SQL.Text;
 // pgc1.ActivePageIndex:=0;
  // pgc2.ActivePageIndex:=0;



  if dm.EFlag=1 then  //新增
  begin
   pnl1.Enabled:=true;
   pnl2.Enabled:=true;
   pnl5.Enabled:=true;
   mmo1.text:='';
   edt_name.readonly:=false;

   if not qry_processSave.Active  then qry_processSave.Open;
   if not qry_MaterielSave.Active  then qry_MaterielSave.Open;
   if not qry_ManSave.Active  then qry_ManSave.Open;



  with qry_Main  do
  begin
    Close;
    Parameters[0].Value:=-1;   // frmmain.qry_main.FieldByName('rkey').asinteger;
    Open;
  end;

   with qry_process  do
  begin
    Close;
    Parameters[0].Value:=-1;   // frmmain.qry_main.FieldByName('rkey').asinteger;
    Open;
  end;

  with qry_materiel  do
  begin
    Close;
    Parameters[0].Value:=-1;   // frmmain.qry_main.FieldByName('rkey').asinteger;
    Open;
  end;

  with qry_Man  do
  begin
    Close;
    Parameters[0].Value:=-1;   // frmmain.qry_main.FieldByName('rkey').asinteger;
    Open;
  end;
  end
  else if (dm.EFlag=2) or (dm.EFlag=3) then  //编辑
  begin
     edt_name.readonly:=true;
     
     with qry_main do
    begin
       Close;
       Parameters[0].value:= frmmain.qry_Main.fieldbyname('rkey').AsInteger;
       Open;
    end;

     control_ptr:= frmmain.qry_Main.fieldbyname('rkey').value;

   self.edt_name.Text:=qry_Main.fieldbyname('control_name').asstring;

   ssql:='select dept_name from data0034 where rkey='+inttostr(qry_Main.fieldbyname('DeptId_P').asinteger)+' ';
    self.edt_Process.Text:= dm.getone('dept_name',ssql,dm.qry_temp);
        edt_Process.tag:= qry_Main.fieldbyname('DeptId_P').asinteger;

    ssql:='select abbr_name from data0015 where rkey='+inttostr(qry_Main.fieldbyname('warehouse_ptr').asinteger)+' ';
    self.edt_factory.Text:= dm.getone('abbr_name',ssql,dm.qry_temp);
     edt_factory.tag:= qry_Main.fieldbyname('warehouse_ptr').asinteger;

    ssql:='select group_desc from data0496 where rkey='+inttostr(qry_Main.fieldbyname('PGroupID').asinteger)+' ';
    self.edt_MType.Text:= dm.getone('group_desc',ssql,dm.qry_temp);
     edt_MType.tag:= qry_Main.fieldbyname('PGroupID').asinteger;


      ssql:='select unit_name from data0002 where rkey='+inttostr(qry_Main.fieldbyname('UseUnit').asinteger)+' ';
    self.edt_UseUnit.Text:= dm.getone('unit_name',ssql,dm.qry_temp);
         edt_UseUnit.tag:= qry_Main.fieldbyname('UseUnit').asinteger;

       ssql:='select unit_name from data0002 where rkey='+inttostr(qry_Main.fieldbyname('PurUnit').asinteger)+' ';
    self.edt_PurUnit.Text:= dm.getone('unit_name',ssql,dm.qry_temp);
        edt_PurUnit.tag:= qry_Main.fieldbyname('PurUnit').asinteger;


    self.edt_CRate.text:=IntToStr(qry_Main.fieldbyname('CRate').asinteger);

    self.edt_property1.Text:=qry_Main.fieldbyname('property').asstring;
    self.edt_property2.Text:=qry_Main.fieldbyname('property2').asstring;
    self.edt_property3.Text:=qry_Main.fieldbyname('property3').asstring;
    self.edt_property4.Text:=qry_Main.fieldbyname('property4').asstring;

    self.mmo1.Text:=qry_Main.fieldbyname('remark').asstring;

   if  qry_Main.fieldbyname('Isfreq').AsBoolean=True then
     chk_freq.Checked:=true  else    chk_freq.Checked:=false;

       if  qry_Main.fieldbyname('IsMCount').AsBoolean=True then
     chk_MCount.Checked:=true  else    chk_MCount.Checked:=false;

    if  qry_Main.fieldbyname('IsSTime').AsBoolean=True then
     chk_time.Checked:=true  else    chk_time.Checked:=false;


       if  qry_Main.fieldbyname('IsFactor').AsBoolean=True then
     chk_fac.Checked:=true  else    chk_fac.Checked:=false;

       if  qry_Main.fieldbyname('IsFormula').AsBoolean=True then
     chk_format.Checked:=true  else    chk_format.Checked:=false;


     
    self.edt_freq.Text:=qry_Main.fieldbyname('FDays').asstring;
    self.edt_FUse.Text:=qry_Main.fieldbyname('FAMountUsed').asstring;
    self.edt_Fremark.Text:=qry_Main.fieldbyname('Fremark').asstring;

    self.edt_Mcount.Text:=qry_Main.fieldbyname('MCount').asstring;
    self.edt_MUse.Text:=qry_Main.fieldbyname('MUsed').asstring;
    self.edt_Mremark.Text:=qry_Main.fieldbyname('MRemark').asstring;

    self.edt_TCont.Text:=qry_Main.fieldbyname('TCount').asstring;
    self.edt_Tuse.Text:=qry_Main.fieldbyname('TUsed').asstring;
    self.edt_TRemark.Text:=qry_Main.fieldbyname('TRemark').asstring;

    self.edt_FacName.Text:=qry_Main.fieldbyname('FacName').asstring;
    self.edt_Facday.Text:=qry_Main.fieldbyname('Facday').asstring;

    self.edt_Formula.Text:=qry_Main.fieldbyname('Formula_ptr').asstring;




          ssql:='select rkey,unit_name from data0002 where rkey='+inttostr(qry_Main.fieldbyname('Fac_unit').asinteger)+' ';
    self.edt_FacUnit.Text:= dm.getone('unit_name',ssql,dm.qry_temp);
         edt_FacUnit.tag:= qry_Main.fieldbyname('Fac_unit').asinteger;

    self.edt_FacUse.Text:=qry_Main.fieldbyname('stan_consume').asstring;

      ssql:='select rkey,unit_name from data0002 where rkey='+inttostr(qry_Main.fieldbyname('unit_ptr').asinteger)+' ';
    self.edt_OUnit.Text:= dm.getone('unit_name',ssql,dm.qry_temp);
         edt_OUnit.tag:= qry_Main.fieldbyname('unit_ptr').asinteger;


    self.edt_FacRemark.Text:=qry_Main.fieldbyname('FacRemark').asstring;



   with qry_process  do
  begin
    Close;
    Parameters[0].Value:=  frmmain.qry_main.FieldByName('rkey').asinteger;
    Open;
  end;

  with qry_materiel  do
  begin
    Close;
    Parameters[0].Value:= frmmain.qry_main.FieldByName('rkey').asinteger;
    Open;
  end;

  with qry_Man  do
  begin
    Close;
    Parameters[0].Value:= frmmain.qry_main.FieldByName('rkey').asinteger;
    Open;
  end;

     
    if (dm.EFlag=2) then       //编辑
    begin
   pnl1.Enabled:=true;
   pnl2.Enabled:=true;
   pnl5.Enabled:=true;

   
    ds_process.AutoEdit:=true;
   ds_man.AutoEdit:=true;
   ds_materiel.AutoEdit:=true;

   if not qry_processSave.Active  then qry_processSave.Open;
   if not qry_MaterielSave.Active  then qry_MaterielSave.Open;
   if not qry_ManSave.Active  then qry_ManSave.Open;

   end
   else  if (dm.EFlag=3) then  //浏览
   begin
   pnl1.Enabled:=false;
   pnl2.Enabled:=false;
//   pnl5.Enabled:=false;           //alter by zsp 2017-03-23
   btn_save.Enabled:= False;        //add by zsp 2017-03-23

   ds_process.AutoEdit:=False;
   ds_man.AutoEdit:=false;
   ds_materiel.AutoEdit:=false;

   btn_cancel.Enabled:=true;

   end ;




  end
end;

procedure TfrmModi.btn_selProcessClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  ssql: string;
  ttype:string;
begin
  try
    ssql:='';
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
      InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50,ttype/类型/50';
       InputVar.Sqlstr := 'select ttype, rkey,dept_code,dept_name,case when ttype=4 then ''部门'' when ttype=5 then ''班组'' else ''工序'' end xz  '+
                          ' from data0034 where (ttype in (4,5)  or ((is_cost_dept=1) and (COST_DEPT_PTR=rkey)))   and (ACTIVE_FLAG=0)  ';  //
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
     if frmPick_Item_Single.ShowModal=mrok then
     begin
          edt_Process.text:= frmPick_Item_Single.adsPick.fieldbyname('dept_name').asstring;
          edt_process.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;

         if  (frmPick_Item_Single.adsPick.fieldbyname('ttype').asstring ='4')  or  (frmPick_Item_Single.adsPick.fieldbyname('ttype').asstring ='5')  then
           ssql:=' select rkey ,dept_code ,dept_name from data0034 where rkey='+inttostr(edt_process.tag)+'  ' 
         else
         ssql:=' select rkey ,dept_code ,dept_name from data0034 where cost_dept_ptr='+inttostr(edt_process.tag)+'  ';  // or (ttype in (4,5))

       if ssql<>'' then 
       dm.OpenQry(dm.qry_temp,ssql);
       dm.qry_temp.first;

       if  not qry_process.IsEmpty then
       begin
          qry_process.First;
          while not qry_process.Eof do
          begin
            qry_process.Delete;
          end;
       end;

        while not dm.qry_temp.eof do
        begin
        qry_process.Append;
        qry_process.FieldByName('dept_ptr').Value:=  dm.qry_temp.FieldByName('rkey').asinteger;
        qry_process.FieldByName('工序代码').Value:= dm.qry_temp.FieldByName('Dept_code').asstring;
        qry_process.FieldByName('工序名称').Value:= dm.qry_temp.FieldByName('Dept_name').asstring;
        qry_process.post;
         dm.qry_temp.next;
        end;

       //如是按公式算 ， 带出公式 ：
     ssql:=' select formula_number from data0569 where dept_ptr= '+inttostr(edt_process.tag)+' ';
       dm.OpenQry(dm.qry_temp,ssql);
       if  not dm.qry_temp.IsEmpty then 
      edt_Formula.Text:=dm.qry_temp.FieldByName('formula_number').asstring;

     end;


    finally
    frmPick_Item_Single.Free ;
  end;


end;

procedure TfrmModi.btn_SelUseUnitClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'unit_code/单位编码/100,unit_name/单位名称/120,rkey/ID/50';
       InputVar.Sqlstr := ' select  unit_code, unit_name,rkey from data0002   ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
          edt_UseUnit.text:= frmPick_Item_Single.adsPick.fieldbyname('unit_name').asstring;
          edt_UseUnit.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
          end;
    finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure TfrmModi.btn_SelPurUnitClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'unit_code/单位编码/100,unit_name/单位名称/120,rkey/ID/50';
       InputVar.Sqlstr := ' select  unit_code, unit_name,rkey from data0002   ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
          edt_PurUnit.text:= frmPick_Item_Single.adsPick.fieldbyname('unit_name').asstring;
          edt_PurUnit.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
          end;
    finally
    frmPick_Item_Single.Free ;
  end;


end;

procedure TfrmModi.btn_MTypeClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'group_name/类别名称/100,group_desc/类别描述/120,rkey/ID/50';
       InputVar.Sqlstr := ' select  group_name, group_desc,rkey from data0496   ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
          edt_MType.text:= frmPick_Item_Single.adsPick.fieldbyname('group_desc').asstring;
          edt_MType.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
          end;
    finally
    frmPick_Item_Single.Free ;
  end;
end;

//工序添加
procedure TfrmModi.N_addProcessClick(Sender: TObject);
//var
//  InputVar:PDlgInput;
//begin
//  if Trim(edt_Process.Text) = '' then
//  begin
//    ShowMessage('请先选择成本中心！！');
//    exit;
//  end;
//  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
//  try
//    InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50,ttype/类型/50';
//    InputVar.Sqlstr := 'select ttype, rkey,dept_code,dept_name,case when ttype=4 then ''部门'' when ttype=5 then ''班组'' else ''工序'' end xz  '+
//                        ' from data0034 where ACTIVE_FLAG=0  ';  //
//
//    Inputvar.KeyField:='';
//
//    InputVar.AdoConn := dm.con1 ;
//    frmPick_Item_Single.InitForm_New(InputVar);
//    if frmPick_Item_Single.ShowModal=mrok then
//    begin
//      qry_process.Append;
//      qry_process.FieldByName('dept_ptr').Value:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
//      qry_process.FieldByName('工序代码').Value:=  frmPick_Item_Single.adsPick.fieldbyname('Dept_code').asstring;
//      qry_process.FieldByName('工序名称').Value:=  frmPick_Item_Single.adsPick.fieldbyname('Dept_name').asstring;
//      qry_process.Post;
//    end;
//  finally
//    frmPick_Item_Single.Free;
//  end;
//end;
var                 //alter by zsp 2017-03-23
  str: string;
begin
  if Trim(edt_Process.Text) = '' then                             //alter by zsp 2017-03-23  begin
  begin
    ShowMessage('请先选择成本中心！！');
    exit;
  end;
  str:='0';
   if not qry_process.IsEmpty   then
   begin

     qry_process.First;
     while not qry_process.Eof do
     begin
  //    str:=str+'dept_code <> '''+qry_process.fieldbyname('工序代码').AsString+''' and ';
      str:= qry_process.fieldbyname('dept_ptr').AsString + ',' + str;
      qry_process.Next;
     end;
//     str:= Copy(str,0,Length(str)-1);
  //   dm.qry_selProcess.Filtered:=false;
  //   dm.qry_selProcess.filter:=str;
  //   dm.qry_selProcess.Filtered:=true;
   end;

   frmSelProcess:=TfrmSelProcess.create(self);
   try
     DM.qry_selProcess.Close;
     DM.qry_selProcess.SQL.Text:= LSelSql + #13+ ' and a.rkey not in (' + str + ')';
     DM.qry_selProcess.Open;
                                                                                         //alter end
      frmSelProcess.showmodal;
     if frmSelProcess.ModalResult=mrok then
     begin
       with  frmSelProcess do
       begin
       dm.qry_selProcess.Filtered:=False;
       dm.qry_selProcess.Filter:=' ISselected =1 ';
       dm.qry_selProcess.Filtered:=true;

       if  dm.qry_selProcess.RecordCount<1 then exit;


        dm.qry_selProcess.first;
        while not dm.qry_selProcess.eof do
        begin
        qry_process.Append;
       // qry_process.FieldByName('control_ptr').Value:= edt_Process.tag;
        qry_process.FieldByName('dept_ptr').Value:=  dm.qry_selProcess.FieldByName('rkey').asinteger;
        qry_process.FieldByName('工序代码').Value:= dm.qry_selProcess.FieldByName('Dept_code').asstring;
        qry_process.FieldByName('工序名称').Value:= dm.qry_selProcess.FieldByName('Dept_name').asstring;
        qry_process.post;
         dm.qry_selProcess.next;
        end;
      end;
     end;
   finally
     dm.qry_selProcess.Filter:='';
     FrmSelProcess.Free;
   end;
end;

procedure TfrmModi.N_AddMaterielClick(Sender: TObject);
var
  str: string;
  LFrm: TfrmSelMateriel;
begin
   try
   LFrm:=TfrmSelMateriel.create(self);

   // LFrm.showmodal;

     if not dm.qry_selmateriel.Active then DM.qry_selmateriel.open;


//         dm.qry_selmateriel.Filtered:=False;
//         dm.qry_selmateriel.Filter:=  ' ISselected =1 ' ;
//         dm.qry_selmateriel.Filtered:=true;
//
//         dm.qry_selmateriel.first;
//        while not dm.qry_selmateriel.eof do
//        begin
//        dm.qry_selmateriel.edit;
//        dm.qry_SelMateriel.FieldByName('ISselected').value:=0 ;
//        dm.qry_selmateriel.post;
//
//         dm.qry_selmateriel.next;
//        end;

       dm.qry_selmateriel.Filtered:=false;

         
     if not qry_materiel.IsEmpty   then
     begin
       str:='';
       qry_materiel.First;
       while not qry_materiel.Eof do
       begin
        str:=str+' rkey <> '+inttostr(qry_materiel.fieldbyname('invt_ptr').Asinteger)+' and ';
        qry_materiel.Next;
       end;
       str:= Copy(str,0,Length(str)-4);

       dm.qry_selmateriel.Filtered:=false;
       dm.qry_selmateriel .filter:=str;
       dm.qry_selmateriel.Filtered:=true;
      end;
      
   if LFrm.ShowModal=mrok then
   begin

        dm.qry_selmateriel.Filtered:=False;
      if  str<>''  then
       dm.qry_selmateriel.Filter:=str + ' and  ISselected =1 '
       else
       dm.qry_selmateriel.Filter:=' ISselected =1 '; 
       dm.qry_selmateriel.Filtered:=true;

       if  dm.qry_selmateriel.RecordCount<1 then exit;


        dm.qry_selmateriel.first;
        while not dm.qry_selmateriel.eof do
        begin
        qry_materiel.Append;
        qry_materiel.FieldByName('invt_ptr').Value:= dm.qry_SelMateriel.FieldByName('rkey').asstring;
        qry_materiel.FieldByName('材料编号').Value:= dm.qry_SelMateriel.FieldByName('材料编号').asstring;
        qry_materiel.FieldByName('材料名称').Value:= dm.qry_SelMateriel.FieldByName('材料名称').asstring;
        qry_materiel.FieldByName('库存单位').Value:= dm.qry_SelMateriel.FieldByName('库存单位').asstring;
        qry_materiel.FieldByName('采购单位').Value:= dm.qry_SelMateriel.FieldByName('采购单位').asstring;
        qry_materiel.FieldByName('标准单位面积').Value:= dm.qry_SelMateriel.FieldByName('标准单位面积').asstring;
        qry_materiel.FieldByName('标准单位重量').Value:= dm.qry_SelMateriel.FieldByName('标准单位重量').asstring;
        qry_materiel.post;

         dm.qry_selmateriel.next;
        end;
     DM.qry_selmateriel.close;
   end;
 finally
   LFrm.free;
 end; 


end;

procedure TfrmModi.N_AddManClick(Sender: TObject);
var
  str: string;
begin
  try
   frmSelMan:=TfrmSelMan.create(self);

    frmSelMan.showmodal;
   if frmSelMan.ModalResult=mrok then
   begin
     with  frmSelMan do
     begin
     dm.qry_selman.Filtered:=False;
     dm.qry_selman.Filter:=' ISselected =1 ';
     dm.qry_selman.Filtered:=true;

     if  dm.qry_selman.RecordCount<1 then exit;


      dm.qry_selman.first;
      while not dm.qry_selman.eof do
      begin
      qry_man.Append;
      qry_man.FieldByName('csi_ptr').Value:=  dm.qry_SelMan.FieldByName('rkey').asinteger;
      qry_man.FieldByName('工号').Value:= dm.qry_SelMan.FieldByName('user_login_name').asstring;
      qry_man.FieldByName('姓名').Value:= dm.qry_SelMan.FieldByName('user_full_name').asstring;
      //qry_man.FieldByName('电话').Value:= dm.qry_SelMan.FieldByName('电话').Value;
      //qry_man.FieldByName('是否有效').Value:= dm.qry_SelMan.FieldByName('是否有效').asstring;
      qry_man.post;


       dm.qry_selman.next;
      end;
     str:='';
     
     if qry_man.IsEmpty   then exit;
     qry_man.First;
     while not qry_man.Eof do
     begin
      str:=str+'user_login_name <> '''+qry_man.fieldbyname('工号').AsString+''' and ';
      qry_man.Next;
     end;
     
     str:= Copy(str,0,Length(str)-4);
     dm.qry_selman.Filtered:=false;
     dm.qry_selman .filter:=str;
     dm.qry_selman.Filtered:=true;
     
     end;
   end;
  finally
   frmSelMan.free;
  end;
end;

procedure TfrmModi.N_DelProcessClick(Sender: TObject);
var ssql:string;
begin
 if qry_process.IsEmpty then exit;

  if dm.eflag=1 then
 begin
   qry_process.delete;
   exit;
 end;

 try
  ssql:=' delete from data0154 where control_ptr='+control_ptr+' and dept_ptr='+inttostr(qry_process.fieldbyname('dept_ptr').asinteger)+'';
  dm.execsql(dm.qry_temp,ssql);
  qry_process.requery;
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TfrmModi.N_DelMaterielClick(Sender: TObject);
var ssql:string;
begin
 if qry_materiel.IsEmpty then exit;

  if dm.eflag=1 then
 begin
   qry_materiel.delete;
   exit;
 end;

 try
  ssql:=' delete from data0155 where control_ptr='+control_ptr+' and invt_ptr='+inttostr(qry_materiel.fieldbyname('invt_ptr').asinteger)+'';
  dm.execsql(dm.qry_temp,ssql);
  qry_materiel.requery;
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;

end;

procedure TfrmModi.N_DelManClick(Sender: TObject);
var ssql: string;
begin
 if qry_man.IsEmpty then exit;
 if dm.eflag=1 then
 begin
   qry_man.delete;
   exit;
 end;
 try
  ssql:=' delete from data0139 where rkey136='+control_ptr+' and csi_ptr='+inttostr(qry_man.fieldbyname('csi_ptr').asinteger)+'';
  dm.execsql(dm.qry_temp,ssql);
    qry_man.requery;
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;


end;

procedure TfrmModi.chk_freqClick(Sender: TObject);
begin
  if chk_freq.Checked then
   //pgc2.ActivePageIndex:= 0
  else
  begin
    edt_freq.Text:='';
    edt_FUse.Text:='';
    edt_Fremark.Text:='';
  end;
end;

procedure TfrmModi.chk_MCountClick(Sender: TObject);
begin
  if chk_MCount.Checked then
   //pgc2.ActivePageIndex:= 1
  else
  begin
    edt_Mcount.Text:='';
    edt_MUse.Text:='';
    edt_Mremark.Text:='';
  end;
end;

procedure TfrmModi.chk_timeClick(Sender: TObject);
begin
 if chk_time.Checked then
  // pgc2.ActivePageIndex:= 2
  else
  begin
    edt_TCont.Text:='';
    edt_TUse.Text:='';
    edt_Tremark.Text:='';
  end;  
end;

procedure TfrmModi.chk_facClick(Sender: TObject);
begin
if chk_fac.Checked then
   //pgc2.ActivePageIndex:= 3
   else
  begin
    edt_FacUse.Text:='';
    edt_FacDay.Text:='';
  end;   
end;

procedure TfrmModi.edt_freqExit(Sender: TObject);
begin
// if (Trim(edt_freq.Text)<>'' )  and ( chk_freq.Checked=false) then
// begin
// ShowMessage('请先选择按保养频率!');
// exit;
// end;
   if YesOrNo(Trim(edt_freq.text),chk_freq,chk_freq.Caption)=False then
   edt_freq.Focused;
end;

function  TfrmModi.YesOrNo(txt: string;chk:TCheckBOx;info:string):BOOLean;
begin
   result:=true;
 if (txt<>'' )  and ( chk.Checked=false) then
 begin
 ShowMessage('请先选择'+info);
   result:=false;
 end;
 end;

procedure TfrmModi.edt_FremarkExit(Sender: TObject);
begin
 if YesOrNo(Trim(edt_Fremark.text),chk_freq,chk_freq.Caption)=False then
   edt_Fremark.Focused;
end;

procedure TfrmModi.edt_FUseExit(Sender: TObject);
begin
 if YesOrNo(Trim(edt_FUse.text),chk_freq,chk_freq.Caption)=False then
    edt_FUse.Focused;
end;

procedure TfrmModi.edt_McountExit(Sender: TObject);
begin
    if YesOrNo(Trim(edt_Mcount.text),chk_MCount,chk_MCount.Caption)=False then
    edt_Mcount.Focused;
end;

procedure TfrmModi.edt_MUseExit(Sender: TObject);
begin
  if YesOrNo(Trim(edt_MUse.text),chk_MCount,chk_MCount.Caption)=False then
    edt_MUse.Focused;
end;

procedure TfrmModi.edt_MremarkExit(Sender: TObject);
begin
 if YesOrNo(Trim(edt_MUse.text),chk_MCount,chk_MCount.Caption)=False then
    edt_MUse.Focused;
end;

procedure TfrmModi.edt_TuseExit(Sender: TObject);
begin
     if YesOrNo(Trim(edt_TCont.text),chk_time,  chk_time.Caption)=False then
    edt_TCont.Focused;
end;

procedure TfrmModi.edt_TContExit(Sender: TObject);
begin
  if YesOrNo(Trim(edt_Tuse.text),chk_time,  chk_time.Caption)=False then
    edt_Tuse.Focused;
end;

procedure TfrmModi.edt_TRemarkExit(Sender: TObject);
begin
 if YesOrNo(Trim(edt_TRemark.text),chk_time,  chk_time.Caption)=False then
    edt_TRemark.Focused;
end;

procedure TfrmModi.edt_FacNameExit(Sender: TObject);
begin

  if YesOrNo(Trim(edt_FacName.text),chk_fac,  chk_fac.Caption)=False then
    edt_FacName.Focused;
end;

procedure TfrmModi.edt_FacUnitExit(Sender: TObject);
begin
     if YesOrNo(Trim(edt_FacUnit.text),chk_fac,  chk_fac.Caption)=False then
    edt_FacUnit.Focused;
end;

procedure TfrmModi.edt_FacUseExit(Sender: TObject);
begin
 // if YesOrNo(Trim(edt_FacUse.text),chk_fac,  chk_fac.Caption)=False then
   // edt_FacUse.Focused;
end;

procedure TfrmModi.edt_OUnitExit(Sender: TObject);
begin
   if YesOrNo(Trim(edt_OUnit.text),chk_fac,  chk_fac.Caption)=False then
    edt_OUnit.Focused;
end;

procedure TfrmModi.edt_FacRemarkExit(Sender: TObject);
begin
   if YesOrNo(Trim(edt_FacRemark.text),chk_fac,  chk_fac.Caption)=False then
    edt_FacRemark.Focused;
end;

procedure TfrmModi.btn_SelFacUnitClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'unit_code/单位编码/100,unit_name/单位名称/120,rkey/ID/50';
       InputVar.Sqlstr := ' select  unit_code, unit_name,rkey from data0002   ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
           edt_FacUnit.text:= frmPick_Item_Single.adsPick.fieldbyname('unit_name').asstring;
           edt_FacUnit.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
           end;
    finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure TfrmModi.btn_SelOUnitClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'unit_code/单位编码/100,unit_name/单位名称/120,rkey/ID/50';
       InputVar.Sqlstr := ' select  unit_code, unit_name,rkey from data0002   ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
            if frmPick_Item_Single.ShowModal=mrok then
            begin
            edt_OUnit.text:= frmPick_Item_Single.adsPick.fieldbyname('unit_name').asstring;
            edt_OUnit.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
            end;
    finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure TfrmModi.btn_saveClick(Sender: TObject);
var
  ssql,unitName: string;
  control_ptr,Xflag :integer;
begin
  // self.screen.cursor:=
  Xflag:=0;
    if Trim(edt_name.text)=''  then
    begin
    ShowMessage('编号不允许为空');
    edt_name.Focused;
    exit;
    end;

     if Trim(edt_Process.text)=''  then
    begin
    ShowMessage('成本中心不允许为空');
    edt_Process.Focused;
    exit;
    end;


    if Trim(edt_Facday.text)=''  then
    begin
    ShowMessage('频率天不允许为空');
    edt_Facday.Focused;
    exit;
    end;

    if Trim(edt_OUnit.text)=''  then
    begin
    ShowMessage('产出单位不允许为空');
    edt_OUnit.Focused;
    exit;
    end;

    if Trim(edt_MType.text)=''  then
    begin
    ShowMessage('物料类型不允许为空');
    edt_MType.Focused;
    exit;
    end;

   if (not chk_freq.Checked) and (not chk_fac.Checked) and (not chk_MCount.Checked) and (not chk_time.Checked) and (not chk_format.Checked)  then
   begin
   ShowMessage('请至少选择一种领料控制标准!!');
  // pgc1.activepageindex:=1;
   //pgc2.activepageindex:=0;
   Exit;
   end;


    if  (chk_freq.Checked) and ( (trim(edt_freq.text)='')   or  (trim(edt_FUse.text)='') ) then
    begin
     ShowMessage('选择按保养频率领料，则保养频率和用量都不能为空');
     // pgc1.activepageindex:=1;
     // pgc2.activepageindex:=0;
    exit;
    end;

    if  (chk_MCount.Checked) and  ((trim(edt_Mcount.text)='')   or  (trim(edt_MUse.text)=''))  then
    begin
     ShowMessage('选择按员工人数领料则员工人数和单位耗用都不能为空');
    //  pgc1.activepageindex:=1;
     // pgc2.activepageindex:=1;
    exit;
    end;

    if  (chk_time.Checked) and  ((trim(edt_Tuse.text)='')  )  then    // or  (trim(edt_Tuse.text)='')
    begin
     ShowMessage('选择按固定时间领料则月可领用量不能为空');
     // pgc1.activepageindex:=1;
     // pgc2.activepageindex:=2;
    exit;
    end;


      if  (chk_fac.Checked) and  (trim(edt_FacUse.text)='')     then
    begin
     ShowMessage('选择按因素领料则单耗不能为空');
     // pgc1.activepageindex:=1;
     // pgc2.activepageindex:=3;
    exit;
    end;

      if  (chk_format.Checked) and  ((trim(edt_Formula.text)='')   )    then
    begin
     ShowMessage('选择按公式领料则公式代码和比例值都不能为空');
     edt_Formula.setfocus;
    exit;
    end;

   if (qry_process.IsEmpty) or (qry_materiel.IsEmpty) then
   begin
   ShowMessage('工序和物料不能为空!!');
   exit;
   end;

    qry_materiel.First;
    unitName := qry_materiel.FieldByName('库存单位').asstring;
    while not qry_materiel.Eof do
    begin
      if  qry_materiel.FieldByName('库存单位').asstring<> unitName then
      xflag:=1;
      qry_materiel.next;
     end;

 if xflag=1 then
   begin
   ShowMessage('物料库存单位必须一致！');
   exit;
   end;



   //开始保存：
   try
  if not dm.con1.InTransaction then   dm.con1.BeginTrans;
   //主表：

//    ssql:= ' select rkey from data0136 where control_name='+trim(edt_name.text)+' ';
//   dm.openqry(DM.qry_temp,ssql);

  if dm.EFlag=1  then
   qry_Main.append
  else
   qry_Main.edit;

  if dm.EFlag=1  then
  qry_Main.FieldByName('control_name').Value:=Trim(edt_name.text);

      //产出单位
  if Trim(edt_OUnit.text)<>'' then
  qry_Main.FieldByName('unit_ptr').Value:= edt_OUnit.Tag
  else
   qry_Main.FieldByName('unit_ptr').Value:=null; 

   if Trim(edt_factory.text)<>'' then
  qry_Main.FieldByName('warehouse_ptr').Value:=edt_factory.Tag  ;

  if Trim(edt_FacUse.text)<>'' then
  qry_Main.FieldByName('stan_consume').Value:=StrToFloat(Trim(edt_FacUse.text))
  else
   qry_Main.FieldByName('stan_consume').Value:=0;


   if Trim(edt_Process.text)<>'' then
  qry_Main.FieldByName('DeptId_P').Value:= edt_Process.Tag ;                 //成本中心



   if Trim(edt_PurUnit.text)<>'' then
  qry_Main.FieldByName('PurUnit').Value:= edt_PurUnit.tag
   else qry_Main.FieldByName('PurUnit').Value:=null ;

   if Trim(edt_UseUnit.text)<>'' then
  qry_Main.FieldByName('UseUnit').Value:= edt_UseUnit.Tag
  else qry_Main.FieldByName('UseUnit').Value:= null;

     if Trim(edt_CRate.text)<>'' then
  qry_Main.FieldByName('CRate').Value:=  StrToint(edt_CRate.text)
  else
 qry_Main.FieldByName('CRate').Value:=0;

   if Trim(edt_MType.text)<>'' then
  qry_Main.FieldByName('PGroupID').Value:=  edt_MType.Tag ;


  qry_Main.FieldByName('property').Value:= Trim(edt_property1.text);
  qry_Main.FieldByName('property2').Value:=Trim(edt_property2.text);
  qry_Main.FieldByName('property3').Value:=Trim(edt_property3.text);
  qry_Main.FieldByName('property4').Value:= Trim(edt_property4.text);

  if chk_freq.Checked then
  qry_Main.FieldByName('Isfreq').Value:=1
    else
  qry_Main.FieldByName('Isfreq').Value:=0;

   if Trim(edt_freq.text)<> ''  then
  qry_Main.FieldByName('FDays').Value:=StrToInt(Trim(edt_freq.text))
  else
  qry_Main.FieldByName('FDays').Value:=0;

  if Trim(edt_FUse.text)<>''  then
  qry_Main.FieldByName('FAMountUsed').Value:= StrToFloat(Trim(edt_FUse.text))
  else qry_Main.FieldByName('FAMountUsed').Value:=0;


  qry_Main.FieldByName('FRemark').Value:= Trim(edt_Fremark.text);

  if chk_MCount.Checked  then
  qry_Main.FieldByName('IsMCount').Value:=1
   else
  qry_Main.FieldByName('IsMCount').Value:=0;

   if Trim(edt_Mcount.text)<>''  then
  qry_Main.FieldByName('MCount').Value:= StrToInt(Trim(edt_Mcount.text))
   else qry_Main.FieldByName('MCount').Value:=0;
   
   if Trim(edt_MUse.text)<>''  then
  qry_Main.FieldByName('MUsed').Value:= StrToFloat(Trim(edt_MUse.text))
  else qry_Main.FieldByName('MUsed').Value:= 0;

  qry_Main.FieldByName('MRemark').Value:= Trim(edt_Mremark.text);

  if chk_time.Checked then
  qry_Main.FieldByName('IsSTime').Value:=1
  else
  qry_Main.FieldByName('IsSTime').Value:=0;

  if Trim(edt_TCont.text)<>''  then
  qry_Main.FieldByName('TCount').Value:=StrToInt(Trim(edt_TCont.text))
   else qry_Main.FieldByName('TCount').Value:=0;

   if Trim(edt_Tuse.text)<>''  then
   qry_Main.FieldByName('TUsed').Value:= StrToFloat(Trim(edt_Tuse.text))
   else qry_Main.FieldByName('TUsed').Value:= 0;

  qry_Main.FieldByName('TRemark').Value:=Trim(edt_TRemark.text);

  if chk_fac.Checked  then
  qry_Main.FieldByName('IsFactor').Value:=1
  else
  qry_Main.FieldByName('IsFactor').Value:=0;

  qry_Main.FieldByName('FacName').Value:=   Trim(edt_FacName.text);
  qry_Main.FieldByName('FacRemark').Value:= Trim(edt_FacRemark.text);
    if Trim(edt_FacUnit.text)<>''  then
  qry_Main.FieldByName('Fac_unit').Value:= edt_FacUnit.Tag
  else  qry_Main.FieldByName('Fac_unit').Value:=null;

     if Trim(edt_FacDay.text)<>''  then
   qry_Main.FieldByName('facday').Value:= StrToFloat(Trim(edt_FacDay.text))
   else qry_Main.FieldByName('facday').Value:= 0;


  qry_Main.FieldByName('remark').Value:= Trim(mmo1.Text);

    if chk_format.Checked  then
  qry_Main.FieldByName('IsFormula').Value:=1
  else
  qry_Main.FieldByName('IsFormula').Value:=0;

  if (Trim(edt_Formula.text)<>'') and (chk_format.Checked) then
   qry_Main.FieldByName('Formula_ptr').Value:=Trim(edt_Formula.text)
   else
    qry_Main.FieldByName('Formula_ptr').Value:=null;
    





 qry_Main.UpdateBatch(arall);

    //从表

   ssql:=' select rkey from data0136 where control_name='''+trim(edt_name.text)+'''';
   control_ptr:= dm.GetOne('rkey',ssql,dm.qry_temp);
     
     
    qry_process.First;
    while not qry_process.Eof do
    begin

      ssql:= ' select control_ptr from data0154 where control_ptr='+inttostr(control_ptr)+' and dept_ptr= '+inttostr(qry_process.FieldByName('dept_ptr').asinteger)+'';
      dm.openqry(DM.qry_temp,ssql);
      if not dm.qry_temp.isempty  then
       begin
       qry_process.Next;
       continue;
      end;

     qry_processsave.append;
     qry_processsave.FieldByName('control_ptr').Value:= control_ptr;
     qry_processsave.FieldByName('dept_ptr').Value:= qry_process.FieldByName('dept_ptr').asinteger;
     qry_processsave.post;

     qry_process.Next;
    end;


    qry_materiel.First;
   // unitName := qry_materiel.FieldByName('库存单位').asstring;
    while not qry_materiel.Eof do
    begin
       ssql:= ' select control_ptr from data0155 where control_ptr='+inttostr(control_ptr)+' and invt_ptr= '+inttostr(qry_materiel.FieldByName('invt_ptr').asinteger)+'';
      dm.openqry(DM.qry_temp,ssql);
      if not dm.qry_temp.isempty  then
      begin
       qry_materiel.Next;
       continue;
      end;


     qry_materielsave.append;
     qry_materielsave.FieldByName('control_ptr').Value:=control_ptr;
     qry_materielsave.FieldByName('invt_ptr').Value:= qry_materiel.FieldByName('invt_ptr').asinteger;
     qry_materielsave.post;

     qry_materiel.Next;
    end;


    qry_man.First;
    while not qry_man.Eof do
    begin
      ssql:= ' select rkey136 from data0139 where rkey136='+inttostr(control_ptr)+' and csi_ptr= '+inttostr(qry_man.FieldByName('csi_ptr').asinteger)+'';
      dm.openqry(DM.qry_temp,ssql);
      if not dm.qry_temp.isempty  then
        begin
       qry_man.Next;
       continue;
      end;

     qry_mansave.append;
     qry_mansave.FieldByName('rkey136').Value:=control_ptr;
     qry_mansave.FieldByName('csi_ptr').Value:= qry_man.FieldByName('csi_ptr').asinteger;
     qry_mansave.post;

     qry_man.Next;
    end;


   qry_processsave.UpdateBatch(arall);

   qry_materielsave.UpdateBatch(arall);

   qry_mansave.UpdateBatch(arall);








  DM.con1.CommitTrans;

  FrmMain.btn_refreshClick(sender);
     close;
   except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 dm.con1.RollbackTrans;
 exit;
 end;
 end;
    
end;

procedure TfrmModi.btn_selWHClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'warehouse_code/工厂代码/100,abbr_name/工厂名称/200,rkey/ID/50';
       InputVar.Sqlstr := ' select warehouse_code , abbr_name,rkey from data0015 ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
          edt_factory.text:= frmPick_Item_Single.adsPick.fieldbyname('abbr_name').asstring;
          edt_factory.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
          end;
    finally
    frmPick_Item_Single.Free ;
  end;

end;

procedure TfrmModi.btn_SelFormulaClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;

      InputVar.Fields := 'formula_number/公式编码/200,dept_name/工序名称/250';
       InputVar.Sqlstr := ' select a.formula_number,b.dept_name   from data0569 a inner join data0034  b on a.dept_ptr=b.rkey where a.ttype=0 ' ;
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
           edt_Formula.text:= frmPick_Item_Single.adsPick.fieldbyname('formula_number').asstring;
          // edt_FacUnit.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
           end;
    finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmModi.edt_RRateExit(Sender: TObject);
begin
//  if YesOrNo(Trim(edt_RRate.text),chk_format,  chk_format.Caption)=False then
//     edt_RRate.Focused;
end;

procedure TfrmModi.chk_formatClick(Sender: TObject);
begin
if not chk_format.Checked then
    edt_Formula.text:='';
end;

end.

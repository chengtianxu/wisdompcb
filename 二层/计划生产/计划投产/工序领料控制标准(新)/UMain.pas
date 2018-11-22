unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB, ADODB;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    pnl2: TPanel;
    lbl_field: TLabel;
    btn_quit: TBitBtn;
    btn_refresh: TBitBtn;
    btn_export: TBitBtn;
    btn_qry: TBitBtn;
    edt_value: TEdit;
    btn_import: TButton;
    pnl3: TPanel;
    pnl4: TPanel;
    dbgrdh_main: TDBGridEh;
    dbgrdh_outport: TDBGridEh;
    pnl5: TPanel;
    dbgrdh_process: TDBGridEh;
    dbgrdh_man: TDBGridEh;
    dbgrdh_materiel: TDBGridEh;
    pm_Main: TPopupMenu;
    mni_add: TMenuItem;
    N_edit: TMenuItem;
    N_browse: TMenuItem;
    N_del: TMenuItem;
    qry_Main: TADOQuery;
    atncfld_Mainrkey: TAutoIncField;
    strngfld_Maincontrol_name: TStringField;
    intgrfld_Mainunit_ptr: TIntegerField;
    intgrfld_Mainwarehouse_ptr: TIntegerField;
    bcdfld_Mainstan_consume: TBCDField;
    intgrfld_MainDeptId_P: TIntegerField;
    intgrfld_MainPurUnit: TIntegerField;
    intgrfld_MainUseUnit: TIntegerField;
    intgrfld_MainCRate: TIntegerField;
    intgrfld_MainPGroupID: TIntegerField;
    strngfld_Mainproperty: TStringField;
    strngfld_Mainproperty2: TStringField;
    strngfld_Mainproperty3: TStringField;
    strngfld_Mainproperty4: TStringField;
    blnfld_MainIsfreq: TBooleanField;
    fltfld_MainFDays: TFloatField;
    fltfld_MainFAMountUsed: TFloatField;
    strngfld_MainFRemark: TStringField;
    blnfld_MainIsMCount: TBooleanField;
    intgrfld_MainMCount: TIntegerField;
    fltfld_MainMUsed: TFloatField;
    strngfld_MainMRemark: TStringField;
    blnfld_MainIsSTime: TBooleanField;
    intgrfld_MainTCount: TIntegerField;
    fltfld_MainTUsed: TFloatField;
    strngfld_MainTRemark: TStringField;
    blnfld_MainIsFactor: TBooleanField;
    strngfld_MainFacName: TStringField;
    strngfld_MainFacRemark: TStringField;
    strngfld_Mainremark: TStringField;
    intgrfld_MainFac_unit: TIntegerField;
    intgrfld_MainFacDay: TIntegerField;
    blnfld_MainIsFormula: TBooleanField;
    strngfld_MainDSDesigner: TStringField;
    strngfld_MainDSDesigner2: TStringField;
    strngfld_MainDSDesigner3: TStringField;
    strngfld_MainDSDesigner4: TStringField;
    strngfld_MainDSDesigner5: TStringField;
    strngfld_MainDSDesigner6: TStringField;
    strngfld_MainDSDesigner7: TStringField;
    qry_process: TADOQuery;
    intgrfld_processcontrol_ptr: TIntegerField;
    intgrfld_processdept_ptr: TIntegerField;
    strngfld_processDSDesigner: TStringField;
    strngfld_processDSDesigner2: TStringField;
    qry_materiel: TADOQuery;
    intgrfld_materielcontrol_ptr: TIntegerField;
    intgrfld_materielinvt_ptr: TIntegerField;
    strngfld_materielDSDesigner: TStringField;
    strngfld_materielDSDesigner2: TStringField;
    strngfld_materielDSDesigner3: TStringField;
    strngfld_materielDSDesigner4: TStringField;
    fltfld_materielDSDesigner5: TFloatField;
    fltfld_materielDSDesigner6: TFloatField;
    qry_Man: TADOQuery;
    intgrfld_Manrkey136: TIntegerField;
    intgrfld_Mancsi_ptr: TIntegerField;
    strngfld_ManDSDesigner: TStringField;
    strngfld_ManDSDesigner2: TStringField;
    ds_main: TDataSource;
    ds_process: TDataSource;
    ds_materiel: TDataSource;
    ds_man: TDataSource;
    strngfld_MainFormula_ptr: TStringField;
    wrdfld_Maingroup_id: TWordField;
    intgrfld_MainFacFreq: TIntegerField;
    strngfld_MainWAREHOUSE_CODE: TStringField;
    spl1: TSplitter;
    spl2: TSplitter;
    strngfld_Maindept_codes: TStringField;
    strngfld_Maininv_part_numbers: TStringField;
    grp1: TGroupBox;
    Label7: TLabel;
    qry_ManDSDesigner: TStringField;
    qry_ManDSDesigner2: TStringField;
    pnl6: TPanel;
    lbl11: TLabel;
    chk_time2: TCheckBox;
    lbl6: TLabel;
    chk_MCount: TCheckBox;
    lbl1: TLabel;
    chk_freq: TCheckBox;
    edt_freq: TEdit;
    lbl2: TLabel;
    lbl4: TLabel;
    edt_FUse: TEdit;
    lbl3: TLabel;
    lbl5: TLabel;
    edt_Fremark: TEdit;
    edt_Mcount: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    edt_MUse: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    edt_Mremark: TEdit;
    lbl36: TLabel;
    lbl37: TLabel;
    edt_TCont: TEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    edt_Tuse2: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    edt_TRemark2: TEdit;
    lbl38: TLabel;
    chk_fac: TCheckBox;
    Label1: TLabel;
    edt_FacName: TEdit;
    Label2: TLabel;
    edt_FacUnit: TEdit;
    Label5: TLabel;
    edt_OUnit: TEdit;
    Label6: TLabel;
    edt_facRemark: TEdit;
    chk_format: TCheckBox;
    lbl28: TLabel;
    edt_Formula: TEdit;
    Label3: TLabel;
    edt_Facday: TEdit;
    Label8: TLabel;
    lbl31: TLabel;
    edt_FacUse: TEdit;
    pnl7: TPanel;
    Label4: TLabel;
    edt_Tuse: TEdit;
    Label9: TLabel;
    edt_TRemark: TEdit;
    lbl16: TLabel;
    chk_time: TCheckBox;
    procedure mni_addClick(Sender: TObject);
    procedure N_editClick(Sender: TObject);
    procedure N_browseClick(Sender: TObject);
    procedure btn_quitClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure qry_MainAfterScroll(DataSet: TDataSet);
    procedure N_delClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_importClick(Sender: TObject);
    procedure dbgrdh_mainTitleClick(Column: TColumnEh);
    procedure dbgrdh_processTitleClick(Column: TColumnEh);
    procedure dbgrdh_materielTitleClick(Column: TColumnEh);
    procedure dbgrdh_manTitleClick(Column: TColumnEh);
    procedure dbgrdh_mainDblClick(Sender: TObject);
  private
    { Private declarations }
     field_name,field_name1,field_name2,field_name3,field_name4,psql  :  string;
    PreColumn,PreColumn1,PreColumn2,PreColumn3,PreColumn4: TColumnEh;
    Pgrid: integer;
    procedure intpnl;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
         uses UDM,common, UQry, UModi, UImport;
{$R *.dfm}

procedure TFrmMain.mni_addClick(Sender: TObject);
begin
  if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('对不起，你没有新增的权限');
    Exit;
  end;

   // if qry_main.isempty then exit;
    dm.EFlag:=1;

     try
    FrmModi := TFrmModi.create(nil);

    FrmModi.ShowModal;


    finally
    FrmModi.free;
    end;


end;

procedure TFrmMain.N_editClick(Sender: TObject);
begin
  if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('对不起，你没有新增的权限');
    Exit;
  end;

  if qry_main.isempty then exit;

    dm.EFlag:=2;
    
     try
    FrmModi := TFrmModi.create(nil);

    FrmModi.ShowModal;

  
    finally
    FrmModi.free;
    end;
end;

procedure TFrmMain.N_browseClick(Sender: TObject);
begin
  if qry_main.isempty then exit;
    dm.EFlag:=3;
    
     try
    FrmModi := TFrmModi.create(nil);
   
    FrmModi.ShowModal;

  
    finally
    FrmModi.free;
    end;
end;

procedure TFrmMain.btn_quitClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.btn_refreshClick(Sender: TObject);
begin
   if qry_main.Active then  qry_main.close  ;
   qry_main.open;
   
 if qry_Main.IsEmpty then exit;

 with qry_process do
 begin
 close;
 Parameters[0].Value:=  qry_main.fieldbyname('rkey').AsInteger;
 open;
 end;

 with qry_materiel do
 begin
 close;
 Parameters[0].Value:=  qry_main.fieldbyname('rkey').AsInteger;
 open;
 end;

 with qry_man do
 begin
 close;
 Parameters[0].Value:=  qry_main.fieldbyname('rkey').AsInteger;
 open;
 end;

end;

procedure TFrmMain.btn_exportClick(Sender: TObject);
begin
    if qry_Main.IsEmpty then exit;

  // if not qry_outport.Active then  qry_outport.Open;

   common.Export_dbGridEH_to_Excel(dbgrdh_outport,'领料控制标准导出');
end;

procedure TFrmMain.btn_qryClick(Sender: TObject);
var
  i:integer;
  ssql:string;
begin
  ssql:='';
  try
    frmqry:=Tfrmqry.create(nil);
    with frmqry do
    begin
            if ShowModal=mrok then
            begin

               qry_main.Filtered:=False;
                
               for i := 1 to frmqry.sgrid1.RowCount-2  do
               begin
                   ssql:=ssql+ (trim(frmqry.sgrid1.Cells[2,i]));
               end;

              with qry_Main do
              begin
              close;
              sql.Clear;
              sql.Add(psql+ssql);
              open;
              end;


            end ;
    end;
  finally
   frmqry.free;
  end;

end;

procedure TFrmMain.qry_MainAfterScroll(DataSet: TDataSet);
begin
// if qry_Main.IsEmpty then exit;
     grp1.Visible:=true;
 with qry_process do
 begin
 close;
 Parameters[0].Value:=  qry_main.fieldbyname('rkey').AsInteger;
 open;
 end;

 with qry_materiel do
 begin
 close;
 Parameters[0].Value:=  qry_main.fieldbyname('rkey').AsInteger;
 open;
 end;

 with qry_man do
 begin
 close;
 Parameters[0].Value:=  qry_main.fieldbyname('rkey').AsInteger;
 open;
 end;

  intPnl;

 
end;

procedure TFrmMain.intpnl;
var
   ssql: string;
   control_ptr: integer;
begin
   control_ptr:= frmmain.qry_Main.fieldbyname('rkey').value;



   // ssql:='select warehouse_name from data0015 where rkey='+inttostr(qry_Main.fieldbyname('warehouse_ptr').asinteger)+' ';
   // self.edt_factory.Text:= dm.getone('warehouse_name',ssql,dm.qry_temp);
   //  edt_factory.tag:= qry_Main.fieldbyname('warehouse_ptr').asinteger;

  //  ssql:='select group_desc from data0496 where rkey='+inttostr(qry_Main.fieldbyname('PGroupID').asinteger)+' ';
  //  self.edt_MType.Text:= dm.getone('group_desc',ssql,dm.qry_temp);
  //   edt_MType.tag:= qry_Main.fieldbyname('PGroupID').asinteger;


//      ssql:='select unit_name from data0002 where rkey='+inttostr(qry_Main.fieldbyname('UseUnit').asinteger)+' ';
//    self.edt_UseUnit.Text:= dm.getone('unit_name',ssql,dm.qry_temp);
//         edt_UseUnit.tag:= qry_Main.fieldbyname('UseUnit').asinteger;

//       ssql:='select unit_name from data0002 where rkey='+inttostr(qry_Main.fieldbyname('PurUnit').asinteger)+' ';
//    self.edt_PurUnit.Text:= dm.getone('unit_name',ssql,dm.qry_temp);
//        edt_PurUnit.tag:= qry_Main.fieldbyname('PurUnit').asinteger;


   // self.edt_CRate.text:=IntToStr(qry_Main.fieldbyname('CRate').asinteger);

//    self.edt_property1.Text:=qry_Main.fieldbyname('property').asstring;
//    self.edt_property2.Text:=qry_Main.fieldbyname('property2').asstring;
//    self.edt_property3.Text:=qry_Main.fieldbyname('property3').asstring;
//    self.edt_property4.Text:=qry_Main.fieldbyname('property4').asstring;

  //  self.mmo1.Text:=qry_Main.fieldbyname('remark').asstring;

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


end;

procedure TFrmMain.N_delClick(Sender: TObject);
var
  ssql,ssql2,ssql3,ssql4: string;
begin

    if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('对不起，你没有新增的权限');
    Exit;
  end;

if qry_Main.IsEmpty then exit;
   ssql:='delete from data0136  where rkey ='+inttostr(qry_main.fieldbyname('rkey').asinteger)+'';
   ssql2:='delete from data0154  where control_ptr ='+inttostr(qry_main.fieldbyname('rkey').asinteger)+'';
   ssql3:='delete from data0155  where control_ptr ='+inttostr(qry_main.fieldbyname('rkey').asinteger)+'';
   ssql4:='delete from data0139  where rkey136 ='+inttostr(qry_main.fieldbyname('rkey').asinteger)+'';
   
  try
  dm.execsql(dm.qry_temp,ssql);
  dm.execsql(dm.qry_temp,ssql2);
  dm.execsql(dm.qry_temp,ssql3);
  dm.execsql(dm.qry_temp,ssql4);

  qry_Main.requery;

 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;
 end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin

grp1.Visible:=false;
   grp1.Enabled:=false;
if not qry_Main.Active then qry_Main.Open;

psql:=qry_Main.SQL.Text;

 Pgrid:=1;

 field_name1:= dbgrdh_main.columns[0].fieldname;
PreColumn1:=dbgrdh_main.columns[0];
dbgrdh_main.columns[0].title.Color:=clRed;
 dbgrdh_main.columns[0].Title.SortMarker:=smUpEh;

  field_name2:= dbgrdh_process.columns[0].fieldname;
PreColumn2:=dbgrdh_process.columns[0];
dbgrdh_process.columns[0].title.Color:=clRed;
 dbgrdh_process.columns[0].Title.SortMarker:=smUpEh;

   field_name3:= dbgrdh_materiel.columns[0].fieldname;
PreColumn3:=dbgrdh_materiel.columns[0];
dbgrdh_materiel.columns[0].title.Color:=clRed;
 dbgrdh_materiel.columns[0].Title.SortMarker:=smUpEh;

    field_name4:= dbgrdh_man.columns[0].fieldname;
PreColumn4:=dbgrdh_man.columns[0];
dbgrdh_man.columns[0].title.Color:=clRed;
 dbgrdh_man.columns[0].Title.SortMarker:=smUpEh;

end;

procedure TFrmMain.edt_valueChange(Sender: TObject);
var
  qry: TADOQuery;
begin

   if  Pgrid=1then
   begin
   qry:=qry_Main;
   field_name:=field_name1;
   end
   else if Pgrid=2 then
    begin
   qry:=qry_process;
   field_name:=field_name2;
   end
   else  if Pgrid=3 then
   begin
   qry:=qry_materiel;
   field_name:=field_name3;
   end
   else  if   Pgrid=4 then
   begin
   qry:=qry_Man;
   field_name:=field_name4;
   end ;


  qry.Filtered:=false;
  if qry.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if qry.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftFloat]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        qry.Filter:=field_name + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        qry.Filter:=  field_name+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry.Filter:='';
  end;

  qry.Filtered:=true;
  
      if trim(edt_value.text)=''  then    qry.Filtered:=false;
  
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
//
     rkey73:= '3023';
 user_ptr := '3301';
  vprev := '4';

   if not App_init_2(dm.con1) then
    begin
      ShowMsg('程序起动失败请联系管理员',1);
      application.Terminate;
    end;

  DM.con1.Connected:= True;
  Caption := application.Title;



end;

procedure TFrmMain.btn_importClick(Sender: TObject);
begin
      if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('对不起，你没有新增的权限');
    Exit;
  end;

   // if qry_main.isempty then exit;
  

     try
    FrmImport := TFrmImport.create(nil);

    FrmImport.ShowModal;


    finally
    FrmImport.free;
    end;

end;

procedure TFrmMain.dbgrdh_mainTitleClick(Column: TColumnEh);
begin
  Pgrid:=1;

if qry_main.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_main.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_main.Sort:=Column.FieldName+' DESC';
  end;

  if qry_Main.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name1 <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name1 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn1.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn1 := column ;
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.dbgrdh_processTitleClick(Column: TColumnEh);
begin
  Pgrid:=2;
if qry_process.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_process.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_process.Sort:=Column.FieldName+' DESC';
  end;

  if qry_process.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name2 <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn2.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.dbgrdh_materielTitleClick(Column: TColumnEh);
begin
Pgrid:=3;

if qry_materiel.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_materiel.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_materiel.Sort:=Column.FieldName+' DESC';
  end;

  if qry_materiel.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name3 <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name3 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn3.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn3 := column ;
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.dbgrdh_manTitleClick(Column: TColumnEh);
begin
Pgrid:=4;

if qry_man.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_man.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_man.Sort:=Column.FieldName+' DESC';
  end;

  if qry_man.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  
  if (field_name4 <> column.FieldName) then
  begin
    lbl_field.Caption := column.Title.Caption ;
    field_name4 := column.FieldName ;
    edt_value.SetFocus;
    PreColumn4.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn4 := column ;
  end else
    edt_value.SetFocus;
end;

procedure TFrmMain.dbgrdh_mainDblClick(Sender: TObject);
begin
if qry_main.isempty then exit;
    dm.EFlag:=3;
    
     try
    FrmModi := TFrmModi.create(nil);

    FrmModi.ShowModal;

  
    finally
    FrmModi.free;
    end;
end;

end.

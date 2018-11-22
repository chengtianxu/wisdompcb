unit Mainfrm;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, ImgList,ComCtrls,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, StrUtils, DBGrids;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    spl1: TSplitter;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblMCount: TLabel;
    btnExit: TBitBtn;
    btnFresh: TBitBtn;
    btnQry: TBitBtn;
    btnExcel: TBitBtn;
    btnField: TBitBtn;
    btnmodel: TBitBtn;
    edt_value: TEdit;
    rg_status: TRadioGroup;
    pnl2: TPanel;
    tv1: TTreeView;
    pnl3: TPanel;
    pnl4: TPanel;
    rg1: TRadioGroup;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    dbgrdhDetail: TDBGridEh;
    ds1: TDataSource;
    qryDep: TADOQuery;
    atncfld_departmentrkey: TAutoIncField;
    qryDepdepartmentname: TWideStringField;
    qryDepdepartmentcode: TWideStringField;
    intgrfld_departmentsuperior: TIntegerField;
    qryDepchargename: TWideStringField;
    intgrfld_departmentdepartmentration: TIntegerField;
    intgrfld_departmentdepartmentcount: TIntegerField;
    intgrfld_departmentscarcity: TIntegerField;
    qry_EMP: TADOQuery;
    atncfld_EMPrkey: TAutoIncField;
    qry_EMPchinesename: TWideStringField;
    qry_EMPemployeecode: TWideStringField;
    intgrfld_EMPdepartmentid: TIntegerField;
    qry_EMPLanguages: TWideStringField;
    qry_EMPondutytime: TStringField;
    qry_EMPoutdutytime: TStringField;
    intgrfld_EMPemploy_type: TIntegerField;
    intgrfld_EMPPosition: TIntegerField;
    intgrfld_EMPRank: TIntegerField;
    intgrfld_EMPPolitics_face: TIntegerField;
    intgrfld_EMPeducation: TIntegerField;
    intgrfld_EMPmarriage: TIntegerField;
    intgrfld_EMPsex: TIntegerField;
    qry_EMPage: TWideStringField;
    qry_EMPworkage: TWideStringField;
    qry_EMPsextext: TStringField;
    qry_EMPaddr: TWideStringField;
    qry_EMPprovince: TWideStringField;
    qry_EMPIDCard: TWideStringField;
    qry_EMPCardno: TStringField;
    qry_EMPphone: TWideStringField;
    intgrfld_EMPattendance: TIntegerField;
    intgrfld_EMPwagetype: TIntegerField;
    qry_EMProomcode: TWideStringField;
    qry_EMPnation: TWideStringField;
    qry_EMPbirthday: TStringField;
    qry_EMPblood_type: TWideStringField;
    intgrfld_EMPHeight: TIntegerField;
    qry_EMPgraduatedschool: TWideStringField;
    qry_EMPmajorsubject: TWideStringField;
    qry_EMPiDCardtime: TDateTimeField;
    qry_EMPsicardno: TStringField;
    qry_EMPResidencepermit: TStringField;
    qry_EMPbankaccount: TStringField;
    qry_EMPbankname: TWideStringField;
    qry_EMPcontactpersonname: TWideStringField;
    qry_EMPcontactpersontel: TWideStringField;
    qry_EMPcontactpersonaddr: TWideStringField;
    qry_EMPrecommendpersonname: TWideStringField;
    qry_EMPrecommendpersontel: TWideStringField;
    qry_EMPrecommendaddr: TWideStringField;
    qry_EMPrecommendworkplace: TWideStringField;
    qry_EMPGraduateTime: TWideStringField;
    qry_EMPdepartmentcode: TWideStringField;
    qry_EMPdepartmentname: TWideStringField;
    intgrfld_EMPsuperior: TIntegerField;
    atncfld_EMPrkeydep: TAutoIncField;
    qry_EMPemploy_typeitem: TWideStringField;
    qry_EMPRankitem: TWideStringField;
    qry_EMPPolitics_faceitem: TWideStringField;
    qry_EMPeducationitem: TWideStringField;
    qry_EMPmarriageitem: TWideStringField;
    qry_EMPPositionitem: TWideStringField;
    qry_EMPwagetypename: TWideStringField;
    qry_EMPattendancename: TStringField;
    qry_EMPsource: TWideStringField;
    qry_EMPstation: TWideStringField;
    qry_EMPrecognizor: TWideStringField;
    qry_EMPrecognizor_Phone: TWideStringField;
    qry_EMPE_people_relation: TWideStringField;
    intgrfld_EMPstarlevel: TIntegerField;
    qry_EMPremark: TWideStringField;
    intgrfld_EMPprovince_ptr: TIntegerField;
    qry_EMPprinvicename: TWideStringField;
    qry_EMPpublic_accumulation_funds: TWideStringField;
    qry_EMPsiaccountno: TWideStringField;
    intgrfld_EMPserious_mistake: TIntegerField;
    qry_EMPmulti_ability: TWideStringField;
    intgrfld_EMPuser_defined2: TIntegerField;
    intgrfld_EMPcontractcount: TIntegerField;
    qry_EMPemp_contract_flag: TStringField;
    intgrfld_EMPID: TIntegerField;
    qry_EMPLsight: TBCDField;
    qry_EMPRsight: TBCDField;
    qry_EMPformal: TStringField;
    qry_EMPstatus2: TStringField;
    qry_EMPstatus: TWordField;
    qry_EMPIDCardFlag: TStringField;
    qry_EMP_1: TADOQuery;
    atncfld_msg_1rkey: TAutoIncField;
    qry_EMP_1chinesename: TWideStringField;
    intgrfld_msg_1departmentid: TIntegerField;
    qry_EMP_1ondutytime: TDateTimeField;
    qry_EMP_1outdutytime: TDateTimeField;
    intgrfld_msg_1employ_type: TIntegerField;
    intgrfld_msg_1Position: TIntegerField;
    intgrfld_msg_1Rank: TIntegerField;
    intgrfld_msg_1Politics_face: TIntegerField;
    intgrfld_msg_1education: TIntegerField;
    intgrfld_msg_1marriage: TIntegerField;
    intgrfld_msg_1sex: TIntegerField;
    qry_EMP_1addr: TWideStringField;
    qry_EMP_1province: TWideStringField;
    qry_EMP_1IDCard: TWideStringField;
    qry_EMP_1Cardno: TWideStringField;
    qry_EMP_1phone: TWideStringField;
    intgrfld_msg_1attendance: TIntegerField;
    intgrfld_msg_1wagetype: TIntegerField;
    qry_EMP_1roomcode: TWideStringField;
    qry_EMP_1nation: TWideStringField;
    qry_EMP_1photo: TBlobField;
    qry_EMP_1resume: TMemoField;
    qry_EMP_1others_contacts: TWideStringField;
    qry_EMP_1birthday: TDateTimeField;
    qry_EMP_1status: TWordField;
    intgrfld_msg_1classgroupid: TIntegerField;
    qry_EMP_1blood_type: TWideStringField;
    intgrfld_msg_1Height: TIntegerField;
    qry_EMP_1graduatedschool: TWideStringField;
    qry_EMP_1majorsubject: TWideStringField;
    qry_EMP_1iDCardtime: TDateTimeField;
    qry_EMP_1sicardno: TStringField;
    qry_EMP_1Residencepermit: TStringField;
    qry_EMP_1bankaccount: TStringField;
    qry_EMP_1bankname: TWideStringField;
    qry_EMP_1contactpersonname: TWideStringField;
    qry_EMP_1contactpersontel: TWideStringField;
    qry_EMP_1contactpersonaddr: TWideStringField;
    qry_EMP_1recommendpersonname: TWideStringField;
    qry_EMP_1recommendpersontel: TWideStringField;
    qry_EMP_1recommendaddr: TWideStringField;
    qry_EMP_1recommendworkplace: TWideStringField;
    qry_EMP_1GraduateTime: TWideStringField;
    qry_EMP_1Languages: TWideStringField;
    qry_EMP_1wagetypename: TStringField;
    qry_EMP_1attendancename: TStringField;
    intgrfld_msg_1station: TIntegerField;
    intgrfld_msg_1source: TIntegerField;
    qry_EMP_1recognizor: TWideStringField;
    qry_EMP_1recognizor_Phone: TWideStringField;
    qry_EMP_1E_people_relation: TWideStringField;
    intgrfld_msg_1starlevel: TIntegerField;
    qry_EMP_1employeecode: TWideStringField;
    qry_EMP_1remark: TWideStringField;
    intgrfld_msg_1province_ptr: TIntegerField;
    qry_EMP_1public_accumulation_funds: TWideStringField;
    qry_EMP_1siaccountno: TWideStringField;
    intgrfld_msg_1serious_mistake: TIntegerField;
    intgrfld_msg_1frist_RKEY: TIntegerField;
    qry_EMP_1multi_ability: TWideStringField;
    pm_field: TPopupMenu;
    pm_Main: TPopupMenu;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniBrowser: TMenuItem;
    mniEmpChangeInfo: TMenuItem;
    mniResumePrint: TMenuItem;
    mniDel: TMenuItem;
    mniN_Audit: TMenuItem;
    mni_AudiModi: TMenuItem;
    mnil_formal: TMenuItem;
    N1: TMenuItem;
    il1: TImageList;
    qry_EmpAll: TADOQuery;
    AutoIncField1: TAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    IntegerField1: TIntegerField;
    WideStringField3: TWideStringField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    StringField3: TStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    StringField4: TStringField;
    WideStringField9: TWideStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    WideStringField10: TWideStringField;
    WideStringField11: TWideStringField;
    StringField5: TStringField;
    WideStringField12: TWideStringField;
    IntegerField11: TIntegerField;
    WideStringField13: TWideStringField;
    WideStringField14: TWideStringField;
    DateTimeField1: TDateTimeField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    WideStringField17: TWideStringField;
    WideStringField18: TWideStringField;
    WideStringField19: TWideStringField;
    WideStringField20: TWideStringField;
    WideStringField21: TWideStringField;
    WideStringField22: TWideStringField;
    WideStringField23: TWideStringField;
    WideStringField24: TWideStringField;
    WideStringField25: TWideStringField;
    IntegerField12: TIntegerField;
    AutoIncField2: TAutoIncField;
    WideStringField26: TWideStringField;
    WideStringField27: TWideStringField;
    WideStringField28: TWideStringField;
    WideStringField29: TWideStringField;
    WideStringField30: TWideStringField;
    WideStringField31: TWideStringField;
    WideStringField32: TWideStringField;
    StringField9: TStringField;
    WideStringField33: TWideStringField;
    WideStringField34: TWideStringField;
    WideStringField35: TWideStringField;
    WideStringField36: TWideStringField;
    WideStringField37: TWideStringField;
    IntegerField13: TIntegerField;
    WideStringField38: TWideStringField;
    IntegerField14: TIntegerField;
    WideStringField39: TWideStringField;
    WideStringField40: TWideStringField;
    WideStringField41: TWideStringField;
    IntegerField15: TIntegerField;
    WideStringField42: TWideStringField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    StringField10: TStringField;
    IntegerField18: TIntegerField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    StringField11: TStringField;
    StringField12: TStringField;
    WordField1: TWordField;
    N2: TMenuItem;
    N3: TMenuItem;
    N_Pulishment: TMenuItem;
    dtmfld_EMPadate: TDateTimeField;
    strngfld_EmpAllIDCardFlag: TStringField;
    dtmfld_EmpAlladate: TDateTimeField;
    intgrfld_EMPpgrade: TIntegerField;
    intgrfld_EmpAllpgrade: TIntegerField;
    wdstrngfld_EMPpGradeItem: TWideStringField;
    wdstrngfld_EmpAllPGRadeItem: TWideStringField;
    wdstrngfld_EMPDgrade: TWideStringField;
    wdstrngfld_EmpAllDgrade: TWideStringField;
    qry_EMPIsKeyPostiton: TStringField;
    qry_EmpAllIsKeyPostiton: TStringField;
    mniPBCode: TMenuItem;
    mniN4: TMenuItem;
    qry_EMPkeyPID: TIntegerField;
    qry_EmpAllKeyPID: TIntegerField;
    N4: TMenuItem;
    qry_EMPprintdate: TDateTimeField;
    qry_EmpAllprintdate: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure tv1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnFreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnmodelClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
    procedure mniEmpChangeInfoClick(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure intgrfld_EMPIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure mniResumePrintClick(Sender: TObject);
    procedure dbgrdhDetailTitleClick(Column: TColumnEh);
    procedure tv1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure mniN_AuditClick(Sender: TObject);
    procedure mnil_formalClick(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure rg_statusClick(Sender: TObject);
    procedure edt_valueExit(Sender: TObject);
    procedure edt_valueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdhDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdhDetailDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure dbgrdhDetailDblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N_PulishmentClick(Sender: TObject);
    procedure mniPBCodeClick(Sender: TObject);
    procedure mniN4Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    
 
  private
    { Private declarations }
    
     Userstr,  field_name  :string;
       PreColumn: TColumnEh;

      MySql,mysql_all,MySql_All_S,MySql_other: string ;  //save主表Sql
      filterStr,status_filstr,Dep_Filter:string;


    procedure MItemClick(sender: Tobject);
     procedure iniEmp();
     function IsAudit(rkey: integer):string;
     function GetStatusFilStr():string;

  public

   UserRkey :string ; //当前用户ID
  procedure CreateTree(tv:TTreeView; qry:TAdoQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);
  procedure CreateNode(tv: TTreeView;ParentNode: TTreeNode;qry: TADOQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);
  end;

var
  FrmMain: TFrmMain;

implementation
     uses common,Udm,UDetailfrm, UQry, UFrmReport, UEmpChange,
  UDepQry, UModel, UIDCardDes, UExpDetail, UAlert, UPulishment,UPrtBCode;

{$R *.dfm}


function TFrmMain.GetStatusFilStr():string;
begin
    result:='';
           //status_filstr
    if  rg_status.ItemIndex=0  then
       status_filstr:=' (status =0 or status =1) '
    else if  rg_status.ItemIndex=1  then
       status_filstr:=' status=0 '
    else if  rg_status.ItemIndex=2  then
       status_filstr:=' status=1 '
     else if  rg_status.ItemIndex=3  then
       status_filstr:=' status=2 '   ;
      result:=status_filstr;
end;



// add by  lisa
procedure TFrmMain.CreateTree(tv:TTreeView; qry:TAdoQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);
var
  BootNode: TTreeNode; //根结点
  NodeInfo: ^Integer; //rkey
begin
  tv.Items.Clear;
  with qry do
  begin
    Filtered := False;
    Filter :=' '+FN+'= '''+fv+''' ';
    Filtered := True;
    First;
    while not Eof do
    begin
      New(NodeInfo);
      NodeInfo^ := FieldByName(rkey).AsInteger;
      BootNode := tv.Items.AddChildObject(nil,FieldByName(DisplayFieldName).AsString,NodeInfo); //添加根结点，并关联根结点信息
      CreateNode(tv,BootNode,qry,fn,fv,rkey,DisplayFieldName); 
      Next;
    end;
    First;
  end;
  tv.ReadOnly := true;
  tv.DragMode := dmAutomatic;
end;

// add by lisa 
procedure TFrmMain.CreateNode(tv: TTreeView;ParentNode: TTreeNode;qry: TADOQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);
var
  ChildNode:TTreeNode; //孩子结点
  NodeInfo:^Integer; //rkey
  QueryTmp:TADOQuery;
begin
    QueryTmp := TADOQuery.Create(nil);
    QueryTmp.Clone(qry);
    with QueryTmp do
    begin
      Filtered := False;
      Filter := ''+fn+' ='+IntToStr(Integer(ParentNode.Data^));
      Filtered := true;
      while not Eof do
      begin
       New(NodeInfo);
       NodeInfo^:=FieldByName(rkey).value;
       ChildNode:=tv.Items.AddChildObject(ParentNode,FieldByName(DisplayFieldName).AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
       CreateNode(tv,ChildNode,qry,fn,fv,rkey,DisplayFieldName); //递归
       Next;
      end;
      Free; //释放无用的query
    end;
end;






 function  TFrmMain.IsAudit(rkey: integer):string;
 var
   ssql: string;
 begin
    result:='';
    ssql:='select status from employeemsg where rkey ='+inttostr(rkey)+' ';
    if  not openquery(fdm.qrytemp,ssql) then exit;
    if fdm.qrytemp.FieldByName('status').asinteger=1 then
    result:='在职'
    else if fdm.qrytemp.FieldByName('status').asinteger=2 then
     result:='离职'
     else
     result:='未审核';
end;


procedure TFrmMain.FormCreate(Sender: TObject);
begin

//  vprev := '4';
//  user_ptr := '3062';
//  rkey73 := '2563';



  if not App_init_2(FDM.con1) then
  begin
    ShowMsg('程序起动失败！',1);
    application.Terminate;
    exit;
  end;
  // ShowMessage(db_ptr);



//  ShowMessage(inttostr(Pos('a','abc')));


            //625东莞5zhu


    self.Caption:=application.Title;          

 if not qrydep.active then  qryDep.open;

  //初始化部门tree：
 CreateTree(tv1,qryDep,'superior','0','rkey','departmentname')  ;
           tv1.items[1].selected:=true;

  MySql:= qry_emp.sql.text;
  MySql_all:= qry_empAll.sql.text;


  MySql_other:=' and datadepartment.rkey in (select departmentid from hr_permission '
      + ' where operator_ptr= ' + rkey73
      + ' and program_ptr=(select rkey from data0419 where programe =''employeemsg.exe'')) '
      +' order by employeecode ';


  rg_status.ItemIndex:=0;







 // MySql:= '  and ( status=1  or status=0)  ';

   //MySql:=MySql2+MySql;

  // qry_EMP.SQL.text:=mysql;


 //' and ( status=1  or status=0) '
   //   + ' and datadepartment.rkey in (select departmentid from hr_permission '
   //   + ' where operator_ptr= ' + rkey73
    //  + ' and program_ptr=(select rkey from data0419 where programe =''employeemsg.exe'')) '
   //

   with fdm.qrytemp do
  begin
    Close;
    SQL.Text := 'select data0005.rkey from data0005 inner join data0073 '
      + 'on data0005.rkey=data0073.employee_ptr where data0073.rkey = '+ rkey73;
    Open;
    if not IsEmpty then UserRkey := FieldByName('rkey').asstring
    else  UserRkey:='';
  end;





end;

procedure TFrmMain.iniEmp();
var
  ssql:string;
begin
    //打开 emp表显示所有员工信息：

   rg_status.itemindex:=0;

      if rg_status.itemindex=0 then
      ssql:= ' and   (status= 0 or status=1)  '
      else  if rg_status.itemindex=1 then
      ssql:=   '  and    status= 0  '
      else  if rg_status.itemindex=2 then
      ssql:=  ' and  status= 1  '
      else  if rg_status.itemindex=3 then
      ssql:=  ' and  status= 2  ';

 MySql_All_S:=Mysql_all+ssql+mysql_other;

  with qry_emp do
  begin
    Close;
    SQL.clear;
    SQL.Text :=MySql_All_S;
    Open;
   end;

    lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);

end;

procedure TFrmMain.tv1Click(Sender: TObject);
var
  NodeSlt: TTreeNode;
  P: TPoint;
 // Dep_Filter: string;
begin
  edt_value.Text:='';
  //rg_status.ItemIndex:=-1;

  if  not  qry_emp.active then qry_emp.open;

  GetCursorPos(P);
  P := tv1.ScreenToClient(P);
  if (htOnButton in tv1.GetHitTestInfoAt(P.X,P.Y)) then exit;
  Dep_Filter := '';
  if tv1.Selected <> nil then
  begin
    NodeSlt:=tv1.Selected;
    Dep_Filter := 'rkeydep =   ' + IntToStr(Integer(NodeSlt.Data^));
    IF not( tv1.Selected.HasChildren ) then
    begin
          Dep_Filter := '';
          NodeSlt:=tv1.Selected;
          Dep_Filter := ' rkeydep = ' + IntToStr(Integer(NodeSlt.Data^)) + ' or ' + Dep_Filter;
          delete(Dep_Filter,length(Dep_Filter)-2,2);
    end
    else
    BEGIN
      NodeSlt := tv1.Selected.GetFirstChild;
      if tv1.Selected.Level = 0 then
      begin
           Dep_Filter := '';
      end
      else
      begin
        while  (NodeSlt <> nil) and (NodeSlt.Level > tv1.Selected.Level) do
        begin
              Dep_Filter := ' rkeydep = ' + IntToStr(Integer(NodeSlt.Data^)) + ' or ' + Dep_Filter ;
              NodeSlt := NodeSlt.GetNext;
        end;
      end;
    end;
  end;
  with qry_emp do
  begin
//    if SQL.Text<>MySql_all then
//    begin
//     if active then close;
//    sql.Clear;
//    sql.Text:=MySql_all ;
//    open;
//    end;

        Filtered:=False;
        Filter:= Dep_Filter;
        Filtered:=true;

        lblMCount.Caption := inttostr( RecordCount );
  end;
end;

procedure TFrmMain.btnExitClick(Sender: TObject);
begin
 application.Terminate;
end;

procedure TFrmMain.btnFreshClick(Sender: TObject);
var
   i : integer ;
begin
      iniEmp;   //
    // 还原原来所有字段：
   for i:=0 to dbgrdhDetail.Columns.Count-1 do
   begin
    dbgrdhDetail.Columns[i].Visible:=true;
   end;

   qry_emp.Filtered:=false;

   
   rg_status.ItemIndex:=-1;

end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  MItem:  TMenuItem;
  i:integer;
begin

  iniEmp;

       field_name := self.dbgrdhDetail.Columns[1].FieldName;
  PreColumn := dbgrdhDetail.Columns[1];
        self.dbgrdhDetail.Columns[1].Title.Color := clred;

   if qry_emp.IsEmpty then
   self.lblMCount.Caption:= inttostr(qry_emp.recordcount);


  //定位dbgh第一列为可查询列L:
  // self.dbgrdDetail.

 //模块加载：
    with fdm.qrytemp do
     begin
       close;
       sql.clear;
       sql.text:=('select distinct model_name from employeemsg_rpt_model ');
       open;
      if not  isempty  then
        while not eof  do
        begin
          self.rg1.Items.Add(fieldbyname('model_name').asstring);
          next;
        end;
     end;

    rg1.columns:= 6;//fdm.qrytemp.RecordCount;

   //emp字段可见性设置：

        // MItem:=TMenuItem.Create(self);
      for i:=0 to  self.dbgrdhDetail.Columns.Count-1 do
       begin
         MItem:=TMenuItem.Create(self);
        MItem.Caption:=dbgrdhDetail.Columns[i].Title.caption;
        MItem.Checked:=dbgrdhDetail.Columns[1].Visible;
        MItem.OnClick :=MitemClick;
        self.pm_field.Items.add(MItem);
       end;
end;

//字段可见性选择；
  procedure TFrmMain.MItemClick(sender: Tobject);
  var
     i: integer ;
  begin

    (sender as TMenuItem).checked:= not (sender as TMenuItem).checked;
    if (sender as  TmenuItem).checked then
    begin
         for i:=0 to dbgrdhDetail.columns.count-1 do
          begin
            if( dbgrdhDetail.columns[i].Title.Caption=(sender as TMenuItem).caption) then
            begin
            dbgrdhDetail.columns[i].visible:=true;
            break;
            end;
          end;
    end
    else
    begin
       for i:=0 to dbgrdhDetail.columns.count-1 do
          begin
             if( dbgrdhDetail.columns[i].Title.caption=(sender as TMenuItem).caption) then
            begin
            dbgrdhDetail.columns[i].visible:=false;
            break;
             end;
          end;
    end;

  end;


procedure TFrmMain.btnFieldClick(Sender: TObject);
begin
   self.pm_field.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TFrmMain.btnExcelClick(Sender: TObject);
begin
  if ((strtoint(vprev)<>2) and  (strtoint(vprev)<>4) ) then
    begin
    showmessage('没有权限！！');
    exit;
    end;
    if  qry_emp.RecordCount<1  then exit;
      Export_dbGridEH_to_Excel(dbgrdhDetail,'员工信息');
end;

procedure TFrmMain.btnmodelClick(Sender: TObject);
begin
  if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
  begin
    ShowMessage('您的权限不够！');
    Exit;
  end;
  FrmModel := TFrmModel.Create(Application);
 if  FrmModel.ShowModal=mrok then
  begin
    //模块加载：
    with fdm.qrytemp do
     begin
       close;
       sql.clear;
       sql.text:=('select distinct model_name from employeemsg_rpt_model ');
       open;
       fdm.qrytemp.First;
       rg1.Items.clear;
      if not  isempty  then
        while not eof  do
        begin
          self.rg1.Items.Add(fieldbyname('model_name').asstring);
          next;
        end;
     end;


  end;

  FrmModel.Free;
end;

procedure TFrmMain.rg1Click(Sender: TObject);
var
  item, ssql:string;
  i ,j : integer;
begin
    item:= self.rg1.Items.Strings[rg1.itemindex];

ssql:='select datafield_name  from  employeemsg_rpt_model where model_name='''+item+''' ';

    if not (common.OpenQuery(fdm.qrytemp,ssql)) then  exit;
    if fdm.qrytemp.RecordCount<1 then exit;

     dbgrdhDetail.FrozenCols:=0;

    for j:=0 to dbgrdhDetail.Columns.Count-1 do
     begin
       dbgrdhDetail.Columns[j].Visible:=false;
     end;

    fdm.qrytemp.First;
  for j :=0  to fdm.qrytemp.RecordCount-1 do 
    begin
       for i:=0 to self.dbgrdhDetail.Columns.Count-1 do
       begin
        if fdm.qrytemp.FieldByName('datafield_name').value=dbgrdhDetail.Columns[i].Title.Caption then
              begin
              dbgrdhDetail.Columns[i].Visible:=true;
              dbgrdhDetail.Columns[i].Index:=j;
              end;
       end;
        fdm.qrytemp.Next;
    end;

    if self.dbgrdhDetail.Columns.Count>=4 then
    dbgrdhDetail.FrozenCols:=3
    else    if (self.dbgrdhDetail.Columns.Count<4 ) and (self.dbgrdhDetail.Columns.Count>2 ) then
    dbgrdhDetail.FrozenCols:=2;

end;

procedure TFrmMain.mniAddClick(Sender: TObject);
begin


  case Tmenuitem(Sender).Tag of
   2:
   begin
    if  qry_emp.fieldbyname('status').asinteger<>0 then
    begin
    ShowMessage('已审核的请在''审核后修改资料''里修改!');
     exit;
     end;

      if qry_emp.isempty then  exit;
    end;
   end;

  case Tmenuitem(Sender).Tag of
   2,3,4,5,6,7,8,9:
   begin
    //if not qry_EMP.Active then exit;
    if qry_emp.isempty then exit;

    end;
   end;

  case Tmenuitem(Sender).Tag of
   1,2: //新增，编辑，删除  ，4查看
    if (StrToInt(vprev) <>2) and (StrToInt(vprev) <>4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
  end;
  case  (sender as  Tmenuitem).tag of
   9:
   begin
    if ((StrToInt(vprev) =1) or (StrToInt(vprev) = 3)) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

    if qry_EMP.FieldByName('status2').Value='未审核'  then
     begin
      ShowMessage('还末审核不用在这里面修改');
      Exit;
     end;
    end; 
   end;

  case  (sender as  Tmenuitem).tag of

  1,2,3,9: //1新增2编辑3查看


   try
   FrmDetail := TFrmDetail.create(nil);
     FrmDetail.PFlag := TMENuitem(sender).tag;
    if not  FrmDetail.qry_empsave.active then
    begin
      FrmDetail.qry_EMPSave.Parameters[0].Value := qry_EMP.fieldbyname('rkey').Value;
      FrmDetail.qry_empsave.open;
    end;
    FrmDetail.showmodal;
       // FrmDetail.initFrmDetail;

   finally
      FrmDetail.free;

    end;
    end;

  end;



procedure TFrmMain.mniEmpChangeInfoClick(Sender: TObject);
var
  FrmEmpChange: TFrmEmpChange;
begin

     if qry_emp.recordcount<1 then exit;


  try

     FrmEmpChange:=TFrmEmpChange.create(nil);

      with FrmEmpChange.qry_EmpChange do
       begin
         close;
         parameters[0].value :=FrmMain.qry_emp.fieldbyname('rkey').asstring;
         open;
       end;
          FrmEmpChange.showmodal;

    finally
       FrmEmpChange.Free;
      end;





end;

procedure TFrmMain.btnQryClick(Sender: TObject);
var
  i :integer;
  ssql,ssql2: string;
begin
 // ssql:= mysql ;
 ssql:='';
        FrmQry :=TFrmQry.create(nil);

       ssql2:= mysql;

   if frmqry.showmodal = mrok then
   begin
      for i :=1  to frmqry.EditorSgrid_condition.rowcount-2 do
        ssql:= ssql+ frmqry.EditorSgrid_condition.cells[2,i];



    with  qry_EMP do
    begin
      Filtered:=false;
     Close;
     sql.Clear;
     sql.text:= mysql_all+ssql+mysql_other;
      Open;

    end;

    lblMCount.Caption:= IntToStr(qry_EMP.RecordCount);

      //qry_EMP.sql.text:=mysql;
     end;

    rg_status.itemindex:=-1;
    frmqry.free;
end;



procedure TFrmMain.mniDelClick(Sender: TObject);
var
   ssql:  string;
begin
 if qry_emp.isempty then  exit;

  if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

  if  qry_emp.fieldbyname('status').asinteger<>0 then
    begin
    ShowMessage('已审核请先取消审核!');
     exit;
     end;
   


   ssql:= 'select roomcode from employeemsg  where rkey='+ INTTOSTR(qry_emp.fieldbyname('rkey').asinteger)+'  ';
  if  common.openquery(fdm.qrytemp, ssql) then
  begin
    if fdm.qrytemp.recordcount<1 then exit;

    if fdm.qrytemp.fieldbyname('roomcode').asstring<>'' then
    begin
      showmessage('该员工还有住宿记录，不能删除！！');
      exit;
    end;
  end;
 // 判断考勤：
     ssql:= 'select rkey from OnOffDutyData  where employeeid= '''+INTTOSTR(qry_emp.fieldbyname('rkey').AsInteger)+'''  ';
  if  openquery(fdm.qrytemp, ssql) then
  begin
    if fdm.qrytemp.recordcount>0 then
    begin
      showmessage('该员工还存在考勤记录，不能删除！！');
      exit;
    end;
  end;

   ssql:= 'select rkey from employeecard_msg  where status=1 and  employeeid= '+INTTOSTR(qry_emp.fieldbyname('rkey').AsInteger);
  if  openquery(fdm.qrytemp, ssql) then
  begin
    if fdm.qrytemp.recordcount>0 then
    begin
      showmessage('该员工还存在IC卡记录，请检查是否退卡，是否有餐费记录！');
      exit;
    end;
  end;

  if messagedlg('确定要删除吗？',mtwarning,[mbok,mbcancel],1)= mrok  then
      begin
     //qry_emp.edit;
     //qry_emp.delete;
     //qry_emp.UpdateBatch(arall);
     ssql:='delete from  employeemsg where rkey='+INTTOSTR(qry_emp.fieldbyname('rkey').AsInteger)+' ';
     ssql:= ssql +  'delete from  employeeFamilyrelationship where employeeid='+INTTOSTR(qry_emp.fieldbyname('rkey').AsInteger)+' ';
     with  fdm.qrytemp do
     begin
     close;
     sql.Clear;
     SQL.Add(ssql);
     ExecSQL;
     end;
      showmessage('删除成功');
      qry_emp.requery;
       lblMCount.Caption := inttostr(qry_EMP.recordcount);
     end
     else
     exit;
end;

procedure TFrmMain.intgrfld_EMPIDGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
//
   if Sender.DataSet.IsEmpty then exit;
   Text := IntToStr(Sender.DataSet.RecNo);
   if Text = '-1'   then
     Text := IntToStr(Sender.DataSet.RecordCount + 1);
end;

procedure TFrmMain.mniResumePrintClick(Sender: TObject);
begin
  //me
     if qry_emp.recordcount<1 then exit;


     if  (StrToInt(vprev) = 1)  then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

       if qry_emp.fieldbyname('status2').asstring<>'在职' then
    begin
      ShowMessage('该员工资料还没审核，请先不要打印！！');
     exit;
    end;


  FrmReport:=TFrmReport.Create(application);
    with  FrmReport do
    begin

    with qry_Main do
     begin
      close;
      Parameters[0].Value:=qry_EMP.fieldbyname('rkey').AsInteger;
      open;
     end;

     if  qry_Main.IsEmpty THEN EXIT;

     with qry_family do
     begin
      close;
      Parameters[0].Value:=qry_EMP.fieldbyname('rkey').AsInteger;
      open;
     end;



     with qry_Photo do
     begin
      close;
      Parameters[0].Value:=qry_EMP.fieldbyname('rkey').AsInteger;
      open;
     end;

     with qry_change do
     begin
      close;
      Parameters[0].Value:=qry_EMP.fieldbyname('rkey').AsInteger;
      open;
     end;



      ppReport1.Reset;
      ppReport1.Template.FileName :=
      StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'hrinfo.rtm';
      ppReport1.Template.LoadFromFile;
      ppReport1.SaveAsTemplate:=false;
      ppReport1.OutlineSettings.Enabled:=False;
      ppReport1.Print;
      free;


    end;


end;

procedure TFrmMain.dbgrdhDetailTitleClick(Column: TColumnEh);
begin

if dbgrdhDetail.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

 if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_emp.Sort:=Column.FieldName;
    column.Title.Color:=clred;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_emp.Sort:= Column.FieldName + ' DESC';
     column.Title.Color:=clred;
  end;

  if dbgrdhDetail.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName)  then    //and (column.ReadOnly)
  begin
    lbl1.Caption:=column.Title.Caption + ':';
    self.field_name:=column.FieldName;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edt_value.SetFocus;
//if Trim(self.edt_value.text)<>'' then

end;

procedure TFrmMain.tv1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then Node.ImageIndex:=1 else Node.ImageIndex:=2
end;

procedure TFrmMain.mniN_AuditClick(Sender: TObject);
var
  ssql: string;
  i,syes:integer;
begin
   //
   if qry_emp.recordcount<1 then exit;


     if  (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;


    if self.dbgrdhDetail.SelectedRows.count<1 then exit;

  ssql:='';
  syes:=0;
  try
    IF NOT  FDM.con1.InTransaction THEN  fdm.con1.BeginTrans;
     for i := 0 to dbgrdhDetail.SelectedRows.Count - 1 do
    begin
      qry_emp.GotoBookmark(Pointer(dbgrdhDetail.SelectedRows.items[i]));
       if qry_emp.fieldByName('status').asinteger =0 then
       begin
       ssql:= ' update employeemsg  set status=1,auditor='+userrkey+'  where  rkey = '+inttostr(qry_emp.fieldByName('rkey').asinteger)+'  ';
       end
       else if qry_emp.fieldByName('status').asinteger =1 then
       begin
         if syes=0 then
         begin
           if messagedlg('有员工已审核, 需要撤销审核吗？',mtwarning, [mbOK, mbcancel],1)=mrOk then
           begin
           ssql:= ' update employeemsg  set status=0,auditor=0  where  rkey = '+inttostr(qry_emp.fieldByName('rkey').asinteger)+'  ' ;
           syes:=1;
           end
           else
           begin
           ssql:='';
           syes:=2;
           end;
         end
         else
         if syes=1 then
            ssql:= ' update employeemsg  set status=0,auditor=0  where  rkey = '+inttostr(qry_emp.fieldByName('rkey').asinteger)+'  '
         else if syes=2 then
           ssql:= '';

       end ;


     with fdm.qrytemp do
     begin
      close;
      sql.clear;
      sql.text:=ssql;
      if ssql<>'' then 
      execsql;
     end;


    end;

     fdm.con1.CommitTrans;
     if ssql<>'' then
     begin
     showmessage('操作成功:)');
     qry_EMP.requery;
     end;
   except
    on e: Exception do
    begin
      FDM.con1.RollbackTrans;
      ShowMessage('异常: ' + e.Message + '');
    end;
   end;

    ////////////////////////////////////////////////////////-------------------------------


end;

procedure TFrmMain.mnil_formalClick(Sender: TObject);
var
   FResult,i,syes,syes2: integer;
   ssql,str: string;
begin
   //
       if qry_emp.recordcount<1 then exit;


     if  (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

   ssql:='select data0005.rkey, employee_name from data0005 where data0005.rkey='+user_ptr;
   if OpenQuery(FDM.qrytemp,ssql)  then
   begin
    if fdm.qrytemp.IsEmpty then
    Userstr:=''
    else
    Userstr:=fdm.qrytemp.fieldbyname('employee_name').asstring;
    end;
   




    ssql:='';
    syes:=0;
    syes2:=0;
  try
      IF NOT  FDM.con1.InTransaction THEN 
    fdm.con1.BeginTrans;

      for i := 0 to dbgrdhDetail.SelectedRows.Count - 1 do
    begin
      qry_emp.GotoBookmark(Pointer(dbgrdhDetail.SelectedRows.items[i]));

         if qry_emp.fieldbyname('status').asinteger<>1 then
          begin
            ShowMessage('有员工资料还没审校，不能做转正操作！！');
           exit;
          end;


       if leftstr(qry_emp.fieldByName('formal').asstring,3) ='已转正' then
       begin
        if syes=0 then
        begin
          if messagedlg('有员工已转正, 需要撤销转正吗？',mtwarning, [mbOK, mbcancel],1)=mrOk then
             begin
             ssql:= ' update employeemsg  set formal=0 ,formal_name=0   where  rkey = '+inttostr(qry_emp.fieldByName('rkey').asinteger)+'  ';
             syes:=1;
             end
          else
          begin
            ssql:='';
            syes:=2;
          end;
        end
        else if syes=1 then
         ssql:= ' update employeemsg  set formal=0 , formal_name=0   where  rkey = '+inttostr(qry_emp.fieldByName('rkey').asinteger)+'  '
        else
        ssql:=''; 
       end
      else
      begin

      if syes2=0 then
      begin
         if messagedlg('请确认转正是否合格，合格: yes ,不合格: no',mtwarning, [mbyes, mbno] ,1)=mryes then    // 0未转正， 1，2 转正合格/不合格
          begin
           fResult:=1;
           syes2:=1;
          end
         else
         begin
          fResult:=2;
          syes2:=2;
         end;
       end
       else  if syes2=1 then FResult:=1
       else  if syes2=2 then FResult:=2;

         str:= ' 执行转正操作人：'+ Userstr+'  时间：'+ DateTimeToStr(now);
        ssql:= ' update employeemsg  set formal= '+inttostr(fResult)+' , formal_name='+user_ptr+',  remark =isnull(remark,'''')+'''+str+'''  where  rkey = '+inttostr(qry_emp.fieldByName('rkey').asinteger)+'  ';
     end;

     with fdm.qrytemp do
     begin
      close;
      sql.clear;
      sql.text:=ssql;
       if ssql<>'' then
      execsql;
     end;
    end;

      fdm.con1.CommitTrans;

     if ssql<>'' then
     begin
     showmessage('操作成功:)');
     qry_EMP.requery;
     end;
  except
        on e: Exception do
        begin
           fdm.con1.RollbackTrans;
          ShowMessage('异常:  ' + e.Message + '');
          ShowMessage(fdm.qrytemp.SQL.text);
        end;
  end;



end;

procedure TFrmMain.edt_valueChange(Sender: TObject);
var
   ssql: string;
begin
 if trim(edt_value.text)='' then
   begin
    if  qry_emp.filtered=true  then
    begin
     qry_emp.filtered:=false;
     lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);
     exit;
     end;
    end;

   if qry_emp.FieldByName(field_name).datatype in [ftString,ftWideString] then
   ssql:= '  '+field_name+'  like   ''%'+trim(edt_value.text)+'%''  '
    else if qry_emp.FieldByName(field_name).DataType in [ftinteger,ftsmallint, ftDateTime,ftfloat]  then
   ssql:= '  '+field_name+' = '''+trim(edt_value.text)+'''  '
    else
    ssql:='';
   with qry_emp do
   begin
     filtered:= false;
     filter:= ssql;
     filtered:=true;
   end;

   lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);
end;

procedure TFrmMain.rg_statusClick(Sender: TObject);
var
  ssql: string;
begin

   if rg_status.itemindex=0 then
    ssql:= ' and   (status= 0 or status=1)  '
     else  if rg_status.itemindex=1 then
    ssql:=   '  and    status= 0  '
       else  if rg_status.itemindex=2 then
    ssql:=  ' and  status= 1  '
       else  if rg_status.itemindex=3 then
    ssql:=  ' and  status= 2  ';


   with qry_emp do
   begin

     close;
     sql.clear;
     sql.text:=mysql_all+ssql+mysql_other;
     open;

//     Filtered:=false;
//     Filter:=ssql;
//     Filtered:=true;
   end;
   filterStr:=ssql;
    lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);


end;

procedure TFrmMain.edt_valueExit(Sender: TObject);
var
   ssql: string;
begin  if trim(edt_value.text)='' then  exit;

   if qry_emp.FieldByName(field_name).datatype= ftstring then
   ssql:= '  '+field_name+'  like   ''%'+trim(edt_value.text)+'%''  '
    else if qry_emp.FieldByName(field_name).DataType in [ftinteger,ftsmallint, ftDateTime,ftfloat]  then
   ssql:= '  '+field_name+' = '''+trim(edt_value.text)+'''  '
    else
    ssql:='';
   with qry_emp do
   begin
//      Close;
//      sql.Clear;
//      sql.text:=MySql;
//      Open;
     filtered:= false;
     filter:= ssql;
     filtered:=true;
   end;

end;

procedure TFrmMain.edt_valueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key<>13  then
  exit
  else
  begin

   if trim(edt_value.text)='' then
   begin
    if  qry_emp.filtered=true  then
    begin
     qry_emp.filtered:=false;
     lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);
     exit;
     end;
    end;

  edt_valueChange(sender);
  end;


end;

procedure TFrmMain.dbgrdhDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(qry_emp.SQL.Text);
end;

procedure TFrmMain.dbgrdhDetailDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if qry_EMP.FieldByName('emp_contract_flag').asstring = '合同数超限'
  then  dbgrdhDetail.Canvas.Font.Color := clblue ;

  if qry_EMP.FieldByName('serious_mistake').Value > 0
  then  dbgrdhDetail.Canvas.Font.Color := clRed ;

  if qry_EMP.FieldByName('IDCardFlag').Value='身份证快过期'
  then  dbgrdhDetail.Canvas.Font.Color := clAqua ;

  if qry_EMP.FieldByName('status').Value=0 then 
    dbgrdhDetail.Canvas.Font.Color := clFuchsia ;


  dbgrdhDetail.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmMain.N1Click(Sender: TObject);
begin
  if qry_EMP.IsEmpty then Exit;

  try
   frmIDcardDes:= TfrmIDCardDes.create(nil);

      if not  frmIDcardDes.qry_Main.Active   then  frmIDcardDes.qry_Main.open;

   frmIDcardDes.ShowModal;



  finally
     frmIDcardDes.Free;

  end;


end;

procedure TFrmMain.dbgrdhDetailDblClick(Sender: TObject);
begin
 if qry_EMP.IsEmpty then exit;

 Self.mniBrowser.Click;

end;

procedure TFrmMain.N2Click(Sender: TObject);
begin
  if qry_EMP.IsEmpty then Exit;

  try
   FrmExpDetail:= TFrmExpDetail.create(nil);

      if not  FrmExpDetail.qry_Main.Active   then  FrmExpDetail.qry_Main.open;

   FrmExpDetail.ShowModal;



  finally
     FrmExpDetail.Free;

  end;
end;

procedure TFrmMain.N3Click(Sender: TObject);
begin
  try
 frmAlert:=TfrmAlert.create(nil);

   frmAlert.Showmodal;
 finally
   frmAlert.free;
 end;
end;

procedure TFrmMain.N_PulishmentClick(Sender: TObject);
begin

     if qry_emp.recordcount<1 then exit;


  try

     frmPulishment:=TfrmPulishment.create(nil);

      with frmPulishment.qry1 do
       begin
         close;
         parameters[0].value :=FrmMain.qry_emp.fieldbyname('rkey').asstring;
         open;
       end;
          frmPulishment.showmodal;

    finally
       frmPulishment.Free;
  end;

end;

procedure TFrmMain.mniPBCodeClick(Sender: TObject);
begin
     try
                frmPrtBCode:= TfrmPrtBCode.Create(application);
                frmPrtBCode.qryEmpCode.Close;
                frmPrtBCode.qryEmpCode.Parameters[0].Value:=qry_emp.fieldbyname('rkey').value;
                frmPrtBCode.qryEmpCode.Open;
                frmPrtBCode.prprt1.Reset;
                frmPrtBCode.prprt1.Template.FileName :=
                  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
                    'employeemsg_empBarCode.rtm';
                frmPrtBCode.prprt1.Template.LoadFromFile;
                frmPrtBCode.prprt1.SaveAsTemplate:=False;
                frmPrtBCode.prprt1.Print;
        finally
                frmPrtBCode.qryEmpCode.Close;
                frmPrtBCode.Free;
        end;
end;

procedure TFrmMain.mniN4Click(Sender: TObject);
begin
  try
              frmPrtBCode:= TfrmPrtBCode.Create(application);
              frmPrtBCode.prprt1.Reset;
              frmPrtBCode.prprt1.Template.FileName :=
                  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
                    'employeemsg_empBarCode.rtm';
              frmPrtBCode.prprt1.Template.LoadFromFile;
              frmPrtBCode.prprt1.SaveAsTemplate:=true;
              frmPrtBCode.ppDesigner1.ShowModal;
        finally
              frmPrtBCode.qryEmpCode.Close;
              frmPrtBCode.Free;
        end;
end;

procedure TFrmMain.N4Click(Sender: TObject);
begin
    if qry_emp.recordcount<1 then exit;
    if  (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3)  then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;

  FrmReport:=TFrmReport.Create(application);
  try
    with  FrmReport do
    begin

    with qry_Main do
     begin
      close;
      Parameters[0].Value:=qry_EMP.fieldbyname('rkey').AsInteger;
      open;
     end;

      ppReport2.Reset;
      ppReport2.Template.FileName :=
      StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'emptrialrep.rtm';
      ppReport2.Template.LoadFromFile;
      ppReport2.SaveAsTemplate:=false;
//      ppReport2.OutlineSettings.Enabled:=False;
      ppReport2.Print;

      if  qry_EMPprintdate.IsNull then
      if messagedlg('标识为已打印吗？',mtConfirmation,[mbyes,mbno],0) = mryes then
      try
        with FDM.qrytemp do
        begin
          Close;
          sql.text:= 'update employeemsg set printdate = CONVERT(VARCHAR(20),GETDATE(),120) where rkey = '
          + qry_EMP.fieldbyname('rkey').AsString;
          ExecSQL;
        end;
      except
        ShowMessage('更新转正报告打印时间失败');
      end;
    end;
  finally
    FrmReport.Free
  end;
end;

end.

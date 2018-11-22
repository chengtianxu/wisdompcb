unit UDetailfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, ComCtrls,ExtDlgs,jpeg, DBCtrls, CommCtrl,StrUtils,DateUtils,
  OleCtrls, SHDocVw,Mainfrm;

  const NameLen	= 30;
  const SexLen	= 5;
  const NationLen	= 10;
  const DateLen	= 8;
  const AddrLen	= 70;
  const IdLen	= 18;
  const DepartmentLen	= 30;
  const ReserveLen = 36;

type
  TFrmDetail = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    btnSave: TBitBtn;
    btn_close: TBitBtn;
    dlgOpenPic1: TOpenPictureDialog;
    dlgOpenPic2: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    edt_empCode: TEdit;
    edt_EmpName: TEdit;
    dtp_birthday: TDateTimePicker;
    lblAge: TLabel;
    cbb_marage: TComboBox;
    edt_tel: TEdit;
    edt_SecTel: TEdit;
    edt_IDCardNo: TEdit;
    edt_EmpStar: TEdit;
    mmo: TMemo;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    edt_province: TEdit;
    edt_HomeTown: TEdit;
    cbb_degree: TComboBox;
    cbb_polStatus: TComboBox;
    cbb_source: TComboBox;
    edt_RoomNo: TEdit;
    btn_SaveAs: TBitBtn;
    btn_getPic: TBitBtn;
    pnl3: TPanel;
    img1: TImage;
    grp1: TGroupBox;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    btn_GetDep: TSpeedButton;
    btn_Head: TSpeedButton;
    btn_GetPost: TSpeedButton;
    edt_dep: TEdit;
    edt_position: TEdit;
    cbb_rank: TComboBox;
    edt_station: TEdit;
    edt_ability: TEdit;
    cbb_contract: TComboBox;
    rg_Sex: TRadioGroup;
    rg_att: TRadioGroup;
    edt_AttCard: TEdit;
    edt_wageType: TEdit;
    btn7: TSpeedButton;
    btn_GetWageType: TSpeedButton;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    cbb_nation: TComboBox;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl52: TLabel;
    lbl53: TLabel;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    mmo1: TMemo;
    dbgrdh_Relation: TDBGridEh;
    qry_relation: TADOQuery;
    dsS: TDataSource;
    qry_EMPSave: TADOQuery;
    dtp_InDate: TDateTimePicker;
    dtp_OutDate: TDateTimePicker;
    dtp_IDDesDate: TDateTimePicker;
    lbl73: TLabel;
    lbl_MaxCode: TLabel;
    pnl4: TPanel;
    btn_Test: TBitBtn;
    atncfld_relationrkey: TAutoIncField;
    intgrfld_relationemployeeid: TIntegerField;
    qry_relationrelationship: TWideStringField;
    qry_relationchinesename: TWideStringField;
    qry_relationbirth: TWideStringField;
    qry_relationaddr: TWideStringField;
    qry_relationworkplace: TWideStringField;
    qry_relationremark: TWideStringField;
    qry_relationinputdate: TWideStringField;
    qry_relationopration_person: TWideStringField;
    Label1: TLabel;
    Panel1: TPanel;
    edt_RecoCompany: TEdit;
    lbl63: TLabel;
    lbl71: TLabel;
    edt_RecoAddr: TEdit;
    edt_recoTel: TEdit;
    edt_recoName: TEdit;
    edt_AssTel: TEdit;
    edt_AssName: TEdit;
    edt_AddrCard: TEdit;
    edt_Rsight: TEdit;
    lbl13: TLabel;
    edt_Lsight: TEdit;
    lbl12: TLabel;
    lbl64: TLabel;
    lbl62: TLabel;
    lbl61: TLabel;
    lbl60: TLabel;
    edt_BandNo: TEdit;
    edt_BankName: TEdit;
    cbb_BloodType: TComboBox;
    lbl72: TLabel;
    edt_Height: TEdit;
    btn_TestAss: TSpeedButton;
    btn_TestReco: TSpeedButton;
    lbl69: TLabel;
    lbl68: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    lbl67: TLabel;
    lbl70: TLabel;
    lbl43: TLabel;
    lbl49: TLabel;
    lbl48: TLabel;
    lbl47: TLabel;
    lbl46: TLabel;
    lbl45: TLabel;
    lbl44: TLabel;
    lbl42: TLabel;
    lbl41: TLabel;
    lbl40: TLabel;
    edt_school: TEdit;
    edt_major: TEdit;
    edt_eduDate: TEdit;
    edt_lag: TEdit;
    edt_Csocs: TEdit;
    edt_socs: TEdit;
    edt_PFund: TEdit;
    edt_RPName: TEdit;
    edt_RPTel: TEdit;
    edt_RPAddr: TEdit;
    edt_RPRelation: TEdit;
    btn_TestRP: TSpeedButton;
    pm_del: TPopupMenu;
    N1: TMenuItem;
    edt_HomeAddr: TEdit;
    qry_EMPSaverkey: TAutoIncField;
    qry_EMPSavechinesename: TWideStringField;
    qry_EMPSaveemployeecode: TWideStringField;
    qry_EMPSavedepartmentid: TIntegerField;
    qry_EMPSaveondutytime: TDateTimeField;
    qry_EMPSaveoutdutytime: TDateTimeField;
    qry_EMPSaveemploy_type: TIntegerField;
    qry_EMPSavePosition: TIntegerField;
    qry_EMPSaveRank: TIntegerField;
    qry_EMPSavePolitics_face: TIntegerField;
    qry_EMPSaveeducation: TIntegerField;
    qry_EMPSavemarriage: TIntegerField;
    qry_EMPSavesex: TIntegerField;
    qry_EMPSaveaddr: TWideStringField;
    qry_EMPSaveprovince: TWideStringField;
    qry_EMPSaveIDCard: TWideStringField;
    qry_EMPSaveCardno: TStringField;
    qry_EMPSavephone: TWideStringField;
    qry_EMPSaveattendance: TIntegerField;
    qry_EMPSavewagetype: TIntegerField;
    qry_EMPSaveroomcode: TWideStringField;
    qry_EMPSavenation: TWideStringField;
    qry_EMPSavephoto: TBlobField;
    qry_EMPSaveresume: TMemoField;
    qry_EMPSaveothers_contacts: TWideStringField;
    qry_EMPSavebirthday: TDateTimeField;
    qry_EMPSavestatus: TWordField;
    qry_EMPSaveclassgroupid: TIntegerField;
    qry_EMPSaveblood_type: TWideStringField;
    qry_EMPSaveHeight: TIntegerField;
    qry_EMPSavegraduatedschool: TWideStringField;
    qry_EMPSavemajorsubject: TWideStringField;
    qry_EMPSaveiDCardtime: TDateTimeField;
    qry_EMPSavesicardno: TStringField;
    qry_EMPSaveResidencepermit: TStringField;
    qry_EMPSavebankaccount: TStringField;
    qry_EMPSavebankname: TWideStringField;
    qry_EMPSavecontactpersonname: TWideStringField;
    qry_EMPSavecontactpersontel: TWideStringField;
    qry_EMPSavecontactpersonaddr: TWideStringField;
    qry_EMPSaverecommendpersonname: TWideStringField;
    qry_EMPSaverecommendpersontel: TWideStringField;
    qry_EMPSaverecommendaddr: TWideStringField;
    qry_EMPSaverecommendworkplace: TWideStringField;
    qry_EMPSaveGraduateTime: TWideStringField;
    qry_EMPSaveLanguages: TWideStringField;
    qry_EMPSavestation: TIntegerField;
    qry_EMPSavesource: TIntegerField;
    qry_EMPSavewagetypename: TStringField;
    qry_EMPSaveattendancename: TStringField;
    qry_EMPSaverecognizor: TWideStringField;
    qry_EMPSaverecognizor_Phone: TWideStringField;
    qry_EMPSaveE_people_relation: TWideStringField;
    qry_EMPSavestarlevel: TIntegerField;
    qry_EMPSaveremark: TWideStringField;
    qry_EMPSaveprovince_ptr: TIntegerField;
    qry_EMPSavepublic_accumulation_funds: TWideStringField;
    qry_EMPSavesiaccountno: TWideStringField;
    qry_EMPSaveserious_mistake: TIntegerField;
    qry_EMPSavemulti_ability: TWideStringField;
    qry_EMPSavefrist_RKEY: TIntegerField;
    qry_EMPSaveLSight: TBCDField;
    qry_EMPSaveRSight: TBCDField;
    qry_EMPSaveformal: TIntegerField;
    qry_EMPSaveformal_name: TIntegerField;
    qry_EMPSaveAuditor: TIntegerField;
    lbl74: TLabel;
    dtp_ad: TDateTimePicker;
    dtmfld_EMPSaveadate: TDateTimeField;
    lbl75: TLabel;
    edt_PGrade: TEdit;
    btn_SelPgrade: TSpeedButton;
    intgrfld_EMPSavePGrade: TIntegerField;
    Label2: TLabel;
    cbb_DGrade: TComboBox;
    intgrfld_EMPSaveDGrade_ptr: TIntegerField;
    Label3: TLabel;
    rg_IsKey: TRadioGroup;
    qry_EMPSaveIsKeyPostiton: TIntegerField;
    qrytemp: TADOQuery;
    lbl76: TLabel;
    edt_KeyPID: TEdit;
    qry_EMPSaveKeyPID: TIntegerField;
    btn_LZDetail: TButton;
    lbl77: TLabel;
    lbl78: TLabel;
    cbb1: TComboBox;
    chkBox: TCheckBox;
    qry_EMPSaveNeedShoeBox: TBooleanField;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_HeadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dtp_birthdayClick(Sender: TObject);
    procedure edt_empCodeExit(Sender: TObject);
    procedure edt_EmpStarChange(Sender: TObject);
    procedure btn_GetPostClick(Sender: TObject);
    procedure lbl39Click(Sender: TObject);
    procedure btn_GetWageTypeClick(Sender: TObject);
    procedure btn_TestRPClick(Sender: TObject);
    procedure btn_TestAssClick(Sender: TObject);
    procedure btn_TestRecoClick(Sender: TObject);
    procedure btn_getPicClick(Sender: TObject);
    procedure btn_SaveAsClick(Sender: TObject);
    procedure dtp_birthdayExit(Sender: TObject);
    procedure btn_GetDepClick(Sender: TObject);
    procedure edt_IDCardNoExit(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure edt_LsightKeyPress(Sender: TObject; var Key: Char);
    procedure edt_RsightKeyPress(Sender: TObject; var Key: Char);
    procedure edt_HeightKeyPress(Sender: TObject; var Key: Char);
    procedure edt_SecTelKeyPress(Sender: TObject; var Key: Char);
    procedure edt_telKeyPress(Sender: TObject; var Key: Char);
    procedure edt_AttCardKeyPress(Sender: TObject; var Key: Char);
    procedure edt_CsocsKeyPress(Sender: TObject; var Key: Char);
    procedure edt_socsKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PFundKeyPress(Sender: TObject; var Key: Char);
    procedure edt_RPTelKeyPress(Sender: TObject; var Key: Char);
    procedure edt_AssTelKeyPress(Sender: TObject; var Key: Char);
    procedure edt_recoTelKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BandNoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IDCardNoChange(Sender: TObject);
    procedure mmo1Change(Sender: TObject);
    procedure dtp_OutDateClick(Sender: TObject);
    procedure dtp_IDDesDateClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure edt_depChange(Sender: TObject);
    procedure edt_depExit(Sender: TObject);
    procedure edt_positionExit(Sender: TObject);
    procedure edt_stationExit(Sender: TObject);
    procedure edt_wageTypeExit(Sender: TObject);
    procedure btn_TestClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mmo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure dbgrdh_RelationExit(Sender: TObject);
    procedure btn_SelPgradeClick(Sender: TObject);
    procedure edt_PGradeExit(Sender: TObject);
    procedure btn_LZDetailClick(Sender: TObject);
  private
    { Private declarations }
    // 判断重复：
 function IsExits(fv:string):boolean;
  procedure SetContrlStatus(en: boolean);
  procedure EmpSave();

  procedure SetCtrlStatus(fEnabled,fReadonly: boolean);
    procedure initFrmDetail();
   function IsINList(id:Integer;item:string):boolean;
  function GetItemRkey(dictID:integer;item:string):integer;
  function GetDepRkey(Depname:string):integer;
  function GetWTRkey(Wagetypename:string):integer;







  public

       contract_rkey: Integer;
      contract_index: Integer;
      idcardisexit_flag :integer;
      idcardisexit_firstrkey : integer;
   
    PFlag: integer; //  1 新增， 2 编辑 3 查看


  end;

//  function JpegStartsInBlob(PicField:TBlobField):integer;
  function GetBmp(Wlt_File: pchar; intf: integer): integer; stdcall;external 'WltRS.dll';
  function InitComm(iPort: Integer):integer;stdcall;external 'termb.dll';
  function InitComm1(iPort: Integer;iBaud: Integer):integer;stdcall;external 'termb.dll';
  function SetCOMMBaud(iPort: Integer;iBaudRate: Integer):boolean;stdcall;external 'termb.dll';
  function Authenticate():integer;stdcall;external 'termb.dll';
  function Read_Content(iActive : integer):integer;stdcall;external 'termb.dll';
  function CloseComm():integer;stdcall;external 'termb.dll';

  function GetPeopleName(szName:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleSex(szSex:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleNation(szNation:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleBirthday(szBirthday:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleAddress(szAddress:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleIDCode(szID:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetDepartment(szDepartment:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetStartDate(szStartDate:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetEndDate(szEndDate:pchar;iLen:integer):integer;stdcall;external 'termb.dll';



var
  FrmDetail: TFrmDetail;
     m_szDllPath: string;
implementation
         uses udm,  Pick_Item_Single,
          common,ConstVar, UDepQry,UOldInfo;
{$R *.dfm}

function TFrmDetail.GetWTRkey(Wagetypename:string):integer;
var
ssql:string;
begin
     result:=0;
  ssql:='SELECT rkey  FROM dbo.salaryaccount  where  Accountname='''+Wagetypename+'''  ' ;

  if OpenQuery(fdm.qrytemp, ssql) then
  begin
    if fdm.qrytemp.RecordCount>0  then
    begin

      result:=fdm.qrytemp.fieldbyname('rkey').asinteger;
      
    end;

  end;

end;


function TFrmDetail.GetItemRkey(dictID:integer;item:string):integer;
   var
     ssql:string;
  begin
    //
     result:=0;
  ssql:=' select rkey  from datadetail where dictid='+inttostr(dictID)+' and item='''+item+''' ' ;

  if OpenQuery(fdm.qrytemp, ssql) then
  begin
    if fdm.qrytemp.RecordCount>0  then
    begin

      result:=fdm.qrytemp.fieldbyname('rkey').asinteger;
      
    end;

  end;


    
  end;

function TFrmDetail.GetDepRkey(Depname:string):integer;
  var
     ssql:string;
  begin
    //   select rkey From datadepartment where isnull(invalid,0)=0 and  departmentname
       result:=0;
  ssql:=' select rkey From datadepartment where isnull(invalid,0)=0 and  departmentname='''+DepName+''' ' ;

  if OpenQuery(fdm.qrytemp, ssql) then
  begin
    if fdm.qrytemp.RecordCount>0  then
    begin

      result:=fdm.qrytemp.fieldbyname('rkey').asinteger;
      
    end;

  end;

  end;

function TFrmDetail.IsINList(id:Integer;item:string):boolean;  //可以选的不能录入
var
 ssql: string;
begin
  result:=true;
  ssql:=' select item  from datadetail where dictid='+inttostr(ID)+' and item='''+item+''' ' ;

  if OpenQuery(fdm.qrytemp, ssql) then
  begin
    if fdm.qrytemp.RecordCount<1  then
    begin
      //ShowMessage('输入值不选项中，请重新输入！');
      result:=false;
      exit;
    end;


  end;

end;


procedure  TFrmDetail.SetCtrlStatus(fEnabled,fReadonly: boolean);  //赋值
 var
   i : integer;
   ssql:string;
 begin

 for i:=0 to  self.ComponentCount-1 do
        begin
         if self.Components[i]  is Tedit then
         Tedit(self.Components[i]).Enabled:=fEnabled;
         if self.Components[i]  is TMEMo then
         TMEMo(self.Components[i]).Enabled:=fEnabled;
         if self.Components[i]  is TSpeedButton then
         TSpeedButton(self.Components[i]).enabled:=fEnabled;
        if self.Components[i]  is Tcombobox then
         Tcombobox(self.Components[i]).enabled:=fEnabled;
         if self.Components[i]  is TRadioGroup then
         TRadioGroup(self.Components[i]).enabled:=fEnabled;
         if self.Components[i]  is TBitbtn then
         TBitbtn(self.Components[i]).enabled:=fEnabled;
         if self.Components[i]  is TDateTimepicker then
         TDateTimepicker(self.Components[i]).enabled:=fEnabled;
        end;
       btn_SaveAs.enabled:=true;
       // img1.Enabled:=fEnabled;

       //dss.AutoEdit:=fEnabled;
       dtp_OutDate.enabled:=false;
      dbgrdh_Relation.Enabled:=fEnabled;
       rg_IsKey.Enabled:=false;
       edt_KeyPID.Enabled:=false;



   if PFlag=1 then
     ssql:=' SELECT     rkey, employeeid, relationship, chinesename, birth, addr, workplace, remark, inputdate, opration_person '+
           ' FROM   dbo.employeeFamilyrelationship '+
           ' where  1=0 '
    else
     ssql:=' SELECT     rkey, employeeid, relationship, chinesename, birth, addr, workplace, remark, inputdate, opration_person '+
           ' FROM   dbo.employeeFamilyrelationship '+
           ' where employeeid='+frmmain.qry_emp.fieldbyname('rkey').asstring+' ' ;



    with qry_relation do
    begin
      close;
      sql.clear;
      sql.text:=ssql;
      open;
    end;




 end;

 procedure  TFrmDetail.EmpSave();    //赋值
 var
   ssql:string;
   rkey:integer;
 begin

  //审核人：

    //  qry_EMPSave.Fieldbyname('Auditor').value :=strtoint(frmMain.UserRkey);
       qry_EMPSave.Fieldbyname('formal_name').value :=StrToInt(frmMain.UserRkey);    //转正操作人

       
     qry_EMPSave.Fieldbyname('employeecode').asstring := trim(edt_empCode.text);
     
     qry_EMPSave.Fieldbyname('chinesename').asstring := trim(edt_EmpName.Text);

     if rg_sex.ItemIndex=0 then
        qry_EMPSave.Fieldbyname('sex').AsInteger:=0
        else
         qry_EMPSave.Fieldbyname('sex').AsInteger:=1 ;



     qry_EMPSave.Fieldbyname('birthday').AsDateTime:= strtodate(formatdatetime('yyyy-mm-dd',dtp_birthday.Date));
//       if  cbb_marage.ItemIndex=1  then
//        qry_EMPSave.Fieldbyname('marriage').asinteger:=448
//        else
//        qry_EMPSave.Fieldbyname('marriage').asinteger:=7661;

      if cbb_marage.Text<>'' then 
      qry_EMPSave.Fieldbyname('marriage').asinteger:=Integer(cbb_marage.Items.Objects[cbb_marage.itemindex]);

      qry_EMPSave.Fieldbyname('phone').asstring:=trim(edt_tel.text);
      qry_EMPSave.Fieldbyname('others_contacts').asstring:= trim(edt_SecTel.Text);
      qry_EMPSave.Fieldbyname('idcard').asstring:=   trim(edt_idcardno.Text);
      qry_EMPSave.Fieldbyname('starlevel').asstring:=trim(edt_empstar.text);
      qry_EMPSave.Fieldbyname('IDCardTime').AsDateTime:=  strtodate(formatdatetime('yyyy-mm-dd',dtp_iddesDate.date));
      qry_EMPSave.Fieldbyname('remark').asstring:= trim(mmo.Text);
      qry_EMPSave.Fieldbyname('nation').asstring:=cbb_nation.text; //； Integer(cbb_nation.Items.Objects[cbb_nation.itemindex]);    //cbb_nation.ItemIndex;
      qry_EMPSave.Fieldbyname('province').asstring:=trim(edt_province.text);

      if trim(edt_HomeTown.Text)<> '' then
      begin
        with fdm.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT rkey, memo  FROM  dbo.datadetail WHERE dictid = 19 and  memo ='''+trim(edt_HomeTown.Text)+''' ' ;
          Open;
          if fdm.qrytemp.recordcount>0 then 
          qry_EMPSave.Fieldbyname('province_ptr').asstring:= FieldByName('rkey').Value
          else
          qry_EMPSave.Fieldbyname('province_ptr').value:=0;

        end;
      end;

         if cbb_Degree.text<>''  then
      qry_EMPSave.Fieldbyname('education').AsInteger:=    Integer(cbb_Degree.Items.Objects[cbb_Degree.itemindex]); // cbb_Degree.ItemIndex;

         if cbb_DGrade.text<>''  then
      qry_EMPSave.Fieldbyname('DGrade_ptr').AsInteger:=  Integer(cbb_DGrade.Items.Objects[cbb_DGrade.itemindex]); // cbb_Degree.ItemIndex;


             if cbb_polstatus.text<>''  then
      qry_EMPSave.Fieldbyname('politics_face').AsInteger:=Integer(cbb_polstatus.Items.Objects[cbb_polstatus.itemindex]);   //  cbb_polstatus.ItemIndex;

      qry_EMPSave.Fieldbyname('ondutytime').asdatetime:=  strtodate(formatdatetime('yyyy-mm-dd',dtp_indate.Date));
      qry_EMPSave.Fieldbyname('adate').asdatetime:=  strtodate(formatdatetime('yyyy-mm-dd',dtp_ad.Date));


     //qry_EMPSave.Fieldbyname('outdutytime').asdatetime:= strtodate(formatdatetime('yyyy-mm-dd', dtp_outdate.date));
        if cbb_source.text<>''  then
      qry_EMPSave.Fieldbyname('source').AsInteger:=Integer(cbb_source.Items.Objects[cbb_source.itemindex]);    //cbb_source.ItemIndex;
      qry_EMPSave.Fieldbyname('roomcode').asstring:=  trim(edt_roomno.Text);

      //  if trim(edt_HomeAddr.text)<>'' then
       // begin
        // qry_EMPSave.Fieldbyname('remark').Value:=  trim(edt_HomeAddr.text);
         qry_EMPSave.Fieldbyname('addr').Value:=  trim(edt_HomeAddr.text);
      //  end;

    // qry_EMPSaveaddr.Value:= trim(edt_HomeAddr.text);

     // ShowMessage(trim(edt_HomeAddr.text));
    //  ShowMessage(qry_EMPSave.Fieldbyname('addr').asstring+'2');

             if (edt_Dep.text<>'') and (Pflag=1) then
      qry_EMPSave.Fieldbyname('departmentID').value:=  edt_Dep.tag
      else if (edt_Dep.text<>'') and  ((Pflag=2) or  (Pflag=9) ) then
      begin
       qry_EMPSave.Fieldbyname('departmentID').value:= self.GetDepRkey(edt_dep.text);
      end;

           if (edt_position.text<>'') and  (Pflag=1)  then
      qry_EMPSave.Fieldbyname('position').value:= edt_position.tag
       else   if (edt_position.text<>'') and  ((Pflag=2) or  (Pflag=9) )  then
      qry_EMPSave.Fieldbyname('position').value:= self.GetItemRkey(1,edt_position.text);

      //20160803add
     if (edt_PGrade.text<>'') and  (Pflag=1)  then
      qry_EMPSave.Fieldbyname('PGrade').value:= edt_PGrade.tag
      else   if (edt_PGrade.text<>'') and  ((Pflag=2) or  (Pflag=9) )  then
      qry_EMPSave.Fieldbyname('PGrade').value:= self.GetItemRkey(23,edt_PGrade.text);

      
           if cbb_rank.text<>''  then
      qry_EMPSave.Fieldbyname('rank').AsInteger:=  Integer(cbb_rank.Items.Objects[cbb_rank.itemindex]);
        //edt_station    if edt_station.text<>''  then

     if (edt_station.text<>'') and  (Pflag=1)  then
      qry_EMPSave.Fieldbyname('station').value:= edt_station.tag
       else   if (edt_station.text<>'') and  ((Pflag=2) or  (Pflag=9) )  then
      qry_EMPSave.Fieldbyname('station').value:= self.GetItemRkey(16,edt_station.text);




      qry_EMPSave.Fieldbyname('multi_ability').asstring:=  trim(edt_ability.text);


          if cbb_contract.text<>''  then
     qry_EMPSave.Fieldbyname('employ_type').AsInteger:=Integer(cbb_contract.Items.Objects[cbb_contract.itemindex]);

      if rg_att.ItemIndex=0 then
         qry_EMPSave.Fieldbyname('attendance').asinteger:=0
        else
        qry_EMPSave.Fieldbyname('attendance').asinteger:=1;

      if rg_IsKey.ItemIndex=0 then
         qry_EMPSave.Fieldbyname('IsKeyPostiton').asinteger:=0
        else
        qry_EMPSave.Fieldbyname('IsKeyPostiton').asinteger:=1;


        
      qry_EMPSave.Fieldbyname('cardno').asstring:=trim(edt_attcard.text);

          
        if (edt_wagetype.text<>'') and  (Pflag=1)  then
      qry_EMPSave.Fieldbyname('wageType').value:= edt_wagetype.tag
       else   if (edt_wagetype.text<>'') and  ((Pflag=2) or (Pflag=9)  )  then
      qry_EMPSave.Fieldbyname('wageType').value:= self.GetWTRkey(edt_wagetype.text);

      //page2:
      qry_EMPSave.Fieldbyname('graduatedschool').asstring:=  trim(edt_school.text);
      qry_EMPSave.Fieldbyname('majorsubject').asstring:=  trim(edt_major.text);
      qry_EMPSave.Fieldbyname('graduateTime').asstring:= trim(edt_edudate.text);
      qry_EMPSave.Fieldbyname('Languages').asstring:= trim(edt_lag.text);
      qry_EMPSave.Fieldbyname('sicardno').asstring:= trim(edt_Csocs.text);
      qry_EMPSave.Fieldbyname('siaccountno').asstring:=  trim(edt_socs.text);
      qry_EMPSave.Fieldbyname('public_accumulation_funds').asstring:=  trim(edt_PFund.text);
      qry_EMPSave.Fieldbyname('contactPersonTel').asstring:= trim(edt_rptel.text);
      qry_EMPSave.Fieldbyname('contactpersonaddr').asstring:= trim(edt_rpAddr.text);
      qry_EMPSave.Fieldbyname('E_people_relation').asstring:=  trim(edt_RPRelation.text);
      qry_EMPSave.Fieldbyname('contactPersonName').asstring:=  trim(edt_RPName.text);


      qry_EMPSave.Fieldbyname('bankaccount').asstring:= trim(edt_bandno.text);
      qry_EMPSave.Fieldbyname('bankname').asstring:= trim(edt_bankname.text);
       if cbb_BloodType.text <>'' then 
      qry_EMPSave.Fieldbyname('blood_type').asstring:= cbb_BloodType.text;//nteger(cbb_BloodType.Items.Objects[cbb_BloodType.itemindex]); //cbb_BloodType.itemindex;
      qry_EMPSave.Fieldbyname('height').asstring:=  trim(edt_height.text);
        //新加的视力：

            if trim(edt_Lsight.text)<>'' then         //StrToFloat(trim(edt_Lsight.text),
            begin
           qry_EMPSave.Fieldbyname('Lsight').asfloat:=StrToFloat(Trim(edt_Lsight.Text));
           //ShowMessage(FloatToStr(strtofloat(trim(edt_Rsight.text))));
           end;
           if trim(edt_Rsight.text)<>'' then
      qry_EMPSave.Fieldbyname('Rsight').asfloat:=  strtofloat(trim(edt_Rsight.text));

      qry_EMPSave.Fieldbyname('ResidencePermit').asstring:=trim(edt_addrCard.text);
      qry_EMPSave.Fieldbyname('recognizor').asstring:=    trim(edt_AssName.text);
      qry_EMPSave.Fieldbyname('recognizor_phone').asstring:=  trim(edt_AssTel.text);
      qry_EMPSave.Fieldbyname('recommendpersonname').asstring:=trim(edt_RecoName.text);
      qry_EMPSave.Fieldbyname('recommendpersontel').asstring:=trim(edt_RecoTel.text);
      qry_EMPSave.Fieldbyname('recommendaddr').asstring:=trim(edt_RecoAddr.text);
      qry_EMPSave.Fieldbyname('RecommendWorkplace').asstring:=  trim(edt_RecoCompany.text);
      qry_EMPSave.Fieldbyname('formal').asinteger:= cbb1.ItemIndex;  //0未转正，1 转正合格，2转正不合格
//      qry_EMPSave.Fieldbyname('formal').asinteger:=Integer(cbb_contract.Items.Objects[cbb1.itemindex]);
      qry_EMPSave.Fieldbyname('NeedShoeBox').Value:= chkBox.Checked;
      //转正状态和员工审核状态：
      if Pflag=1 then      //新增状态：
      begin
        qry_EMPSave.Fieldbyname('status').asinteger:= 0;


      end;

//page3

    qry_EMPSave.Fieldbyname('resume').asstring:=  trim(mmo1.text);



  
 end;

 //人员验证
function TFrmDetail.IsExits(fv:string):boolean;
//var
  // ssql: string ;
begin
 { result :=true;
       ssql:= 'select empployeecode from employeemsg  where empployeecode='''+fv+''' ';
    if  not ( common.OpenQuery(fdm.qrytemp,ssql)) then exit;
    if fdm.qrytemp.RecordCount>0 then
     begin
      //showmessage(msg);
      result:=false; // fdm.qrytemp.FieldByName('empployeecode').asstring;
     exit;
     end;
          }
end;



procedure TFrmDetail.btn_closeClick(Sender: TObject);
begin
  close;
end;

procedure TFrmDetail.btn_HeadClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'item/职务名称/500';
  InputVar.Sqlstr := 'SELECT rkey, dictid, item FROM dbo.datadetail WHERE dictid = 1 ' + #13;
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := fdm.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edT_position.Text := trim(frmPick_Item_Single.adsPick.fieldbyname('item').asstring);
      edT_position.Tag := frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmDetail.FormShow(Sender: TObject);
var
   ssql,Rsql:  string;
begin
  try
  rg_IsKey.Enabled:=false;

//显示当前最大工号：

 ssql:= 'select max(cast(employeecode as int) ) as employeecode  from employeemsg  where status<>2  '
      + ' and employeecode not like ''ST%''  and   employeecode not like ''L%''  and   employeecode not like ''Z%''    ';   // order by employeecode  desc
   if  (common.openquery(fdm.qrytemp, ssql))  then
   begin
    if fdm.qrytemp.RecordCount>0 then
    lbl_MaxCode.Caption := fdm.qrytemp.FieldByName('employeecode').AsString;
   end;


  //加载婚姻状况：
  ssql:= 'select rkey , item   from  datadetail where  dictid= 11';
  if  (common.openquery(fdm.qrytemp, ssql))  then
  begin
  fdm.qrytemp.first;
  cbb_marage.Items.clear;
  while  not  fdm.qrytemp.Eof do
   begin
   self.cbb_marage.Items.AddObject(fdm.qrytemp.fieldByName('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
       fdm.qrytemp.next;
   end;
  end;
  //加载文化程度:
  ssql:='select rkey , item  from datadetail where dictid=3';
  if  (common.OpenQuery(fdm.qrytemp,ssql)) then
  begin
   fdm.qrytemp.First;
   cbb_degree.Items.Clear;
   while  not fdm.qrytemp.Eof do
   begin
    self.cbb_degree.Items.AddObject(fdm.qrytemp.FieldByName('item').asstring,Tobject(fdm.qrytemp.FieldByName('rkey').asinteger));
    fdm.qrytemp.next;
   end;
  end;

   //加载宿舍等级:
  ssql:='select rkey , item  from datadetail where dictid=24';
  if  (common.OpenQuery(fdm.qrytemp,ssql)) then
  begin
   fdm.qrytemp.First;
   cbb_DGrade.Items.Clear;
   while  not fdm.qrytemp.Eof do
   begin
    self.cbb_DGrade.Items.AddObject(fdm.qrytemp.FieldByName('item').asstring,Tobject(fdm.qrytemp.FieldByName('rkey').asinteger));
    fdm.qrytemp.next;
   end;
  end;

//  ssql:='select rkey , item  from datadetail where dictid=26';
//  if  (common.OpenQuery(fdm.qrytemp,ssql)) then
//  begin
//   fdm.qrytemp.First;
//   cbb1.Items.Clear;
//   while  not fdm.qrytemp.Eof do
//   begin
//    self.cbb1.Items.AddObject(fdm.qrytemp.FieldByName('item').asstring,Tobject(fdm.qrytemp.FieldByName('rkey').asinteger));
//    fdm.qrytemp.next;
//   end;
//  end;

    //加载政治面貌:
  ssql:='select rkey , item  from datadetail where dictid=4';
  if  (common.OpenQuery(fdm.qrytemp,ssql)) then
  begin
   fdm.qrytemp.First;
   self.cbb_polStatus.Items.Clear;
   while  not fdm.qrytemp.Eof do
   begin
    self.cbb_polStatus.Items.AddObject(fdm.qrytemp.fieldbyname('item').asstring,Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
       fdm.qrytemp.Next;
   end;
   end;
      //加载录用来源:
  ssql:='select rkey , item  from datadetail where dictid=17';
  if  (common.OpenQuery(fdm.qrytemp,ssql)) then
  begin
   fdm.qrytemp.First;
   self.cbb_source.Items.Clear;
   while  not fdm.qrytemp.Eof do
   begin
    self.cbb_source.Items.AddObject(fdm.qrytemp.fieldbyname('item').asstring,Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
    fdm.qrytemp.next;
   end;
  end;

         //加载职级:
  ssql:='select rkey , item  from datadetail where dictid=2';
  if  (common.OpenQuery(fdm.qrytemp,ssql)) then
  begin
   fdm.qrytemp.First;
   self.cbb_rank.Items.Clear;
   while  not fdm.qrytemp.Eof do
   begin
    self.cbb_rank.Items.AddObject(fdm.qrytemp.fieldbyname('item').asstring,Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
    fdm.qrytemp.next;
   end;
  end;



            //加载合类型:
  ssql:='select rkey , item  from datadetail where dictid=5 order by rkey';
  if  (common.OpenQuery(fdm.qrytemp,ssql)) then
  begin
   fdm.qrytemp.First;
   self.cbb_contract.Items.Clear;
   while  not fdm.qrytemp.Eof do
   begin
         if fdm.qrytemp.FieldByName('item').AsString ='正式合同' then
        begin
         contract_rkey := fdm.qrytemp.FieldByName('rkey').AsInteger;
         //contract_index:=i5;
        end;

    self.cbb_contract.Items.AddObject(fdm.qrytemp.fieldbyname('item').asstring,Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
    fdm.qrytemp.next;
   end;
  end;
   self.initFrmDetail;
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;

 end;


end;

procedure TFrmDetail.btnSaveClick(Sender: TObject);
var
  ssql , Redsql:string; 
   PicStream : TADOBlobStream;
  QueryTmp: TADOQuery;
  i: Integer;
  Nrkey:   Integer;
begin
    if trim(self.edt_empCode.text)='' then
     begin
       showmessage('工号不能为空！！！');
        self.pgc1.ActivePageIndex:=0;
       edt_empcode.setfocus;

       exit;
     end;

     if trim(self.edt_empName.text)='' then
     begin
       showmessage('员工姓名不能为空！！！');
        self.pgc1.ActivePageIndex:=0;
       edt_empName.setfocus;

       exit;
     end;


     if trim(self.edt_IDCardNo.text)='' then
     begin
       showmessage('员工身份证号不能为空！！！');
        self.pgc1.ActivePageIndex:=0;
       edt_IDCardNo.setfocus;

       exit;
     end;

      if trim(self.edt_position.text)='' then
     begin
       showmessage('员工职务不能为空！！！');
        self.pgc1.ActivePageIndex:=0;
       edt_position.setfocus;

        exit;
     end;

//     if trim(self.edt_pGrade.text)='' then
//     begin
//       showmessage('员工职等不能为空,但暂时可继续保存.');
//       exit;
//     end;


       if trim(self.edt_dep.text)='' then
     begin
       showmessage('请选择部门！！！');
        self.pgc1.ActivePageIndex:=0;
       edt_dep.setfocus;

       exit;
     end;


        if trim(self.cbb_contract.text)='' then
     begin
       showmessage('请选择合同类型！！！');
        self.pgc1.ActivePageIndex:=0;
       edt_dep.setfocus;

       exit;
     end;


     if trim(self.edt_wageType.text)='' then
     begin
       showmessage('请选择工资账套！！！');
        self.pgc1.ActivePageIndex:=0;
       edt_wageType.setfocus;

       exit;
     end;
   if (PFlag = 1) or (PFlag =2) then
   begin
     if (cbb1.ItemIndex =1) or (cbb1.ItemIndex =2) then
     begin
       ShowMessage('未审核不能转正');
       Exit;
     end;
   end;



     //小于16岁的不能入厂：

   if(strtoint(leftstr(lblage.Caption,2))<16) then
    begin
    showmessage('该小于16岁');
     self.pgc1.ActivePageIndex:=0;
    dtp_birthday.setfocus;
    exit;
    end;

    ssql := 'select 1 from employeemsg where neverhire =1 and IDCard = '+ QuotedStr(Trim(edt_IDCardNo.text));
    OpenQuery(FDM.qrytemp,ssql);
    if not FDM.qrytemp.IsEmpty then
    begin
      ShowMessage('此身份证员工已被标记为永不录用，不能入职！！');
      exit;
    end;
    
    if fdm.con1.Connected then
    begin
     try
      if not fdm.con1.InTransaction then
        fdm.con1.BeginTrans;

     if PFlag=1  then
     begin
     qry_empSave.Append;

     end
     else if (Pflag=2) or (Pflag=9) then
     begin
     qry_empSave.Edit;
     qry_relation.Edit;
     end;


     
   //身份验证：不能重复：
    if    PFlag=1  then
       ssql:= 'select rkey, idcard,employeecode, status  from employeemsg  where   idcard='''+trim(edt_idcardNo.text)+''' '
     else
       ssql:= 'select rkey, idcard,employeecode, status  from employeemsg  where   idcard='''+trim(edt_idcardNo.text)+'''  and  employeecode<>'''+trim(edt_empCode.text)+''' ' ;


    if   ( common.OpenQuery(fdm.qrytemp,ssql)) then
    begin
    if fdm.qrytemp.RecordCount>0  then
     begin
        if ((fdm.qrytemp.FieldByName('status').Value=1) or (fdm.qrytemp.FieldByName('status').Value=0)) and ((PFlag=1) or (PFlag=2)  or (PFlag=9)  )   then  // 
        begin
      showmessage('该员工身份证号与系统里在职员工'''+fdm.qrytemp.fieldbyname('employeecode').AsString+'''重复,请核对！！');
      exit;
      end
//      else if   ((fdm.qrytemp.FieldByName('status').Value=1) or (fdm.qrytemp.FieldByName('status').Value=0)) and (PFlag=2) and (fdm.qrytemp.RecordCount>1)  then  //编辑
//      begin
//      showmessage('该员工身份证号与系统里在职员工重复,请核对！！');
//      ShowMessage(IntToStr(fdm.qrytemp.RecordCount));
//      exit;
//      end
      else if(fdm.qrytemp.FieldByName('status').Value=2) and (PFlag=1)  then
        begin
           if Messagedlg('该员工以前做过离职处理，如果已离职超过一个月，请到离职档案中作复职处理，如果未超过一个月确定要继续录入档案吗？',mtConfirmation,[mbyes,mbno],0)=mryes then
           begin
             // if  not qry_EMPSave.State  in [dsedit,dsinsert]     then
              // qry_EMPSave.Edit;
               self.qry_EMPSave.FieldByName('frist_rkey').AsInteger:=fdm.qrytemp.FieldByName('rkey').AsInteger


           end
           else
           begin
           close;
           exit;
           end;
        end;
     end;
    end;

         //相片
      if img1.Picture.Graphic <> nil then
        begin
          PicStream := tadoblobstream.Create(tblobfield(qry_EMPSave.FieldByName('photo')),bmWrite);
          img1.Picture.Graphic.SaveToStream(PicStream);
          PicStream.Position :=0;
          TBlobField(qry_EMPSave.FieldByName('photo')).LoadFromStream(PicStream);
        end
      else qry_EMPSave.FieldByName('photo').Value := null;

      
          //保存
     self.EmpSave;
     qry_empSave.UpdateBatch(arall);
     Nrkey:= qry_empSave.fieldbyname('rkey').asinteger;
     qry_empSave.Requery;



     // 插入合同资料：
      if PFlag=1 then  //新增
      begin
        if trim(self.cbb_contract.Text) = '正式合同' then
        begin
          with fdm.qrytemp do
          begin
            Close;
            SQL.Clear;
             ssql:='insert into dbo.employee_contract values('+quotedStr(edt_empCode.Text)+','
              + IntToStr(Nrkey) +','
              + QuotedStr(DateToStr(dtp_inDate.Date)) + ','                 //合同开始日期  当天日期
              + QuotedStr(DateToStr(dtp_ad.Date)) +','    //试用期满日期
              + QuotedStr(DateToStr(IncYear(dtp_inDate.Date, +3) -1)) +     //合同结束日期
              ', '+inttostr(contract_rkey)+', '
              + QuotedStr(DateToStr(Now())) + ',' + frmMain.UserRkey + ',1,'' '' )';
              SQL.Text :=ssql;
            ExecSQL;
          end;
        end;
      end;

     if (((pflag =1) or (pflag=2) or (pflag=9)  ) and (qry_relation.recordcount>0)) then
     begin
       qry_relation.First;
      // qry_relation.Insert;
      while not qry_relation.Eof do
       begin
         qry_relation.edit;
         qry_relation.FieldByName('employeeid').value := Nrkey;
         qry_relation.FieldByName('inputdate').value := FormatDateTime('yyyy-mm-dd',NOW);
         qry_relation.FieldByName('opration_person').value := FrmMain.UserRkey;
         qry_relation.next;
       end;

      // if    qry_reation.recordcount=1 then
        //qry_reation.post;


     qry_relation.UpdateBatch(arall);
     qry_relation.Requery;

      end;

     if (PFlag<>9) then
     begin
         if ( messagedlg('已保存完成，需要继续添加吗？', mtwarning, [mbOK, mbcancel],1)=mrOK)    then
         begin
          for i:=0 to  self.ComponentCount-1 do
          begin
           if self.Components[i]  is Tedit then
           Tedit(self.Components[i]).Clear;
           if self.Components[i]  is Tcombobox then
           Tedit(self.Components[i]).Text :='';
            if self.Components[i]  is TMEMo then
           TMEMo(self.Components[i]).clear;

          end;

          img1.Picture:=nil;
           //
            ssql:=' SELECT     rkey, employeeid, relationship, chinesename, birth, addr, workplace, remark, inputdate, opration_person '+
             ' FROM   dbo.employeeFamilyrelationship '+
             ' where  1=0 '  ;

            with qry_relation do
            begin
              close;
              sql.clear;
              sql.text:=ssql;
              open;
            end;
           pflag:=1;
        end
        else
        begin
        with FrmMain.qry_EMP do
        begin
          Filtered:=false;
         FrmMain.rg_status.ItemIndex:=1;
          FrmMain.rg_statusClick(sender);
          requery;
          locate('rkey', Nrkey, []);

        end;
        self.close;
        end;
     end
     else
     begin
      with FrmMain.qry_EMP do
      begin
        Filtered:=false;
       FrmMain.rg_status.ItemIndex:=2;
        FrmMain.rg_statusClick(sender);
        requery;
        locate('rkey', Nrkey, []);

      end;
      self.close;
      end;




     FrmMain.lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);

     fdm.con1.CommitTrans;
     except   on e: exception do
       begin
        fdm.con1.RollbackTrans;
        qry_relation.Requery;
        qry_EMPSave.Requery;
        showmessage('错误：'+e.Message);
       end;

   


   end;
    end;
end;




procedure TFrmDetail.dtp_birthdayClick(Sender: TObject);
var  f_ages :real;
Lnow:Tdatetime;
Lsql:string;
begin

  Lnow:= common.getsystem_date(qrytemp,0);

  DateTime_SetFormat(dtp_birthday.Handle,PChar('yyyy-MM-dd'));
  dtp_birthday.Hint := 'A';
  f_ages :=trunc(MonthsBetween(incday(Lnow,1),dtp_birthday.Date)/12.0);
     //  ShowMessage(FloatToStr(f_ages));
  if MonthsBetween(incday(Lnow,1),dtp_birthday.Date) mod 12 = 0
  then
  begin
      //TCX 20170905
   // if dayof(dtp_birthday.Date)<= dayof(now)   then f_ages := f_ages+0.00
   // else f_ages := f_ages-1+0.11;
  end
   else
  begin
     f_ages :=  f_ages +  (MonthsBetween(Lnow,dtp_birthday.Date) mod 12 )/100;
    // ShowMessage('test2');
   end;
 // showmessage( formatfloat('0.00',f_ages))  ;
  lblage.Caption := formatfloat('0.00',f_ages)+'岁';
end;

procedure TFrmDetail.edt_empCodeExit(Sender: TObject);
var
ssql:string;
begin
  if trim(edt_empCode.text)='' then exit;
  if Pflag<>1 then exit;
   ssql:='select employeecode from employeemsg where employeecode='''+trim(self.edt_empCode.text)+''' ';
   if   OpenQuery(FDM.qrytemp,ssql)  then
   begin
   if not   FDM.qrytemp.IsEmpty  then
    begin
      showmessage('该工号已存在，请重输入！！');
      edt_empCode.SetFocus;
      exit;
    end;
  end;
 end;
procedure TFrmDetail.edt_EmpStarChange(Sender: TObject);
begin
  try
    if Trim(edt_EmpStar.Text) <> '' then
    begin
      if StrToInt(edt_EmpStar.Text) > 8 then
      begin
        ShowMessage('员工星级最多8星，请重新输入！');
        edt_EmpStar.Clear;
        Exit;
      end;
      case StrToInt(edt_EmpStar.Text) of
        1 : lbl38.Caption := '★☆☆☆☆☆☆☆';
        2 : lbl38.Caption := '★★☆☆☆☆☆☆';
        3 : lbl38.Caption := '★★★☆☆☆☆☆';
        4 : lbl38.Caption := '★★★★☆☆☆☆';
        5 : lbl38.Caption := '★★★★★☆☆☆';
        6 : lbl38.Caption := '★★★★★★☆☆';
        7 : lbl38.Caption := '★★★★★★★☆';
        8 : lbl38.Caption := '★★★★★★★★';
      else
        lbl38.Caption := '☆☆☆☆☆☆☆☆';
      end;
    end
    else  lbl38.Caption := '☆☆☆☆☆☆☆☆';
  except
    ShowMessage('对不起，请输入数字！');
    edt_EmpStar.Clear;
  end;
end;



procedure TFrmDetail.btn_GetPostClick(Sender: TObject);
 var
 inputRec:PdlgInput;
begin
    frmPick_item_single:= TfrmPick_item_single.Create(nil);
    inputRec.fields:= 'item/岗位名称/400';
    inputrec.sqlstr:='select  rkey, item   from datadetail where dictid=16 ';
    inputrec.keyField:='rKey' ;
    inputrec.ADoConn:=fdm.con1;
    try

    frmPick_item_single.InitForm_New(inputrec);
    if frmPick_item_single.ShowModal =mrok then
    begin
     edt_station.text:= frmPick_item_single.adsPick.fieldbyname('item').asstring;
     edt_station.Tag:= frmpick_item_single.adsPick.fieldByName('rkey').asinteger
    end;


    finally
    

      frmpick_item_single.Free;

   end;


end;


procedure TFrmDetail.lbl39Click(Sender: TObject);
begin
 DateTime_SetFormat(self.dtp_IDDesDate.Handle, '''    -  -  ''');
end;

procedure TFrmDetail.initFrmDetail();
 var
   ssql:string;
   i : integer;
   jpegimage : TJPEGImage;
  PicStream : TADOBlobstream;
  Bitmap: tBitmap;
  LStream: TMemoryStream;
begin
 if PFlag=1 then //新增；
 begin
      with qry_empSave  do
      begin
       close;
       parameters[0].Value :=-1; // frmMain.qry_EMP.FieldByName('rkey').asinteger;
       open;
      end;

      self.rg_att.ItemIndex:=1;

           rg_IsKey.ItemIndex:=0;

        // cbb_contract.itemindex:=1;

        mmo.text:='';
       Mmo1.Text := '点此开始编写履历内容.......';
      img1.Picture.Graphic := nil;
    datetime_setformat(self.dtp_birthday.Handle,'''    -  -  ''');
    dtp_birthday.date:=now; 
    self.dtp_InDate.date:=now;
    self.dtp_ad.date:=IncDay(IncMonth(now,3),-1);
    datetime_setformat(self.dtp_OutDate.Handle,'''    -  -  ''');
    //self.dtp_IDDesDate.date := now;
  //edt_position.Text := '员工';
    cbb_contract.ItemIndex := contract_index;

    SetCtrlStatus(true,false);


 end;

 if (PFlag=2)  then  //编辑：
  begin
    self.Caption:='员工信息-修改';

   
    self.SetCtrlStatus(true,false);
     self.btnSave.Enabled:=true;
      btn_close.Enabled:=true;
    lblage.caption:= frmMain.qry_emp.fieldbyname('age').asstring+'岁';
    //.



  end
  else
   if PFlag=3  then  //查看：
  begin
    self.Caption:='员工信息-查看';


   
   SetCtrlStatus(false,true);
    btn_Test.Enabled:=true;
    self.btnSave.Enabled:=false;
    btn_close.Enabled:=true;
    chkBox.Enabled:= False;
  end;

  if PFlag=9  then  //审核后编辑：
  begin

    self.Caption:='员工信息-审核后一些资料修改';

     
    lblage.caption:= frmMain.qry_emp.fieldbyname('age').asstring+'岁';
   
    self.SetCtrlStatus(false,true);
       self.btnSave.Enabled:=true;
         btn_close.Enabled:=true;
    // Panel1.Enabled:=True;
     
    btn_Test.Enabled:=true;
  dbgrdh_Relation.Enabled:=true;
    
    self.edt_tel.Enabled:=true;
    self.edt_SecTel.Enabled:=true;
    self.edt_IDCardNo.Enabled:=true;
     mmo.Enabled:=true;
     mmo1.Enabled:=true;
     dtp_IDDesDate.Enabled:=True;

      edt_RoomNo.Enabled:=true;
       edt_HomeAddr.Enabled:=true;
       rg_Sex.Enabled:=True;
       edt_EmpName.Enabled:=true;
       rg_att.Enabled:=true;
      // rg_IsKey.Enabled:=true;
       edt_AttCard.Enabled:=true;
       edt_ability.Enabled:=true;
       edt_province.Enabled:=true;
       cbb_nation.Enabled:=true;
       dtp_InDate.Enabled:=true;
       dtp_ad.Enabled:=true;

       cbb_source.Enabled:=true;
       cbb_degree.Enabled:=true;
       cbb_dGrade.Enabled:=true;

       cbb_marage.Enabled:=true;
       cbb_polStatus.Enabled:=true;
        edt_dep.Enabled:=true;
        edt_PGrade.Enabled:=true;
        btn_SelPgrade.Enabled:=true;
        btn_GetDep.Enabled:=true;
        edt_wageType.Enabled:=true;
        cbb_contract.enabled:=True;
        btn_GetWageType.Enabled:=true;
        btn_getPic.Enabled:=true;
        dtp_IDDesDate.Enabled:=True;
        edt_station.Enabled:=True;
        btn_GetPost.Enabled:=True;
        chkBox.Enabled:= True;

       with  Panel1 do
       begin
        for i:=0 to Panel1.ControlCount-1 do
        begin
         if   Panel1.Controls[i] is TEdit then
            TEdit(Panel1.Controls[i]).Enabled:=true;
             if   Panel1.Controls[i] is TSpeedButton then
            TSpeedButton(Panel1.Controls[i]).Enabled:=true;


        end;

       end;




  end ;




   if ((PFlag=2) or (PFlag=3) or (PFlag=9) )  then  //查看：
  begin

     //加载员工照片
    // OutputDebugString(PChar(LeftStr(qry_empSave.fieldbyname('photo').asstring,15)));
    // img1.Picture.Graphic := nil;
    //
   //照片

      if qry_EMPSave.fieldbyname('photo').AsString <> '' then
      begin
        PicStream := tadoblobstream.Create(qry_EMPSavephoto,bmread);
      try
        Bitmap:=TBitmap.Create;

          Bitmap.LoadFromStream(PicStream);
          img1.Picture.Graphic:=Bitmap;

      finally
        Bitmap.Free
      end;

      end
      else img1.Picture.Graphic := nil;



     //取得当前员 工的资料：

     with qry_empSave  do
      begin
       close;
       parameters[0].Value := frmMain.qry_EMP.FieldByName('rkey').asinteger;
       open;
      end;

     self.edt_empCode.text:=self.qry_EMPSave.fieldbyname('employeecode').AsString;
     self.edt_EmpName.Text:=qry_EMPSave.fieldbyname('chinesename').asstring;

     if qry_EMPSave.fieldbyname('sex').value=0 then
        rg_sex.ItemIndex:=0
        else
        rg_Sex.ItemIndex:=1;


     self.dtp_birthday.Date:=qry_EMPSave.Fieldbyname('birthday').AsDateTime;
//       if qry_EMPSave.Fieldbyname('marriage').asinteger=448 then
//        cbb_marage.ItemIndex:=1
//        else
//        cbb_marage.ItemIndex:=0;

   if qry_EMPSave.Fieldbyname('marriage').AsString<>'' then 
    cbb_marage.ItemIndex:=  cbb_marage.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('marriage').AsInteger));



      edt_tel.text:= qry_EMPSave.Fieldbyname('phone').asstring;
      edt_SecTel.Text:=qry_EMPSave.Fieldbyname('others_contacts').asstring;
      edt_idcardno.Text:= qry_EMPSave.Fieldbyname('idcard').asstring;
      edt_empstar.text:=qry_EMPSave.Fieldbyname('starlevel').asstring;
      if qry_EMPSave.Fieldbyname('IDCardTime').asstring <>''  then
      dtp_iddesDate.date:=qry_EMPSave.Fieldbyname('IDCardTime').asdatetime
      else
      DateTime_SetFormat(dtp_iddesDate.Handle, '''    -  -  ''');

      mmo.Text:=qry_EMPSave.Fieldbyname('remark').asstring;
      cbb_nation.text:= qry_EMPSave.Fieldbyname('nation').asstring ;  //cbb_nation.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('nation').asstring));
      edt_province.text:=qry_EMPSave.Fieldbyname('province').asstring;


      if qry_empSave.FieldByName('province_ptr').AsString <> '' then
      begin
        with fdm.qrytemp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT rkey, memo  FROM  dbo.datadetail WHERE dictid = 19 and  rkey = '
            + qry_empSave.FieldByName('province_ptr').AsString+#13;
          Open;
          Self.edt_HomeTown.Tag :=    FieldByName('rkey').AsInteger;
          Self.edt_HomeTown.Text :=   FieldByName('memo').AsString;
        end;
      end;


      cbb_Degree.ItemIndex:=cbb_Degree.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('education').AsInteger));
      cbb_DGrade.ItemIndex:=cbb_DGrade.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('DGrade_ptr').AsInteger));

      cbb_polstatus.ItemIndex:= cbb_polstatus.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('politics_face').AsInteger));
      dtp_indate.Date:=qry_EMPSave.Fieldbyname('ondutytime').asdatetime;
      dtp_ad.Date:=qry_EMPSave.Fieldbyname('adate').asdatetime;

       datetime_setformat(self.dtp_OutDate.Handle,'''    -  -  ''');
      if qry_EMPSave.Fieldbyname('outdutytime').asstring <>''  then 
      dtp_outdate.date:=qry_EMPSave.Fieldbyname('outdutytime').asdatetime;
      cbb_source.ItemIndex:=  cbb_source.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('source').AsInteger));
      edt_roomno.Text:=qry_EMPSave.Fieldbyname('roomcode').asstring;
      edt_HomeAddr.text:=qry_EMPSave.Fieldbyname('addr').asstring;

       ssql:='select departmentName  from datadepartment where rkey = '+inttostr(qry_EMPSave.Fieldbyname('departmentID').asinteger)+'';
       if  openquery(fdm.qrytemp,ssql) then
       begin
       if  fdm.qrytemp.recordcount>0 then
          edt_Dep.text:=fdm.qrytemp.Fieldbyname('departmentName').asstring;
      end;
      //职务：
         ssql:='select item  from datadetail where rkey = '+inttostr(qry_EMPSave.Fieldbyname('position').asinteger)+'';
       if  openquery(fdm.qrytemp,ssql) then
       begin
       if  fdm.qrytemp.recordcount>0 then
       edt_position.text:=fdm.qrytemp.Fieldbyname('item').asstring;
       end;

      //职等：
         ssql:='select item  from datadetail where rkey = '+inttostr(qry_EMPSave.Fieldbyname('PGrade').asinteger)+'';
       if  openquery(fdm.qrytemp,ssql) then
       begin
       if  fdm.qrytemp.recordcount>0 then
       edt_pgrade.text:=fdm.qrytemp.Fieldbyname('item').asstring;
       end;


      //职级：
        //   ssql:='select item  from datadetail where rkey = '+inttostr(qry_EMPSave.Fieldbyname('rank').asinteger)+'';
     //  if not openquery(fdm.qrytemp,ssql) then exit;
      // if  fdm.qrytemp.recordcount>0 then

      if qry_EMPSave.Fieldbyname('rank').asstring<>'' then
      cbb_rank.ItemIndex:=cbb_rank.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('rank').asinteger));

       //岗位：
           ssql:='select item  from datadetail where rkey = '+inttostr(qry_EMPSave.Fieldbyname('station').asinteger)+'';
       if  openquery(fdm.qrytemp,ssql) then
       begin
       if  fdm.qrytemp.recordcount>0 then
       edt_station.text:=fdm.qrytemp.Fieldbyname('item').asstring;
       end;

     edt_ability.text:=qry_EMPSave.Fieldbyname('multi_ability').asstring;



      cbb_contract.ItemIndex:= cbb_contract.Items.IndexOfObject(TObject(qry_EMPSave.Fieldbyname('employ_type').AsInteger));

      if qry_EMPSave.Fieldbyname('attendance').asinteger=0 then
        rg_att.ItemIndex:=0
        else
        rg_att.ItemIndex:=1;

      if qry_EMPSave.Fieldbyname('IsKeyPostiton').asinteger=0 then
        rg_IsKey.ItemIndex:=0
        else
        rg_IsKey.ItemIndex:=1;

      //关键岗位：
      ssql:='select   rkey, positionName  from  hr_keyposition where rkey = '+ qry_EMPSave.Fieldbyname('KeyPID').asstring+' ';
       if  openquery(fdm.qrytemp,ssql) then
       begin
       if  fdm.qrytemp.recordcount>0 then
        edt_KeyPID.text:=fdm.qrytemp.Fieldbyname('positionName').asstring;
        end;


        edt_attcard.text:=qry_EMPSave.Fieldbyname('cardno').asstring;

                //工资账套：
           ssql:='select   accountname  from  salaryaccount where rkey = '+inttostr(qry_EMPSave.Fieldbyname('wagetype').asinteger)+'';
       if  openquery(fdm.qrytemp,ssql) then
       begin
       if  fdm.qrytemp.recordcount>0 then
        edt_wagetype.text:=fdm.qrytemp.Fieldbyname('accountname').asstring;
        end;


      //page2:
      edt_school.text:= qry_EMPSave.Fieldbyname('graduatedschool').asstring;
      edt_major.text:= qry_EMPSave.Fieldbyname('majorsubject').asstring;
      edt_edudate.text:= qry_EMPSave.Fieldbyname('graduateTime').asstring;
      edt_lag.text:= qry_EMPSave.Fieldbyname('Languages').asstring;
      edt_Csocs.text:= qry_EMPSave.Fieldbyname('sicardno').asstring;
      edt_socs.text:= qry_EMPSave.Fieldbyname('siaccountno').asstring;
      edt_PFund.text:= qry_EMPSave.Fieldbyname('public_accumulation_funds').asstring;
      edt_rptel.text:= qry_EMPSave.Fieldbyname('contactPersonTel').asstring;
      edt_rpAddr.text:= qry_EMPSave.Fieldbyname('addr').asstring;
      edt_RPRelation.text:= qry_EMPSave.Fieldbyname('E_people_relation').asstring;
      edt_RPName.text:= qry_EMPSave.Fieldbyname('contactPersonName').asstring;


      edt_bandno.text:= qry_EMPSave.Fieldbyname('bankaccount').asstring;
      edt_bankname.text:= qry_EMPSave.Fieldbyname('bankname').asstring;
      cbb_BloodType.text:=Trim(qry_EMPSave.Fieldbyname('blood_type').asstring);
      edt_height.text:= qry_EMPSave.Fieldbyname('height').asstring;
        edt_Lsight.text:=floattostr(qry_EMPSave.Fieldbyname('Lsight').asfloat);
        edt_Rsight.text:=floattostr(qry_EMPSave.Fieldbyname('Rsight').asfloat);

      edt_addrCard.text:= qry_EMPSave.Fieldbyname('ResidencePermit').asstring;
      edt_AssName.text:= qry_EMPSave.Fieldbyname('recognizor').asstring;
      edt_AssTel.text:= qry_EMPSave.Fieldbyname('recognizor_phone').asstring;
      edt_RecoName.text:= qry_EMPSave.Fieldbyname('recommendpersonname').asstring;
      edt_RecoTel.text:= qry_EMPSave.Fieldbyname('recommendpersontel').asstring;
      edt_RecoAddr.text:= qry_EMPSave.Fieldbyname('recommendaddr').asstring;
      edt_RecoCompany.text:= qry_EMPSave.Fieldbyname('RecommendWorkplace').asstring;
      cbb1.ItemIndex :=  qry_EMPSave.Fieldbyname('formal').AsInteger;
//      cbb1.ItemIndex:= cbb1.Items.IndexOfObject(Tobject(fdm.qrytemp.FieldByName('formal').asinteger));
      chkBox.Checked:= qry_EMPSave.Fieldbyname('NeedShoeBox').Value;
      if (PFlag = 9) and ((cbb1.ItemIndex = 0) or (cbb1.ItemIndex =3)) then  cbb1.Enabled:= True;
//page3

 mmo1.text:= qry_EMPSave.Fieldbyname('resume').asstring;




  end;






end;

procedure TFrmDetail.SetContrlStatus(en: boolean);
var
  i,j: integer;
begin
  { for i:=0 to  pnl1.ComponentCount-1 do
   begin
       pnl1.Components[i].enabled:=en;
   end;

    for i:=0 to  grp1.ComponentCount-1 do
   begin
    grp1.Components[i].enabled:=en;
   end;

    for i:=0 to  ts2.ComponentCount-1 do
   begin
       ts2.Components[i].enabled:=en;
   end;
       mmo1.enabled:=en;
       dbgrdh_relation.enabled:=en;   }

end;


procedure TFrmDetail.btn_GetWageTypeClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'Accountname/帐套名称/80,discription/描述/80,'
    + 'remark/备注/180';
  InputVar.Sqlstr := 'SELECT rkey, Accountname, discription, remark ' + #13
    + 'FROM dbo.salaryaccount'+#13;
  try
  inputvar.KeyField :='rkey';
  InputVar.AdoConn := fdm.con1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edt_wageType.Text := trim(frmPick_Item_Single.adsPick.FieldByName('Accountname').asstring);
    edt_wageType.tag := frmPick_Item_Single.adsPick.FieldByName('rkey').value;
  end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmDetail.btn_TestRPClick(Sender: TObject);
begin
  with fDM.qrytemp do
  begin
    if Trim(edt_RPName.Text) <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select employeecode,chinesename,departmentname, '
        + ' case sex when 0 then ''女'' else ''男'' end SexDisplay, '
        + ' case status when 1 then ''在职'' when 2 then ''离职'' when 0 then ''末审核'' end statusDisplay '
        + ' from employeemsg '
        + ' inner join datadepartment on employeemsg.departmentid = datadepartment.rkey '
        + ' where chinesename = ' + QuotedStr(edt_RPName.Text) ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('紧急联络人: ' + FieldByName('chinesename').asstring + ' 为本厂员工，概览如下：'
          + #13 + #13 + '工号: ' + FieldByName('employeecode').asstring
          + #13 +  '姓名: ' + FieldByName('chinesename').asstring
          + #13 +  '性别: ' + FieldByName('SexDisplay').asstring
          + #13 +  '部门: ' + FieldByName('departmentname').asstring
          + #13 +  '状态: ' + FieldByName('statusDisplay').asstring);
      end;
    end;
  end;
end;

procedure TFrmDetail.btn_TestAssClick(Sender: TObject);
begin
  with fDM.qrytemp do
  begin
    if Trim(edt_AssName.Text) <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select employeecode,chinesename,departmentname, '
        + ' case sex when 0 then ''女'' else ''男'' end SexDisplay, '
        + ' case status when 1 then ''在职'' when 2 then ''离职'' WHEN 0 then ''未审核'' end statusDisplay '
        + ' from employeemsg '
        + ' inner join datadepartment on employeemsg.departmentid = datadepartment.rkey '
        + ' where chinesename = ' + QuotedStr(edt_AssName.Text) ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('担保人: ' + fieldbyname('chinesename').asstring + ' 为本厂员工，概览如下：'
          + #13 + #13 + '工号: ' + fieldbyname('employeecode').asstring
          + #13 +  '姓名: ' + fieldbyname('chinesename').asstring
          + #13 +  '性别: ' + fieldbyname('SexDisplay').asstring
          + #13 +  '部门: ' + fieldbyname('departmentname').asstring
          + #13 +  '状态: ' + fieldbyname('statusDisplay').asstring );
      end;
    end;
  end;
end;

procedure TFrmDetail.btn_TestRecoClick(Sender: TObject);
begin
  with fDM.qrytemp do
  begin
    if Trim(edt_RecoName.Text) <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select employeecode,chinesename,departmentname, '
        + ' case sex when 0 then ''女'' else ''男'' end SexDisplay, '
        + ' case status when 1 then ''在职'' when 2 then ''离职''  WHEN 0 then ''未审核'' end statusDisplay '
        + ' from employeemsg '
        + ' inner join datadepartment on employeemsg.departmentid = datadepartment.rkey '
        + ' where chinesename = ' + QuotedStr(edt_RecoName.Text) ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('推荐人: ' + FieldByName('chinesename').asstring + ' 为本厂员工，概览如下：'
          + #13 + #13 + '工号: ' + FieldByName('employeecode').asstring
          + #13 +  '姓名: ' + FieldByName('chinesename').asstring
          + #13 +  '性别: ' + FieldByName('SexDisplay').asstring
          + #13 +  '部门: ' + FieldByName('departmentname').asstring
          + #13 +  '状态: ' + FieldByName('statusDisplay').asstring);
      end;
    end;
  end;
end;

procedure TFrmDetail.btn_getPicClick(Sender: TObject);
var
  iRet : integer;
  szName:Array[0..NameLen] of char;
  szSex:Array[0..SexLen] of char;
  szNation:Array[0..NationLen] of char;
  szBirthday:Array[0..DateLen] of char;
  szAddress:Array[0..AddrLen] of char;
  szID:Array[0..IdLen] of char;
  szDepartment:Array[0..DepartmentLen] of char;
  szStartDate:Array[0..DateLen] of char;
  szEndDate:Array[0..DateLen] of char;
  BMP:TBitmap;
  JPG:TJpegImage;
  JPGFile:string;
  outSzDate: TDateTime;
begin

  edt_IdCardNo.SetFocus();
  if (edt_EmpName.Text <> '') or (edt_IdCardNo.Text <> '')
  or (edt_HomeAddr.Text <> '') or(edt_province.Text <> '')
  or (rg_sex.ItemIndex <> -1) or (cbb_nation.Text <> '')
  or (dtp_birthday.Hint <> '') or (dtp_IDDesDate.Hint <> '')
  then
  begin
    edt_EmpName.Text := '';
    edt_IDCardNo.Text := '';
    edt_HomeAddr.Text := '';
    img1.Picture.Assign(nil);
    FillChar(szName, sizeof(szName), 0);
    m_szDllPath := ExtractFilePath(application.ExeName);
    iRet := InitComm1(strToint('1001'), strToint('115200'));

    if  (Application.MessageBox('从身份证读取后，一些已填写的资料将被新内容替换，是否继续?', PChar('提示'),MB_YESNO)=6) then
    begin
      if iRet <> 1 then
      begin
        ShowMessage('打开端口失败');
        exit;
      end;
      Authenticate();
      iRet := Read_Content(1);
      if iRet <> 1 then
      begin
        ShowMessage('读卡失败，请查看设备是否正常运行');
        CloseComm();
        exit;
      end;
      iRet := GetPeopleName(szName,sizeof(szName));
      iRet := GetPeopleSex(szSex,sizeof(szSex));
      iRet := GetPeopleNation(szNation,sizeof(szNation));
      iRet := GetPeopleBirthday(szBirthday,sizeof(szBirthday));
      iRet := GetPeopleAddress(szAddress,sizeof(szAddress));
      iRet := GetPeopleIDCode(szID,sizeof(szID));
      iRet := GetDepartment(szDepartment,sizeof(szDepartment));
      iRet := GetStartDate(szStartDate,sizeof(szStartDate));
      iRet := GetEndDate(szEndDate,sizeof(szEndDate));
      CloseComm();
      if iRet = 0 then
      begin
        ShowMessage('获取卡信息失败，请查看卡是否放置正确，或查看设备是否正常运行');
        exit;
      end;
      edt_EmpName.Text := szName;
      if szSex = '男' then rg_sex.ItemIndex:= 1
      else rg_sex.ItemIndex:= 0;
      DateTime_SetFormat(dtp_birthday.Handle,PChar('yyyy-MM-dd'));
      dtp_birthday.Date := StrToDate(Format('%s-%s-%s', [copy(szBirthday,1,4), copy(szBirthday, 5, 2), copy(szBirthday, 7,2)]));
      dtp_birthday.Hint := 'A';
      edt_IDCardNo.Text := szID;
      edt_HomeAddr.Text := szAddress;
      edt_province.Text := LeftStr(szAddress, 6);
      cbb_nation.Text := szNation+'族';
      if not FileExists(m_szDllPath+'zp.bmp') then
      begin
        Application.MessageBox('文件不存在，请重新读取', '错误', mb_iconerror);
        Exit;
      end;
      img1.Picture.LoadFromFile(m_szDllPath+'zp.bmp');
      DeleteFile(m_szDllPath+'\zp.bmp');
      dtp_IDDesDate.Date := StrToDate(Format('%s-%s-%s', [copy(szEndDate,1,4), copy(szEndDate, 5, 2), copy(szEndDate, 7,2)]));
      dtp_IDDesDate.Hint := 'A';
    end;
  end
  else
  begin
    edt_EmpName.Text := '';
    edt_IDCardNo.Text := '';
    edt_HomeAddr.Text := '';
    img1.Picture.Assign(nil);
    FillChar(szName,sizeof(szName),0);
    m_szDllPath := ExtractFilePath(application.ExeName);
    iRet := InitComm1(strToint('1001'),strToint('115200'));
    if iRet <> 1 then
    begin
      ShowMessage('打开端口失败');
      exit;
    end;
    Authenticate();
    iRet := Read_Content(1);
    if iRet <> 1 then
    begin
      ShowMessage('读卡失败，请查看设备是否正常运行');
      CloseComm();
      exit;
    end;
    iRet := GetPeopleName(szName,sizeof(szName));
    iRet := GetPeopleSex(szSex,sizeof(szSex));
    iRet := GetPeopleNation(szNation,sizeof(szNation));
    iRet := GetPeopleBirthday(szBirthday,sizeof(szBirthday));
    iRet := GetPeopleAddress(szAddress,sizeof(szAddress));
    iRet := GetPeopleIDCode(szID,sizeof(szID));
    iRet := GetDepartment(szDepartment,sizeof(szDepartment));
    iRet := GetStartDate(szStartDate,sizeof(szStartDate));
    iRet := GetEndDate(szEndDate,sizeof(szEndDate));
    CloseComm();
    if iRet = 0 then
    begin
      ShowMessage('获取卡信息失败，请查看卡是否放置正确，或查看设备是否正常运行');
      exit;
    end;

    edt_EMpName.Text := szName;
    if szSex = '男' then rg_sex.ItemIndex:= 1
    else rg_Sex.ItemIndex:= 0;
    DateTime_SetFormat(dtp_birthday.Handle,PChar('yyyy-MM-dd'));
    dtp_birthday.Date := StrToDate(Format('%s-%s-%s', [copy(szBirthday,1,4), copy(szBirthday, 5, 2), copy(szBirthday, 7,2)]));
    dtp_birthday.Hint := 'A';
    edt_IDCardNo.Text := szID;
    
    edt_HomeAddr.Text := szAddress;
    edt_province.Text := LeftStr(szAddress,3);
    cbb_nation.Text := szNation+'族';

    if not FileExists(m_szDllPath+'zp.bmp') then
    begin
       Application.MessageBox('文件不存在，请重新读取','错误',mb_iconerror);
       Exit;
    end;
    img1.Picture.LoadFromFile(m_szDllPath+'zp.bmp');
    DeleteFile(m_szDllPath+'\zp.bmp');
    dtp_IDDesDate.Date := StrToDate(Format('%s-%s-%s', [copy(szEndDate,1,4), copy(szEndDate, 5, 2), copy(szEndDate, 7,2)]));
    dtp_IDDesDate.Hint := 'A';
  end;
 // IDCardIsExit; //看看是否重复身份证

    
end;

procedure TFrmDetail.btn_SaveAsClick(Sender: TObject);
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够！');
      Exit;
    end;
  self.SavePictureDialog1.FileName := edt_Empcode.Text+edt_EmpName.Text+'.jpg';
  if self.SavePictureDialog1.Execute then
    img1.Picture.SaveToFile(self.SavePictureDialog1.FileName)
    else 
   //messagedlg('图片保存失败!',mterror,[mbcancel],0);
end;

procedure TFrmDetail.dtp_birthdayExit(Sender: TObject);
begin
dtp_birthdayClick(sender);
end;

procedure TFrmDetail.btn_GetDepClick(Sender: TObject);
begin
 FrmDepQry := TFrmDepQry.Create(application);
     if  FrmDepQry.showmodal=mrOK then
     begin
      Self.edt_dep.Text := FrmDepQry.PDepName;
      Self.edt_dep.Tag:=  FrmDepQry.Prkey;
      with FDM.qrytemp do
      begin
        Close;
        SQL.Text:= 'select NeedBox from datadepartment where rkey = ' + IntToStr(edt_dep.Tag);
        Open;
        chkBox.Checked := FieldByName('NeedBox').Value;
      end;
      end;

  with fdm.qrytemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey, departmentname, departmentcode, superior, chargename, departmentration, max_overproof_percent,  '
      + 'departmentcount, scarcity from datadepartment where invalid <> 1 and rkey=' + IntToStr(Self.edt_dep.Tag);
    Open;
    if FieldByName('departmentcount').AsInteger >=  Round (FieldByName('departmentration').AsInteger * (1 + FieldByName('max_overproof_percent').AsInteger/100)) then
    begin
      ShowMessage('该部门定额人数已满，不能新增人员，请查证！');
      Self.edt_dep.Clear;
      Self.edt_dep.Tag := 0;
      chkBox.Checked:= False;
      Exit;
    end;
  end;
end;

procedure TFrmDetail.edt_IDCardNoExit(Sender: TObject);
var result_str : string;
begin
  if  edt_IDCardNo.Text='' then exit;
  if PFlag<>1 then exit;
with  fdm.qrytemp do
begin
  SQL.Clear;
  SQL.Text :=' select dbo.get_hrVerification_IdenNo('+quotedstr(edt_IDCardNo.Text)+') as result';
  ExecSQL;
  Open;
  result_str := FieldByName('result').AsString ;
  Close;
  end;
  if result_str <>'正确'then
  begin
    if messagedlg('请确认身份证号是否正确！！继续录入吗？',mtwarning, [mbok, mbcancel],1) = mrcancel then
    edt_IDCardNo.SetFocus;
    Abort;
  end;
  dtp_birthdayClick(sender);

end;

procedure TFrmDetail.img1Click(Sender: TObject);
var
  JpgFile:TjpegImage;
  MyBmp: TBitmap;
  filepath: string;
begin
  filepath := ExtractFilePath(application.ExeName);
  try
    if dlgOpenPic2.Execute then
    begin
      if trim(dlgOpenPic2.filename)= '' then exit;

        JpgFile:=TjpegImage.create;
        MyBmp:=TBitmap.create;
        JpgFile.LoadFromFile(dlgOpenPic2.filename);
        MyBmp.Assign(JpgFile);
        MyBmp.SaveToFile(filepath + 'temp.bmp');

      img1.Picture:=nil;
      img1.picture.LoadFromFile(filepath + 'temp.bmp');
    end;
    DeleteFile(ExtractFileDir(dlgOpenPic2.FileName)+'zp.bmp');
  except
    on e: Exception do
        begin
          //fdm.con1.RollbackTrans;
          ShowMessage('异常: (' + e.Message + ')');
          MyBmp.free;
         JpgFile.Free;
        end


  end;
  
end;

procedure TFrmDetail.edt_LsightKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

procedure TFrmDetail.edt_RsightKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

procedure TFrmDetail.edt_HeightKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

procedure TFrmDetail.edt_SecTelKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_telKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_AttCardKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_CsocsKeyPress(Sender: TObject; var Key: Char);
begin
//if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_socsKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_PFundKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_RPTelKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_AssTelKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_recoTelKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_BandNoKeyPress(Sender: TObject; var Key: Char);
begin
//if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TFrmDetail.edt_IDCardNoChange(Sender: TObject);
var str : string;
    birthdaytime: Tdatetime;
    f_ages : real;
begin
  if Pflag=3  then exit;
  if trim(edt_IDCardNo.text)='' then exit;

  with fdm.qrytemp do
  begin
    close;
    SQL.Clear;
    SQL.Text := 'select * from datadetail where item = ' + QuotedStr(LeftStr(edt_IDCardNo.Text, 6));
    Open;
    if not IsEmpty then
    begin
      edt_HomeTown.Text := fieldbyname('memo').asstring;    //取前六位得到籍贯
      edt_HomeTown.Tag := fieldbyname('rkey').asinteger;
    end
    else
    begin
      edt_HomeTown.Clear;
      edt_HomeTown.Tag := 0;
    end;
  end;
    //取第7位开始得到生日并更新出生日期：
 str := midstr(edt_IDCardNo.Text,7,4)+'-'+ midstr(edt_IDCardNo.Text,11,2) +'-'+midstr(edt_IDCardNo.Text,13,2);
 if (length(edt_IDCardNo.Text)=18)  then
 begin
 if  trystrtodate(str,birthdaytime)
 then
 begin
  dtp_birthday.Date := birthdaytime;
  dtp_birthdayClick(sender);
  //dtp_birthday.Onchange(sender);


 end;
 end;

end;

procedure TFrmDetail.mmo1Change(Sender: TObject);
begin
  if mmo1.text='点此开始编写履历内容.......' then
    mmo1.text:='';
end;

procedure TFrmDetail.dtp_OutDateClick(Sender: TObject);
begin
//  DateTime_SetFormat(dtp_OutDate.Handle,PChar('yyyy-MM-dd'));
end;

procedure TFrmDetail.dtp_IDDesDateClick(Sender: TObject);
begin
  DateTime_SetFormat(dtp_IDDesDate.Handle,PChar('yyyy-MM-dd'));
end;

procedure TFrmDetail.Label1Click(Sender: TObject);
begin
 DateTime_SetFormat(self.dtp_OutDate.Handle, '''    -  -  ''');
end;

procedure TFrmDetail.edt_depChange(Sender: TObject);
begin
  if (PFlag=1) or (PFlag=2) or (PFlag=9) then
btn_GetDepClick(sender);
end;

procedure TFrmDetail.edt_depExit(Sender: TObject);
var
  ssql:STRING;
begin
    if (PFlag<>1 ) and  (Pflag<>2)  then exit;
    if Trim(edt_dep.text)='' then exit;
   ssql:=' select  departmentName   from  datadepartment where departmentName='''+trim(edt_dep.text)+''' ';

   if OpenQuery(FDM.qrytemp,ssql)  then
   begin
     if fdm.qrytemp.RecordCount<1  then
     ShowMessage('输入值不在选项中， 请重新输入！');
     //edt_dep.SETFOCUS;
     EXIT;
   end;


end;

procedure TFrmDetail.edt_positionExit(Sender: TObject);
begin
 if (PFlag<>1 ) and  (Pflag<>2)  then exit;
  if Trim(edt_position.text)='' then exit;
 if  not  self.IsINList(1,Trim(edt_position.Text))  then
 begin
  ShowMessage('输入值不在选项中， 请重新输入！');
  edt_position.SetFocus;
 exit;
 end;

end;

procedure TFrmDetail.edt_stationExit(Sender: TObject);
begin
 if (PFlag<>1 ) and  (Pflag<>2)  then exit;
 if Trim(edt_station.text)='' then exit;
 if  not  self.IsINList(16,Trim(edt_station.Text))  then
 begin
  ShowMessage('输入值不在选项中， 请重新输入！');
  edt_station.SetFocus;
 exit;
 end;
end;

procedure TFrmDetail.edt_wageTypeExit(Sender: TObject);
var
  ssql:STRING;
begin
    if (PFlag<>1 ) and  (Pflag<>2)  then exit;
     if Trim(edt_wageType.text)='' then exit;
   ssql:=' select  accountName   from  salaryaccount where accountName='''+trim(edt_wageType.text)+''' ';

   if OpenQuery(FDM.qrytemp,ssql)  then
   begin
     if fdm.qrytemp.RecordCount<1   then
     ShowMessage('输入值不在选项中， 请重新输入！');
    // edt_wageType.SETFOCUS;
     EXIT;
   end;

end;

procedure TFrmDetail.btn_TestClick(Sender: TObject);
var
  ssql, Nstr: string;
begin
 //
  if qry_relation.IsEmpty then exit;
            Nstr:='';
   qry_relation.First;
   while not qry_relation.Eof do
   begin
      Nstr:=Nstr+''''+qry_relation.fieldbyname('chineseName').asstring+''',';
      qry_relation.Next;
   end;

   Nstr:= Copy(Nstr,0,Length(Nstr)-1);
   ssql:= 'select chineseName from employeemsg where  chineseName  in ('+Nstr+') ';
   if OpenQuery(FDM.qrytemp,ssql)  then
   begin
     if fdm.qrytemp.IsEmpty then
     begin
     showmessage('该员工没有在厂内的亲属');
     exit;
      end;
         fdm.qrytemp.First;

   while not fdm.qrytemp.Eof do
   begin
      Nstr:=Nstr+''''+fdm.qrytemp.fieldbyname('chineseName').asstring+''',';
      qry_relation.Next;
   end;

       Nstr:= Copy(Nstr,0,Length(Nstr)-1);

     ShowMessage('该员工亲属在本厂的可能有以下人员, 请查实： '+Nstr);
   end;


end;

procedure TFrmDetail.FormActivate(Sender: TObject);
begin
  self.KeyPreview:=true;


end;

procedure TFrmDetail.mmo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   if Key = #13 then
//      begin
//        Key := 0;
//      end;
end;

procedure TFrmDetail.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (not mmo1.Focused) then
      begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
end;

procedure TFrmDetail.N1Click(Sender: TObject);
var
ssql : string;
begin

  if qry_relation.IsEmpty  then  exit;
  try
//  ssql:='  delete from  dbo.employeeFamilyrelationship where rkey ='+inttostr(qry_relation.fieldbyname('rkey').asinteger)+' ' ;
//
//  with fdm.qrytemp do
//  begin
//   close;
//   sql.clear;
//   sql.Text:=ssql;
//   execsql;
//
//  end;
     qry_relation.edit;
    qry_relation.Delete;
    //qry_relation.post;

   //qry_relation.Requery;
  except  on e: Exception do
  begin
   ShowMessage('错误： '+e.Message);

  end;




  end;
end;

procedure TFrmDetail.dbgrdh_RelationExit(Sender: TObject);
begin
   qry_relation.append;
end;

procedure TFrmDetail.btn_SelPgradeClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'item/职等/100,memo/说明/300';
  InputVar.Sqlstr := 'SELECT rkey, dictid, item,memo FROM dbo.datadetail WHERE dictid = 23 ' + #13;
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := fdm.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_PGrade.Text := trim(frmPick_Item_Single.adsPick.fieldbyname('item').asstring);
      edt_PGrade.Tag := frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TFrmDetail.edt_PGradeExit(Sender: TObject);
var ssql:string;
begin
 if (PFlag<>1 ) and  (Pflag<>2)  then exit;
  if Trim(edt_PGrade.text)='' then exit;
 if  not  self.IsINList(23,Trim(edt_PGrade.Text))  then
 begin
  ShowMessage('输入值不在选项中， 请重新输入！');
  edt_PGrade.SetFocus;
 exit;
 end;

  ssql:=' select  rkey , item  from  datadetail where item='''+trim(edt_PGrade.text)+''' ';

   if OpenQuery(FDM.qrytemp,ssql)  then
   begin
     if fdm.qrytemp.IsEmpty   then
     begin
     ShowMessage('输入值不在选项中， 请重新输入！');
      EXIT;
     end
     else
     begin
      edt_PGrade.Text :=fdm.qrytemp.fieldbyname('item').asstring;
      edt_PGrade.Tag := fdm.qrytemp.fieldbyname('rkey').asinteger;
     end;

   end;

end;

procedure TFrmDetail.btn_LZDetailClick(Sender: TObject);
var
  Lfrm:TfrmOldInfo;
begin
  //if Pos('172.16.0.8',db_ptr)=0 then exit;

  if Trim(edt_IDCardNo.Text)='' then
  begin
  ShowMessage('请先录入身份证号！');
  exit;
  end;

  //判断是否以前在各厂入职过：
  Lfrm:=TfrmOldInfo.Create(self);
  try
  Lfrm.Getdata(Trim(edt_IDCardNo.Text));
  if not Lfrm.qry1.IsEmpty  then
  begin
    Lfrm.ShowModal;
  end
  else
  begin
    ShowMessage('各厂无该身份证号信息');
  end
  finally
   Lfrm.Free;
  end;
end;

end.

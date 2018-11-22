unit UDM;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs, DB, ExtDlgs, StdCtrls, ADODB, Grids, DBGrids, ExtCtrls, jpeg, DBCtrls, UMain, common; 
type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    tmp1: TADOQuery;
    tmp: TADOQuery;
    DataSource1: TDataSource;
    employee_department: TADOQuery;
    tmp2: TADOQuery;
    employee_departmentrkey: TAutoIncField;
    employee_departmentdepartmentname: TWideStringField;
    employee_departmentdepartmentcode: TWideStringField;
    employee_departmentsuperior: TIntegerField;
    employee_departmentchargename: TWideStringField;
    employee_departmentdepartmentration: TIntegerField;
    employee_departmentdepartmentcount: TIntegerField;
    employee_departmentscarcity: TIntegerField;
    employee_msg: TADOQuery;
    employee_msg_1: TADOQuery;
    employee_msgrkey: TAutoIncField;
    employee_msgchinesename: TWideStringField;
    employee_msgdepartmentid: TIntegerField;
    employee_msgemploy_type: TIntegerField;
    employee_msgPosition: TIntegerField;
    employee_msgRank: TIntegerField;
    employee_msgPolitics_face: TIntegerField;
    employee_msgeducation: TIntegerField;
    employee_msgmarriage: TIntegerField;
    employee_msgsex: TIntegerField;
    employee_msgaddr: TWideStringField;
    employee_msgprovince: TWideStringField;
    employee_msgIDCard: TWideStringField;
    employee_msgCardno: TWideStringField;
    employee_msgphone: TWideStringField;
    employee_msgattendance: TIntegerField;
    employee_msgwagetype: TIntegerField;
    employee_msgroomcode: TWideStringField;
    employee_msgnation: TWideStringField;
    employee_msg_1rkey: TAutoIncField;
    employee_msg_1chinesename: TWideStringField;
    employee_msg_1departmentid: TIntegerField;
    employee_msg_1ondutytime: TDateTimeField;
    employee_msg_1outdutytime: TDateTimeField;
    employee_msg_1employ_type: TIntegerField;
    employee_msg_1Position: TIntegerField;
    employee_msg_1Rank: TIntegerField;
    employee_msg_1Politics_face: TIntegerField;
    employee_msg_1education: TIntegerField;
    employee_msg_1marriage: TIntegerField;
    employee_msg_1sex: TIntegerField;
    employee_msg_1addr: TWideStringField;
    employee_msg_1province: TWideStringField;
    employee_msg_1IDCard: TWideStringField;
    employee_msg_1Cardno: TWideStringField;
    employee_msg_1phone: TWideStringField;
    employee_msg_1attendance: TIntegerField;
    employee_msg_1wagetype: TIntegerField;
    employee_msg_1roomcode: TWideStringField;
    employee_msg_1nation: TWideStringField;
    employee_msg_1photo: TBlobField;
    employee_msg_1resume: TMemoField;
    employee_msg_1others_contacts: TWideStringField;
    employee_msg_1birthday: TDateTimeField;
    DataSource2: TDataSource;
    employee_msgdepartmentcode: TWideStringField;
    employee_msgdepartmentname: TWideStringField;
    employee_msgsuperior: TIntegerField;
    employee_msgrkeydep: TAutoIncField;
    employee_msgemploy_typeitem: TWideStringField;
    employee_msgRankitem: TWideStringField;
    employee_msgPolitics_faceitem: TWideStringField;
    employee_msgeducationitem: TWideStringField;
    employee_msgmarriageitem: TWideStringField;
    employee_msgPositionitem: TWideStringField;
    employee_msgsextext: TStringField;
    employee_msgondutytime: TStringField;
    employee_msgoutdutytime: TStringField;
    employee_msgbirthday: TStringField;
    employee_msg_1status: TWordField;
    employee_msg_1classgroupid: TIntegerField;
    employee_msg_1blood_type: TWideStringField;
    employee_msg_1Height: TIntegerField;
    employee_msg_1graduatedschool: TWideStringField;
    employee_msg_1majorsubject: TWideStringField;
    employee_msg_1iDCardtime: TDateTimeField;
    employee_msg_1sicardno: TStringField;
    employee_msg_1Residencepermit: TStringField;
    employee_msg_1bankaccount: TStringField;
    employee_msg_1bankname: TWideStringField;
    employee_msg_1contactpersonname: TWideStringField;
    employee_msg_1contactpersontel: TWideStringField;
    employee_msg_1contactpersonaddr: TWideStringField;
    employee_msg_1recommendpersonname: TWideStringField;
    employee_msg_1recommendpersontel: TWideStringField;
    employee_msg_1recommendaddr: TWideStringField;
    employee_msg_1recommendworkplace: TWideStringField;
    employee_msg_1GraduateTime: TWideStringField;
    ADOEFR: TADOQuery;
    ADOEFRrkey: TIntegerField;
    ADOEFRemployeeid: TIntegerField;
    ADOEFRrelationship: TWideStringField;
    ADOEFRchinesename: TWideStringField;
    ADOEFRbirth: TWideStringField;
    ADOEFRaddr: TWideStringField;
    ADOEFRworkplace: TWideStringField;
    ADOEFRremark: TWideStringField;
    ADOEFRinputdate: TWideStringField;
    ADOEFRopration_person: TWideStringField;
    employee_msgblood_type: TWideStringField;
    employee_msgHeight: TIntegerField;
    employee_msggraduatedschool: TWideStringField;
    employee_msgmajorsubject: TWideStringField;
    employee_msgiDCardtime: TDateTimeField;
    employee_msgsicardno: TStringField;
    employee_msgResidencepermit: TStringField;
    employee_msgbankaccount: TStringField;
    employee_msgbankname: TWideStringField;
    employee_msgcontactpersonname: TWideStringField;
    employee_msgcontactpersontel: TWideStringField;
    employee_msgcontactpersonaddr: TWideStringField;
    employee_msgrecommendpersonname: TWideStringField;
    employee_msgrecommendpersontel: TWideStringField;
    employee_msgrecommendaddr: TWideStringField;
    employee_msgrecommendworkplace: TWideStringField;
    employee_msgGraduateTime: TWideStringField;
    employee_msg_1Languages: TWideStringField;
    employee_msgLanguages: TWideStringField;
    dsModel: TDataSource;
    qryModel: TADOQuery;
    employee_msgstatus: TWordField;
    ADOQuery1: TADOQuery;
    employee_msgwagetypename: TStringField;
    employee_msg_1wagetypename: TStringField;
    employee_msgattendancename: TStringField;
    employee_msg_1attendancename: TStringField;
    employee_msgID: TIntegerField;
    employee_msg_1station: TIntegerField;
    employee_msg_1source: TIntegerField;
    employee_msgsource: TWideStringField;
    employee_msgstation: TWideStringField;
    employee_msgrecognizor: TWideStringField;
    employee_msgrecognizor_Phone: TWideStringField;
    employee_msgE_people_relation: TWideStringField;
    employee_msg_1recognizor: TWideStringField;
    employee_msg_1recognizor_Phone: TWideStringField;
    employee_msg_1E_people_relation: TWideStringField;
    employee_msgstarlevel: TIntegerField;
    employee_msg_1starlevel: TIntegerField;
    employee_msg_1employeecode: TWideStringField;
    employee_msgemployeecode: TStringField;
    employee_msgremark: TWideStringField;
    employee_msg_1remark: TWideStringField;
    employee_msgprinvicename: TWideStringField;
    employee_msg_1province_ptr: TIntegerField;
    employee_msgprovince_ptr: TIntegerField;
    employee_msgage: TWideStringField;
    employee_msg_1public_accumulation_funds: TWideStringField;
    employee_msg_1siaccountno: TWideStringField;
    employee_msg_1serious_mistake: TIntegerField;
    employee_msgpublic_accumulation_funds: TWideStringField;
    employee_msgsiaccountno: TWideStringField;
    employee_msgserious_mistake: TIntegerField;
    employee_msg_1frist_RKEY: TIntegerField;
    employee_msgworkage: TWideStringField;
    employee_msgmulti_ability: TWideStringField;
    employee_msg_1multi_ability: TWideStringField;
    employee_msguser_defined2: TIntegerField;
    employee_msgcontractcount: TIntegerField;
    employee_msgemp_contract_flag: TStringField;
    procedure employee_msgIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    TypeWriting: string;
  end;

var
  DM: TDM;
  Frkeymsg, FimilyTag: integer;

implementation

{$R *.dfm}



procedure TDM.employee_msgIDGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
if Sender.DataSet.IsEmpty then exit;
   Text := IntToStr(Sender.DataSet.RecNo);
   if Text = '-1'   then
     Text := IntToStr(Sender.DataSet.RecordCount + 1);
end;

end.

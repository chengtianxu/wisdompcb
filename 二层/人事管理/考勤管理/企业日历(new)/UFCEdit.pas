unit UFCEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB,common,DateUtils;

type
  TfrmFCEdit = class(TForm)
    Label1: TLabel;
    cbb_SAcc: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cbb_HType: TComboBox;
    dtp_HDate: TDateTimePicker;
    btn_Save: TButton;
    btn_cancel: TButton;
    qrytemp: TADOQuery;
    qryFC: TADOQuery;
    procedure btn_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     FEType: Integer;
     FHkey:integer;
  end;

var
  frmFCEdit: TfrmFCEdit;

implementation
    uses udm;
{$R *.dfm}

procedure TfrmFCEdit.btn_cancelClick(Sender: TObject);
begin
 close;
end;

procedure TfrmFCEdit.FormCreate(Sender: TObject);
var
Lsql:string;
i:integer;
begin
     //添加薪资账套
  Lsql:=' select case  when Accountname=''日薪帐'' then 0  '+
			' when Accountname=''月薪6'' then 1   '+
			'  when Accountname=''月薪5.5'' then 2  '+
			'  when Accountname=''月薪5'' then 3  '+
			'  else 14 end as accountid, '+
      ' Accountname  from  salaryaccount  '+
      ' order by accountid    ';

   if not common.OpenQuery(qryTemp,Lsql) then Exit;

   if not qryTemp.IsEmpty then
   begin
     cbb_SAcc.Items.Clear;
     qryTemp.First;
     while not qryTemp.Eof do
     begin
      // if  qryTemp.fieldbyname('Accountname').asstring='日薪帐'  then
      // ShowMessage('test');
       
     cbb_SAcc.Items.AddObject(trim(qryTemp.fieldbyname('Accountname').asstring),TObject(qryTemp.fieldbyname('accountid').AsInteger));
      qryTemp.Next;
     end;
   end;

       //添加假日类别
  Lsql:='select rkey,resttype_name from Resttypemsg   ';

   if not common.OpenQuery(qryTemp,Lsql) then Exit;

   if not qryTemp.IsEmpty then
   begin
     cbb_HType.Items.Clear;
     qryTemp.First;
     while not qryTemp.Eof do
     begin
     cbb_HType.Items.AddObject(qryTemp.fieldbyname('resttype_name').asstring,TObject(qryTemp.fieldbyname('rkey').AsInteger));
      qryTemp.Next;
     end;
   end;



end;

procedure TfrmFCEdit.btn_SaveClick(Sender: TObject);
var
  Lsql:string;
begin
   if Trim(cbb_SAcc.text)='' then
   begin
     ShowMessage('工资账套不能为空！');
     exit;
   end;

   if Trim(cbb_HType.text)='' then
   begin
     ShowMessage('假日类别不能为空！');
     exit;
   end;

   Lsql:='select rkey from factorycalendar  where  CalendarID='+inttostr(Integer(cbb_SAcc.Items.Objects[cbb_SAcc.itemindex]))+' and '+
    'restdate='''+formatdatetime('yyyy-MM-dd',dtp_hdate.date)+''' and '+
    'type='+inttostr(Integer(cbb_HType.Items.Objects[cbb_HType.itemindex]))+'';
    
   if not common.ExecSql(qrytemp,Lsql)  then Exit;

   if  not  qrytemp.IsEmpty  then
   begin
   ShowMessage('已有记录存在， 请重新输入！');
   exit;
   end;


   if FEType =0 then
   Lsql:= 'insert into factorycalendar(CalendarID,restdate,type) values('+
       inttostr(Integer(cbb_SAcc.Items.Objects[cbb_SAcc.itemindex]))+','''+formatdatetime('yyyy-MM-dd',dtp_hdate.date)+''', '+
       inttostr(Integer(cbb_HType.Items.Objects[cbb_HType.itemindex])) +')'
   else
   Lsql:='update factorycalendar set CalendarID='+inttostr(Integer(cbb_SAcc.Items.Objects[cbb_SAcc.itemindex]))+', '+
        '  restdate='''+formatdatetime('yyyy-MM-dd',dtp_hdate.date)+''', type='+inttostr(Integer(cbb_HType.Items.Objects[cbb_HType.itemindex]))+' where rkey= '+inttostr(FHkey);


   if not common.ExecSql(qrytemp,Lsql)  then Exit;

   
   self.ModalResult:=mrOk;

end;

end.

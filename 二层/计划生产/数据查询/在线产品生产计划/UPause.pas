unit UPause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TfrmPause = class(TForm)
    Panel5: TPanel;
    d34Rkey: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtHour: TEdit;
    Edit6: TEdit;
    qry1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Frkey06:string;
  end;

var
  frmPause: TfrmPause;

implementation
   uses  UDm,common;
{$R *.dfm}

procedure TfrmPause.FormShow(Sender: TObject);
var
  Lsql:string;
begin
   Lsql:=' select d06.rkey as rkey06, D06.WORK_ORDER_NUMBER,D25.MANU_PART_NUMBER,D34.DEPT_CODE,D34.DEPT_NAME,D38.STEP_NUMBER,d34.rkey as rkey34,d56.flow_no'+
 '	from  data0006 D06'+
'	inner join   Data0025 D25 ON D06.BOM_PTR = D25.RKEY'+
'	INNER JOIN   Data0038 D38 ON D25.RKEY = D38.SOURCE_PTR'+
'	INNER JOIN   Data0034 D34 ON D38.DEPT_PTR = D34.RKEY'+
' inner join  data0056 d56 ON  d56.WO_PTR=d06.RKEY and  d56.DEPT_PTR=D34.rkey'+
' where d06.rkey='+Frkey06;
//ShowMessage(LSql);
 qry1.close;
 qry1.sql.text:=Lsql;
 qry1.open;

  self.Edit1.text:=qry1.fieldbyname('WORK_ORDER_NUMBER').asstring;
  Edit1.Tag:=  qry1.fieldbyname('rkey06').AsInteger;
  self.Edit2.text:=qry1.fieldbyname('MANU_PART_NUMBER').asstring;
  self.Edit3.text:=qry1.fieldbyname('DEPT_CODE').asstring;
  self.Edit3.tag:=qry1.fieldbyname('rkey34').asinteger;
  self.Edit4.text:=qry1.fieldbyname('DEPT_NAME').asstring;
  self.Edit4.tag:=qry1.fieldbyname('flow_no').asinteger;    //当前工序允许暂停小时
  self.Edit5.text:=qry1.fieldbyname('STEP_NUMBER').asstring;
  edit5.tag:= qry1.fieldbyname('STEP_NUMBER').asinteger;
  edtHour.text:=  qry1.fieldbyname('flow_no').asstring;


end;

procedure TfrmPause.BitBtn2Click(Sender: TObject);
var 
    Ddate:TDateTime;
    sName05:string;
    Lsql:string;
begin
  if (Trim(edtHour.Text)='') then
  begin
    ShowMessage('暂停小时数不能为空！');
    Exit;
  end;
  if (Trim(Edit6.Text)='') then
  begin
    ShowMessage('暂停原因不能为空！');
    Exit;
  end;
  Ddate:=getsystem_date(DM.qrytemp,0);
  if (MessageBox(Handle,PAnsiChar('作业单号【'+Edit1.Text+'】当前【'+Edit4.Text+'】工序将会'+#13+'暂停【'+edtHour.Text+'】小时, 确定暂停?'),'暂停作业单提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
  dm.qrytemp.Close;
  Lsql:=   ' select data0117.*,data0005.employee_name from data0005,data0117 '+
           ' where data0117.source_type=2 and data0117.source_ptr='+IntToStr(Edit1.Tag)+' and Action=16 and data0117.empl_ptr=data0005.rkey';
  dm.qrytemp.SQL.Text:=Lsql;
  DM.qrytemp.Open;
  sName05:=DM.qrytemp.FieldByName('employee_name').AsString;

    try
      if not DM.con1.InTransaction then
        DM.con1.BeginTrans;
      qry1.Close;
      qry1.SQL.Clear;
      Lsql:=  'update dbo.data0056 set FLOW_NO='+trim(edtHour.text)+' where WO_PTR='+inttostr(Edit1.tag)+'  and DEPT_PTR='+inttostr(Edit3.tag)+'  and STEP='+inttostr(Edit5.tag)+' ';
     // showmessage(Lsql);
      qry1.SQL.Text:=Lsql;
//      qry1.Parameters.ParamByName('FLOW_NO').Value:=Edit4.tag;
//      qry1.Parameters.ParamByName('WO_PTR').Value:=Edit1.Tag;
//      qry1.Parameters.ParamByName('DEPT_PTR').Value:=Edit3.tag;
//      qry1.Parameters.ParamByName('STEP').Value:=Edit5.tag;
      qry1.ExecSQL;
      dm.qrytemp.Close;
      dm.qrytemp.SQL.Text:=' insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark) '+
              ' values ('+IntToStr(Edit1.Tag)+',2,0,'+User_ptr+',getdate(),16,''===手动单个工序暂停于'
              +datetimetostr(Ddate)+' 暂停:'+edtHour.Text+'小时 '+' 经由:'+sName05+'==='+#13+'暂停原因：'+Trim(Edit6.Text)+''')';
      dm.qrytemp.ExecSQL;
      DM.con1.CommitTrans;
    except
      DM.con1.RollbackTrans;
      ShowMsg('作业单暂停操作失败！',1);
      Exit;
    end;
    ShowMsg('作业单暂停成功！',1);
    modalresult:=mrok;

end;

end.

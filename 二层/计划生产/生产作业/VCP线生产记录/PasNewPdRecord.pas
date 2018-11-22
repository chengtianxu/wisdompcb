unit PasNewPdRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  DB, ADODB,DateUtils, ComCtrls;

type
  TFrmNewPdRecord = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label17: TLabel;
    ComboBox1: TComboBox;
    edtRemark: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    edtWORK_ORDER_NUMBER: TEdit;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    edtMANU_PART_NUMBER: TEdit;
    edtSTEP: TEdit;
    edtDEPT_NAME: TEdit;
    edtQTY_BACKLOG: TEdit;
    edtpanel_ln: TEdit;
    edtANALYSIS_CODE_5: TEdit;
    edtpanel_wd: TEdit;
    edtwip_area: TEdit;
    edtPANELS: TEdit;
    edtABBR_NAME: TEdit;
    edtuser_ptr: TEdit;
    edtComputerName: TEdit;
    edtIPAddress: TEdit;
    edtPNLArae: TEdit;
    DateTimePicker1: TDateTimePicker;
    labVCPID: TLabel;
    labd06Rkey: TLabel;
    labd34Rkey: TLabel;
    Label9: TLabel;
    cbName: TComboBox;
    lab25Rkey: TLabel;
    labType: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtWORK_ORDER_NUMBERKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbNameChange(Sender: TObject);
    procedure edtWORK_ORDER_NUMBERKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtWORK_ORDER_NUMBERChange(Sender: TObject);
  private
    { Private declarations }
    PressCtrl:Boolean;
    iSelStart,iSelLen,iSumLen:Integer;
    startTime,startTime2,startTime3,startTime4,startTime5,startTime6,endTime:LONGLONG;
    FunCtion GetNewKeyNo(Const Tablename,FieldName,FString,whereTxt:String;NoLen:Integer;AdoConn:TADOConnection):String;
  public
    { Public declarations }
    Q_Date6:String;
    sSQLTxt:string;
  end;

var
  FrmNewPdRecord: TFrmNewPdRecord;

implementation

uses common,myclass,PasDM,constvar, PasPropertyType,PasPublic, PasQuery,
  PasProduceRecord;

{$R *.dfm}
FunCtion TFrmNewPdRecord.GetNewKeyNo(Const Tablename,FieldName,FString,whereTxt:String;NoLen:Integer;AdoConn:TADOConnection):String;
var tmpAdoQry:TAdoQuery;
     cmdStr,BegStr,ReturnNo,tmpNo:String;
     Len:Integer;
Begin
   tmpAdoQry:=TAdoQuery.Create(Application);
   try
        Len:=Length(FString);
        BegStr:='0000000000000000000000';
        BegStr:=Copy(BegStr,Len,(NoLen-Len));
        if FString<>'' then
           cmdStr:='Select '+FieldName+' from '+Tablename
            +' where '+FieldName+' Like '''+FString+'%'' Order by '+FieldName
        else
           cmdStr:='Select '+FieldName+' from '+Tablename+' Order by '+FieldName;
        tmpAdoQry.Connection:=AdoConn;
        tmpAdoQry.SQL.Text:=cmdStr;
        tmpAdoQry.Open;
        tmpAdoQry.Last;
        if Trim(tmpAdoQry.FieldByName(FieldName).AsString)='' then
        begin
             Len:=Length(BegStr);
             BegStr:=Copy(BegStr,1,Len-1);
             BegStr:=BegStr+'1';
             ReturnNo:=BegStr;
        end
        else
        begin
            tmpNo:=Trim(tmpAdoQry.FieldByname(FieldName).AsString);
            tmpNo:=Copy(tmpNo,Len+1,NoLen-Len);
            if tmpNO<>'' then
            begin
            try
            tmpNo:=IntToStr(StrToInt(tmpNO)+1);
            Len:=Length(BegStr)-Length(tmpNO);
            BegStr:=Copy(BegStr,1,Len);
            ReturnNo:=BegStr+tmpNo;
            except
              ReturnNo:=tmpNO;
            end;
            end
            else
            ReturnNo:='01';
        end;
        Result:=FString+ReturnNo;
   finally
       tmpAdoQry.Free;
   end;
end;

procedure TFrmNewPdRecord.BitBtn5Click(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TFrmNewPdRecord.FormShow(Sender: TObject);
begin
  sSQLTxt:=dm.Ado181.SQL.Text;
  iSelStart:=0;iSelLen:=0;iSumLen:=0;
  startTime:=0;startTime2:=0;startTime3:=0;startTime4:=0;startTime5:=0;startTime6:=0;endTime:=0;
  Q_Date6:=FormatDateTime('yyMMdd',Now);
  edtuser_ptr.Text:=user_ptr;
  DateTimePicker1.Date:=Now;
  edtComputerName.Text:=GetLocalName;
  edtIPAddress.Text:=GetLocalIP;
  edtRemark.Text:='';
  cbName.ItemIndex:=-1;
  edtWORK_ORDER_NUMBER.Text:='';
  edtWORK_ORDER_NUMBER.SetFocus;
  dm.ado198.Close;
  dm.ado198.Open;
  if (not DM.ado198.Eof) then
  begin
    cbName.Items.Clear;
    DM.ado198.First;
    while not dm.ado198.Eof do
    begin
      cbName.Items.Add(dm.ado198.FieldByName('sName').AsString);
      dm.ado198.Next;
    end;
    DM.ado198.First;
  end else
  begin
    ShowMsg('产线类型没有设置，请先设置产线类型！！',1);
  end;
end;

procedure TFrmNewPdRecord.edtWORK_ORDER_NUMBERKeyPress(Sender: TObject; var Key: Char);
var tmpAdo:TADOQuery;
    sTemp:string;
begin
  if (Key=#13) then
  begin
    endTime:=GetTickCount;
    if (((startTime2-startTime)<>(startTime4-startTime3)) and ((endTime-startTime)>5000)) then
    begin
      ShowMsg('不能手工输入作业单！',1);
      edtWORK_ORDER_NUMBER.Text:='';
      Exit;
    end;
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=dm.ADOConnection;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select dbo.data0006.WORK_ORDER_NUMBER,dbo.data0025.MANU_PART_NUMBER,dbo.data0056.STEP,dbo.data0006.Rkey as d06Rkey,'
                       +' dbo.data0034.DEPT_CODE,dbo.data0034.DEPT_NAME,dbo.data0056.STEP,dbo.data0056.QTY_BACKLOG,dbo.data0034.RKey as d34Rkey,'
                       +' dbo.data0056.PANELS,dbo.data0006.panel_ln,dbo.data0006.panel_wd,dbo.Data0025.ANALYSIS_CODE_5,dbo.data0025.RKey as Rkey25,'
                       +' isnull(ROUND(dbo.data0006.panel_ln*dbo.data0006.panel_wd*dbo.data0056.PANELS*0.000001, 2),0)as PNLArae,'
                       +' isnull(ROUND(dbo.Data0056.QTY_BACKLOG * dbo.Data0025.unit_sq, 2),0) AS wip_area,dbo.data0015.ABBR_NAME,dbo.data0025.MANU_PART_DESC'
                       +' from dbo.Data0006 INNER JOIN'
                       +' dbo.Data0056 ON dbo.Data0006.RKEY = dbo.Data0056.WO_PTR LEFT OUTER JOIN'
                       +' dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN'
                       +' dbo.Data0034 ON dbo.Data0056.DEPT_PTR = dbo.Data0034.RKEY LEFT OUTER JOIN'
                       +' dbo.data0015 on dbo.data0006.WHOUSE_PTR=dbo.data0015.Rkey'
                       +' where dbo.data0006.WORK_ORDER_NUMBER=:WORK_ORDER_NUMBER'
                       +' and dbo.data0006.PROD_STATUS in (3,5,6)';
      tmpAdo.Parameters.ParamByName('WORK_ORDER_NUMBER').Value:=Trim(edtWORK_ORDER_NUMBER.Text);
      tmpAdo.Open;
      if not tmpAdo.Eof then
      begin
        edtWORK_ORDER_NUMBER.Text:=tmpAdo.FieldBYName('WORK_ORDER_NUMBER').AsString;
        edtMANU_PART_NUMBER.Text:=tmpAdo.FieldBYName('MANU_PART_NUMBER').AsString;
        edtABBR_NAME.Text:=tmpAdo.FieldBYName('ABBR_NAME').AsString;
        edtSTEP.Text:=tmpAdo.FieldBYName('STEP').AsString;
        edtDEPT_NAME.Text:=tmpAdo.FieldBYName('DEPT_NAME').AsString;
        edtpanel_ln.Text:=tmpAdo.FieldBYName('panel_ln').AsString;
        edtpanel_wd.Text:=tmpAdo.FieldBYName('panel_wd').AsString;
        edtQTY_BACKLOG.Text:=tmpAdo.FieldBYName('QTY_BACKLOG').AsString;
        edtANALYSIS_CODE_5.Text:=tmpAdo.FieldBYName('ANALYSIS_CODE_5').AsString;
        edtPANELS.Text:=tmpAdo.FieldBYName('PANELS').AsString;
        edtPNLArae.Text:=tmpAdo.FieldBYName('PNLArae').AsString;
        edtwip_area.Text:=tmpAdo.FieldBYName('wip_area').AsString;
        labd06Rkey.Caption:=tmpAdo.fieldByName('d06Rkey').AsString;
        labd34Rkey.Caption:=tmpAdo.fieldByName('d34Rkey').AsString;
        lab25Rkey.Caption:=tmpAdo.FieldByName('Rkey25').AsString;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select PARAMETER_VALUE from data0494 where outp_spfc_flag=''Y'' and custpart_ptr=:Rkey and step_number=:STEP';
        tmpAdo.Parameters.ParamByName('Rkey').Value:=Trim(lab25Rkey.Caption);
        tmpAdo.Parameters.ParamByName('STEP').Value:=Trim(edtSTEP.Text);
        tmpAdo.Open;
        sTemp:='';
        if (not tmpAdo.IsEmpty) then
        begin
          tmpAdo.First;
          while not tmpAdo.Eof do
          begin
            sTemp:=tmpAdo.FieldBYName('PARAMETER_VALUE').AsString+';'+sTemp;
            tmpAdo.Next;
          end;
        end;
        edtRemark.Text:=sTemp;
      end else
      begin
        ShowMsg('该作业单号已取消或者已完成或者已暂缓，请查正！',1);
        edtWORK_ORDER_NUMBER.Text:='';
        edtMANU_PART_NUMBER.Text:='';
        edtABBR_NAME.Text:='';
        edtSTEP.Text:='';
        edtDEPT_NAME.Text:='';
        edtpanel_ln.Text:='';
        edtpanel_wd.Text:='';
        edtQTY_BACKLOG.Text:='';
        edtANALYSIS_CODE_5.Text:='';
        edtPANELS.Text:='';
        edtPNLArae.Text:='';
        edtwip_area.Text:='';
        labd06Rkey.Caption:='';
        labd34Rkey.Caption:='';
        labVCPID.Caption:='';
        edtWORK_ORDER_NUMBER.SetFocus;
        Exit;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;

    BitBtn2.SetFocus;
  end;
end;

procedure TFrmNewPdRecord.BitBtn2Click(Sender: TObject);
var tmpAdo:TADOQuery;
    sSql:string;
begin
  if (Trim(cbName.Text)='') then
  begin
    ShowMsg('请选择产线类型！',1);
    edtWORK_ORDER_NUMBER.Text:='';
    edtMANU_PART_NUMBER.Text:='';
    edtABBR_NAME.Text:='';
    edtSTEP.Text:='';
    edtDEPT_NAME.Text:='';
    edtpanel_ln.Text:='';
    edtpanel_wd.Text:='';
    edtQTY_BACKLOG.Text:='';
    edtANALYSIS_CODE_5.Text:='';
    edtPANELS.Text:='';
    edtPNLArae.Text:='';
    edtwip_area.Text:='';
    labd06Rkey.Caption:='';
    labd34Rkey.Caption:='';
    labVCPID.Caption:='';
    edtWORK_ORDER_NUMBER.SetFocus;
    Exit;
  end;
  if (Trim(edtSTEP.Text)='') then
  begin
    ShowMsg('新增信息不全！',1);
    Exit;
  end;
  if (DM.ado198.RecordCount>0) then
  begin
    DM.ado198.First;
    while not dm.ado198.Eof do
    begin
      if (dm.ado198.FieldByName('sName').AsString=Trim(cbName.Text)) then
      begin
        cbName.Tag:=DM.ado198Rkey.Value;
        labType.Tag:=dm.ado198sType.Value;
        labType.Caption:= DM.ado198sName.Value;
        Break;
      end else
      dm.ado198.Next;
    end;
  end;
  try
    tmpAdo:=TADOQuery.Create(Application);
    tmpAdo.Connection:=dm.ADOConnection;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Text:='select dbo.data0006.WORK_ORDER_NUMBER,dbo.data0025.MANU_PART_NUMBER,dbo.data0181.STEP,dbo.Data0025.unit_sq,'
                     +' dbo.data0034.DEPT_CODE,dbo.data0034.DEPT_NAME,dbo.data0181.QTY_BACKLOG,dbo.data0006.Rkey as d06RKey,'
                     +' dbo.data0181.PANELS,dbo.data0006.panel_ln,dbo.data0006.panel_wd,dbo.Data0025.ANALYSIS_CODE_5,dbo.data0025.MANU_PART_DESC,'
                     +' isnull(ROUND(dbo.data0006.panel_ln*dbo.data0006.panel_wd*dbo.data0181.PANELS*0.000001, 2),0)as PNLArae,'
                     +' isnull(ROUND(dbo.Data0181.QTY_BACKLOG * dbo.Data0025.unit_sq, 2),0) AS wip_area,dbo.data0015.ABBR_NAME,dbo.data0181.sType'
                     +' from dbo.Data0181 INNER JOIN'
                     +' dbo.Data0006 ON dbo.Data0181.d06_Ptr = dbo.Data0006.RKey LEFT OUTER JOIN'
                     +' dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN'
                     +' dbo.Data0034 ON dbo.Data0181.d34_Ptr = dbo.Data0034.RKEY INNER JOIN'
                     +' dbo.data0198 ON dbo.Data0181.d198_Ptr = dbo.data0198.RKey LEFT OUTER JOIN'
                     +' dbo.data0015 on dbo.data0006.WHOUSE_PTR=dbo.data0015.Rkey'
                     +' where dbo.data0006.PROD_STATUS in (3,5,6)'
                     +' and dbo.data0006.RKey=:WORK_ORDER_NUMBER'
                     +' and dbo.data0181.sType=:sType';
    tmpAdo.Parameters.ParamByName('WORK_ORDER_NUMBER').Value:=Trim(labd06Rkey.Caption);
    tmpAdo.Parameters.ParamByName('sType').Value:=labType.Tag;
    tmpAdo.Open;
    if (tmpAdo.RecordCount=0) then
    begin
      labVCPID.Caption:=GetNewKeyNo('dbo.data0181','VCPID',Q_Date6,'',10,DM.ADOConnection);
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='insert into dbo.data0181 (VCPID,d06_Ptr,d34_Ptr,STEP,QTY_BACKLOG,PANELS,sClass,d198_Ptr,d05_Ptr,create_date,ComputerName,IPAddress,Remark,sType) '
      +'values (:VCPID,:d06_Ptr,:d34_Ptr,:STEP,:QTY_BACKLOG,:PANELS,:sClass,:d198_Ptr,:d05_Ptr,:create_date,:ComputerName,:IPAddress,:Remark,:sType)';
      tmpAdo.Parameters.ParamByName('VCPID').Value:=Trim(labVCPID.Caption);
      tmpAdo.Parameters.ParamByName('d06_Ptr').Value:=Trim(labd06Rkey.Caption);
      tmpAdo.Parameters.ParamByName('d34_Ptr').Value:=Trim(labd34Rkey.Caption);
      tmpAdo.Parameters.ParamByName('STEP').Value:=Trim(edtSTEP.Text);
      tmpAdo.Parameters.ParamByName('QTY_BACKLOG').Value:=Trim(edtQTY_BACKLOG.Text);
      tmpAdo.Parameters.ParamByName('PANELS').Value:=Trim(edtPANELS.Text);
      tmpAdo.Parameters.ParamByName('sClass').Value:=Trim(ComboBox1.Text);
      tmpAdo.Parameters.ParamByName('d198_Ptr').Value:=cbName.Tag;
      tmpAdo.Parameters.ParamByName('d05_Ptr').Value:=user_ptr;
      tmpAdo.Parameters.ParamByName('create_date').Value:=Now;
      tmpAdo.Parameters.ParamByName('ComputerName').Value:=Trim(edtComputerName.Text);
      tmpAdo.Parameters.ParamByName('IPAddress').Value:=Trim(edtIPAddress.Text);
      tmpAdo.Parameters.ParamByName('Remark').Value:=Trim(edtRemark.Text);
      tmpAdo.Parameters.ParamByName('sType').Value:=labType.Tag;
      tmpAdo.ExecSQL;
      edtWORK_ORDER_NUMBER.SetFocus;
      edtWORK_ORDER_NUMBER.Text:='';
      edtMANU_PART_NUMBER.Text:='';
      edtABBR_NAME.Text:='';
      edtSTEP.Text:='';
      edtDEPT_NAME.Text:='';
      edtpanel_ln.Text:='';
      edtpanel_wd.Text:='';
      edtQTY_BACKLOG.Text:='';
      edtANALYSIS_CODE_5.Text:='';
      edtPANELS.Text:='';
      edtPNLArae.Text:='';
      edtwip_area.Text:='';
      labd06Rkey.Caption:='';
      labd34Rkey.Caption:='';
      labVCPID.Caption:='';
      dm.Ado181.Close;
      DM.Ado181.SQL.Text:=sSQLTxt+' where (convert(char(10),dbo.data0181.create_date,120)>='''+formatdatetime('yyyy-MM-dd',FrmProduceRecord.DateTimePicker1.Date)+
                               ''') and (convert(char(10),dbo.data0181.create_date,120)<='''+formatdatetime('yyyy-MM-dd',FrmProduceRecord.DateTimePicker2.Date)+''') ';
      dm.Ado181.Open;
    end else
    begin
      ShowMsg('该作业单号在该生产工序步骤已记录，请查正！',1);
      edtWORK_ORDER_NUMBER.Text:='';
      edtMANU_PART_NUMBER.Text:='';
      edtABBR_NAME.Text:='';
      edtSTEP.Text:='';
      edtDEPT_NAME.Text:='';
      edtpanel_ln.Text:='';
      edtpanel_wd.Text:='';
      edtQTY_BACKLOG.Text:='';
      edtANALYSIS_CODE_5.Text:='';
      edtPANELS.Text:='';
      edtPNLArae.Text:='';
      edtwip_area.Text:='';
      labd06Rkey.Caption:='';
      labd34Rkey.Caption:='';
      labVCPID.Caption:='';
      edtWORK_ORDER_NUMBER.SetFocus;
      Exit;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

procedure TFrmNewPdRecord.cbNameChange(Sender: TObject);
begin
  if (DM.ado198.RecordCount>0) then
  begin
    DM.ado198.First;
    while not dm.ado198.Eof do
    begin
      if (dm.ado198.FieldByName('sName').AsString=Trim(cbName.Text)) then
      begin
        cbName.Tag:=DM.ado198Rkey.Value;
        labType.Tag:=dm.ado198sType.Value;
        Break;
      end else
      dm.ado198.Next;
    end;
  end;
end;

procedure TFrmNewPdRecord.edtWORK_ORDER_NUMBERKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((ssCtrl in Shift) and (chr(Key) in ['C', 'c'])) then Key:=0;
  if ((ssCtrl in Shift) and (chr(Key) in ['V', 'v'])) then
  begin
    ShowMessage('禁用CTRL+V!');
    edtWORK_ORDER_NUMBER.Text:='';
    edtWORK_ORDER_NUMBER.SetFocus;
  end;
end;

procedure TFrmNewPdRecord.edtWORK_ORDER_NUMBERChange(Sender: TObject);
begin
  iSelStart:=edtWORK_ORDER_NUMBER.SelStart;
  iSelLen:=Length(edtWORK_ORDER_NUMBER.Text);
  if (iSelLen=1) then startTime:=GetTickCount;
  if (iSelLen=2) then startTime2:=GetTickCount;
  if (iSelLen=3) then startTime3:=GetTickCount;
  if (iSelLen=4) then startTime4:=GetTickCount;
end;

end.

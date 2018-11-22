unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB, Menus,OleServer, Excel2000, ComObj,DateUtils,
  ComCtrls, DBGrids	,IdMessage,HTTPApp,excelxp;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    Popup1: TPopupMenu;
    Popup2: TPopupMenu;
    OpenDialog1: TOpenDialog;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
    StringGrid2: TStringGrid;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    N2: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ExcelToDB;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure item_click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    StartDate,EndDate:TDatetime;
    preColumn:TColumnEh;
    field_name:string;
    v_date,sql:string;
    procedure ShowADOQueryDataOnStringGrid(ADOQuery: TADOQuery;
      SG: TStringGrid);
    function SbctoDbc(s:string):string;
  public
    { Public declarations }
    newrkey:string;
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses dmo,common, InsertTrain, UQuery, PasQuery, PasPublic;


{$R *.dfm}
function TFrm_Main.SbctoDbc(s:string):string;
var nlength,i:Integer;
    strTxt,ctmp,C1,C2:string;
begin
  nlength:=Length(s);
  if (nlength=0) then Exit;
  strTxt:='';
  setlength(ctmp,nlength+1);
  ctmp:=s;
  i:=1;
  while (i<=nlength) do
  begin
    C1:=ctmp[i];
    C2:=ctmp[i+1];
    if (C1=#163) then
    begin
      strTxt:=strTxt+chr(ord(C2[1])-128);
      inc(i,2);
      continue;
    end;
    if (C1>#163) then
    begin
      strTxt:=strTxt+C1;
      strTxt:=strTxt+C2;
      inc(i,2);
      continue;
    end;
    if (C1=#161) and (C2=#161) then
    begin
      strTxt:=strTxt+' ';
      inc(i,2);
      continue;
    end;
    strTxt:=strTxt+C1;
    inc(i);
  end;
  Result:=strTxt;
end;

procedure TFrm_Main.ShowADOQueryDataOnStringGrid(ADOQuery: TADOQuery; SG: TStringGrid);
var //把ADOQuery的数据显示在StringGrid上.
  iCount, iCell, iRecordCount, iFieldCount: Integer;
begin
  SG.RowCount := 1;
  for iCount := 1 to SG.ColCount - 1 do
    SG.Cells[iCount, 1] := '';
  SG.Update;
  iRecordCount := ADOQuery.RecordCount;
  iFieldCount := ADOQuery.FieldCount;
  SG.RowCount := iRecordCount + 1;
  SG.ColCount := iFieldCount + 1;
  if iRecordCount = 0 then
  begin
    SG.RowCount := 2; SG.FixedRows := 1;
  end
  else
    SG.FixedRows := 1;
  if iFieldCount = 0 then
  begin
    SG.ColCount := 2; SG.FixedCols := 1;
  end
  else
    SG.FixedCols := 1;
    SG.Cells[0, 0] := 'Rkey'; //显示序号名称
    SG.Cells[1, 0] := '错误行号';
    SG.Cells[2, 0] := '错误信息';
    SG.Cells[3, 0] := '错误列号';
  if iRecordCount > 0 then 
  begin
    ADOQuery.First;
    for iCount := 1 to iRecordCount do
    begin
      for iCell := 1 to iFieldCount do
        SG.Cells[iCell-1, iCount] := Trim(ADOQuery.Fields[iCell - 1].AsString);
      ADOQuery.Next;
    end;
  end;
  SG.Update;
end;

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
begin
  DM.ADOEmployee_Train.Close;
  dm.ADOEmployee_Train.CommandText:=sql+' and T.startdate between :dtpk1 and :dtpk2 and T.Train_status<>:V1 and T.Train_status<>:V2 order by T.oprate_time desc';
  DM.ADOEmployee_Train.Parameters[0].Value:=DateTimePicker1.Date;
  DM.ADOEmployee_Train.Parameters[1].Value:=DateTimePicker2.Date;
  if chk1.Checked then
    DM.ADOEmployee_Train.Parameters[2].Value:=2
  else
    DM.ADOEmployee_Train.Parameters[2].Value:=0;

  if chk2.Checked then
    DM.ADOEmployee_Train.Parameters[3].Value:=2
  else
    DM.ADOEmployee_Train.Parameters[3].Value:=1;
  DM.ADOEmployee_Train.Open;
  label3.Caption := inttostr(dm.ADOEmployee_Train.RecordCount);
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  FrmQuery.Caption:='员工培训查询';
  FrmQuery.listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['员工工号','姓名','部门','培训类型','是否结清','是否引用','有效期时间','结案时间']);
  v_Field_List_EN := VarArrayOf(['M.employeecode','M.chinesename','M.departmentname','dbo.datadetail.item','T.feels_payed','T.ptr_flag','T.effective_date','T.oprate_time']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    FrmQuery.listbox3.Items.Add(v_Field_List_CN[i]);
  FrmQuery.sgrid1.Cells[0,0]:='条件名';
  FrmQuery.sgrid1.Cells[1,0]:='条件值';
  FrmQuery.ListBox3.ItemIndex := 0;
  FrmQuery.iNum:=1;
  FrmQuery.iType:=0;
  if StartDate > 100 then
    FrmQuery.DateTimePicker1.Date:= StartDate
  else
    FrmQuery.DateTimePicker1.Date:=IncYear(Now,-3);
  if EndDate > 100 then
    FrmQuery.DateTimePicker2.Date:= EndDate
  else
    FrmQuery.DateTimePicker2.Date:=Now;

  if FrmQuery.ShowModal=mrok then
  begin
    dm.ADOEmployee_Train.Close;
    Sqlstr:='';
  sSql:='SELECT T.Rkey,T.employeeid,M.employeecode,M.chinesename,M.ondutytime,M.departmentname,T.Train_NO,T.Train_topics,'
       +' T.startdate,T.starttime,T.enddate,T.endtime,T.Train_time,T.Teacher,T.Train_place,T.Train_grade,T.ptr_flag,'
       +' T.Train_result,T.Train_content,case T.Train_status when 0 then ''未完成'' when 1 then ''已完成'' end AS Train_status,'
       +' T.ptr_flag,dbo.datadetail.Rkey as detailRkey,dbo.datadetail.item,T.train_feels,T.effective_date,'
       +' T.feels_payed,T.oprator_ptr,T.oprate_time,T.employeecode as ecode'
       +' FROM   Employee_Train AS T INNER JOIN v_employeemsg AS M'
       +' ON T.employeeid=M.rkey left join'
       +' dbo.datadetail on T.type_ptr=dbo.datadetail.Rkey';
    for i:=1 to FrmQuery.sgrid1.RowCount-2 do
      if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    StartDate:=FrmQuery.DateTimePicker1.Date;
    EndDate:=FrmQuery.DateTimePicker2.Date;
    DateTimePicker1.Date:=FrmQuery.DateTimePicker1.Date;
    DateTimePicker2.Date:=FrmQuery.DateTimePicker2.Date;
    DM.ADOEmployee_Train.CommandText:='';
    dm.ADOEmployee_Train.CommandText:=sSql+' where T.startdate>='''+formatdatetime('yyyy-MM-dd',FrmQuery.DateTimePicker1.Date)+
                           ''' and T.startdate<='''+formatdatetime('yyyy-MM-dd',FrmQuery.DateTimePicker2.Date)+''' '+Sqlstr+' order by T.oprate_time desc';
//    ShowMessage(dm.ADOEmployee_Train.CommandText);
    dm.ADOEmployee_Train.Open;
  end;
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
VAR
  I,J,iValue,iCount,jCount,code:Integer;
  col,row:integer;
  MsExcel,WBook,WSheet:OleVariant;
  f_temp,strtemp,strSQL:string;
  TmpAdo,tmpAdo2:TADOQuery;
  TempDate:TDateTime;
  dFloat:Double;
  iDetailType:Integer;
begin
{  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  ExcelToDB; }
//2012.12.13-----------------------------------------------------------
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if messagedlg('确认导入：继续导入;取消：终止导入?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    try
      begin
        MsExcel:= CreateOleObject('Excel.Application');
        WBook:=MsExcel.Application;
        if OpenDialog1.Execute then   //关联到文件
        begin
         if OpenDialog1.FileName='' then
           abort;
          wbook.workbooks.Open(OpenDialog1.FileName);
        end;
        WBook.Visible:= False;
        WSheet:=WBook.worksheets[1];
      end
    except
      begin
        Messagedlg('您取消了操作或 Excel没有安装!',mtinformation,[mbok],0);
        WBook.DisplayAlerts := false;//是否提示存盘
        wbook.workbooks.close;
        wbook.Quit;
        Exit;
      end;
    end;
    screen.Cursor:=crSQLWait;
    row:=WSheet.UsedRange.Rows.Count;      //行
    col:=WSheet.UsedRange.columns.Count;     //列
    if (row=0) or (col = 0)  then
    begin
      ShowMessage('该excel文件没有数据！请确认!');
      WBook.DisplayAlerts := false;//是否提示存盘
      wbook.workbooks.close;
      wbook.Quit;
      abort;
    end;
    try
      try
        TmpAdo:=TADOQuery.Create(Application);
        TmpAdo.Connection:=dm.ADOConn;
        TmpAdo2:=TADOQuery.Create(Application);
        TmpAdo2.Connection:=dm.ADOConn;
              strSQL:='if exists (select * from tempdb..sysobjects where id=object_id(''#TempDBExcel'')) drop table #TempDBExcel'
        +#13+' CREATE TABLE #TempDBExcel(RKEY int IDENTITY(1,1) NOT NULL,iRowNo int not null,employeeid varchar(100) null,iCol int null)'
        +#13+' CREATE UNIQUE INDEX [RKEY] ON #TempDBExcel ([RKEY]) ON [PRIMARY]';
        if (ExecSql(TmpAdo,strSQL)) then
        begin
          Try
//            DM.ADOConn.BeginTrans;
            j:=1;
            for i:=1 to row-1 do
            begin
              if (Trim(WSheet.cells[i+1,1].Value)='') or (TryStrToInt(WSheet.cells[i+1,1].Value,iValue)=False) then
              begin
                tmpAdo2.Close;
                tmpAdo2.SQL.Clear;
                tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,1].Value;
                tmpAdo2.Parameters.ParamByName('iCol').Value:='0';
                tmpAdo2.ExecSQL;
                continue;
              end else
              begin
                with DM.ADOQuery1 do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text:='select rkey from employeemsg where employeecode='''+Trim(WSheet.cells[i+1,1])+'''';
                  Open;
                  if Eof then
                  begin
                    tmpAdo2.Close;
                    tmpAdo2.SQL.Clear;
                    tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                    tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                    tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,1].Value;
                    tmpAdo2.Parameters.ParamByName('iCol').Value:='0';
                    tmpAdo2.ExecSQL;
                    continue;
                  end;
                  code:=FieldValues['rkey'];
                end;
              end;
              Application.ProcessMessages;
              TmpAdo.Close;
              TmpAdo.SQL.Clear;
              TmpAdo.SQL.Add('select * from Employee_Train where employeeid=:empID and Train_NO=:Train_NO');
              TmpAdo.Parameters.ParamByName('empID').Value:=code;
              TmpAdo.Parameters.ParamByName('Train_NO').Value:=Trim(WSheet.cells[i+1,2].Value);
              TmpAdo.Open;
              if not TmpAdo.Eof then
              begin
                tmpAdo2.Close;
                tmpAdo2.SQL.Clear;
                tmpAdo2.SQL.Add('delete from Employee_Train where employeeid=:empID and Train_NO=:Train_NO');
                TmpAdo2.Parameters.ParamByName('empID').Value:=code;
                TmpAdo2.Parameters.ParamByName('Train_NO').Value:=WSheet.cells[i+1,2].Value;
                tmpAdo2.ExecSQL;
              end;
              if (TryStrToDate(SbctoDbc(Trim(WSheet.cells[i+1,4].Value)),TempDate)=False) then
              begin
                tmpAdo2.Close;
                tmpAdo2.SQL.Clear;
                tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,4].Value;
                tmpAdo2.Parameters.ParamByName('iCol').Value:='4';
                tmpAdo2.ExecSQL;
                continue;
              end;
              if (TryStrToFloat(Trim(WSheet.cells[i+1,5].Value),dFloat)=True) then
              begin

              end else
              if (TryStrToDateTime(SbctoDbc(WSheet.cells[i+1,5].Value),TempDate)=False) then
              begin
                tmpAdo2.Close;
                tmpAdo2.SQL.Clear;
                tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,5];
                tmpAdo2.Parameters.ParamByName('iCol').Value:='5';
                tmpAdo2.ExecSQL;
                continue;
              end;
              if (TryStrToDate(SbctoDbc(Trim(WSheet.cells[i+1,6].Value)),TempDate)=False) then
              begin
                tmpAdo2.Close;
                tmpAdo2.SQL.Clear;
                tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,6].Value;
                tmpAdo2.Parameters.ParamByName('iCol').Value:='6';
                tmpAdo2.ExecSQL;
                continue;
              end;
              if (TryStrToFloat(Trim(WSheet.cells[i+1,7].Value),dFloat)=True) then
              begin

              end else
              if (TryStrToDateTime(SbctoDbc(WSheet.cells[i+1,7].Value),TempDate)=False) then
              begin
                tmpAdo2.Close;
                tmpAdo2.SQL.Clear;
                tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,7];
                tmpAdo2.Parameters.ParamByName('iCol').Value:='7';
                tmpAdo2.ExecSQL;
                continue;
              end;
              if (TryStrToFloat(Trim(WSheet.cells[i+1,8].Value),dFloat)=False) then
              begin
                tmpAdo2.Close;
                tmpAdo2.SQL.Clear;
                tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,8].Value;
                tmpAdo2.Parameters.ParamByName('iCol').Value:='8';
                tmpAdo2.ExecSQL;
                continue;
              end;
    //---------------------------------------------------------------
              if ( Trim(WSheet.cells[i+1,14])='完成') then
              begin
                jCount:=1;
              end else
              begin
                jCount:=0;
              end;
              iDetailType:=GetDataRkey('datadetail','item',Trim(WSheet.cells[i+1,15].Value),DM.ADOConn,'dictid=20');
              if (Trim(WSheet.cells[i+1,15].Value)='普通') then
              begin
                tmpAdo.Close;
                tmpAdo.SQL.Clear;
                if (Trim(WSheet.cells[i+1,16].Value)='') then WSheet.cells[i+1,16].Value:='0';
//                if (Trim(WSheet.cells[i+1,17].Value)='') then
//                begin
                  TmpAdo.SQL.Text:='insert into Employee_Train (employeeid,Train_NO,Train_topics,startdate,starttime,enddate,endtime,'
                  +'Train_time,Teacher,Train_place,Train_grade,Train_result,Train_content,Train_status, '
                  +'type_ptr,train_feels,oprator_ptr,oprate_time,employeecode)'
                  +'values(:employeeid,:Train_NO,:Train_topics,:startdate,:starttime,:enddate,:endtime,'
                  +':Train_time,:Teacher,:Train_place,:Train_grade,:Train_result,:Train_content,:Train_status,'
                  +':type_ptr,:train_feels,:oprator_ptr,:oprate_time,:employeecode)';
//                end else
//                begin
//                  TmpAdo.SQL.Text:='insert into Employee_Train (employeeid,Train_NO,Train_topics,startdate,starttime,enddate,endtime,'
//                  +'Train_time,Teacher,Train_place,Train_grade,Train_result,Train_content,Train_status, '
//                  +'type_ptr,train_feels,effective_date,feels_payed,oprator_ptr,oprate_time)'
//                  +'values(:employeeid,:Train_NO,:Train_topics,:startdate,:starttime,:enddate,:endtime,'
//                  +':Train_time,:Teacher,:Train_place,:Train_grade,:Train_result,:Train_content,:Train_status,'
//                  +':type_ptr,:train_feels,:effective_date,:feels_payed,:oprator_ptr,:oprate_time)';
//                end;
                TmpAdo.Parameters.ParamByName('employeeid').Value:=code;
                tmpAdo.Parameters.ParamByName('Train_NO').Value:=Trim(WSheet.cells[i+1,2]);
                tmpAdo.Parameters.ParamByName('Train_topics').Value:=Trim(WSheet.cells[i+1,3]);
                tmpAdo.Parameters.ParamByName('startdate').Value:=FormatDateTime('yyyy-mm-dd',StrToDateTime(SbctoDbc(WSheet.cells[i+1,4])));
                if (TryStrToFloat(Trim(WSheet.cells[i+1,5].Value),dFloat)=True) then
                begin
                  tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,5]));
                end else
                if (VarIsNumeric(WSheet.cells[i+1,5])) then tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,5]))
                else tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('hh:mm:ss',StrToDateTime(SbctoDbc(WSheet.cells[i+1,5])));
                tmpAdo.Parameters.ParamByName('enddate').Value:=FormatDateTime('yyyy-mm-dd',StrToDateTime(SbctoDbc(WSheet.cells[i+1,6])));
                if (TryStrToFloat(Trim(WSheet.cells[i+1,7].Value),dFloat)=True) then
                begin
                  tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,7]));
                end else
                if (VarIsNumeric(WSheet.cells[i+1,7])) then tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,7]))
                else tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('hh:mm:ss',StrToDateTime(SbctoDbc(WSheet.cells[i+1,7])));
                tmpAdo.Parameters.ParamByName('Train_time').Value:=StrToFloat(WSheet.cells[i+1,8]);
                tmpAdo.Parameters.ParamByName('Teacher').Value:=Trim(WSheet.cells[i+1,9]);
                tmpAdo.Parameters.ParamByName('Train_place').Value:=Trim(WSheet.cells[i+1,10]);
                tmpAdo.Parameters.ParamByName('Train_grade').Value:=Trim(WSheet.cells[i+1,11]);
                tmpAdo.Parameters.ParamByName('Train_result').Value:=Trim(WSheet.cells[i+1,12]);
                tmpAdo.Parameters.ParamByName('Train_content').Value:=Trim(WSheet.cells[i+1,13]);
                tmpAdo.Parameters.ParamByName('Train_status').Value:=jCount;
                tmpAdo.Parameters.ParamByName('type_ptr').Value:=iDetailType;
                tmpAdo.Parameters.ParamByName('train_feels').Value:=Trim(WSheet.cells[i+1,16]);
//                if (Trim(WSheet.cells[i+1,17].Value)='') then else
//                tmpAdo.Parameters.ParamByName('effective_date').Value:=FormatDateTime('yyyy-mm-dd',StrToDateTime(SbctoDbc(WSheet.cells[i+1,17])));
//                tmpAdo.Parameters.ParamByName('feels_payed').Value:='1';
                tmpAdo.Parameters.ParamByName('oprator_ptr').Value:=user_ptr;
                tmpAdo.Parameters.ParamByName('oprate_time').Value:=formatdatetime('yyyy-MM-dd',Now);
                tmpAdo.Parameters.ParamByName('employeecode').Value:=Trim(WSheet.cells[i+1,1]);
                tmpAdo.ExecSQL;
              end else
              begin
                if (TryStrToFloat(Trim(WSheet.cells[i+1,16].Value),dFloat)=False) then
                begin
                  tmpAdo2.Close;
                  tmpAdo2.SQL.Clear;
                  tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                  tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                  tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,16].Value;
                  tmpAdo2.Parameters.ParamByName('iCol').Value:='16';
                  tmpAdo2.ExecSQL;
                  continue;
                end;
                if (TryStrToDate(SbctoDbc(Trim(WSheet.cells[i+1,17].Value)),TempDate)=False) then
                begin
                  tmpAdo2.Close;
                  tmpAdo2.SQL.Clear;
                  tmpAdo2.SQL.Add('insert into #TempDBExcel ([iRowNO],[employeeid],[iCol]) values(:iRowNO,:employeeid,:iCol)');
                  tmpAdo2.Parameters.ParamByName('iRowNO').Value:=i+1;
                  tmpAdo2.Parameters.ParamByName('employeeid').Value:=WSheet.cells[i+1,17].Value;
                  tmpAdo2.Parameters.ParamByName('iCol').Value:='17';
                  tmpAdo2.ExecSQL;
                  continue;
                end;

                tmpAdo.Close;
                tmpAdo.SQL.Clear;
                TmpAdo.SQL.Text:='insert into Employee_Train (employeeid,Train_NO,Train_topics,startdate,starttime,enddate,endtime,'
                +'Train_time,Teacher,Train_place,Train_grade,Train_result,Train_content,Train_status, '
                +'type_ptr,train_feels,effective_date,feels_payed,oprator_ptr,oprate_time,employeecode)'
                +'values(:employeeid,:Train_NO,:Train_topics,:startdate,:starttime,:enddate,:endtime,'
                +':Train_time,:Teacher,:Train_place,:Train_grade,:Train_result,:Train_content,:Train_status,'
                +':type_ptr,:train_feels,:effective_date,:feels_payed,:oprator_ptr,:oprate_time,:employeecode)';
                TmpAdo.Parameters.ParamByName('employeeid').Value:=code;
                tmpAdo.Parameters.ParamByName('Train_NO').Value:=Trim(WSheet.cells[i+1,2]);
                tmpAdo.Parameters.ParamByName('Train_topics').Value:=Trim(WSheet.cells[i+1,3]);
                tmpAdo.Parameters.ParamByName('startdate').Value:=FormatDateTime('yyyy-mm-dd',StrToDateTime(SbctoDbc(WSheet.cells[i+1,4])));
                if (TryStrToFloat(Trim(WSheet.cells[i+1,5].Value),dFloat)=True) then
                begin
                  tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,5]));
                end else
                if (VarIsNumeric(WSheet.cells[i+1,5])) then tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,5]))
                else tmpAdo.Parameters.ParamByName('starttime').Value:=FormatDateTime('hh:mm:ss',StrToDateTime(SbctoDbc(WSheet.cells[i+1,5])));
                tmpAdo.Parameters.ParamByName('enddate').Value:=FormatDateTime('yyyy-mm-dd',StrToDateTime(SbctoDbc(WSheet.cells[i+1,6])));
                if (TryStrToFloat(Trim(WSheet.cells[i+1,7].Value),dFloat)=True) then
                begin
                  tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,7]));
                end else
                if (VarIsNumeric(WSheet.cells[i+1,7])) then tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('hh:mm:ss',FloatToDateTime(WSheet.cells[i+1,7]))
                else tmpAdo.Parameters.ParamByName('endtime').Value:=FormatDateTime('hh:mm:ss',StrToDateTime(SbctoDbc(WSheet.cells[i+1,7])));
                tmpAdo.Parameters.ParamByName('Train_time').Value:=StrToFloat(WSheet.cells[i+1,8]);
                tmpAdo.Parameters.ParamByName('Teacher').Value:=Trim(WSheet.cells[i+1,9]);
                tmpAdo.Parameters.ParamByName('Train_place').Value:=Trim(WSheet.cells[i+1,10]);
                tmpAdo.Parameters.ParamByName('Train_grade').Value:=Trim(WSheet.cells[i+1,11]);
                tmpAdo.Parameters.ParamByName('Train_result').Value:=Trim(WSheet.cells[i+1,12]);
                tmpAdo.Parameters.ParamByName('Train_content').Value:=Trim(WSheet.cells[i+1,13]);
                tmpAdo.Parameters.ParamByName('Train_status').Value:=jCount;
                tmpAdo.Parameters.ParamByName('type_ptr').Value:=iDetailType;
                tmpAdo.Parameters.ParamByName('train_feels').Value:=Trim(WSheet.cells[i+1,16]);;
                tmpAdo.Parameters.ParamByName('effective_date').Value:=FormatDateTime('yyyy-mm-dd',StrToDateTime(SbctoDbc(WSheet.cells[i+1,17])));
                tmpAdo.Parameters.ParamByName('feels_payed').Value:='0';
                tmpAdo.Parameters.ParamByName('oprator_ptr').Value:=user_ptr;
                tmpAdo.Parameters.ParamByName('oprate_time').Value:=formatdatetime('yyyy-MM-dd',Now);
                tmpAdo.Parameters.ParamByName('employeecode').Value:=Trim(WSheet.cells[i+1,1]);
                tmpAdo.ExecSQL;
              end;
            end;
            tmpAdo2.Close;
            tmpAdo2.SQL.Clear;
            tmpAdo2.SQL.Add('select * from #TempDBExcel');
            tmpAdo2.Open;
            if tmpAdo2.RecordCount>1 then
            begin
              if (Application.MessageBox('数据已经导入！,部分记录因为已经存在或是类型不符，没有导入，是否导出没有导入记录的请单？', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then
              begin
                WBook.DisplayAlerts := false;//是否提示存盘
                wbook.workbooks.close;
                wbook.Quit;
                DM.ADOQuery1.Close;
                DM.ADOQuery1.SQL.Clear;
                DM.ADOQuery1.SQL.Add('if exists(select 1 from tempdb..sysobjects where xtype=''u'' and name like ''#TempDB%'') drop table #TempDBExcel');
                DM.ADOQuery1.ExecSQL;
                screen.Cursor:=crDefault;
                Exit;
              end;
              with dm.ADOQuery1 do
              begin
                Close;
                SQL.Clear;
                sql.Add('select * from #TempDBExcel');
                Open;
                ShowADOQueryDataOnStringGrid(dm.ADOQuery1,StringGrid2);
                Export_Grid_to_Excel(StringGrid2,Application.Title);
              end;
            end
            else
            begin
              ShowMessage('数据已全部导入完毕！');
              WBook.DisplayAlerts := false;//是否提示存盘
              wbook.workbooks.close;
              wbook.Quit;
            end;

//            DM.ADOConn.CommitTrans;
            BitBtn2Click(nil);
          except
//            DM.ADOConn.RollbackTrans;
            WBook.DisplayAlerts := false;//是否提示存盘
            wbook.workbooks.close;
            wbook.Quit;
            DM.ADOQuery1.Close;
            DM.ADOQuery1.SQL.Clear;
            DM.ADOQuery1.SQL.Add('if exists(select 1 from tempdb..sysobjects where xtype=''u'' and name like ''#TempDB%'') drop table #TempDBExcel');
            DM.ADOQuery1.ExecSQL;
            ShowMessage('导入数据失败！');
          end;
          WBook.DisplayAlerts := false;//是否提示存盘
          wbook.workbooks.close;
          wbook.Quit;
          TmpAdo.Close;
          TmpAdo.SQL.Clear;
          TmpAdo.SQL.Add('drop table #TempDBExcel');
          TmpAdo.ExecSQL;
        end else
        begin
          Messagedlg('创建错误，请联系管理员！',mtinformation,[mbok],0);
          WBook.DisplayAlerts := false;//是否提示存盘
          wbook.workbooks.close;
          wbook.Quit;
          DM.ADOQuery1.Close;
          DM.ADOQuery1.SQL.Clear;
          DM.ADOQuery1.SQL.Add('if exists(select 1 from tempdb..sysobjects where xtype=''u'' and name like ''#TempDB%'') drop table #TempDBExcel');
          DM.ADOQuery1.ExecSQL;
          screen.Cursor:=crDefault;
          Exit;
        end;
      except
        WBook.DisplayAlerts := false;//是否提示存盘
        wbook.workbooks.close;
        wbook.Quit;
        DM.ADOQuery1.Close;
        DM.ADOQuery1.SQL.Clear;
        DM.ADOQuery1.SQL.Add('if exists(select 1 from tempdb..sysobjects where xtype=''u'' and name like ''#TempDB%'') drop table #TempDBExcel');
        DM.ADOQuery1.ExecSQL;
        screen.Cursor:=crDefault;
        Exit;
      end;
    finally
      TmpAdo.Close;
      TmpAdo.Connection:=nil;
      TmpAdo.Free;
      tmpAdo2.Close;
      tmpAdo2.Connection:=nil;
      tmpAdo2.Close;
    end;
  end;
  screen.Cursor:=crDefault;
//----------------------------------------------------------------------
end;

procedure TFrm_Main.ExcelToDB;
var
  fileName,msg,code:String;
  k,iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
    Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  try
    XLApp.workBooks.Open(fileName);
    Sheet := XLApp.Workbooks[1].WorkSheets[1];
    DM.ADOEmployee_Train_1.DisableControls;
    for iCount:=2 to 65535 do
    begin
      if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then  break;

      code:= sheet.cells[iCount,1];
      with DM.ADOQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='select rkey from employeemsg where employeecode='''+code+'''';
            Open;
          end;
      if dm.ADOQuery1.RecordCount=0 then continue ;

      DM.ADOEmployee_Train_1.Append;
      for jCount:=1 to 14 do
      begin
        if jCount=1 then
        begin
          code:= sheet.cells[iCount,jCount];
          with DM.ADOQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='select rkey from employeemsg where employeecode='''+code+'''';
            Open;
            DM.ADOEmployee_Train_1.Fields[jCount].Value:=IntToStr(FieldValues['rkey']);
          end;
        end
        else
        begin
          if jCount=14 then
          begin
            msg:= sheet.cells[iCount,jCount];
            if msg='未完成' then
              DM.ADOEmployee_Train_1.Fields[jCount].Value:=0
            else
              DM.ADOEmployee_Train_1.Fields[jCount].Value:=1;
            Break;
          end
          else
            DM.ADOEmployee_Train_1.Fields[jCount].Value:=sheet.cells[iCount,jCount];
        end;
      end;
        DM.ADOEmployee_Train_1.Post;
      
    end;
     XLApp.workbooks[1].close;
     if icount>=2 then
     begin
      k:=iCount-1;
      showmessage('导入完毕');

      DM.ADOEmployee_Train.Close;
      dm.ADOEmployee_Train.CommandText :='SELECT  top '+inttostr(k)+'T.Rkey,T.employeeid,M.employeecode,M.chinesename,M.ondutytime,'+
    'M.departmentname,T.Train_NO,T.Train_topics,T.startdate,T.starttime,T.enddate,'+
    'T.endtime,T.Train_time,T.Teacher,T.Train_place,T.Train_grade,T.Train_result,'+
    'T.Train_content,case T.Train_status when 0 then '+#39+'未完成'+#39+
    ' when 1 then '+#39+'已完成'+#39+ 'end AS Train_status,T.employeecode as ecode FROM  '+
    ' Employee_Train AS T INNER JOIN v_employeemsg AS M ON T.employeeid=M.rkey'+
    ' order by t.rkey desc ';
      DM.ADOEmployee_Train.Open;

     end;

  finally
    XLApp.quit;
    Screen.Cursor := crDefault;
    DM.ADOEmployee_Train_1.EnableControls;
  end
end;

procedure TFrm_Main.BitBtn5Click(Sender: TObject);
begin
  if not DM.ADOEmployee_Train.IsEmpty then
    Export_dbGridEH_to_Excel(DBGridEh1,Application.Title);
end;

procedure TFrm_Main.BitBtn6Click(Sender: TObject);
begin
  Popup2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  Frm_InsertTrain:=TFrm_InsertTrain.Create(Application);
  Q_Ftp:=TMenuItem(Sender).Tag;
  Frm_InsertTrain.dtpk1.Date:=StrToDate(v_date);
  Frm_InsertTrain.dtpk2.Date:=StrToDate(v_date);
  if Frm_InsertTrain.ShowModal=mrok then
  begin
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select top 1 rkey from Employee_Train order by rkey desc';
      Open;
    end;
    newrkey:=IntToStr(DM.ADOQuery1.FieldValues['rkey']);
    BitBtn2Click(nil);
  end;
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
var i:Integer;
    item:TMenuItem;
begin
  if not App_Init(dm.ADOConn) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

//  DM.ADOConn.Open;
//  rkey73:='2525';
//  user_ptr := '100';
//  vprev:='4';

  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select getdate() as v_date');
    Open;                                 //全局变量
    v_date:=datetostr(fieldvalues['v_date']);//短日期格式
  end;
  DM.ADOEmployee_Train.Close;
  DM.ADOEmployee_Train.Parameters[0].Value:=StartOfTheMonth(IncMonth(now,-1));
  DM.ADOEmployee_Train.Parameters[1].Value:=EndOfTheMonth(Now);
  DM.ADOEmployee_Train.Parameters[2].Value:=2;
  DM.ADOEmployee_Train.Parameters[3].Value:=2;
  DM.ADOEmployee_Train.Open;
  DM.ADOEmployee_Train_1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  label3.Caption := inttostr(dm.ADOEmployee_Train.RecordCount);
end;

procedure TFrm_Main.N3Click(Sender: TObject);
var rkey:string;
    dD1,dD2:TDateTime;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  Frm_InsertTrain:=TFrm_InsertTrain.Create(Application);
  dD1:=DateTimePicker1.Date;
  dD2:=DateTimePicker2.Date;
  Q_Ftp:=TMenuItem(Sender).Tag;
  if (not DM.ADOEmployee_Train.IsEmpty) then
  begin
    if (DM.ADOEmployee_Trainfeels_payed.AsString<>'') then
    begin
      if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
      begin
        showmessage('已结案的记录不能再结案！');
        exit;
      end;
    end;
    with TFrm_InsertTrain.Create(nil) do
    begin
      Q_Ftp:=TMenuItem(Sender).Tag;
      rkey:=dm.ADOEmployee_Trainemployeecode.Value;
      if showmodal=mrok then
      begin
        dm.ADOEmployee_Train.Close;
        dm.ADOEmployee_Train.CommandText:=sql+' and T.startdate between :dtpk1 and :dtpk2 and T.Train_status<>:V1 and T.Train_status<>:V2 order by T.oprate_time desc';
        DM.ADOEmployee_Train.Parameters[0].Value:=dD1;
        DM.ADOEmployee_Train.Parameters[1].Value:=dD2;
        if chk1.Checked then
          DM.ADOEmployee_Train.Parameters[2].Value:=2
        else
          DM.ADOEmployee_Train.Parameters[2].Value:=0;

        if chk2.Checked then
          DM.ADOEmployee_Train.Parameters[3].Value:=2
        else
          DM.ADOEmployee_Train.Parameters[3].Value:=1;
        dm.ADOEmployee_Train.Open;
        dm.ADOEmployee_Train.Locate('employeecode',rkey,[]);
      end;
      Free;
    end;
  end;
end;

procedure TFrm_Main.N5Click(Sender: TObject);
var iCount:Integer;
begin
  if (vprev='1') or (vprev='3') then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
  begin
    showmessage('已结案的记录不能再删除！');
    exit;
  end;
  if (strtoint(vprev)=2) then
  begin
    if (not DM.ADOEmployee_Train.IsEmpty) then
    begin
      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' ptr_flag=1');
      if (iCount>0) then
      begin
        ShowMsg('该记录已被引用，不能删除！',1);
        Exit;
      end;
      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' ptr_flag=0 and oprator_ptr='+user_ptr+'');
      if (iCount=0) then
      begin
        ShowMsg('只能删除本人添加的培训记录！',1);
        Exit;
      end else
      begin
        DM.ADOConn.BeginTrans;
        try
          with DM.ADOQuery1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='delete Employee_Train where rkey='+inttostr(DM.ADOEmployee_TrainRkey.Value);
            ExecSQL;
          end;
          DM.ADOConn.CommitTrans;
          BitBtn2Click(nil);
        except
          DM.ADOConn.RollbackTrans;
          ShowMessage('删除数据失败');
        end;
      end;
    end;
  end;
  if (strtoint(vprev)=4) then
  begin
    if (not DM.ADOEmployee_Train.IsEmpty) then
    begin
      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' ptr_flag=1');
      if (iCount>0) then
      begin
        ShowMsg('该记录已被引用，不能删除！',1);
        Exit;
      end;
      DM.ADOConn.BeginTrans;
      try
        with DM.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='delete Employee_Train where rkey='
            +inttostr(DM.ADOEmployee_TrainRkey.Value);
          ExecSQL;
        end;
        DM.ADOConn.CommitTrans;
        BitBtn2Click(nil);
      except
        DM.ADOConn.RollbackTrans;
        ShowMessage('删除数据失败');
      end;
    end;
  end;
end;

procedure TFrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:= smDownEh;
    DM.ADOEmployee_Train.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADOEmployee_Train.IndexFieldNames:=Column.FieldName;
  end;
//  if preColumn.FieldName<>Column.FieldName then
//  begin
//    Label1.Caption:=Column.Title.Caption;
//    preColumn.Title.Color:=clBtnFace;
//    Column.Title.Color:=clRed;
//    preColumn:=Column;
//    Edit1.SetFocus;
//  end;
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
    begin
      Label1.Caption:=Column.Title.Caption;
      Column.Title.Color:=clRed;
      preColumn.Title.Color:=clBtnFace;
      preColumn:=Column;
      Edit1Change(Edit1);
      Edit1.SetFocus;
    end;
end;

procedure TFrm_Main.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  DateTimePicker1.Date:=StartOfTheMonth(IncMonth(now,-1));
  DateTimePicker2.Date:=EndOfTheMonth(now);
  if dm.ADOConn.Connected then
  begin
    field_name := DBGridEh1.Columns[0].FieldName;
    PreColumn := DBGridEh1.Columns[0];
    DBGridEh1.Columns[0].Title.Color := clred ;
    Label1.Caption:=preColumn.Title.Caption;
    for i:=0 to DBGridEh1.Columns.Count-1 do
    begin
      DBGridEh1.Columns[i].Tag:=i;
      item := TmenuItem.Create(self) ;
      item.Tag:=i;
      item.Caption := DBGridEh1.Columns[i].Title.Caption;
      item.Checked :=DBGridEh1.Columns[i].Visible ;
      item.OnClick := item_click ;
      self.Popup2.Items.Add(item) ;
    end;

    with StringGrid1 do
    begin
      StringGrid1.ColCount:=17;
      StringGrid1.RowCount:=4;
      Cells[0,0]:='员工工号';
      Cells[1,0]:='培训编号';
      Cells[2,0]:='培训主题';
      Cells[3,0]:='开始日期';
      Cells[4,0]:='开始时间';
      Cells[5,0]:='结束日期';
      Cells[6,0]:='结束时间';
      Cells[7,0]:='培训时长(分钟)';
      Cells[8,0]:='培训讲师';
      Cells[9,0]:='培训地点';
      Cells[10,0]:='培训成绩';
      Cells[11,0]:='培训结果';
      Cells[12,0]:='培训内容';
      Cells[13,0]:='进行状况(未完成/完成)';
      Cells[14,0]:='培训类型';
      Cells[15,0]:='培训费用';
      Cells[16,0]:='费用有效期';
      Cells[0,1]:='10010';
      Cells[1,1]:='2013060001';
      Cells[2,1]:='培训专案讲课';
      Cells[3,1]:='2013-10-01';
      Cells[4,1]:='9:30';
      Cells[5,1]:='2013-10-02';
      Cells[6,1]:='10:30';
      Cells[7,1]:='60';
      Cells[8,1]:='张三';
      Cells[9,1]:='三楼会议室';
      Cells[10,1]:='98';
      Cells[11,1]:='合格';
      Cells[12,1]:='培训内容';
      Cells[13,1]:='完成';
      Cells[14,1]:='专案';
      Cells[15,1]:='100';
      Cells[16,1]:='2014-10-01';
      Cells[0,2]:='请以上一条为实例，按下列事项要求操作：所有输入的汉字标点切记请用半角；日期格式统一为：YYYY-MM-DD例：2013-10-01。时间单元格式可以时间类型或是文本！！时间类型表示：21:00:00或文本表示时间例：9:00';
      Cells[0,3]:='成绩、费用、培训时长(分钟)只能输入数字，进行状况只能填入(未完成或完成)；培训类型只能填入(普通、专案、升职、调薪四选其一)；培训类型为普通时，培训费用与费用有效期留空不填；结案初始默认都为未结。';
    end;
  end;
  sql:='SELECT T.Rkey,T.employeeid,M.employeecode,M.chinesename,M.ondutytime,M.departmentname,T.Train_NO,T.Train_topics,'
       +' T.startdate,T.starttime,T.enddate,T.endtime,T.Train_time,T.Teacher,T.Train_place,T.Train_grade,T.ptr_flag,'
       +' T.Train_result,T.Train_content,case T.Train_status when 0 then ''未完成'' when 1 then ''已完成'' end AS Train_status,'
       +' dbo.datadetail.Rkey as detailRkey,dbo.datadetail.item,T.train_feels,T.effective_date,'
       +' T.feels_payed,T.oprator_ptr,T.oprate_time,T.employeecode as ecode'
       +' FROM   Employee_Train AS T INNER JOIN v_employeemsg AS M'
       +' ON T.employeeid=M.rkey left join'
       +' dbo.datadetail on T.type_ptr=dbo.datadetail.Rkey'
       +' WHERE 1=1 ';
end;

procedure TFrm_Main.item_click(Sender: TObject);
var i:byte;
begin
  for i:=0 to DBGridEh1.Columns.Count-1 do
  if DBGridEh1.Columns[i].Tag=TMenuItem(sender).Tag then
  begin
    DBGridEh1.Columns[i].Visible:=not DBGridEh1.Columns[i].Visible;
    break;
  end;
  TMenuItem(sender).Checked:=not TMenuItem(sender).Checked;
end;

procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADOEmployee_Train.Filter:=preColumn.FieldName+' like ''%' +trim(Edit1.Text)+'%'''
  else
    DM.ADOEmployee_Train.Filter:='';
  label3.Caption := inttostr(dm.ADOEmployee_Train.RecordCount);

end;

procedure TFrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    ShowMessage(DM.ADOEmployee_Train.CommandText);
end;

procedure TFrm_Main.BitBtn7Click(Sender: TObject);
begin
  Export_Grid_to_Excel(StringGrid1,Self.Caption,False);
end;

procedure TFrm_Main.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
      (DBGridEh1.DataSource.DataSet as tadoquery).Sort := Column.FieldName;
end;

procedure TFrm_Main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if not (gdFixed in State) then
   if DBGridEh1.DataSource.DataSet.Active then
    begin
     if  DBGridEh1.DataSource.DataSet.RecNo  mod 2=0 then
     begin
      DBGridEh1.Canvas.Brush.Color:=clinfobk;
      DBGridEh1.Canvas.FillRect(rect);
      DBGridEh1.Canvas.font.color:=clblack;
     end
     else
     begin
      DBGridEh1.Canvas.Brush.Color:=clwhite;
      DBGridEh1.Canvas.FillRect(rect);
      DBGridEh1.Canvas.font.color:=clblack;
     end;

     if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
      begin
       DBGridEh1.Canvas.Brush.Color:=RGB(0,224,224);
       DBGridEh1.Canvas.FillRect(rect);
       DBGridEh1.Canvas.font.color:=clblack;
      end;
    DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
     DBGridEh1.Canvas.Font.Color := clred ;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_Main.N6Click(Sender: TObject);
var iCount,iItem:Integer;
    tmpAdo:TADOQuery;
    rkey:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if MessageBox(Handle,'确定要结案此记录吗?','操作提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  if (DM.ADOEmployee_Trainfeels_payed.AsString<>'') then
  begin
    if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
    begin
      showmessage('已结案的记录不能再结案！');
      exit;
    end;
  end;
  if (strtoint(vprev)=2) then
  begin
    if (not DM.ADOEmployee_Train.IsEmpty) then
    begin
      rkey:=dm.ADOEmployee_Trainemployeecode.Value;
      if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
      begin
        showmessage('本条培训记录已结案！');
        exit;
      end;

//      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' feels_payed=1');
//      if (iCount=0) then
//      begin
//        ShowMsg('本条培训记录已结案！',1);
//        Exit;
//      end;
      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' feels_payed=0 and oprator_ptr='+user_ptr+'');
      if (iCount=0) then
      begin
        ShowMsg('非创建者不可修改培训记录！',1);
        Exit;
      end else
      begin
        iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' effective_date>'''+formatdatetime('yyyy-MM-dd',Now)+''' and oprator_ptr='+user_ptr+' and feels_payed=0');
        if (iCount=0) then
        begin
          try
            tmpAdo:=TADOQuery.Create(Application);
            tmpAdo.Connection:=DM.ADOConn;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprate_time=substring(convert(nvarchar(10),getdate(),120),1,10) where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
            tmpAdo.ExecSQL;
            ShowMsg('结案成功！',1);
          finally
            tmpAdo.Close;
            tmpAdo.Connection:=nil;
            tmpAdo.Free;
          end;
        end else
        begin
          try
            tmpAdo:=TADOQuery.Create(Application);
            tmpAdo.Connection:=DM.ADOConn;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='select rkey from datadetail where dictid=15 and item =''负绩效''';
            tmpAdo.Open;
            if (tmpAdo.RecordCount>0) then
            begin
              iItem:=tmpAdo.FieldByName('Rkey').AsInteger;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='insert into employee_rewards_punishment (employeeid,type,money,flag,effectdate,remark) values(:employeeid,:type,:money,:flag,:effectdate,:remark)';
            tmpAdo.Parameters.ParamByName('employeeid').Value:=DM.ADOEmployee_Trainemployeeid.Value;
            tmpAdo.Parameters.ParamByName('type').Value:=iItem;
            tmpAdo.Parameters.ParamByName('money').Value:=DM.ADOEmployee_Traintrain_feels.Value;
            tmpAdo.Parameters.ParamByName('flag').Value:=1;
            tmpAdo.Parameters.ParamByName('effectdate').Value:=FormatDateTime('yyyy-MM-dd',Now);
            tmpAdo.Parameters.ParamByName('remark').Value:=DM.ADOEmployee_TrainType_ptr.AsString+'培训挂帐';
            tmpAdo.ExecSQL;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprate_time='''+formatdatetime('yyyy-MM-dd',Now)+''' where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
            tmpAdo.ExecSQL;
            ShowMsg('结案成功！',1);
            end;
          finally
            tmpAdo.Close;
            tmpAdo.Connection:=nil;
            tmpAdo.Free;
          end;
        end;
      end;
    end;
  end;
  if (strtoint(vprev)=4) then
  begin
    if (not DM.ADOEmployee_Train.IsEmpty) then
    begin
      rkey:=dm.ADOEmployee_Trainemployeecode.Value;
      if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
      begin
        showmessage('本条培训记录已结案！');
        exit;
//      end;
//      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' feels_payed=0');
//      if (iCount=0) then
//      begin
//        ShowMsg('本条培训记录已结案！',1);
//        Exit;
      end else
      begin
        iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' effective_date>'''+formatdatetime('yyyy-MM-dd',Now)+''' and feels_payed=0');
        if (iCount=0) then
        begin
          try
            tmpAdo:=TADOQuery.Create(Application);
            tmpAdo.Connection:=DM.ADOConn;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprator_ptr='+user_ptr+',oprate_time=substring(convert(nvarchar(10),getdate(),120),1,10) where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
            tmpAdo.ExecSQL;
            ShowMsg('结案成功！',1);
          finally
            tmpAdo.Close;
            tmpAdo.Connection:=nil;
            tmpAdo.Free;
          end;
        end else
        begin
          try
            tmpAdo:=TADOQuery.Create(Application);
            tmpAdo.Connection:=DM.ADOConn;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='select rkey from datadetail where dictid=15 and item =''负绩效''';
            tmpAdo.Open;
            if (tmpAdo.RecordCount>0) then
            begin
              iItem:=tmpAdo.FieldByName('Rkey').AsInteger;
            end;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='insert into employee_rewards_punishment (employeeid,type,money,flag,effectdate,remark) values(:employeeid,:type,:money,:flag,:effectdate,:remark)';
            tmpAdo.Parameters.ParamByName('employeeid').Value:=DM.ADOEmployee_Trainemployeeid.Value;
            tmpAdo.Parameters.ParamByName('type').Value:=iItem;
            tmpAdo.Parameters.ParamByName('money').Value:=DM.ADOEmployee_Traintrain_feels.Value;
            tmpAdo.Parameters.ParamByName('flag').Value:=1;
            tmpAdo.Parameters.ParamByName('effectdate').Value:=FormatDateTime('yyyy-MM-dd',Now);
            tmpAdo.Parameters.ParamByName('remark').Value:=DM.ADOEmployee_TrainType_ptr.AsString+'培训挂帐';
            tmpAdo.ExecSQL;
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprator_ptr='+user_ptr+',oprate_time=substring(convert(nvarchar(10),getdate(),120),1,10) where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
            tmpAdo.ExecSQL;
            ShowMsg('结案成功！',1);
          finally
            tmpAdo.Close;
            tmpAdo.Connection:=nil;
            tmpAdo.Free;
          end;
        end;
      end;
    end;
  end;
  BitBtn2Click(nil);
  dm.ADOEmployee_Train.Locate('employeecode',rkey,[]);
end;

procedure TFrm_Main.N4Click(Sender: TObject);
var rkey:string;
    dD1,dD2:TDateTime;
begin
  Frm_InsertTrain:=TFrm_InsertTrain.Create(Application);
//  dD1:=DateTimePicker1.Date;
//  dD2:=DateTimePicker2.Date;
  Q_Ftp:=TMenuItem(Sender).Tag;
  if (not DM.ADOEmployee_Train.IsEmpty) then
  begin
    with TFrm_InsertTrain.Create(nil) do
    begin
      Q_Ftp:=TMenuItem(Sender).Tag;
      rkey:=dm.ADOEmployee_Trainemployeecode.Value;
      if showmodal=mrok then
      begin
//        dm.ADOEmployee_Train.Close;
//        dm.ADOEmployee_Train.CommandText:=sql+' and T.startdate between :dtpk1 and :dtpk2 and T.Train_status<>:V1 and T.Train_status<>:V2';
//        DM.ADOEmployee_Train.Parameters[0].Value:=dD1;
//        DM.ADOEmployee_Train.Parameters[1].Value:=dD2;
//        if chk1.Checked then
//          DM.ADOEmployee_Train.Parameters[2].Value:=2
//        else
//          DM.ADOEmployee_Train.Parameters[2].Value:=0;
//
//        if chk2.Checked then
//          DM.ADOEmployee_Train.Parameters[3].Value:=2
//        else
//          DM.ADOEmployee_Train.Parameters[3].Value:=1;
//        dm.ADOEmployee_Train.Open;
        dm.ADOEmployee_Train.Locate('employeecode',rkey,[]);
      end;
      Free;
    end;
  end;
end;

procedure TFrm_Main.N7Click(Sender: TObject);
var iCount,iItem:Integer;
    tmpAdo:TADOQuery;
    rkey:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if MessageBox(Handle,'确定要特殊结案此记录吗?','操作提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  if (DM.ADOEmployee_Trainfeels_payed.AsString<>'') then
  begin
    if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
    begin
      showmessage('已结案的记录不能再结案！');
      exit;
    end;
  end;
  if (strtoint(vprev)=2) then
  begin
    if (not DM.ADOEmployee_Train.IsEmpty) then
    begin
      rkey:=dm.ADOEmployee_Trainemployeecode.Value;
      if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
      begin
        showmessage('本条培训记录已结案！');
        exit;
      end;

      iCount:=ResultRecordCount('Employee_Train','Rkey',IntToStr(dm.ADOEmployee_TrainRkey.Value),dm.ADOConn,' feels_payed=0 and oprator_ptr='+user_ptr+'');
      if (iCount=0) then
      begin
        ShowMsg('非创建者不可修改培训记录！',1);
        Exit;
      end else
      begin
        try
          tmpAdo:=TADOQuery.Create(Application);
          tmpAdo.Connection:=DM.ADOConn;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprate_time='''+formatdatetime('yyyy-MM-dd',Now)+''',Train_result=''合格(结案不扣绩效)'' where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
          tmpAdo.ExecSQL;
          ShowMsg('特殊结案成功！',1);
        finally
          tmpAdo.Close;
          tmpAdo.Connection:=nil;
          tmpAdo.Free;
        end;
      end;
    end;
  end;
  if (strtoint(vprev)=4) then
  begin
    if (not DM.ADOEmployee_Train.IsEmpty) then
    begin
      rkey:=dm.ADOEmployee_Trainemployeecode.Value;
      if (DM.ADOEmployee_Trainfeels_payed.Value=True) then
      begin
        showmessage('本条培训记录已结案！');
        exit;
      end else
      begin
        try
          tmpAdo:=TADOQuery.Create(Application);
          tmpAdo.Connection:=DM.ADOConn;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='update Employee_Train set feels_payed=1,oprator_ptr='+user_ptr+',oprate_time='''+formatdatetime('yyyy-MM-dd',Now)+''',Train_result=''合格(结案不扣绩效)'' where Rkey='+IntToStr(dm.ADOEmployee_TrainRkey.Value);
          tmpAdo.ExecSQL;
          ShowMsg('特殊结案成功！',1);
        finally
          tmpAdo.Close;
          tmpAdo.Connection:=nil;
          tmpAdo.Free;
        end;
      end;
    end;
  end;
  BitBtn2Click(nil);
  dm.ADOEmployee_Train.Locate('employeecode',rkey,[]);
end;

end.

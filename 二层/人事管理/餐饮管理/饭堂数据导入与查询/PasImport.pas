unit PasImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,TLHelp32,
  DB, ADODB;

type
  TfrmImport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    BitBtn1: TBitBtn;
    gdImport: TDBGrid;
    Panel3: TPanel;
    pb: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ADOExcelConn: TADOConnection;
    adoImport: TADOQuery;
    dsImport: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    LXls:Variant;
    SheetName:string;
  public
    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation

uses PasDM,ComObj;

{$R *.dfm}

procedure TfrmImport.BitBtn1Click(Sender: TObject);
var
  LFileDialog:TOpenDialog;
  LSheet:Variant;
  LFileName,LSql,LConnStr:string;
  i,j:Integer;
begin
  LFileDialog:=TOpenDialog.Create(nil);
  if LFileDialog.Execute then
  begin
    LFileName:=LFileDialog.FileName;
    if LFileName='' then
    begin
      Application.MessageBox('请选择需导入的Excel文件!','提示',mb_ok);
      Exit;
    end;
    SheetName:=ChangeFileExt(ExtractFileName(LFileName),'');
//    ShowMessage(SheetName);

    LXls:=CreateOleObject('Excel.Application');
    try
      try
        Screen.Cursor:= crSQLWait;
  //      LXls.WorkBooks.visiable:=False;
        LXls.WorkBooks.Open(trim(LFileName));
        ADOExcelConn.Connected:=False ;
        adoImport.Active :=False ;
        ADOExcelConn.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=';
        ADOExcelConn.ConnectionString:=ADOExcelConn.ConnectionString+trim(LFileName);
        ADOExcelConn.ConnectionString:=ADOExcelConn.ConnectionString+';Extended Properties=excel 8.0;Persist Security Info=false';
        ADOExcelConn.LoginPrompt:=False ;
        ADOExcelConn.Connected:=True;

        adoImport.Close;
        adoImport.SQL.Text:='SELECT * FROM ['+ LXls.ActiveSheet.Name +'$]';
        adoImport.Open;

        for i:=0 to gdImport.Columns.Count-1 do
        begin
          if (i = 3) or (i = 4)  then
          begin
            gdImport.Columns[i].Width:= 150;
            continue;
          end;
          gdImport.Columns[i].Width:=60;
        end;
        Screen.Cursor:= crDefault;
        Label4.Caption:= IntToStr(adoImport.RecordCount);
      except
        ShowMessage('打开EXCEL失败！');
        Screen.Cursor:= crDefault;
        LXls.WorkBooks.Close;
      end;
    finally
      LFileDialog.Free;
    end;
  end;
end;

procedure TfrmImport.btnSaveClick(Sender: TObject);
var
  LSql:string ;
  i:Integer;
  LMIN,LMAX:TDateTime;
begin
  if adoImport.IsEmpty then Exit;
  btnClose.Enabled:=False;
  BitBtn1.Enabled:=False;
  btnSave.Enabled:=False;
  Label1.Visible:=True;
  pb.Visible:=True;
  pb.Position:=0;
  pb.StepBy(1);
  pb.Max:= adoImport.RecordCount;
  Screen.Cursor:=crSQLWait;
  Application.ProcessMessages;
  adoImport.DisableControls;
  with dm.adoTmp do
  begin
    Close;
    SQL.Text:='TRUNCATE TABLE ICCardDataImport' ;
    ExecSQL;
  end;
  try
    DM.qryPost.Close;
    DM.qryPost.Open;
    adoImport.First;
    while not adoImport.Eof do
    begin

      DM.qryPost.Append;
      DM.qryPostaccount_type.Value:= adoImport.Fields[0].AsInteger;
      DM.qryPostempcard.Value:=trim(adoImport.Fields[1].AsString);
      DM.qryPostempcode.Value:=Trim(adoImport.Fields[2].AsString);
      DM.qryPostcard_time.Value:=adoImport.Fields[3].AsDateTime;
      DM.qryPostinport_time.Value:= adoImport.Fields[4].AsDateTime;
      DM.qryPostpayed.Value:=adoImport.Fields[5].AsCurrency;
      DM.qryPostdev_id.Value:=adoImport.Fields[6].AsString;
      DM.qryPoststrmeal_type.Value:=adoImport.Fields[7].AsString;
      DM.qryPoststrcompany.Value:=adoImport.Fields[8].AsString;

      DM.qryPost.Post;
      adoImport.Next;
      Application.ProcessMessages;
      pb.StepBy(1);
    end;
  except
    Screen.Cursor:=crDefault;
    ShowMessage('数据格式不正确,请检查');
    Exit;
  end;
  adoImport.EnableControls;
  Label1.Visible:=False;
  pb.Visible:=False;
  Label2.Visible:=True;
  Application.ProcessMessages;

//    DM.adoTmp.Close;
//    DM.adoTmp.SQL.Text:= 'exec hrsp_ICCardImport';
//    DM.adoTmp.Open;

    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'SELECT MIN(CARD_TIME) as TMin,MAX(CARD_TIME) as TMax FROM ICCardDataImport';
      Open;
      if not IsEmpty then
      begin
        LMIN:= FieldByName('TMin').Value;
        LMAX:= FieldByName('TMax').Value;
      end;

      Close;
      SQL.Text:= 'UPDATE ICCardDataImport set empid= employeemsg.rkey,factorytype=''local''     '+#13+
                 '   FROM ICCardDataImport inner join employeemsg   '+#13+
                 '          ON ICCardDataImport.empcode = employeemsg.employeecode  ' +#13+
                 '   WHERE employeemsg.STATUS IN (0,1,2)   ' +#13+
                 '                                                                   '+#13+
                 'UPDATE ICCardDataImport set empid= employeemsg_extra.rkey,factorytype=''extra''     '+#13+
                 '   FROM ICCardDataImport inner join employeemsg_extra   '+#13+
                 '          ON ICCardDataImport.empcode = employeemsg_extra.employeecode  ' +#13+
                 '  WHERE ICCardDataImport.empid IS NULL and employeemsg_extra.flag IN (1,4)               '+#13+
                 '                                                                      '+#13+
                 '   UPDATE ICCardDataImport set empid=alteration.employeeid,factorytype=''local''   '+#13+
                 '   FROM ICCardDataImport INNER JOIN      '+#13+
                 '       ( SELECT EMPLOYEEID,orginal_employeecode,NEW_employeecode  '+#13+
                 '         FROM employee_alteration      '+#13+
                 '         WHERE alterdate >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMIN)) + '  AND NEW_employeecode IS NOT NULL ) AS alteration   '+#13+
                 '       ON ICCardDataImport.empcode = alteration.orginal_employeecode     '+#13+
                 '   WHERE ICCardDataImport.empid IS NULL';
      ExecSQL;

      Close;
      SQL.Text:= 'UPDATE ICCardDataImport set company= substring(strcompany,1,1)   '+#13+
                 '   ,meal_type= substring(strmeal_type,1,1)     '+#13+
                 '   ,remark=''IC''    '+#13+
                 '   ,date_e= convert(varchar(10),inport_time,23)   '+#13+
                 '   ,time_e= convert(varchar(8),inport_time,24)  '+#13+
                 ' UPDATE ICCardDataImport set flag=1    '+#13+
                 ' FROM ICCardDataImport INNER JOIN   '+#13+
                 '     MEAL_ORGINALDATA ON ICCardDataImport.empid = MEAL_ORGINALDATA.empid  '+#13+
                 '     AND ICCardDataImport.card_time = MEAL_ORGINALDATA.card_time   '+#13+
                 '     AND ICCardDataImport.dev_id = MEAL_ORGINALDATA.dev_id   '+#13+
                 '     AND ICCardDataImport.account_type = MEAL_ORGINALDATA.account_type  '+#13+
                 ' WHERE MEAL_ORGINALDATA.DEV_MARK=''IC''  '+#13+
                 ' AND MEAL_ORGINALDATA.card_time BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMIN)) +
                 ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMAX)) + #13+
                 '     and ICCardDataImport.empid IS NOT NULL   ';
      ExecSQL;



      Close;
      SQL.Text:= 'UPDATE ICCardDataImport set flag=2   '+#13+
                 ' FROM ICCardDataImport left JOIN  '+#13+
                 '     employeecard_eastriver_rcd_error ON ICCardDataImport.empcode=employeecard_eastriver_rcd_error.empno    '+#13+
                 '     AND ICCardDataImport.card_time = employeecard_eastriver_rcd_error.card_time    '+#13+
                 '     AND ICCardDataImport.dev_id = employeecard_eastriver_rcd_error.dev_id   '+#13+
                 '     AND ICCardDataImport.account_type = employeecard_eastriver_rcd_error.account_type   '+#13+
                 ' WHERE employeecard_eastriver_rcd_error.DEV_MARK=''IC''   '+#13+
                 '     AND employeecard_eastriver_rcd_error.card_time  BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMIN)) +
                 ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMAX)) + #13+
                 '     AND ICCardDataImport.empid IS NULL ';
      ExecSQL;
    end;

  try
      DM.ADOConn.BeginTrans;
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'INSERT INTO MEAL_ORGINALDATA(empno,employeecard,card_time,date_e,time_e,dev_id,empid  '+#13+
                 '         ,dev_mark,factorytype,account_type,payed,company,meal_type)  '+#13+
                 ' SELECT empcode,empcard,card_time,date_e,time_e,dev_id,empid   '+#13+
                 '         ,remark,factorytype,account_type,payed,company,meal_type  '+#13+
                 '   FROM ICCardDataImport   '+#13+
                 '   WHERE flag=0 and empid IS NOT NULL ';
      ExecSQL;

      Close;
      SQL.Text:= 'INSERT INTO employeecard_eastriver_rcd_error(id,empno,employeecard,card_time,date_e,time_e,dev_id,empid   '+#13+
                 '         ,dev_mark,factorytype,account_type,payed,company,meal_type)  '+#13+
                 '   SELECT 1,empcode,empcard,card_time,date_e,time_e,dev_id,empid   '+#13+
                 '         ,remark,factorytype,account_type,payed,company,meal_type '+#13+
                 '   FROM ICCardDataImport   '+#13+
                 '   WHERE flag=0 and empid IS NULL ';
      ExecSQL;

      Close;
      SQL.Text:= 'UPDATE MEAL_ORGINALDATA  '+#13+
                 ' SET remark2=''BuKa''  '+#13+
                 ' WHERE DEV_MARK=''IC'' and employeecard = ''000000''   '+#13+
                 '       and card_time BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMIN)) +
                 ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMAX));
      ExecSQL;

      Close;
      SQL.Text:= 'UPDATE employeecard_eastriver_rcd_error  '+#13+
                 ' SET remark2=''BuKa''  '+#13+
                 ' WHERE DEV_MARK=''IC'' and employeecard = ''000000''   '+#13+
                 '       and card_time BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMIN)) +
                 ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',LMAX));
      ExecSQL;
    end;
    dm.ADOConn.CommitTrans ;
  except
    DM.ADOConn.RollbackTrans;
    Screen.Cursor:=crDefault;
    ShowMessage('数据导入失败，请联系管理员');
  end;
  try
    Label2.Caption:= '数据保存成功，正在进行数据分析。。。';
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= ' EXEC hrsp_MealAnalysis ' + QuotedStr(FormatDateTime('YYYY-MM-DD',LMIN)) + ',' + QuotedStr(FormatDateTime('YYYY-MM-DD',LMAX));
  //      ShowMessage(SQL.Text);
      ExecSQL;
    end;
  except
    Screen.Cursor:=crDefault;
    ShowMessage('数据分析失败，请联系管理员！');
  end;
  ModalResult:= mrYes;
end;

procedure TfrmImport.FormShow(Sender: TObject);
begin
  Label1.Visible:=False;
  pb.Visible:=False;
end;

procedure TfrmImport.FormClose(Sender: TObject; var Action: TCloseAction);
  procedure EndProcess(AFileName: string);
  const
    PROCESS_TERMINATE=$0001;
  var
    ExeFileName: String;
    ContinueLoop: BOOL;
    FSnapshotHandle: THandle;
    FProcessEntry32: TProcessEntry32;
  begin
    ExeFileName := AFileName;
    FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
    ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);
    while integer(ContinueLoop) <> 0 do
      begin
        if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))=UpperCase(ExeFileName))
         or (UpperCase(FProcessEntry32.szExeFile)=UpperCase(ExeFileName))) then
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),FProcessEntry32.th32ProcessID), 0);
        ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
      end;
  end;
begin
  if not VarIsEmpty(LXls) then
  begin
    if LXls.WorkBooks.Count<>0 then
    begin
     try
       adoImport.Close;
       ADOExcelConn.Connected:= False;
       LXls.WorkBooks.Close;
     except
     end;
    end;
    EndProcess('Excel.exe');
  end;
  Action:= Cafree;
end;

end.

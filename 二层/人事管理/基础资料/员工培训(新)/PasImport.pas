unit PasImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, ComCtrls,ADODB;

type
  TfrmImport = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnImSave: TBitBtn;
    btnImExit: TBitBtn;
    btnExport: TBitBtn;
    btnImport: TBitBtn;
    sgImport: TStringGrid;
    OpenDialog1: TOpenDialog;
    sgExport: TStringGrid;
    cbbTime: TComboBox;
    lbTime: TLabel;
    function SbctoDbc(s:string):string;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnImSaveClick(Sender: TObject);
  private
    { Private declarations }
    err:Boolean;
  public
    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation

uses DAMO,common,ComObj;

{$R *.dfm}

function TfrmImport.SbctoDbc(s:string):string;
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

procedure TfrmImport.FormShow(Sender: TObject);
begin
  sgExport.Visible:=False;
  err:=False;
  with sgImport do
  begin
    sgImport.RowCount:=3;
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
    Cells[17,0]:='关键岗位';

    Cells[18,0]:='课程编号';
    Cells[19,0]:='课程名称';

    //20171211add
    Cells[20,0]:='培训类别';
    Cells[21,0]:='培训方式';
    Cells[22,0]:='考核方式';

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
    Cells[17,1]:='如切片员';

    Cells[18,1]:='东莞五株用';
    Cells[19,1]:='东莞五株用';

    Cells[20,1]:='东莞五株用';
    Cells[21,1]:='东莞五株用';
    Cells[22,1]:='东莞五株用';



//    Cells[17,0]:='错误说明';
//    Cells[0,2]:='请以上一条为实例，按下列事项要求操作：所有输入的汉字标点切记请用半角；日期格式统一为：YYYY-MM-DD例：2013-10-01。时间单元格式可以时间类型或是文本！！时间类型表示：21:00:00或文本表示时间例：9:00';
//    Cells[0,3]:='成绩、费用、培训时长(分钟)只能输入数字，进行状况只能填入(未完成或完成)；培训类型只能填入(普通、专案、升职、调薪四选其一)；培训类型为普通时，培训费用与费用有效期留空不填；结案初始默认都为未结。';
  end;

  with sgExport do
  begin
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
    Cells[17,0]:='关键岗位';
    Cells[18,0]:='课程编号';
    Cells[19,0]:='课程名称';
    Cells[20,0]:='培训类别';
    Cells[21,0]:='培训方式';
    Cells[22,0]:='考核方式';

    Cells[23,0]:='无用';
    Cells[24,0]:='错误说明';
    

  end;
end;

procedure TfrmImport.btnExportClick(Sender: TObject);
begin
  Export_Grid_to_Excel(sgImport,Self.Caption,True);
end;

procedure TfrmImport.btnImportClick(Sender: TObject);
var
  excel:Variant;
  i,iCol:Integer;
  checktime:TDateTime;
  checkint:Integer;
  checkfloat:Double;
begin
  iCol:=1;

  OpenDialog1.Title:='请选择要导入的文件';
  OpenDialog1.Filter:='*.xls|*.xls|*.xlsx|*.xlsx';
  OpenDialog1.DefaultExt:='xls';

  if OpenDialog1.Execute then
  begin
    btnImport.Enabled:=False;
    if sgImport.RowCount>2 then
    begin
      for i:=1 to sgImport.RowCount-2 do
        sgImport.Rows[i].Clear;
      sgImport.RowCount:=2;
    end;
    sgImport.Cursor:=crHourGlass;
    try
      excel:=CreateOleObject('Excel.Application');
      excel.visible:=False;
      excel.WorkBooks.open(OpenDialog1.FileName);
      for i:=2 to excel.activesheet.UsedRange.Rows.Count do
      begin
        with sgImport do
        begin
          if Trim((Trim(excel.activesheet.cells[i,iCol].value)))='' then
          begin
            Break;
          end
          else Cells[0,i-1]:=Trim(excel.activesheet.cells[i,iCol].value);

          if Trim(excel.activesheet.cells[i,iCol+1].value)='' then
          begin
            Cells[1,i-1]:=Trim(excel.activesheet.cells[i,iCol+1].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值';
          end
          else Cells[1,i-1]:=Trim(excel.activesheet.cells[i,iCol+1].value);

          if Trim(excel.activesheet.cells[i,iCol+2].value)='' then
          begin
            Cells[2,i-1]:=Trim(excel.activesheet.cells[i,iCol+2].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 ' ;
          end
          else Cells[2,i-1]:=Trim(excel.activesheet.cells[i,iCol+2].value);

          if not TryStrToDate(Trim(excel.activesheet.cells[i,iCol+3].value),checktime) then
          Cells[24,i-1]:=Cells[24,i-1] + ' 开始日期格式不对 '
          else Cells[3,i-1]:=FormatDateTime('yyyy-MM-dd',checktime);

  //        if not TryFloatToDateTime((StrToFloat(Trim(excel.activesheet.cells[i,iCol+4].value))),checktime) then Cells[19,i-1]:=Cells[19,i-1] + ' 开始时间格式不对 '
  //        else Cells[4,i-1]:=FormatDateTime('hh:mm:ss',FloatToDateTime(StrToFloat(Trim(excel.activesheet.cells[i,iCol+4].value))));

          if not (TryStrToDateTime((Trim(excel.activesheet.cells[i,iCol+4].value)),checktime) or
                  TryFloatToDateTime((StrToFloat(Trim(excel.activesheet.cells[i,iCol+4].value))),checktime))
          then Cells[24,i-1]:=Cells[24,i-1] + ' 开始时间格式不对 '
          else Cells[4,i-1]:=FormatDateTime('hh:mm:ss',checktime);

          if not TryStrToDate(Trim(excel.activesheet.cells[i,iCol+5].value),checktime) then
          Cells[24,i-1]:=Cells[24,i-1] + ' 结束日期格式不对 '
          else Cells[5,i-1]:=FormatDateTime('yyyy-MM-dd',checktime);

  //        if not TryFloatToDateTime((StrToFloat(Trim(excel.activesheet.cells[i,iCol+6].value))),checktime) then Cells[19,i-1]:=Cells[19,i-1] + ' 结束时间格式不对 '
  //        else Cells[6,i-1]:=FormatDateTime('hh:mm:ss',FloatToDateTime(StrToFloat(Trim(excel.activesheet.cells[i,iCol+6].value))));

          if not (TryStrToDateTime((Trim(excel.activesheet.cells[i,iCol+6].value)),checktime) or
                    TryFloatToDateTime((StrToFloat(Trim(excel.activesheet.cells[i,iCol+6].value))),checktime))
          then Cells[24,i-1]:=Cells[24,i-1] + ' 结束时间格式不对 '
          else Cells[6,i-1]:=FormatDateTime('hh:mm:ss',checktime);

          if Trim(excel.activesheet.cells[i,iCol+7].value)='' then
          begin
            Cells[7,i-1]:=Trim(excel.activesheet.cells[i,iCol+7].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 ';
          end
          else Cells[7,i-1]:=Trim(excel.activesheet.cells[i,iCol+7].value);

          if Trim(excel.activesheet.cells[i,iCol+8].value)='' then
          begin
            Cells[8,i-1]:=Trim(excel.activesheet.cells[i,iCol+8].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 ' ;
          end
          else Cells[8,i-1]:=Trim(excel.activesheet.cells[i,iCol+8].value);

          if Trim(excel.activesheet.cells[i,iCol+9].value)='' then
          begin
            Cells[9,i-1]:=Trim(excel.activesheet.cells[i,iCol+9].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 '  ;
          end
          else Cells[9,i-1]:=Trim(excel.activesheet.cells[i,iCol+9].value);

  //        if not  TryStrToInt(Trim(excel.activesheet.cells[i,iCol+10].value),checkint) then             // 培训成绩
  //        begin
  //          Cells[10,i-1]:=Trim(excel.activesheet.cells[i,iCol+10].value);
  //          Cells[19,i-1]:=Cells[19,i-1] + ' 培训成绩有误 ' ;
  //        end
  //        else
  //        begin
  //          if (checkint<0) or (checkint > 100) then
  //          begin
  //            Cells[10,i-1]:=Trim(excel.activesheet.cells[i,iCol+10].value);
  //            Cells[19,i-1]:=Cells[19,i-1] + ' 培训成绩必须在0-100之间 ' ;
  //          end
  //          else Cells[10,i-1]:=Trim(excel.activesheet.cells[i,iCol+10].value);
  //        end;
          if Trim(excel.activesheet.cells[i,iCol+10].value)='' then
          begin
            Cells[10,i-1]:=Trim(excel.activesheet.cells[i,iCol+10].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 '  ;
          end
          else Cells[10,i-1]:=Trim(excel.activesheet.cells[i,iCol+10].value);

          if Trim(excel.activesheet.cells[i,iCol+11].value)='' then                         //培训结果
          begin
            Cells[11,i-1]:=Trim(excel.activesheet.cells[i,iCol+11].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 ' ;
          end
          else Cells[11,i-1]:=Trim(excel.activesheet.cells[i,iCol+11].value);

          if Trim(excel.activesheet.cells[i,iCol+12].value)='' then
          begin
            Cells[12,i-1]:=Trim(excel.activesheet.cells[i,iCol+12].value);                    //培训内容
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 ' ;
          end
          else Cells[12,i-1]:=Trim(excel.activesheet.cells[i,iCol+12].value);

          if Trim(excel.activesheet.cells[i,iCol+13].value)='完成' then
           Cells[26,i-1]:='1'              //培训状况
          else
          begin
            if Trim(excel.activesheet.cells[i,iCol+13].value)='未完成' then
             Cells[26,i-1]:='0'
            else Trim(excel.activesheet.cells[i,iCol+13].value) ;
          end;
            Cells[13,i-1]:=Trim(excel.activesheet.cells[i,iCol+13].value);

          if Trim(excel.activesheet.cells[i,iCol+14].value)='' then                               //培训类型
          begin
            Cells[14,i-1]:=Trim(excel.activesheet.cells[i,iCol+14].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 记录中存在空值 ';
          end
          else Cells[14,i-1]:=Trim(excel.activesheet.cells[i,iCol+14].value);

          if Trim(excel.activesheet.cells[i,iCol+15].value)='' then
            Cells[15,i-1]:='0'
          else if not TryStrToFloat(Trim(excel.activesheet.cells[i,iCol+15].value),checkfloat) then      //培训费用
          begin
            Cells[15,i-1]:=Trim(excel.activesheet.cells[i,iCol+15].value);
            Cells[24,i-1]:=Cells[24,i-1] + ' 培训费用有误 ';
          end
          else
            Cells[15,i-1]:=Trim(excel.activesheet.cells[i,iCol+15].value);

  //        if not TryStrToDate(Trim(excel.activesheet.cells[i,iCol+16].value),checktime) then        //失效日期
  //        begin
  //          Cells[16,i-1]:=Trim(excel.activesheet.cells[i,iCol+16].value);
  //          Cells[19,i-1]:=Cells[19,i-1] + ' 记录中存在空值 ';
  //        end
  //        else Cells[16,i-1]:=Trim(excel.activesheet.cells[i,iCol+16].value);
          Cells[16,i-1]:=Trim(excel.activesheet.cells[i,iCol+16].value);
          Cells[17,i-1]:=Trim(excel.activesheet.cells[i,iCol+17].value);
          Cells[18,i-1]:=Trim(excel.activesheet.cells[i,iCol+18].value);
          Cells[19,i-1]:=Trim(excel.activesheet.cells[i,iCol+19].value);

          Cells[20,i-1]:=Trim(excel.activesheet.cells[i,iCol+20].value);
          Cells[21,i-1]:=Trim(excel.activesheet.cells[i,iCol+21].value);
          Cells[22,i-1]:=Trim(excel.activesheet.cells[i,iCol+22].value);

          
          if Cells[24,i-1]<>'' then err:=True;
          RowCount:=RowCount+1;
  //        if i=n*t then
  //        begin
  //          ProgressBar1.Position:=10*t;
  //          Application.ProcessMessages;
  //          t:=t+1;
  //        end;
        end;
      end;
    finally
      excel.Quit;
      excel:=Unassigned;
      sgImport.Cursor:=crDefault;
    end;
    ShowMessage('导入完成');
    btnImport.Enabled:=True;
  end;
end;

procedure TfrmImport.btnImSaveClick(Sender: TObject);
var
  i,j,imrow,errrow,uprcount:Integer;
  daystr,Key:string;
//  checkdate:TDateTime;
  datebegin,timebegin,timeend:string;
//  grade:Extended;
begin
//  if cbbTime.ItemIndex=-1 then
//  begin
//    ShowMessage('请先选择培训时间段！');
//    cbbTime.SetFocus;
//    exit;
//  end;
  imrow:=1;
  uprcount:=0;
  err:=False;
  case cbbTime.ItemIndex of
    0:
    begin
      timebegin:='08:00:00';
      timeend:='12:00:00';
    end;
    1:
    begin
      timebegin:='12:00:00';
      timeend:='16:00:00';
    end;
    2:
    begin
      timebegin:='16:30:00';
      timeend:='22:00:00';
    end;
  end;

  with DM.adoTmp do                               //判断工号与培训类型是否正确
  begin
    Close;
    SQL.Clear;
    SQL.Add('if exists(select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb..#trainimport'') and type=''U'') '+ #13+
            'drop table #trainimport '+#13+
            'create table #trainimport(employeeid int,employeecode nvarchar(20),train_no varchar(50),train_topics nvarchar(50), '+
            ' startdate datetime,starttime varchar(20),enddate datetime,endtime varchar(20),train_time float, '+
            ' teacher nvarchar(50),train_place nvarchar(30),train_grade nvarchar(20),train_result nvarchar(20), '+
            ' train_content nvarchar(200),train_status int,train_feels money,effective_date datetime,oprator_ptr int, '+
            ' oprate_time datetime,traintype nvarchar(20),typeid int,feels_payed bit,ptr_flag bit,dbflag bit,deptid int,keyid int,KeyPosition varchar(40), '+
            'ccode varchar(20),cname varchar(30),PostID int,tc_ptr int,Ctype varchar(10),Ttype varchar(10),Etype varchar(10), CtypeiD int, TTYpeID int,ETYpeid int )');
     // ShowMessage(SQL.Text);
    ExecSQL;


    Close;
    SQL.Clear;
    for i:=1 to sgImport.RowCount-2 do
    begin
      if Length(sgImport.Cells[24,i])< 2 then
      begin
        if Trim(sgImport.Cells[16,i])='' then daystr:='null'
        else daystr:= QuotedStr(sgImport.Cells[16,i]);
        if Trim(sgImport.Cells[17,i])='' then Key:='null'
        else Key:= QuotedStr(sgImport.Cells[17,i]) ;
        SQL.Text:=SQL.Text+ 'insert into #trainimport values(0,'+ QuotedStr(sgImport.Cells[0,i])+','+ QuotedStr(sgImport.Cells[1,i])+','+ QuotedStr(sgImport.Cells[2,i])+','+
                  QuotedStr(sgImport.Cells[3,i])+','+ QuotedStr(sgImport.Cells[4,i])+','+ QuotedStr(sgImport.Cells[5,i])+','+QuotedStr(sgImport.Cells[6,i])+','+ sgImport.Cells[7,i]+','+
                  QuotedStr(sgImport.Cells[8,i])+','+QuotedStr(sgImport.Cells[9,i])+','+QuotedStr(sgImport.Cells[10,i])+','+ QuotedStr(sgImport.Cells[11,i])+','+
                  QuotedStr(sgImport.Cells[12,i])+','+sgImport.Cells[26,i]+','+ sgImport.Cells[15,i]+','+ daystr +','+ user_ptr+','+
                  QuotedStr(FormatDateTime('yyyy-MM-dd',getsystem_date(DM.adoTime,1)))+','+QuotedStr(sgImport.Cells[14,i])+',0,0,0,0,0,null,' +
                 Key+','+QuotedStr(sgImport.Cells[18,i])+','+QuotedStr(sgImport.Cells[19,i])+ ',0,0,'+QuotedStr(sgImport.Cells[20,i])+ ','+QuotedStr(sgImport.Cells[21,i])+ ' '+
                 ','+QuotedStr(sgImport.Cells[22,i])+ ',-1,-1,-1)';
      end;
    end;
    // ShowMessage(SQL.Text);
    if SQL.Text='' then
    begin
      ShowMessage('没有可以保存的数据，请查看记录最后面的错误说明是否存在错误，改正后重新导入');
      exit;
    end;
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Text:='update #trainimport set employeeid = employeemsg.rkey,typeid = datadetail.rkey,deptid = employeemsg.departmentid,tc_ptr=trainclass.rkey,postID=employeemsg.Position ' + #13+
                ',CtypeID=(case when #trainimport.ctype=''入职培训''  then 0  when #trainimport.ctype=''岗前培训''  then 1 when #trainimport.ctype=''在岗培训''  then 2 else -1 end )'+  #13+
                ',TtypeID=(case when #trainimport.ttype=''课堂面授''  then 0  when #trainimport.Ttype=''实操培训''  then 1 when #trainimport.Ttype=''在线培训''  then 2 else -1 end )'+  #13+
                ',EtypeID=(case when #trainimport.Etype=''口试考核''  then 0  when #trainimport.Etype=''笔试考核''  then 1 when #trainimport.Etype=''实操考核''  then 2 when #trainimport.Etype=''在线考核''  then 3 else -1 end )'+  #13+
                'from #trainimport inner join employeemsg on #trainimport.employeecode=employeemsg.employeecode '+  #13+
                'inner join datadetail on #trainimport.traintype=datadetail.item '+#13+
                'left join trainclass  on #trainimport.ccode=trainclass.ccode   '+#13+
               // 'inner join datadetail d1  on #trainimport.ccode=trainclass.ccode   '+#13+
                'select * from #trainimport'; //employeeid,employeecode,train_no,traintype,typeid,dbflag
   // ShowMessage('1:'+SQL.Text);
    ExecSQL;
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        if (FieldByName('employeeid').AsInteger<>0) and (FieldByName('typeid').AsInteger<>0) then
        begin
          with dm.adoTime do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='select rkey,employeeid,Train_no from employee_train where employeeid ='+
                DM.adoTmp.FieldByName('employeeid').AsString +' and Train_no = '+
                QuotedStr(DM.adoTmp.FieldByName('train_no').AsString);
            Open;
            if not IsEmpty then
            begin
              with DM.adoTmp2 do
              begin
                Close;
                SQL.Clear;
                SQL.Text:='update #trainimport set dbflag=1 where employeeid ='+ DM.adoTmp.FieldByName('employeeid').AsString +' and train_no = '+ QuotedStr(DM.adoTmp.FieldByName('train_no').AsString);
                ExecSQL;
              end;
              sgImport.Cells[24,imrow]:=sgImport.Cells[24,imrow]+' 记录已经存在 ';
              err:=True;
            end;
          end;
          sgImport.Cells[25,imrow]:= FieldByName('employeeid').AsString;
          sgImport.Cells[27,imrow]:= FieldByName('typeid').AsString;
        end
        else
        begin
            sgImport.Cells[24,imrow]:=sgImport.Cells[24,imrow]+' 工号或类型有误 ';
            err:=True;
        end;
        imrow:=imrow+1;
        Next;
      end;
    end;

    Close;
    SQL.Clear;
    SQL.Text:='update #trainimport set keyid = hr_KeyPosition.rkey ' + #13+
                'from #trainimport inner join hr_KeyPosition on #trainimport.deptid = hr_KeyPosition.deptid and #trainimport.KeyPosition = hr_KeyPosition.positionname '+  #13+
                'select * from #trainimport';
    ExecSQL;
    open;
    if not IsEmpty then
    begin
      imrow:=1;
      first;
      while not eof do
      begin

        if (FieldByName('cname').asstring <> '') and (FieldByName('tc_ptr').AsInteger=0) then
        begin
          sgImport.Cells[24,imrow]:=sgImport.Cells[24,imrow]+' 课程编号或名称有误 ';
          err:=True;
        end;

        if (FieldByName('KeyPosition').asstring <> '') and (FieldByName('keyid').AsInteger=0) then
        begin
          sgImport.Cells[24,imrow]:=sgImport.Cells[24,imrow]+' 关键岗位有误 ';
          err:=True;
        end;

        if (Trim(FieldByName('traintype').asstring) = '关键岗位') and (FieldByName('keyid').AsInteger=0) then
        begin
          sgImport.Cells[24,imrow]:=sgImport.Cells[24,imrow]+' 关键岗位有误 ';
          err:=True;
        end;
        imrow:=imrow+1;
        Next;
      end;
    end;

    Close;
    SQL.Clear;
    SQL.Text:='update #trainimport set dbflag=1 where traintype = ''关键岗位'' and keyid =0' +
              'update #trainimport set keyid = null where traintype <> ''关键岗位'' and keyid <>0';
    ExecSQL;
  end;

  try
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select top 1 startdate from #trainimport' ;
      Open;
      if not IsEmpty then
      begin
        datebegin:=FieldByName('startdate').AsString;
      end;
    end;

    with DM.adoTmp do                                                                        //同步时间
    begin
      Close;
      SQL.Clear;
      SQL.Text:=' update #trainimport '+#13+
                ' set starttime=isnull(b.card_time,#trainimport.starttime),endtime=isnull(c.card_time,#trainimport.endtime) '+#13+
                ' from #trainimport left join (select * from employee_train_eastid  where flag=0 and card_date= '+ QuotedStr(datebegin)+ #13+
                ' and card_time between '+ QuotedStr(timebegin)+' and '+ QuotedStr(timeend)+') b on #trainimport.employeeid=b.employeeid and #trainimport.startdate=b.card_date '+ #13+
                ' left join (select * from employee_train_eastid a where flag=0 and a.rkey >( '+  #13+
                ' select top 1 rkey from employee_train_eastid where flag=0 and card_date='+ QuotedStr(datebegin)+'and card_time between '+ QuotedStr(timebegin)+' and '+ QuotedStr(timeend)+') '+ #13+
                ' and card_date='+ QuotedStr(datebegin) + ' and card_time between '+ QuotedStr(timebegin)+' and ' + QuotedStr(timeend)+')  c on #trainimport.employeeid=c.employeeid and #trainimport.startdate=c.card_date '+#13+
                ' select @@rowcount as rcount ';
//      ShowMessage(SQL.Text);
      ExecSQL;
      if not IsEmpty then  uprcount:= fieldByName('rcount').Value;

    end;
    if uprcount<>0 then
    begin
      with DM.adoTmp do                                                                      //更新培训时长
      begin
        Close;
        SQL.Clear;
        SQL.Text:=' update #trainimport '+#13+
                  ' set train_time= datediff(n,starttime,endtime)';    //此处可能有BUG（视打卡情况而定）
        ExecSQL;
      end;
    end;

    DM.ADOConnection1.BeginTrans;
    with DM.adoTmp do                                                                      //把记录插入employee_train
    begin
      Close;
      SQL.Clear;
      SQL.Text:='insert into employee_train(employeeid, Train_NO, Train_topics, startdate, starttime, enddate, endtime, Train_time, Teacher, ' +
                'Train_place, Train_grade, Train_result, Train_content, Train_status, ptr_flag, type_ptr, train_feels, effective_date, ' +
                'feels_payed, oprator_ptr, oprate_time, employeecode,KeyPositionId,tc_ptr,DeptID,PostID,Ctype,TType,ETYpe)'+#13+
                'select employeeid,train_no,train_topics,startdate,starttime,enddate,endtime,train_time,teacher,train_place,train_grade, '+
                'train_result,train_content,train_status,ptr_flag,typeid,train_feels,effective_date,feels_payed,oprator_ptr,oprate_time,employeecode,keyid,tc_ptr,DeptID,PostID '+ #13+
                ',CtypeID,TTypeID,ETYpeID'+ #13+
                'from #trainimport where (employeeid <>0 and typeid <>0 ) and dbflag=0';
      ExecSQL;
    end;
//
    with DM.adoTmp do                                                                    //把 employee_train_eastid 中使用过的时间flag设置成1
    begin
      Close;
      SQL.Clear;
      SQL.Text:='update employee_train_eastid '+#13+
                'set flag=1 '+#13+
                'where rkey in (select top 2 rkey from employee_train_eastid where flag=0 and card_date = '+ QuotedStr(datebegin) +
                ' and card_time between '+ QuotedStr(timebegin)+' and '+ QuotedStr(timeend)+')' ;
//      ShowMessage(SQL.Text);
      ExecSQL;
    end;
//
//
    DM.ADOConnection1.CommitTrans;
//
    if err=True then
    begin
      if MessageDlg('正确数据导入完成，是否导出有误数据？',mtInformation,[mbYes,mbNo],0)=mryes then
      begin
        errrow:=1;
        for i:=1 to sgImport.RowCount-2 do
        begin
          if Length(sgImport.Cells[24,i])>2 then
          begin
            for j:=0 to sgImport.ColCount-3 do
            begin
              sgExport.Cells[j,errrow]:=sgImport.Cells[j,i];
            end;
            errrow:=errrow+1;
            sgExport.RowCount:=sgExport.RowCount+1;
          end;
        end;
        Export_Grid_to_Excel(sgExport,'1',True);
      end;
    end;

    ModalResult:=mrYes;
  except
    on E: Exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

end;

end.

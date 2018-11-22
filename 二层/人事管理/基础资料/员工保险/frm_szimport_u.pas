unit frm_szimport_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Buttons,ComObj, ComCtrls, DBGrids;

type
  Tfrm_import_sz = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ExcelToDB;
    procedure dataimport(i,k :Integer);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);

  private
    str4140,str4141,str4142,str4143,str4144 :string;
  public
    { Public declarations }
  end;

var
  frm_import_sz: Tfrm_import_sz;
  total,threadcount,divcount,cur_point,des_point : Integer;
  fileName:String;
  XLApp: variant;
  Sheet: Variant;

implementation
uses common,ConstVar,Pick_Item_Single, damo;

{$R *.dfm}

procedure Tfrm_import_sz.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0] := ''; //序号
  stringgrid1.Cells[1,0] := ''; //个人编号
  stringgrid1.Cells[2,0] := ''; // 姓名
  stringgrid1.Cells[3,0] := ''; // 身份证号码
  stringgrid1.Cells[4,0] := ''; //部门
  stringgrid1.Cells[5,0] := ''; //员工编号
  stringgrid1.Cells[6,0] := ''; // 部门编号
  stringgrid1.Cells[7,0] := ''; // 应收合计
  stringgrid1.Cells[8,0] := ''; // 个人合计
  stringgrid1.Cells[9,0] := ''; //  单位合计
  stringgrid1.Cells[10,0] := '';// 养老缴费基数
  stringgrid1.Cells[11,0] := '养老保险'; //个人交  4140	6	养老保险
  stringgrid1.Cells[12,0] := '';//       单位交
  stringgrid1.Cells[13,0] := '';// 医疗缴费基数
  stringgrid1.Cells[14,0] := '医疗保险'; //个人交      4141	6	医疗保险
  stringgrid1.Cells[15,0] := '';//       单位交
  stringgrid1.Cells[16,0] := '工伤保险';  //缴费基数
  stringgrid1.Cells[17,0] := '';// 单位交     4142	6	工伤保险
  stringgrid1.Cells[18,0] := '';// 缴费基数
  stringgrid1.Cells[19,0] := '失业保险'; //   4143	6	失业保险
  stringgrid1.Cells[20,0] := '';// 单位交
  stringgrid1.Cells[21,0] := '生育医疗'; // 缴费基数    4144	6	生育医疗
  stringgrid1.Cells[22,0] := '';//  单位交
  stringgrid1.Cells[23,0] := '';//   人员employeeid
  stringgrid1.Cells[24,0] := '';//   导入结果
  {stringgrid1.Cells[25] := '';
  stringgrid1.Cells[26] := '';
  stringgrid1.Cells[27] := '';
  stringgrid1.Cells[28] := '';
  stringgrid1.Cells[29] := '';}
  stringgrid1.Cells[0,1] := '序号';
  stringgrid1.Cells[1,1] := '个人编号';
  stringgrid1.Cells[2,1] := '姓名';
  stringgrid1.Cells[3,1] := '身份证号';
  stringgrid1.Cells[4,1] := '部门';
  stringgrid1.Cells[5,1] := '员工编号';
  stringgrid1.Cells[6,1] := '部门编号';
  stringgrid1.Cells[7,1] := '应收合计';
  stringgrid1.Cells[8,1] := '个人合计';
  stringgrid1.Cells[9,1] := '单位合计';
  stringgrid1.Cells[10,1] := '缴费基数';
  stringgrid1.Cells[11,1] := '个人交';
  stringgrid1.Cells[12,1] := '单位交';
  stringgrid1.Cells[13,1] := '缴费基数';
  stringgrid1.Cells[14,1] := '个人交';
  stringgrid1.Cells[15,1] := '单位交';
  stringgrid1.Cells[16,1] := '缴费基数';
  stringgrid1.Cells[17,1] := '单位交';
  stringgrid1.Cells[18,1] := '缴费基数';
  stringgrid1.Cells[19,1] := '个人交';
  stringgrid1.Cells[20,1] := '单位交';
  stringgrid1.Cells[21,1] := '缴费基数';
  stringgrid1.Cells[22,1] := '单位交';
  stringgrid1.Cells[23,1] := '验证结果';
  stringgrid1.Cells[24,1] := '导入结果';
  stringgrid1.ColWidths[3] := 130;
  stringgrid1.ColWidths[23] := 100;
  stringgrid1.ColWidths[24] := 60;
  DateTimePicker1.Date := Now();
  str4140:='0' ;
  str4141:='0' ;
  str4142:='0' ;
  str4143:='0' ;
  str4144:='0' ;

  dm.ADOQuery1.SQL.Text := 'select top 1 rkey from datadetail where dictid=6 and item like '+quotedstr('%养老%');
  dm.ADOQuery1.ExecSQL;
  dm.ADOQuery1.Open;
  if not dm.ADOQuery1.Eof then str4140 := dm.ADOQuery1.fieldbyname('rkey').AsString;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Clear;

    dm.ADOQuery1.SQL.Text := 'select top 1 rkey from datadetail where dictid=6 and item like '+quotedstr('%医疗%');
  dm.ADOQuery1.ExecSQL;
  dm.ADOQuery1.Open;
  if not dm.ADOQuery1.Eof then str4141 := dm.ADOQuery1.fieldbyname('rkey').AsString;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Clear;

    dm.ADOQuery1.SQL.Text := 'select top 1 rkey from datadetail where dictid=6 and item like '+quotedstr('%工伤%');
  dm.ADOQuery1.ExecSQL;
  dm.ADOQuery1.Open;
  if not dm.ADOQuery1.Eof then str4142 := dm.ADOQuery1.fieldbyname('rkey').AsString;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Clear;

    dm.ADOQuery1.SQL.Text := 'select top 1 rkey from datadetail where dictid=6 and item like '+quotedstr('%失业%');
  dm.ADOQuery1.ExecSQL;
  dm.ADOQuery1.Open;
  if not dm.ADOQuery1.Eof then str4143 := dm.ADOQuery1.fieldbyname('rkey').AsString;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Clear;

    dm.ADOQuery1.SQL.Text := 'select top 1 rkey from datadetail where dictid=6 and item like '+quotedstr('%生育%');
  dm.ADOQuery1.ExecSQL;
  dm.ADOQuery1.Open;
  if not dm.ADOQuery1.Eof then str4144 := dm.ADOQuery1.fieldbyname('rkey').AsString;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Clear;





end;

procedure Tfrm_import_sz.ExcelToDB;
var
  iCount,limit,t: Integer;
  tmp1 : Single;

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
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;
  
  try
       XLApp.workBooks.Open(fileName);

       Sheet := XLApp.Workbooks[1].WorkSheets[1];

       for iCount:=3 to 60000 do //从EXCLE 第三行开始
       begin
          if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) = '')
          then
                 begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
      total := icount-limit-2;
       //ShowMessage('总数据条数：'+IntToStr(total));
      StringGrid1.RowCount := total+2;
       divcount :=   Round(total/10); //分10段装载条数 10分之一
       if (total mod 10 <> 0) or (total<10) then   divcount:= divcount +1;
       //ShowMessage( '每次装载' +IntToStr(divcount));
       cur_point :=2;
       des_point := cur_point+ divcount;

       for   t:=1 to 10 do
       begin
          dataimport(cur_point,des_point);
          cur_point := cur_point+divcount;
          des_point := cur_point+divcount;
          ProgressBar1.Position := 10*t;
          StringGrid1.Refresh;
          Application.ProcessMessages;
       end;

       stringgrid1.ColWidths[0] := 60;
       stringgrid1.ColWidths[1] := 60;
       //XLApp.workbooks[1].close;
  finally
      // XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   ShowMessage('数据加载完毕');
   ProgressBar1.Position := 0 ;
   XLApp.workbooks[1].close;
   XLApp.quit; 
   stringgrid1.Refresh;
   //stringgrid1.FixedRows := 1;
end;


 procedure Tfrm_import_sz.dataimport(i,k :Integer);
 var j : Integer;
begin
      for j:=i to k do
      begin
        //stringgrid1.Cells[0,2] := trim(XLApp.workbooks[1].sheets[1].cells[3,1]);
        stringgrid1.Cells[0,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,1]);
        stringgrid1.Cells[1,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,2]);
        stringgrid1.Cells[2,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,3]);
        stringgrid1.Cells[3,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,4]);
        stringgrid1.Cells[4,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,5]);
        stringgrid1.Cells[5,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,6]);
        stringgrid1.Cells[6,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,7]);

        stringgrid1.Cells[7,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,8]);
        if stringgrid1.Cells[7,j] = ''  then stringgrid1.Cells[7,j] :='0';
        stringgrid1.Cells[8,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,9]);
        if stringgrid1.Cells[8,j] = ''  then stringgrid1.Cells[8,j] :='0';
        stringgrid1.Cells[9,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,10]);
        if stringgrid1.Cells[9,j] = ''  then stringgrid1.Cells[9,j] :='0';
        stringgrid1.Cells[10,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,11]);
        if stringgrid1.Cells[10,j] = ''  then stringgrid1.Cells[10,j] :='0';
        stringgrid1.Cells[11,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,12]);
        if stringgrid1.Cells[11,j] = ''  then stringgrid1.Cells[11,j] :='0';
        stringgrid1.Cells[12,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,13]);
        if stringgrid1.Cells[12,j] = ''  then stringgrid1.Cells[12,j] :='0';
        stringgrid1.Cells[13,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,14]);
        if stringgrid1.Cells[13,j] = ''  then stringgrid1.Cells[13,j] :='0';
        stringgrid1.Cells[14,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,15]);
        if stringgrid1.Cells[14,j] = ''  then stringgrid1.Cells[14,j] :='0';
        stringgrid1.Cells[15,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,16]);
        if stringgrid1.Cells[15,j] = ''  then stringgrid1.Cells[15,j] :='0';
        stringgrid1.Cells[16,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,17]);
        if stringgrid1.Cells[16,j] = ''  then stringgrid1.Cells[16,j] :='0';
        stringgrid1.Cells[17,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,18]);
        if stringgrid1.Cells[17,j] = ''  then stringgrid1.Cells[17,j] :='0';
        stringgrid1.Cells[18,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,19]);
        if stringgrid1.Cells[18,j] = ''  then stringgrid1.Cells[18,j] :='0';
        stringgrid1.Cells[19,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,20]);
        if stringgrid1.Cells[19,j] = ''  then stringgrid1.Cells[19,j] :='0';
        stringgrid1.Cells[20,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,21]);
        if stringgrid1.Cells[20,j] = ''  then stringgrid1.Cells[20,j] :='0';
        stringgrid1.Cells[21,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,22]);
        if stringgrid1.Cells[21,j] = ''  then stringgrid1.Cells[21,j] :='0';
        stringgrid1.Cells[22,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,23]);
        if stringgrid1.Cells[22,j] = ''  then stringgrid1.Cells[22,j] :='0';
        stringgrid1.Cells[23,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,24]);
        if stringgrid1.Cells[23,j] = ''  then stringgrid1.Cells[23,j] :='0';
        stringgrid1.Cells[24,j] := trim(XLApp.workbooks[1].sheets[1].cells[j+1,25]);
        if stringgrid1.Cells[24,j] = ''  then stringgrid1.Cells[24,j] :='0';
        stringgrid1.Cells[0,j] := inttostr(j-1);
        //stringgrid1.Cells[0,2] :=inttostr(2-1);
        if j  = total+2 then
        begin 
          break;
        end;
      end;
end;

procedure Tfrm_import_sz.BitBtn1Click(Sender: TObject);
var  i: integer;
begin
for i:=2 to stringgrid1.RowCount-1 do
begin
stringgrid1.Rows[i].Clear;
end;
ExcelToDB;
bitbtn2.Enabled := true;
bitbtn3.Enabled := false;
  //打开文件

  //导入STRING
  //导入临时表
  //计算
  //事务
  //插入
  //提交
end;

procedure Tfrm_import_sz.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_import_sz.BitBtn2Click(Sender: TObject);
var i,j,k,l,row : Integer;
    e: Extended;

begin
          BitBtn2.Enabled := False;
          try
             for row:=2 to  stringgrid1.RowCount-1 do
            begin
            if (
               TryStrToFloat(stringgrid1.Cells[7,row],e) and
               TryStrToFloat(stringgrid1.Cells[8,row],e) and
               TryStrToFloat(stringgrid1.Cells[9,row],e) and
               TryStrToFloat(stringgrid1.Cells[10,row],e) and
               TryStrToFloat(stringgrid1.Cells[11,row],e) and
               TryStrToFloat(stringgrid1.Cells[12,row],e) and
               TryStrToFloat(stringgrid1.Cells[13,row],e) and
               TryStrToFloat(stringgrid1.Cells[14,row],e) and
               TryStrToFloat(stringgrid1.Cells[15,row],e) and
               TryStrToFloat(stringgrid1.Cells[16,row],e) and
               TryStrToFloat(stringgrid1.Cells[17,row],e) and
               TryStrToFloat(stringgrid1.Cells[18,row],e) and
               TryStrToFloat(stringgrid1.Cells[19,row],e) and
               TryStrToFloat(stringgrid1.Cells[20,row],e) and
               TryStrToFloat(stringgrid1.Cells[21,row],e) and
               TryStrToFloat(stringgrid1.Cells[22,row],e)
               )
            then
               begin
                stringgrid1.Cells[24,row]:='0';
               end
            else
               begin
                stringgrid1.Cells[23,row]:='存在非数值型数据';
               end;
           end;
   try
     DM.szimportcheck1.ExecSQL;

     for   i :=2 to StringGrid1.RowCount-1 do
     begin
       DM.szimportcheck2.SQL.Clear;
       dm.szimportcheck2.SQL.Text :=' insert into #szimportexcel  select ' ;
       for j:=0 to  6 do
       begin
         DM.szimportcheck2.SQL.Text :=  DM.szimportcheck2.SQL.Text
         + #39+stringgrid1.Cells[j,i]+ #39+',';
       end;
       for j:=7 to  23 do
       begin
         DM.szimportcheck2.SQL.Text :=  DM.szimportcheck2.SQL.Text+stringgrid1.Cells[j,i]+',';
       end;
         DM.szimportcheck2.SQL.Text :=  DM.szimportcheck2.SQL.Text+stringgrid1.Cells[24,i];
       dm.szimportcheck2.ExecSQL;
       Application.ProcessMessages;
     end;
       //ShowMessage('导入成功');
       DM.szimportcheck3.ExecSQL;
       DM.szimportcheck3.Open;
       dm.szimportcheck3.First;
       while not dm.szimportcheck3.Eof do
       begin
        l := dm.szimportcheck3.FieldValues['id']+2;

        if   dm.szimportcheck3.FieldValues['employeeid']<>0 then
        stringgrid1.Cells[23,l] := inttostr(dm.szimportcheck3.FieldValues['employeeid'])
        else     stringgrid1.Cells[23,l] := '身份证号码不匹配';
        dm.szimportcheck3.Next;
       end;

   except
     ShowMessage('出现错误');
   end;
   finally
     BitBtn2.Enabled := true;
     bitbtn3.Enabled := true;
   end;

end;

procedure Tfrm_import_sz.BitBtn3Click(Sender: TObject);
var  i: integer;
      yearmonth_s : string;
begin
  BitBtn3.Enabled := False;
  yearmonth_s :=  Copy(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date),0,7);
if MessageDlg('保存时只针对有效记录，当前保存的生效年月为：[' + yearmonth_s + ']  您确定要保存吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
 begin

  for   i :=2 to StringGrid1.RowCount-1 do
  begin
    if (Length( stringgrid1.Cells[23,i])<7) and (stringgrid1.Cells[23,i]<>'0') then
    begin
          dm.szimportcheck4.SQL.Clear;
    DM.szimportcheck4.SQL.Text :=
    //养老
      ' if exists (select * from employee_insurance  '+
      ' where employeeid='+stringgrid1.Cells[23,i] + ' and insurance_type='+str4140+
      ' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+')'+
  ' begin '+
  ' update employee_insurance '+
  ' set base_money='+stringgrid1.Cells[10,i]+',company_pay='+stringgrid1.Cells[12,i]+',person_pay='+stringgrid1.Cells[11,i]+
  ',total_pay='+stringgrid1.Cells[11,i]+'+'+stringgrid1.Cells[12,i]+
  ',inputdate=getdate(),opration_person='+user_ptr+
  ' from employee_insurance where employeeid='+stringgrid1.Cells[23,i]+' and insurance_type='+str4140+' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+
  ' end   '+
  ' else  '+
  ' begin '+
  ' insert into employee_insurance(code,employeeid,yearmonth,insurance_type,base_money,company_pay,person_pay,total_pay,inputdate,opration_person)'+
  ' select '+QuotedStr (stringgrid1.Cells[1,i])+','+stringgrid1.Cells[23,i]+','+'replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+','+str4140+','+
    stringgrid1.Cells[10,i]+','+stringgrid1.Cells[12,i]+','+stringgrid1.Cells[11,i]+
    ','+stringgrid1.Cells[11,i]+'+'+stringgrid1.Cells[12,i]+',getdate(),'+ user_ptr +
  ' end '+
   //养老
   //医疗
      ' if exists (select * from employee_insurance  '+
      ' where employeeid='+stringgrid1.Cells[23,i] + ' and insurance_type='+str4141+
      ' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+')'+
  ' begin '+
  ' update employee_insurance '+
  ' set base_money='+stringgrid1.Cells[10,i]+',company_pay='+stringgrid1.Cells[15,i]+',person_pay='+stringgrid1.Cells[14,i]+
  ',total_pay='+stringgrid1.Cells[14,i]+'+'+stringgrid1.Cells[15,i]+
  ',inputdate=getdate(),opration_person='+user_ptr+
  ' from employee_insurance where employeeid='+stringgrid1.Cells[23,i]+' and insurance_type='+str4141+' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+
  ' end   '+
  ' else  '+
  ' begin '+
  ' insert into employee_insurance(code,employeeid,yearmonth,insurance_type,base_money,company_pay,person_pay,total_pay,inputdate,opration_person) '+
  ' select '+QuotedStr (stringgrid1.Cells[1,i])+','+stringgrid1.Cells[23,i]+','+'replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+','+str4141+','+
    stringgrid1.Cells[13,i]+','+stringgrid1.Cells[15,i]+','+stringgrid1.Cells[14,i]+
    ','+stringgrid1.Cells[14,i]+'+'+stringgrid1.Cells[15,i]+',getdate(),'+ user_ptr +
  ' end '+
  //医疗
  // 工伤
      ' if exists (select * from employee_insurance  '+
      ' where employeeid='+stringgrid1.Cells[23,i] + ' and insurance_type='+str4142+
      ' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+')'+
  ' begin '+
  ' update employee_insurance '+
  ' set base_money='+stringgrid1.Cells[16,i]+',company_pay='+stringgrid1.Cells[17,i]+',person_pay=0'+
  ',total_pay='+stringgrid1.Cells[17,i]+
  ',inputdate=getdate(),opration_person='+user_ptr+
  ' from employee_insurance where employeeid='+stringgrid1.Cells[23,i]+' and insurance_type='+str4142+' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+
  ' end   '+
  ' else  '+
  ' begin '+
  ' insert into employee_insurance(code,employeeid,yearmonth,insurance_type,base_money,company_pay,person_pay,total_pay,inputdate,opration_person) '+
  ' select '+QuotedStr (stringgrid1.Cells[1,i])+','+stringgrid1.Cells[23,i]+','+'replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+','+str4142+','+
    stringgrid1.Cells[16,i]+','+stringgrid1.Cells[21,i]+',0,'+stringgrid1.Cells[17,i]+',getdate(),'+ user_ptr +
  ' end '+
// 工伤
//失业
 ' if exists (select * from employee_insurance  '+
      ' where employeeid='+stringgrid1.Cells[23,i] + ' and insurance_type='+str4143+
      ' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+')'+
  ' begin '+
  ' update employee_insurance '+
  ' set base_money='+stringgrid1.Cells[18,i]+',company_pay='+stringgrid1.Cells[20,i]+',person_pay='+stringgrid1.Cells[19,i]+
  ',total_pay='+stringgrid1.Cells[19,i]+'+'+stringgrid1.Cells[20,i]+
  ',inputdate=getdate(),opration_person='+user_ptr+
  ' from employee_insurance where employeeid='+stringgrid1.Cells[23,i]+' and insurance_type='+str4143+' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+
  ' end   '+
  ' else  '+
  ' begin '+
  ' insert into employee_insurance(code,employeeid,yearmonth,insurance_type,base_money,company_pay,person_pay,total_pay,inputdate,opration_person) '+
  ' select '+QuotedStr (stringgrid1.Cells[1,i])+','+stringgrid1.Cells[23,i]+','+'replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+','+str4143+','+
    stringgrid1.Cells[18,i]+','+stringgrid1.Cells[20,i]+','+stringgrid1.Cells[19,i]+
    ','+stringgrid1.Cells[19,i]+'+'+stringgrid1.Cells[20,i]+',getdate(),'+ user_ptr +
  ' end '+
//失业
//生育医疗
      ' if exists (select * from employee_insurance  '+
      ' where employeeid='+stringgrid1.Cells[23,i] + ' and insurance_type='+str4144+
      ' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+')'+
  ' begin '+
  ' update employee_insurance '+
  ' set base_money='+stringgrid1.Cells[21,i]+',company_pay='+stringgrid1.Cells[22,i]+',person_pay=0'+
  ',total_pay='+stringgrid1.Cells[22,i]+
  ',inputdate=getdate(),opration_person='+user_ptr+
  ' from employee_insurance where employeeid='+stringgrid1.Cells[23,i]+' and insurance_type='+str4144+' and yearmonth=replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+
  ' end   '+
  ' else  '+
  ' begin '+
  ' insert into employee_insurance(code,employeeid,yearmonth,insurance_type,base_money,company_pay,person_pay,total_pay,inputdate,opration_person) '+
  ' select '+QuotedStr (stringgrid1.Cells[1,i])+','+stringgrid1.Cells[23,i]+','+'replace('+#39+ yearmonth_s +#39 +','+#39+'-'+#39+','+#39+#39+')'+','+str4144+','+
    stringgrid1.Cells[21,i]+','+stringgrid1.Cells[22,i]+',0,'+stringgrid1.Cells[22,i]+',getdate(),'+ user_ptr +
  ' end ';
//生育医疗
    DM.szimportcheck4.ExecSQL;
    stringgrid1.Cells[24,i] := '完成';

     ProgressBar1.Position := round((i*100)/(StringGrid1.RowCount-1));
     Application.ProcessMessages;
    end
    else
    begin
      stringgrid1.Cells[24,i] := '失败';
      Continue;
    end;
  end;

 end;
  BitBtn3.Enabled := True;
  ShowMessage('操作完成');

end;

procedure Tfrm_import_sz.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
    If (Length(StringGrid1.Cells[ACol, ARow]) > 7) and (ACol = 23) and (ARow > 0) then
  Begin
      StringGrid1.Canvas.Brush.Color := clRed;
  End;
  StringGrid1.Canvas.FillRect(Rect);
  StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+2,StringGrid1.Cells[acol,ARow]);
end;

procedure Tfrm_import_sz.BitBtn4Click(Sender: TObject);
begin
  Export_Grid_to_Excel(StringGrid1,'导'+Copy(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date),0,7)+'保险结果')
end;

end.

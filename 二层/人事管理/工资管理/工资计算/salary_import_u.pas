unit salary_import_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Menus, OleServer, Excel2000,
  ComObj,ComCtrls, Provider, jpeg,strUtils,dateutils, DBGridEh,IniFiles,
  DB, ADODB ;

type
  Tfrm_salary_import = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    StringGrid1: TStringGrid;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Label_accountid: TLabel;
    Label_rowcount: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    grid_col_count1 : Integer; // 工号姓名2+字段=模板原列数
    s_yearmonth: string;
    procedure ExcelToDB;
    procedure stringgridToDB;
    procedure DBupdate;
    procedure gridimportrebuild(Accountid: Integer); 
  public
    { Public declarations }
  end;

var
  frm_salary_import: Tfrm_salary_import;

implementation

uses common,main_u, rpt_model_u, damo;

{$R *.dfm}

procedure Tfrm_salary_import.ExcelToDB;
var
  fileName:String;
  iCount,limit,i,k: Integer;
  tmp1 : Single;
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
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;
   k := StringGrid1.ColCount;
  try
       XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=1 to 50000 do
       begin
                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
                 and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin
                    for i:=0 to k-1 do  //从第0列开始,逐列填充
                    begin
                      stringgrid1.Cells[i,iCount+1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,i+1]);  //留表头
                    end;
                    stringgrid1.RowCount := iCount+2;
                    Label_rowcount.Caption :='数据条数:'+inttostr(iCount-1);
                    application.ProcessMessages;
                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end; 
       XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid1.Refresh;
   stringgrid1.FixedRows := 3;
   StringGrid1.ColCount :=grid_col_count1+2;
   StringGrid1.Cells[grid_col_count1,0]:='工号校验';
   StringGrid1.Cells[grid_col_count1+1,0]:='数值校验';
   button2.Enabled := true;
   button3.Enabled := false;
   button4.Enabled := false;
end;

procedure Tfrm_salary_import.stringgridToDB;
var  i,j,k,flag : Integer;
     e: Extended;
     sql_string1: string;
     sql_string2: string;
     sql_string3: string;
     sql_string: string;
begin
     sql_string1:= ' if exists (select * from tempdb..sysobjects where name like '+
      QuotedStr('#employeesalary%')+' ) '
      +' drop table #employeesalary  '
      +' create table  #employeesalary(employeecode nvarchar(20),chinesename nvarchar(20),';
     sql_string2:='employeeidcheck int,resultcheck int,id int)';
     sql_string3:='';
     for  i:=2 to grid_col_count1-1 do
     begin
     sql_string3 := sql_string3+trim(stringgrid1.Cells[i,1])+' float, '
     end;
     sql_string := sql_string1+ sql_string3 + sql_string2;
     //ShowMessage(sql_string);
     dm.ADOTMP.SQL.Clear;
     DM.ADOTMP.SQL.Text := sql_string;
     try
      DM.ADOTMP.ExecSQL;
     except
      ShowMessage('创建临时表失败,检查失败');
      Exit;
     end;
       sql_string1:='insert into #employeesalary(employeecode,chinesename,';
       sql_string2:='employeeidcheck,resultcheck,id)';
       sql_string3:='';
       for  i:=2 to grid_col_count1-1 do //第3列至于模板原列数
       begin
       sql_string3 := sql_string3+trim(stringgrid1.Cells[i,1])+', '
       end;
       sql_string:=sql_string1+ sql_string3 + sql_string2;

       for k:=3 to StringGrid1.RowCount-1 do // 行数减3
       begin
         DM.ADOTMP.SQL.Clear;
         sql_string3:='';
         for i:=2 to StringGrid1.ColCount-3 do   //列数从第3列开始到倒数第3列
         begin
            sql_string3:=sql_string3+','+trim(stringgrid1.Cells[i,k])
         end;
         dm.ADOTMP.SQL.Text := sql_string+#13
         +' Select '+ QuotedStr(trim(stringgrid1.Cells[0,k]))+','
         +QuotedStr(trim(stringgrid1.Cells[1,k]))+sql_string3+',0,0,'+inttostr(k);
         try
            flag :=0 ;
            for i:=2 to StringGrid1.ColCount-3 do //试导入临时表之前,先系统自身判断能否转为FLOAT型
            begin
              if TryStrToFloat(stringgrid1.Cells[i,k],e)
              then flag := flag +0 else flag := flag+1;
            end;
            if flag>0 then   StringGrid1.Cells[grid_col_count1+1,k]:='X'
            else   dm.ADOTMP.ExecSQL;
         except
           StringGrid1.Cells[grid_col_count1+1,k]:='X';//数值错误
           Continue;
         end;

       end;
     dm.ADOTMP.SQL.Clear;
     DM.ADOTMP.SQL.Text:=' update #employeesalary '+
      ' set employeeidcheck=b.rkey  '+
      ' from #employeesalary a join  '+
      ' (select rkey,employeecode from employeemsg  ) b '+
      ' on a.employeecode=b.employeecode';
     try
       dm.ADOTMP.ExecSQL;
     except
       ShowMessage('工号校验步骤1失败');
     end;
      dm.ADOTMP.SQL.Clear;
      DM.ADOTMP.SQL.Text:='select employeeidcheck,id from #employeesalary  ';//   where employeeidcheck=0
     try
      DM.ADOTMP.Open;
      while not DM.ADOTMP.Eof do
      begin
        i := DM.ADOTMP.FieldValues['id'];
        stringgrid1.Cells[grid_col_count1,i] := inttostr(DM.ADOTMP.FieldValues['employeeidcheck']);
        DM.ADOTMP.Next;
      end;
      DM.ADOTMP.Close;
     except
       ShowMessage('工号校验步骤2失败');
     end;
     dm.ADOTMP.SQL.Clear;
      DM.ADOTMP.SQL.Text:='select id from #employeesalary where employeeidcheck=0';//
     try
      DM.ADOTMP.Open;
      while not DM.ADOTMP.Eof do
      begin
        i := DM.ADOTMP.FieldValues['id'];
        stringgrid1.Cells[grid_col_count1,i] :='X';
        stringgrid1.Cells[grid_col_count1+1,i] :='X';
        DM.ADOTMP.Next;
      end;
      DM.ADOTMP.Close;
     except
       ShowMessage('工号校验步骤3失败');
     end;
     dm.ADOTMP.SQL.Clear;
     DM.ADOTMP.SQL.Text:='drop table  #employeesalary  ';
     dm.ADOTMP.ExecSQL;
     dm.ADOTMP.SQL.Clear;
     //想排序
     StringGrid1.Refresh;
     ShowMessage('检查完毕');
     button3.Enabled := true;
     button4.Enabled := true;
end;
procedure Tfrm_salary_import.DBupdate;
var i,j,k :Integer;
    sqlstring1,sqlstring2,sqlstring3,sqlstring : string;
begin
  for i:=3 to StringGrid1.RowCount-1 do
  begin
    if stringgrid1.Cells[grid_col_count1+1,i] = 'X' then
    begin
      Continue;
    end
    else
    begin
      sqlstring2 :='';
      if checkbox1.Checked = false then
          sqlstring1 := 'update employeesalary set '
      else
         sqlstring1 := 'update employeesalary set can_change_flag=1,';
         //变动值是否锁定
      if  checkbox2.Checked = false then
        sqlstring3 := ' from employeesalary where employeeid='+
        stringgrid1.Cells[grid_col_count1,i]+
        ' and yearmonth='+QuotedStr(s_yearmonth)
      else
         sqlstring3 := ' from employeesalary where employeeid='+
        stringgrid1.Cells[grid_col_count1,i]+
        ' and yearmonth='+QuotedStr(s_yearmonth)+
        ' and accountid='+label_accountid.Caption;
        //帐套是否要匹配
       for j:=2 to grid_col_count1-1 do
       begin
          if sqlstring2<>'' then
          sqlstring2 := sqlstring2+','+trim(stringgrid1.Cells[j,1])+'='+
          Trim(stringgrid1.Cells[j,i])
          else
           sqlstring2 :=trim(stringgrid1.Cells[j,1])+'='+
          Trim(stringgrid1.Cells[j,i]);
       end;
       sqlstring := sqlstring1+sqlstring2+sqlstring3;
       try
         DM.ADOTMP.SQL.Clear;
         DM.ADOTMP.SQL.Text:= sqlstring;
         DM.ADOTMP.ExecSQL;
         StringGrid1.Cells[grid_col_count1+1,i]:= '√ ';//该行导入成功作标记
         DM.ADOTMP.SQL.Clear;
       except
         StringGrid1.Cells[grid_col_count1+1,i]:= 'X';//该行导入失败作标记
         Continue;
       end;
    end;
  end;
  ShowMessage('导入完毕');
end;
procedure Tfrm_salary_import.Button6Click(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_salary_import.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Self.Free;
end;

procedure Tfrm_salary_import.gridimportrebuild(Accountid: Integer);
var
    i,j: integer;
    q_str,ss: string;
    radioX: TRadioGroup;
begin
     radioX := TRadioGroup.Create(application);
     StringGrid1.ColCount := 1;
     StringGrid1.RowCount := 3;
     if Accountid = frm_rpt_model.RadioGroup4.Tag then
     radiox := frm_rpt_model.RadioGroup4;
     if Accountid = frm_rpt_model.RadioGroup5.Tag then
     radiox := frm_rpt_model.RadioGroup5;
     if Accountid = frm_rpt_model.RadioGroup6.Tag then
     radiox := frm_rpt_model.RadioGroup6;
     //ShowMessage(ss);
     if radiox.ItemIndex >0 then
     begin
       ss := radiox.Items.Strings[radiox.ItemIndex];
       Label1.Caption := ss+'    工资月份:    '+s_yearmonth;
       Label_accountid.Caption := inttostr(radiox.ItemIndex);
       dm.ADOTMP.SQL.Clear;
       dm.ADOTMP.SQL.Text := ' select datafield_name,datafield_F from employeesalary_rpt_model '+
                      ' where model_name ='+quotedstr(ss)+' order by f_index' ;
          dm.ADOTMP.Open;
          if dm.ADOTMP.RecordCount>0 then
          begin
            grid_col_count1 := dm.ADOTMP.RecordCount+2;
            StringGrid1.ColCount := dm.ADOTMP.RecordCount+2;
             stringgrid1.Cells[0,0]:='工号';
             StringGrid1.Cells[0,1]:='employeecode';
             stringgrid1.Cells[1,0]:='姓名';
             StringGrid1.Cells[1,1]:='chinesename';
            for i:= 0 to DM.ADOTMP.RecordCount-1 do
              begin
              stringgrid1.Cells[i+2,0]:= dm.ADOTMP.FieldByName('datafield_name').asString;
              stringgrid1.Cells[i+2,1]:= dm.ADOTMP.FieldByName('datafield_F').asString;
              DM.adotmp.Next;
              end;
          end;
          dm.ADOTMP.Close;
     end;
     button2.Enabled := false;
     button3.Enabled := false;
     button4.Enabled := false;
end;

procedure Tfrm_salary_import.FormCreate(Sender: TObject);
var i: integer;
begin
grid_col_count1:=0;
s_yearmonth := frm_main.ComboBox2.Text ;
i:=integer(frm_main.ComboBox1.Items.Objects[frm_main.ComboBox1.ItemIndex]);
gridimportrebuild(i);
end;

procedure Tfrm_salary_import.Button1Click(Sender: TObject);
begin
button5.Enabled := false;
if label1.Caption=''   then
    begin
        showmessage('请选择导入模板');
        exit;
    end;
ExcelToDB;
end;

procedure Tfrm_salary_import.Button2Click(Sender: TObject);
begin
  button2.Enabled := false;
  button1.Enabled := false;
  stringgridToDB;
  button2.Enabled := true;
  button1.Enabled := true;

end;


procedure Tfrm_salary_import.Button3Click(Sender: TObject);
begin
  if stringgrid1.RowCount<4   then
  begin
    showmessage('无加载数据');
    exit;
  end;
  if Messagedlg('你确定在月份 '+s_yearmonth+'，工资中导入数据吗?',mtWarning,[mbYES,mbNO],0)=6 then
  begin
    button3.Enabled := false;
    button4.Enabled := false;
    DBupdate;
    button3.Enabled := true;
    button4.Enabled := true;
  end;
end;

procedure Tfrm_salary_import.Button4Click(Sender: TObject);
begin
  button4.Enabled := false;
Export_Grid_to_Excel(stringgrid1,'导入结果') ;
  button4.Enabled := true;
end;

procedure Tfrm_salary_import.Button5Click(Sender: TObject);
begin
if label1.Caption=''   then
    begin
        showmessage('请选择导入模板');
        exit;
    end; 
end;

end.

unit frm_salarydb_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,StrUtils, StdCtrls, ExtCtrls; 
type
  Tfrm_salarydb = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    program_rkey : integer;
  public
    procedure buildgrid(Accountid: Integer);
    procedure griddisplayrebuild(Accountid: Integer);
  end;

var
  frm_salarydb: Tfrm_salarydb;

implementation

uses damo,common,rpt_model_u;

{$R *.dfm}

procedure Tfrm_salarydb.FormCreate(Sender: TObject);
var i:integer;
begin
dm.ADOTMP.SQL.Text := 'select count(name) as tcount  from syscolumns    '+
 ' where id=(select id from sysobjects where xtype='+#39+'u'+#39+
  ' and name='+#39+'DesignSalaryItem'+#39+')';
dm.ADOTMP.open;
StringGrid1.ColCount := dm.ADOTMP.fieldbyname('tcount').Value+1;
dm.ADOTMP.Close;
//
dm.ADOTMP.SQL.Text := 'select * from salaryaccount ';
dm.ADOTMP.Open;
if  not dm.ADOTMP.IsEmpty then
begin
  dm.ADOTMP.First;
  i := dm.ADOTMP.FieldByName('rkey').Value;
  buildgrid(i);
end;
  dm.ADOTMP.Close;
  dm.ADOTMP.SQL.Text:='select rkey from data0419 where programe='+quotedstr('employeesalary.exe');
  dm.ADOTMP.Open;
  program_rkey :=dm.ADOTMP.fieldbyname('rkey').Value;
  dm.ADOTMP.Close;
end;

procedure Tfrm_salarydb.buildgrid(Accountid: Integer);
var i,k: integer;
    q_str: string;
begin
  k := stringgrid1.ColCount-1;
  dm.ADOTMP.SQL.Text := ' select  *,len(itemname)*8 as colwidth '+
    ' from dbo.DesignSalaryItem where accountid='+inttostr(Accountid)+
    ' order by itemindex';
  dm.ADOTMP.Open;
  StringGrid1.RowCount := dm.ADOTMP.RecordCount;
  stringgrid1.ColWidths[0]:=25;
  stringgrid1.ColWidths[1]:=100;
  stringgrid1.ColWidths[2]:=25;
  stringgrid1.ColWidths[3]:=25;
  stringgrid1.ColWidths[4]:=250;
  stringgrid1.ColWidths[5]:=300;
  stringgrid1.ColWidths[6]:=25;
  stringgrid1.ColWidths[7]:=25;
  stringgrid1.ColWidths[8]:=25;
  stringgrid1.ColWidths[9]:=25;
  stringgrid1.ColWidths[k]:=500;
  for i := 0 to stringgrid1.RowCount-1 do
  if not dm.ADOTMP.IsEmpty then
    begin
      begin
        StringGrid1.Cells[0,i] := dm.ADOTMP.FieldByName('rkey').asString; //rkey
        StringGrid1.Cells[1,i] := dm.ADOTMP.FieldByName('itemname').asString;//项目名称
        StringGrid1.Cells[2,i] := dm.ADOTMP.FieldByName('datafield').asString;//项目字段
        StringGrid1.Cells[3,i] := dm.ADOTMP.FieldByName('datasourcetype').asString;//0值1.公式 2固定
        StringGrid1.Cells[4,i] := dm.ADOTMP.FieldByName('expression1').asString;//
        StringGrid1.Cells[5,i] := dm.ADOTMP.FieldByName('expression2').asString;//
        StringGrid1.Cells[6,i] := dm.ADOTMP.FieldByName('isdisplay').asString;// 是否显示
        StringGrid1.Cells[7,i] := dm.ADOTMP.FieldByName('tag').asString;//层
        StringGrid1.Cells[8,i] := dm.ADOTMP.FieldByName('itemindex').asString;//
        StringGrid1.Cells[9,i] := dm.ADOTMP.FieldByName('colwidth').asString;//列宽
        dm.ADOTMP.Next;
      end;
    end;
  dm.ADOTMP.Close;
  griddisplayrebuild(Accountid);
  if dm.Q_salary.Active = true then  dm.Q_salary.Close;
      q_str := '';
  for i := 0 to stringgrid1.RowCount-1 do
    begin
      q_str := q_str+','+StringGrid1.Cells[2,i]+' as ['+StringGrid1.Cells[1,i]+']';
    end;
     dm.Q_salary.SQL.Text :='select departmentname as 部门,e.item as 职务,'+   //12
      ' current_employeecode as 工号,'+        //3
      ' chinesename as 姓名 ,current_ondutytime as 入职日期,'+  //45
      ' current_outdutytime as 离职日期'+q_str+      // 6
      ' ,a.rkey as SID,g.item as 岗位,d.item as 类型,'+  //-8
      ' bankaccount  as 银行帐号, idcard  as 身份证号码,' + //-6-7
      ' f.item as 离职类型,can_change_flag as 变值锁定,'+ //-4-5
      ' ischecked as 审核,has_payed as 已结算 from employeesalary a '+  //-1-2-3
      ' join employeemsg b on a.employeeid=b.rkey '+
      ' left join datadepartment c on a.current_departmentid=c.rkey '+
      ' left join datadetail d on b.rank=d.rkey '+
      ' left join datadetail e on a.current_position=e.rkey '+
      ' left join datadetail f on a.leave_type=f.rkey '+
      ' left join datadetail g on a.current_station=g.rkey '+
      ' where a.accountid='+inttostr(Accountid)+
      ' and a.current_departmentid in '+
      '(select departmentid from hr_permission where operator_ptr='+rkey73+
      ' and program_ptr='+inttostr(program_rkey)+')';
    for i := 0 to stringgrid1.RowCount-1 do
      begin
        if stringgrid1.Cells[3,i] ='0' then
        begin
          StringGrid1.Cells[k,i] := ''; //
        end;
        if stringgrid1.Cells[3,i]= '1' then
        begin
          if   AnsiContainsText(stringgrid1.Cells[5,i], 'exec') then     //存储过程
            begin
              StringGrid1.Cells[k,i]:= StringGrid1.Cells[5,i];
              stringgrid1.Cells[7,i]:='0';
            end;
          if  not AnsiContainsText(stringgrid1.Cells[5,i], 'exec') then    //公式
            begin
              StringGrid1.Cells[k,i]:='update employeesalary'+
                ' set '+StringGrid1.Cells[2,i]+'= '+StringGrid1.Cells[5,i]+
                ' from employeesalary where accountid=  '+inttostr(Accountid)+
                ' and yearmonth=(select top 1 checkyearmonth from salarycheck where actived=1 )'+
                ' and [ischecked]=0  '+
                ' and has_payed=0 '+
                ' and current_departmentid in '+
                ' (select departmentid from hr_permission where operator_ptr='+rkey73+
                ' and program_ptr='+inttostr(program_rkey)+')';
            end;
        end;
          if stringgrid1.Cells[3,i]= '2' then               //底薪固定值
            begin
              StringGrid1.Cells[k,i]:='update employeesalary'+
                ' set '+StringGrid1.Cells[2,i]+'= b.'+StringGrid1.Cells[2,i]+
                ' from employeesalary a join V_employeebasicsalary b  '+
                ' on a.employeeid=b.employeeid  and a.yearmonth=b.yearmonth'+
                ' where a.accountid= '+inttostr(Accountid)+
                ' and a.has_payed=0 '+
                ' and can_change_flag=0 '+//锁定的不再更新底薪
                ' and a.yearmonth=(select top 1 checkyearmonth from salarycheck where actived=1 )'+
                ' and b.yearmonth=(select top 1 checkyearmonth from salarycheck where actived=1 )'+
                ' and a.current_departmentid in '+
                ' (select departmentid from hr_permission where operator_ptr='+rkey73+
                ' and program_ptr='+inttostr(program_rkey)+')';
                {' + and [ischecked]=0  '}
            end;
      end;
  end;
procedure Tfrm_salarydb.griddisplayrebuild(Accountid: Integer);
var
    i,j: integer;
    q_str,ss: string;
    radioX: TRadioGroup;
begin
     radioX := TRadioGroup.Create(application);

     if Accountid = frm_rpt_model.RadioGroup1.Tag then
     radiox := frm_rpt_model.RadioGroup1;
     if Accountid = frm_rpt_model.RadioGroup2.Tag then
     radiox := frm_rpt_model.RadioGroup2;
     if Accountid = frm_rpt_model.RadioGroup3.Tag then
     radiox := frm_rpt_model.RadioGroup3;

     if radiox.ItemIndex >0 then
     begin
       ss := radiox.Items.Strings[radiox.ItemIndex];
       for i:=0 to stringgrid1.RowCount-1 do
        begin
          dm.ADOTMP.SQL.Clear;
          dm.ADOTMP.SQL.Text := ' select datafield_name from employeesalary_rpt_model '+
                      ' where model_name ='+quotedstr(ss)+
                      ' and datafield_F='+quotedstr(stringgrid1.Cells[2,i]);
          dm.ADOTMP.Open;
          if dm.ADOTMP.RecordCount>0 then
            stringgrid1.Cells[6,i]:='1' else   stringgrid1.Cells[6,i]:='0';
          dm.ADOTMP.Close;
        end;
     end;

end;

end.

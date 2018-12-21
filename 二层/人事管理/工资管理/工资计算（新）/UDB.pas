unit UDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls,StrUtils;

type
  TFrmDB = class(TForm)
    Panel1: TPanel;
    sg1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }



  public
    { Public declarations }
  
     procedure griddisplayrebuild(Accountid: Integer);
     procedure BuildGrid(Accountid: Integer);
  end;

var
  FrmDB: TFrmDB;

implementation
            uses udm,umain,common, Umodel;
{$R *.dfm}

procedure TFrmDB.FormCreate(Sender: TObject);
var i:integer;
ssql:string;
begin
 try
 
 ssql := 'select count(name) as tcount  from syscolumns   '+
 ' where id=(select id from sysobjects where xtype=''u'' '+
  ' and name=''DesignSalaryItem'')';

  dm.openqry(dm.qry_temp,ssql);

  sg1.ColCount := dm.qry_temp.fieldbyname('tcount').Value+1;

 ssql := 'select * from salaryaccount ';
  dm.openqry(dm.qry_temp,ssql);

  if  not dm.qry_temp.IsEmpty then
  begin
    dm.qry_temp.First;
    i := dm.qry_temp.FieldByName('rkey').Value;
    buildgrid(i);
  end;

 ssql:='select rkey from data0419 where programe='+quotedstr('employeesalary.exe');
   dm.openqry(dm.qry_temp,ssql);
  dm.program_rkey :=dm.qry_temp.fieldbyname('rkey').Value;

  
 except on e:exception do
 begin
 ShowMessage('错误：'+e.Message);
 exit;
 end;

  end;

end;

 procedure TFrmDB.BuildGrid(Accountid: Integer);
 var i,k: integer;
    q_str,ssql: string;
begin
  try
  k := sg1.ColCount-1;
  ssql := ' select  *,len(itemname)*8 as colwidth '+
    ' from dbo.DesignSalaryItem where accountid='+inttostr(Accountid)+
    ' order by itemindex';
  dm.openqry(dm.qry_temp,ssql);

  sg1.RowCount := dm.qry_temp.RecordCount;
  sg1.ColWidths[0]:=25;
  sg1.ColWidths[1]:=100;
  sg1.ColWidths[2]:=25;
  sg1.ColWidths[3]:=25;
  sg1.ColWidths[4]:=250;
  sg1.ColWidths[5]:=300;
  sg1.ColWidths[6]:=25;
  sg1.ColWidths[7]:=25;
  sg1.ColWidths[8]:=25;
  sg1.ColWidths[9]:=25;
  sg1.ColWidths[k]:=3500;

  for i := 0 to sg1.RowCount-1 do
  if not dm.qry_temp.IsEmpty then
    begin
      begin
        sg1.Cells[0,i] := dm.qry_temp.FieldByName('rkey').asString; //rkey
        sg1.Cells[1,i] := dm.qry_temp.FieldByName('itemname').asString;//项目名称
        sg1.Cells[2,i] := dm.qry_temp.FieldByName('datafield').asString;//项目字段
        sg1.Cells[3,i] := dm.qry_temp.FieldByName('datasourcetype').asString;//0值1.公式 2固定
        sg1.Cells[4,i] := dm.qry_temp.FieldByName('expression1').asString;//
        sg1.Cells[5,i] := dm.qry_temp.FieldByName('expression2').asString;//
        sg1.Cells[6,i] := dm.qry_temp.FieldByName('isdisplay').asString;// 是否显示
        sg1.Cells[7,i] := dm.qry_temp.FieldByName('tag').asString;//层
        sg1.Cells[8,i] := dm.qry_temp.FieldByName('itemindex').asString;//
        sg1.Cells[9,i] := dm.qry_temp.FieldByName('colwidth').asString;//列宽
        dm.qry_temp.Next;
      end;
    end;
  dm.qry_temp.Close;
  griddisplayrebuild(Accountid);
  if dm.qry_main.Active = true then  dm.qry_main.Close;
      q_str := '';
  for i := 0 to sg1.RowCount-1 do
    begin
      q_str := q_str+','+sg1.Cells[2,i]+' as ['+sg1.Cells[1,i]+']';
    end;
     dm.qry_main.SQL.Text :='select departmentname as 部门,e.item as 职务,'+   //12
      ' current_employeecode as 工号,'+        //3
      ' chinesename as 姓名 ,current_ondutytime as 入职日期,'+  //45
      ' current_outdutytime as 离职日期'+q_str+      // 6
      ' ,a.rkey as SID,g.item as 岗位,d.item as 类型,'+  //-8
      ' bankaccount  as 银行帐号, idcard  as 身份证号码,' + //-6-7
      ' f.item as 离职类型,can_change_flag as 变值锁定,'+ //-4-5
      ' ischecked as 审核,has_payed as 已结算  '+
      ' from employeesalary a '+  //-1-2-3
      ' join employeemsg b on a.employeeid=b.rkey '+
      ' left join datadepartment c on a.current_departmentid=c.rkey '+
      ' left join datadetail d on b.rank=d.rkey '+
      ' left join datadetail e on a.current_position=e.rkey '+
      ' left join datadetail f on a.leave_type=f.rkey '+
      ' left join datadetail g on a.current_station=g.rkey '+
      ' where a.accountid='+inttostr(Accountid)+
      ' and 1=1 '  ;
      //a.current_departmentid in '+
      //'(select departmentid from hr_permission where operator_ptr='+rkey73+
      //' and program_ptr='+inttostr(dm.program_rkey)+')';
     // ' and a.yearmonth=(select top 1 checkyearmonth from salarycheck where actived=1 ) ';
   //  ShowMessage(dm.qry_main.SQL.Text);    //0801
    for i := 0 to sg1.RowCount-1 do
      begin

        if sg1.Cells[3,i] ='0' then     // 数值
        begin
          sg1.Cells[k,i] := ''; //
        end;

        if sg1.Cells[3,i]= '1' then     //公式
        begin
          if   AnsiContainsText(sg1.Cells[5,i], 'exec') then     //存储过程
            begin
              sg1.Cells[k,i]:= sg1.Cells[5,i];
              sg1.Cells[7,i]:='0';
            end;
          if  not AnsiContainsText(sg1.Cells[5,i], 'exec') then    //公式
            begin
              ssql:='update employeesalary'+
                ' set '+sg1.Cells[2,i]+'= '+sg1.Cells[5,i]+
                ' from employeesalary  inner join employeemsg  on employeesalary.employeeid=employeemsg.rkey '+
                '  where accountid=  '+inttostr(Accountid)+
                ' and yearmonth=(select top 1 checkyearmonth from salarycheck where actived=1) '+          //(select top 1 checkyearmonth from salarycheck where actived=1)
                ' and [ischecked]=0  '+
                ' and has_payed=0 '+
                ' and current_departmentid in '+
                ' (select departmentid from hr_permission where operator_ptr='+rkey73+
                ' and program_ptr='+inttostr(dm.program_rkey)+')';
                
              sg1.Cells[k,i]:=ssql;
              //ShowMessage(ssql);
            end;
        end;
          if sg1.Cells[3,i]= '2' then               //底薪固定值
            begin
              sg1.Cells[k,i]:='update employeesalary'+
                ' set '+sg1.Cells[2,i]+'= b.'+sg1.Cells[2,i]+
                ' from employeesalary a join V_employeebasicsalary b  '+
                ' on a.employeeid=b.employeeid  and a.yearmonth=b.yearmonth'+
                ' where a.accountid= '+inttostr(Accountid)+
                ' and a.has_payed=0 '+
                ' and can_change_flag=0 '+//锁定的不再更新底薪
                ' and a.yearmonth=(select top 1 checkyearmonth from salarycheck where actived=1) '+
               ' and b.yearmonth=(select top 1 checkyearmonth from salarycheck where actived=1)  '+
                ' and a.current_departmentid in '+
                ' (select departmentid from hr_permission where operator_ptr='+rkey73+
                ' and program_ptr='+inttostr(dm.program_rkey)+')';
                {' + and [ischecked]=0  '}
            end;
      end;

  except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;

 end;



procedure Tfrmdb.griddisplayrebuild(Accountid: Integer);
var
   i, j: integer;
    ss,ssql: string;
    radioX: TRadioGroup;
begin
     radioX := TRadioGroup.Create(application);

     if Accountid = frmModel.rg_DayShow.Tag then
     radiox := frmModel.rg_DayShow;
     if Accountid = frmModel.rg_show5.Tag then
     radiox := frmModel.rg_show5;
     if Accountid = frmModel.rg_show6.Tag then
     radiox := frmModel.rg_show6;
     if Accountid = frmModel.rg5s.Tag then
     radiox := frmModel.rg5s;



     if radiox.ItemIndex >0 then
     begin
       ss := radiox.Items.Strings[radiox.ItemIndex];
       for i:=0 to sg1.RowCount-1 do
        begin
         ssql := ' select datafield_name from employeesalary_rpt_model '+
                      ' where model_name ='+quotedstr(ss)+
                      ' and datafield_F='+quotedstr(sg1.Cells[2,i]);
          dm.openqry(dm.qry_temp,ssql);

          if dm.qry_temp.RecordCount>0 then
            sg1.Cells[6,i]:='1'
          else
          sg1.Cells[6,i]:='0';
          dm.qry_temp.Close;
        end;
     end;

end;


end.

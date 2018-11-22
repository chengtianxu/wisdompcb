unit frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons,Menus, DB,ADODB,common;

type
  Tfrm_main = class(TForm)
    pgc1: TPageControl;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Grd1: TDBGridEh;
    btn1: TBitBtn;
    pnl4: TPanel;
    pnl5: TPanel;
    grd2: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    rg1: TRadioGroup;
    pnl6: TPanel;
    btn2: TBitBtn;
    btn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure rg1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure grd2TitleClick(Column: TColumnEh);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    PreColumn2: TColumnEh;
    field_name2:string;
    sSql :string;
    FsCheck,FsSearch:string;
    location_empid : Integer;
    paixu1,paixu2:string;
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo,frm_edit_u;

{$R *.dfm}

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOConnection1) then
  begin
   common.ShowMsg('程序启动失败,请联系系统管理员',1);
   application.Terminate;
  end;
  self.Caption :=Application.Title;
                                   
  { user_ptr:='3'; //人员ID
   vprev:='4';    //权限
   rkey73:='1';   //
// dm.ADOConnection1.Open;
//  }
   DateSeparator := '-';
   ShortDateFormat := 'yyyy-mm-dd';
  damo.people_right:=strtoint(vprev);//权限
  damo.op_people:=strtoint(user_ptr);//当前操作员
  dm.qry1.ExecSQL;
  dm.qry1.Open;
  location_empid := dm.qry1rkey.Value;
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Label1.Caption := Grd1.Columns[0].Title.Caption;
  Grd1.Columns[0].Title.Color := clred ;
  field_name2 := Grd2.Columns[0].FieldName;
  PreColumn2 := Grd2.Columns[0];
  Label2.Caption := Grd2.Columns[0].Title.Caption;
  Grd2.Columns[0].Title.Color := clred ;
  paixu1 :='';
  paixu2 :='';

end;

procedure Tfrm_main.btn1Click(Sender: TObject);
begin
  dm.qry1.Close;
  dm.qry1.ExecSQL;
  dm.qry1.Open;
    //ShowMessage(paixu1);
  if paixu1 <> '' then dm.qry1.Sort := paixu1;
   // ShowMessage(dm.qry1.Sort);
  dm.qry1.Locate('rkey',location_empid,[]);
  //Locate('Company;Contact;Phone', VarArrayOf(['Sight Diver', 'P', '408-431-1000']), [loPartialKey]);
end;

procedure Tfrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry1.Sort:=Column.FieldName+' DESC';
  end;
  //DM.qry1AfterScroll(DM.qry1);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    //Edit1Change(Edit1);
  end else
    edit1.SetFocus;
  //ShowMessage(dm.qry1.Sort);

end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure Tfrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.qry1month_left.Value <0 then
     Grd1.Canvas.Font.Color := clred
  else
     if (dm.qry1month_left.Value >0) and (dm.qry1month_left.Value <3) then
     Grd1.Canvas.Font.Color := clfuchsia ; //clTeal //cllime

  {else if dm.qry1month_left.Value > 3 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO70status.Value = 3 then
     Grd1.Canvas.Font.Color := clGreen
  else if dm.ADO70status.Value = 4 then
     Grd1.Canvas.Font.Color := clOlive;  }
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_main.rg1Click(Sender: TObject);
begin
 case rg1.ItemIndex of
 0: Grd1.DataSource.DataSet.Filter:='';
 1: Grd1.DataSource.DataSet.Filter:=' month_left >3 ';
 2: Grd1.DataSource.DataSet.Filter:='  month_left > 1 and month_left<=3 ';
 3: Grd1.DataSource.DataSet.Filter:='  month_left  <0 ';
 end;
end;

procedure Tfrm_main.btn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_main.btn3Click(Sender: TObject);
var date_string : string;
begin
  date_string := DateToStr(now);
  Export_dbGridEH_to_Excel(Grd1,(Trim(pgc1.Pages[0].Caption)+date_string));
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin

    if ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
       paixu2 := DM.qry2.Sort;
       paixu1 := DM.qry1.Sort;
      if  (Tmenuitem(Sender).Tag in [1])
      then
        begin
          try
              Form_edit := TForm_edit.Create(nil);
              Form_edit.Tag := 0 ;//新增
              Form_edit.Lab_departmentname.Caption := dm.qry1departmentname.Value;
              Form_edit.Lab_employeecode.Caption := DM.qry1employeecode.Value;
              Form_edit.Lab_zhiwu.Caption := dm.qry1position_item.Value;
              Form_edit.Lab_chinesename.Caption := dm.qry1chinesename.Value;
              Form_edit.Lab_begindate.Caption := DateTimeToStr(DM.qry1begindate.Value);
              form_edit.lab_circle.Caption := IntToStr(dm.qry1circle.Value);
              Form_edit.lab_emp_id.Caption := IntToStr(dm.qry1rkey.Value);
              Form_edit.lab_departmentid.Caption := IntToStr(dm.qry1departmentid.Value);
              Form_edit.lab_zhiwuid.Caption := IntToStr(DM.qry1position.Value);
              location_empid :=  dm.qry1rkey.Value;
              Form_edit.Caption := '新增延期备注';
               if Form_edit.ShowModal=mrok then
               begin
                //ShowMessage('您点了保存');
                //quotedstr
                dm.ADOTEMP.SQL.Text := ' insert into employee_station_turn_remark '+
                  ' (employeeid,departmentid,Positionid,startdate,oper_0005,operate_date,'+
                  ' extra_month,extra_remark) '+
                  ' select '+Form_edit.lab_emp_id.Caption+','+
                  Form_edit.lab_departmentid.Caption+','+
                  Form_edit.lab_zhiwuid.Caption+','+
                  quotedstr(Form_edit.Lab_begindate.Caption)+','+
                  user_ptr+',getdate(),'+form_edit.Edit1.Text+','+
                  quotedstr(Form_edit.mmo1.Text )+
                  ' where not exists '+
                  ' (select * from employee_station_turn_remark where employeeid='
                   +Form_edit.lab_emp_id.Caption+' and '+
                  ' departmentid='+Form_edit.lab_departmentid.Caption+
                  ' and Positionid='+Form_edit.lab_zhiwuid.Caption+' and startdate='+
                   quotedstr(Form_edit.Lab_begindate.Caption)+')';
                try
                  //ShowMessage(dm.ADOTEMP.SQL.Text);
                  //
                  dm.ADOTEMP.ExecSQL;
                  ShowMessage('添加完成');
                except
                  ShowMessage('添加失败');
                end;
                 btn1.Click;  
               end;
             finally
               Form_edit.Free;
             end;

      end;
       if  (Tmenuitem(Sender).Tag in [2])
            then
              begin
                try
                    Form_edit := TForm_edit.Create(nil);
                    Form_edit.Tag := 1 ;//编辑
                    if pgc1.ActivePageIndex = 0 then
                    begin
                    //ShowMessage(IntToStr(DM.qry1rkey.Value));
                    Form_edit.Lab_departmentname.Caption := dm.qry1departmentname.Value;
                    Form_edit.Lab_employeecode.Caption := DM.qry1employeecode.Value;
                    Form_edit.Lab_zhiwu.Caption := dm.qry1position_item.Value;
                    Form_edit.Lab_chinesename.Caption := dm.qry1chinesename.Value;
                    Form_edit.Lab_begindate.Caption := DateTimeToStr(DM.qry1begindate.Value);
                    form_edit.lab_circle.Caption := IntToStr(dm.qry1circle.Value);
                    Form_edit.lab_emp_id.Caption := IntToStr(dm.qry1rkey.Value);
                    Form_edit.lab_departmentid.Caption := IntToStr(dm.qry1departmentid.Value);
                    Form_edit.lab_zhiwuid.Caption := IntToStr(DM.qry1position.Value);
                    location_empid :=  dm.qry1rkey.Value;
                    Form_edit.Edit1.Text := IntToStr(DM.qry1extra_month.Value);
                    Form_edit.mmo1.Text := DM.qry1extra_remark.Value;
                    end;
                     if pgc1.ActivePageIndex = 1 then
                    begin
                    //ShowMessage(IntToStr(DM.qry1rkey.Value));
                    Form_edit.Lab_departmentname.Caption := dm.qry2departmentname.Value;
                    Form_edit.Lab_employeecode.Caption := DM.qry2employeecode.Value;
                    Form_edit.Lab_zhiwu.Caption := dm.qry2item.Value;
                    Form_edit.Lab_chinesename.Caption := dm.qry2chinesename.Value;
                    Form_edit.Lab_begindate.Caption := DateTimeToStr(DM.qry2startdate.Value);
                    form_edit.lab_circle.Caption := IntToStr(dm.qry2circle.Value);
                    Form_edit.lab_emp_id.Caption := IntToStr(dm.qry2employeeid.Value);
                    Form_edit.lab_departmentid.Caption := IntToStr(dm.qry2departmentid.Value);
                    Form_edit.lab_zhiwuid.Caption := IntToStr(DM.qry2positionid.Value);
                    location_empid :=  dm.qry2employeeid.Value;
                    Form_edit.Edit1.Text := IntToStr(DM.qry2extra_month.Value);
                    Form_edit.mmo1.Text := DM.qry2extra_remark.Value;
                    end;
                    Form_edit.Caption := '备注编辑';
                     if Form_edit.ShowModal=mrok then
                     begin

                        dm.ADOTEMP.SQL.Text := ' update employee_station_turn_remark '+
                        ' set oper_0005='+user_ptr+','+
                        ' operate_date=getdate(),'+
                        ' extra_month='+inttostr(strtoint(Form_edit.Edit1.Text))+','+
                        ' extra_remark= '+quotedstr(Form_edit.mmo1.Text)+
                        ' from  employee_station_turn_remark '+
                        ' where employeeid='+ Trim(Form_edit.lab_emp_id.Caption)+' and '+
                        ' departmentid='+ Trim(Form_edit.lab_departmentid.Caption)+' and '+
                        ' Positionid='+trim(Form_edit.lab_zhiwuid.Caption)+' and '+
                        ' startdate='+quotedstr(Trim(Form_edit.Lab_begindate.Caption)) ;

                      try
                        //ShowMessage(dm.ADOTEMP.SQL.Text);
                        dm.ADOTEMP.ExecSQL;
                        ShowMessage('编辑完成');
                      except
                        ShowMessage('编辑失败');
                      end;
                       btn1.Click;
                       dm.qry2.Active := false;
                       dm.qry2.Active := True;
                       if paixu2<>'' then DM.qry2.Sort:= paixu2 ;
                       DM.qry2.Locate('employeeid',location_empid,[]);

                     end;
                   finally
                     Form_edit.Free;
                   end;

            end;
end;


procedure Tfrm_main.pm1Popup(Sender: TObject);
begin
    N2.Enabled := False;
    N4.Enabled := False;
    if pgc1.ActivePageIndex = 0 then
    begin
    if DM.qry1.Recordset.RecordCount = 0 then
    begin
    ShowMessage('无加载数据');
    Abort;
    end
    else
    begin
     if dm.qry1extra_month.Value = 0 then
     N2.Enabled := True else  N4.Enabled := true;
    end;
    end;

        if pgc1.ActivePageIndex = 1 then
    begin
    if DM.qry2.Recordset.RecordCount = 0 then
    begin
    ShowMessage('无加载数据');
    Abort;
    end
    else
    begin
     if dm.qry2extra_month.Value = 0 then
     N2.Enabled := True else  N4.Enabled := true;
    end;
    end;
end;



procedure Tfrm_main.pgc1Change(Sender: TObject);
begin
 if pgc1.ActivePageIndex=1 then
 begin
   if dm.qry2.Active = True then dm.qry2.Active := False;
   dm.qry2.Active := True;
 end;
end;

procedure Tfrm_main.grd2TitleClick(Column: TColumnEh);
begin
  if Grd2.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry2.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry2.Sort:=Column.FieldName+' DESC';
  end;

  if Grd2.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name2 <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name2 := column.FieldName ;
    edit2.SetFocus;
    PreColumn2.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn2 := column ;    
  end else
    edit2.SetFocus;
end;

procedure Tfrm_main.Edit2Change(Sender: TObject);
begin
  if Grd2.DataSource.DataSet.FieldByName(field_name2).FieldKind = fkCalculated then  exit;
  if Grd2.DataSource.DataSet.FieldByName(field_name2).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit2.text) <> '' then
    begin
      if Grd2.DataSource.DataSet.FieldByName(field_name2).DataType in  [ftString, ftWideString]  then
        Grd2.DataSource.DataSet.Filter:=' (' +  field_name2 + ' like ''%' + trim(edit2.text) + '%'')'
      else if Grd2.DataSource.DataSet.FieldByName(field_name2).DataType in  [ftSmallint, ftInteger]  then
        Grd2.DataSource.DataSet.Filter:=' (' + field_name2+' >= ' + inttostr(strtointdef(edit2.text,0))+')';
    end else
      Grd2.DataSource.DataSet.Filter:='';
  end;
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
var date_string : string;
begin  
  date_string := DateToStr(now);
  Export_dbGridEH_to_Excel(Grd2,(Trim(pgc1.Pages[1].Caption)+date_string));
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
  dm.qry2.Close;
  dm.qry2.Open;
    //ShowMessage(paixu1);
  if paixu2 <> '' then dm.qry2.Sort := paixu1;
   // ShowMessage(dm.qry1.Sort);
  dm.qry2.Locate('rkey',location_empid,[]);
  //Locate('Company;Contact;Phone', VarArrayOf(['Sight Diver', 'P', '408-431-1000']), [loPartialKey]);

end;

end.

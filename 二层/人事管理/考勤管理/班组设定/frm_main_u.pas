unit frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, Menus, StdCtrls, Buttons;

type
  Tfrm_main = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo, frm_detail_u,common, frm_emp_choose_u;

{$R *.dfm}

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
  if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  try
    frm_detail := Tfrm_detail.Create(nil);
    frm_detail.Ftag := 0;
    if frm_detail.ShowModal = mrok then
    begin
      dm.ADOQuery1.Active := false;
      dm.ADOQuery1.Active := true;
    end;
  finally
    frm_detail.Free;
  end;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOConnection1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
  end;
    self.Caption :=Application.Title;  
    //damo.people_right:=strtoint(vprev);//权限
    //damo.op_people:=strtoint(user_ptr);//当前操作员
    { user_ptr:='3'; //人员ID
   vprev:='1';    //权限
   rkey73:='9';   //    }
   DateSeparator := '-';
   ShortDateFormat := 'yyyy-mm-dd';
   if dm.ADOConnection1.Connected then
      dm.ADOQuery1.Active :=true;
      //dm.ADODataSet_emplist.Active := true;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin
  if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  try
    frm_detail := Tfrm_detail.Create(nil);
    frm_detail.Ftag := damo.D_Ftag;
    frm_detail.Edit2.Text := dm.ADOQuery1ClassgroupCode.Value;
    frm_detail.Edit3.Text := dm.ADOQuery1descript.Value;
    frm_detail.Edit6.Text := dm.ADOQuery1ClassBunch.Value;
    frm_detail.RichEdit1.Text := dm.ADOQuery1Remark.Value;
    frm_detail.ComboBox1.ItemIndex := dm.ADOQuery1CalendarID.Value;
    frm_detail.ComboBox2.ItemIndex := dm.ADOQuery1RepeatCycle.Value;
    frm_detail.DateTimePicker1.DateTime := dm.ADOQuery1StartDate.Value;
    frm_detail.Edit4.Text := dm.ADOQuery1classbunch_str.Value;
    frm_detail.Edit5.Text := dm.ADOQuery1peoplecount.CurValue;
    if frm_detail.ShowModal = mrok then
    begin
      dm.ADOQuery1.Active := false;
      dm.ADOQuery1.Active := true;
      dm.ADOQuery1.Locate('rkey', frm_detail.Ftag, []);
    end;
  finally
    frm_detail.Free;
  end;
end;

procedure Tfrm_main.N3Click(Sender: TObject);
var i: integer;
begin
    if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if dm.ADOQuery1peoplecount.Value > 0 then
    begin
    application.MessageBox('请先清除该班组内在职员工!', '提示', 64);
    abort;
    end;
  if Messagedlg('你确定删除该班组吗?',mtWarning,[mbYES,mbNO],0) = 6 then
  begin
    try

      i := dbgrid1.DataSource.DataSet.RecNo;
      dm.ADOTMP.SQL.Text := '';
      dm.ADOTMP.SQL.Text := Format(' delete from classgroup where rkey=%d ',[damo.D_Ftag]);
      dm.ADOTMP.ExecSQL;
      showmessage('删除成功');
      dm.ADOQuery1.Active := false;
      dm.ADOQuery1.Active := true;
      if i > 1 then
      DBGrid1.DataSource.DataSet.RecNo := i-1;
    except on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure Tfrm_main.N5Click(Sender: TObject);
var i,j : Integer;
begin
  if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if damo.D_Ftag = 0 then
    begin
      showmessage('请选择班组');
      abort;
    end;
  j := dbgrid1.DataSource.DataSet.RecNo;
  damo.sSql_fiter_00 := '';
  damo.sSql_begin00 := '';
  damo.sSql_right00 := '';
  damo.sSql_end00 := '';
  //开始设置过滤 ,初始00语句过滤时不包括有班组的员工
  damo.sSql_right00 := ' ';
  damo.sSql_begin00 := ' and rkey  in (select rkey from employeemsg where isnull(classgroupid,0)=0)';
  damo.sSql_end00 := ' ';
  damo.sSql_fiter_00:=damo.sSql_begin00+ damo.sSql_right00+ damo.sSql_end00 ;
  //开始重新构造待选区
  damo.sSql_fiter_0 := ' select rkey,departmentname,employeecode,chinesename,' +
 ' position_item,ondutytime,classgroupcode,accountname '+
 ' from v_employeemsg where attendance=1 and outdutytime is null ' + damo.sSql_fiter_00;
  try
    frm_emp_choose:=Tfrm_emp_choose.Create(nil);
    frm_emp_choose.Label4.Caption := dm.ADOQuery1ClassgroupCode.Value;
    frm_emp_choose.Label5.Caption := dm.ADOQuery1classbunch_str.Value;
    dm.ADOTMP.Close;
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text := Format(' select departmentname,employeecode,chinesename,rkey from v_employeemsg where classgroupid =%d and status=1 ', [damo.D_Ftag]);
    dm.ADOTMP.Open;
    if not dm.ADOTMP.IsEmpty then
      begin
        frm_emp_choose.StringGrid1.RowCount := dm.ADOTMP.RecordCount + 1;
        i :=1;
        //dm.ADOTMP.RecNo := 1;
        while not dm.ADOTMP.Eof do
          begin
            frm_emp_choose.StringGrid1.Cells[1,i] :=dm.ADOTMP.FieldValues['departmentname'];
            frm_emp_choose.StringGrid1.Cells[2,i] :=dm.ADOTMP.FieldValues['employeecode'];
            frm_emp_choose.StringGrid1.Cells[3,i] :=dm.ADOTMP.FieldValues['chinesename'];
            frm_emp_choose.StringGrid1.Cells[4,i] :=dm.ADOTMP.FieldValues['rkey'];
            dm.ADOTMP.Next;
            i := i + 1;
          end;
      end;
    dm.ADOTMP.Close;
    dm.ADOTMP.SQL.Text:='';
    if frm_emp_choose.ShowModal=mrok then
      begin
        dm.ADOQuery1.Active := false;
        dm.ADOQuery1.Active := true;
        dbgrid1.DataSource.DataSet.RecNo := j;
        j := 0;
      end;
  finally
    frm_emp_choose.Free;
  end;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
application.Terminate;
end;

procedure Tfrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if damo.D_Ftag = 0 then
    begin
      n2.Enabled := false;
      n3.Enabled := false;
      n5.Enabled := false;
    end
  else
    begin
      n2.Enabled := true;
      n3.Enabled := true;
      n5.Enabled := true;
    end;
end;

end.

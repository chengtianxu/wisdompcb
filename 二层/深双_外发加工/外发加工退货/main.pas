unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppModule, daDataModule, ppEndUsr, ppCtrls, raCodMod, ppPrnabl,
  ppStrtch, ppSubRpt;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label2: TLabel;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn3: TBitBtn;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    N8: TMenuItem;
    N9: TMenuItem;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline2: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    N10: TMenuItem;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField4: TppField;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine7: TppLine;
    ppLabel11: TppLabel;
    ppLine14: TppLine;
    ppLabel12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape2: TppShape;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine15: TppLine;
    ppLine8: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel13: TppLabel;
    ppLabel18: TppLabel;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    raCodeModule1: TraCodeModule;
    ppSummaryBand1: TppSummaryBand;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
   v_colwidth,v_colwidth1: array of integer;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);   
  public
    { Public declarations }
   sys_longdate,sys_shortdate:tdatetime;
   empl_ptr:integer;
  end;

var
  Form1: TForm1;

implementation

uses data_module, aded_rece, eip_search, received_search,common;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  if dm.ADOConnection1.Connected then
    begin
      ShowMessage('程序处于测试模试下运行，请在发布程序前断开数据库连接后编译！');
      rkey73 := '1';
      vprev := '4';
    end
  else
    if not app_init_2(dm.ADOConnection1) then
    begin
      showmsg('程序起动失败,请联系管理员!',1);
      application.Terminate;
    end;

  Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  field_name:='rejected_number';
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var i:byte;
begin
  if dm.ADOConnection1.Connected then
  begin
    setlength(v_colwidth,8);
    setlength(v_colwidth1,8);
    for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
    for i:=0 to high(v_colwidth1) do v_colwidth1[i]:=dbgrid2.Columns[i].Width;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select EMPLOYEE_PTR from data0073');
      sql.Add('where rkey='+rkey73);
      open;
      empl_ptr := fieldvalues['EMPLOYEE_PTR'];
    end;

    with dm.ADOQuery1 do
    begin
      active:=false;
      sql.Clear;
      sql.Add('select getdate() as v_dt');
      active:=true;
      sys_longdate := fieldvalues['v_dt']; //长格式
      sys_shortdate:=strtodate(datetostr(sys_longdate));
    end;
    dtpk2.Date := sys_shortdate;
    dtpk1.Date := dtpk2.Date - 5;

    dm.Aqwz307.Close;
    dm.Aqwz306.Close;
    dm.Aqwz306.Parameters[5].Value := dtpk1.Date;
    dm.Aqwz306.Parameters[6].Value := dtpk2.Date;
    dm.Aqwz306.Open;
    dm.Aqwz307.Open;
    Timer1Timer(sender);
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    form2:=tform2.Create(application);
    form2.aded_flag:=1;
    if form2.ShowModal=mrok then
    begin
      dm.Aqwz306.Close;
      dm.Aqwz306.Open;
      dm.Aqwz306.Locate('rkey',dm.ADOwz306RKEY.Value,[]);
      dm.ADOwz306.Close;
    end;
  finally
    form2.Free;
  end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
  if (column.ReadOnly) and (field_name<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    dm.Aqwz306.Sort:=Column.FieldName;
    edit1.SetFocus;
    for i:=0 to dbgrid1.FieldCount-1 do
      if dbgrid1.Columns[i].Title.Color= clred then
        dbgrid1.Columns[i].Title.Color:= clbtnface;
    column.Title.Color:=clred;
  end
  else
    edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dm.Aqwz306.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
  else
    dm.Aqwz306.Filter:='';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  dm.aqwz306.Close;
  if not checkbox1.Checked then
    dm.aqwz306.Parameters[0].Value:=1
  else
    dm.aqwz306.Parameters[0].Value:=0;
  if not checkbox2.Checked then
    dm.aqwz306.Parameters[1].Value:=2
  else
    dm.aqwz306.Parameters[1].Value:=0;
  if not checkbox3.Checked then
    dm.aqwz306.Parameters[2].Value:=3
  else
    dm.aqwz306.Parameters[2].Value:=0;
  if not checkbox4.Checked then
    dm.aqwz306.Parameters[3].Value:=4
  else
    dm.aqwz306.Parameters[3].Value:=0;
  if not checkbox5.Checked then
    dm.aqwz306.Parameters[4].Value:=5
  else
    dm.aqwz306.Parameters[4].Value:=0;

  DM.aqwz306.open;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
  dm.Aqwz306.Close;
  dm.Aqwz306.Parameters[5].Value := dtpk1.Date;
  dm.Aqwz306.Parameters[6].Value := dtpk2.Date;
  dm.Aqwz306.Open;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  rkey306:Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    form2:=tform2.Create(application);
    form2.aded_flag:=2;
    form2.BitBtn2.Enabled:=false;
    Form2.Edit1.Enabled:=False;
    if form2.ShowModal=mrok then
      begin
        dm.Aqwz306.Close;
        dm.Aqwz306.Open;
        dm.Aqwz306.Locate('rkey',dm.ADOwz306RKEY.Value,[]);
        dm.ADOwz306.Close;
      end
    else
      begin
        rkey306 :=dm.Aqwz306rkey.Value;
        dm.Aqwz306.Close;
        dm.Aqwz306.Open;
        dm.Aqwz306.Locate('rkey',rkey306 ,[]);
      end;
  finally
    form2.Free;
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  form2:=tform2.Create(application);
  form2.aded_flag:=3;
  form2.BitBtn1.Enabled:=false;
  form2.BitBtn2.Enabled:=false;
  form2.StrGrid1.Options:=form2.StrGrid1.Options-[goEditing];
  form2.Edit1.Enabled:=false;
  form2.Edit5.Enabled:=false;
  form2.DateTimePicker1.Enabled:=false;
  form2.Memo1.Enabled:=false;
  if form2.ShowModal=mrok then
  begin

  end;
  form2.Free;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
    if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      dm.ADOConnection1.BeginTrans;
      try
        with dm.ADOQuery1 do
        begin
          close;
          sql.Clear;
          sql.Add('update wzdata304');
          sql.Add('SET rework_qry = WZDATA304.rework_qry - WZDATA307.rework_qry');
          sql.Add('FROM WZDATA307 INNER JOIN');
          sql.Add('     WZDATA304 ON WZDATA307.received_ptr = WZDATA304.RKEY');
          sql.Add('where WZDATA307.rejected_ptr = '+dm.aqwz306RKEY.AsString);
          ExecSQL;
        end;
        dm.ADOwz306.Close;
        dm.adowz306.Parameters[0].Value := dm.Aqwz306RKEY.Value;
        dm.adowz306.Open;
        dm.adowz306.Delete;
        dm.ADOConnection1.CommitTrans;
        dm.Aqwz306.Close;
        dm.Aqwz306.Open;
        dm.adowz306.Close;
      except
        dm.ADOConnection1.RollbackTrans;
        messagedlg('数据删除不成功!请与管理员联系',mtwarning,[mbcancel],0);
      end;
    end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    dm.Aqwz306.Edit;
    dm.Aqwz306STATUS.Value:=2;
    dm.tmp.close;
    dm.tmp.SQL.Text:='select getdate()' ;
    dm.tmp.Open;
    dm.aqwz306ent_date.value:=dm.tmp.Fields[0].Value;
    dm.tmp.close;
    dm.Aqwz306.Post;
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
  else
    if messagedlg('你确定要将该申请取消提交，重新提交吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
      dm.ADOwz306.Close;
      dm.ADOwz306.Parameters[0].Value := dm.Aqwz306RKEY.Value;
      dm.ADOwz306.Open;
      if dm.ADOwz306STATUS.Value=dm.Aqwz306STATUS.Value then
      begin
        dm.ADOwz306.Edit;
        dm.ADOwz306status.Value := 1;
        dm.ADOwz306.Post;
        dm.Aqwz306.close;
        dm.Aqwz306.open;
        dm.Aqwz306.Locate('rkey',dm.adowz306rkey.value,[]);
        dm.ADOwz306.Close;
      end
      else
        begin
          dm.Aqwz306.close;
          dm.Aqwz306.open;
          dm.Aqwz306.Locate('rkey',dm.adowz306rkey.value,[]);
          dm.ADOwz306.Close;
          showmessage('取消操作不成功，可能已被成功审核了');
        end;
    end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var
  rkey306:Integer;
begin
  if dm.Aqwz306.IsEmpty then
  begin
    n2.Enabled:=false;
    n3.Enabled:=false;
    n4.Enabled:=false;
    n5.Enabled:=false;
    n6.Enabled:=false;
    n9.Enabled:=false;
    N10.Enabled:=False;
  end
  else
    begin
      rkey306 :=dm.Aqwz306rkey.Value;
      dm.Aqwz306.Close;
      dm.Aqwz306.Open;
      dm.Aqwz306.Sort:=Self.field_name;
      dm.Aqwz306.Locate('rkey',rkey306,[]);
      n2.Enabled:=true;
      n3.Enabled:=true;
      n4.Enabled:=true;
      n5.Enabled:=true;
      n6.Enabled:=true;
      n9.Enabled:=true;
      N10.Enabled:=True;
      case dm.Aqwz306STATUS.Value of
      1:
        begin
          n6.Enabled:=false;
          n9.Enabled:=false;
          N10.Enabled:=False;
        end;
      2:
        begin
          n2.Enabled:=false;
          n4.Enabled:=false;
          n5.Enabled:=false;
          n9.Enabled:=false;
          N10.Enabled:=False;
        end;
      3:
        begin
          n2.Enabled:=false;
          n4.Enabled:=false;
          n5.Enabled:=false;
          n6.Enabled:=false;
        end;
      4:
        begin
          n2.Enabled:=false;
          n4.Enabled:=false;
          n5.Enabled:=false;
          n6.Enabled:=false;
          n9.Enabled:=false;
        end;
      5:
        begin
          n5.Enabled:=false;
          n6.Enabled:=false;
          n9.Enabled:=false;
          N10.Enabled:=False;
        end;
      end;
    end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  v_rkey68: integer;
begin
  v_rkey68 := 0;
  if not dm.Aqwz306.IsEmpty then v_rkey68 := dm.Aqwz306rkey.Value;
  dm.Aqwz306.Close;
  dm.Aqwz306.Open;
  if v_rkey68 > 0 then  dm.Aqwz306.Locate('rkey',v_rkey68,[]);
  self.Timer1Timer(sender);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from wzdata306 where status=5');
    open;
    if dm.ADOQuery1.IsEmpty then
      label2.Visible:=false
    else
      label2.Visible:=true;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  ppDesigner1.ShowModal;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dm.aqwz306status.value=5 then
    DBGrid1.Canvas.Font.Color := clRed
  else
    if dm.aqwz306status.value=1 then
      DBGrid1.Canvas.Font.Color := cllime;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.FormResize(Sender: TObject);
var i:byte;
begin
  for i:=low(v_colwidth) to high(v_colwidth) do
    dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-707)*v_colwidth[i]/670);

  for i:=low(v_colwidth1) to high(v_colwidth1) do
    dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid1.Width-707)*v_colwidth1[i]/668);

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  form3:=tform3.create(application);
  form3.showmodal;
  form3.free;
end;

procedure TForm1.N9Click(Sender: TObject);
var
  rkey306:Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    form2:=tform2.Create(application);
    form2.aded_flag:=4;
    form2.BitBtn2.Enabled:=false;
    Form2.Edit1.Enabled:=False;
    Form2.DateTimePicker1.Enabled:=False;
    Form2.Memo1.Enabled:=False;
    Form2.StrGrid1.ColWidths[7]:=0;
    rkey306:=dm.Aqwz306rkey.Value;
    if form2.ShowModal=mrok then
    begin
      dm.Aqwz306.Close;
      dm.Aqwz306.Open;
      dm.Aqwz306.Locate('rkey',rkey306,[]);
    end;
  finally
    form2.Free;
  end;
end;

procedure TForm1.N10Click(Sender: TObject);
{var
  rkey306:string;
  orig_filter:string;
  orig_filtered:Boolean; }
begin
 { rkey306 :=dm.Aqwz306rkey.AsString;
  orig_filter:= dm.Aqwz306.Filter;
  orig_filtered :=dm.Aqwz306.Filtered;
  dm.Aqwz306.Filter:='rkey ='+rkey306;
  dm.Aqwz306.filtered:=True;  }
  ppReport1.Print;
  {dm.Aqwz306.Filtered:=orig_filtered;
  dm.Aqwz306.Filter:=orig_filter;
  dm.Aqwz306.Locate('rkey',StrToInt(rkey306),[]); }
end;

end.

unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    BitBtn6: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }

   PreColumn: TColumn;
   field_name,sql_text:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure item_click(sender:TObject);
   procedure append_ecn(source:byte);
   PROCEDURE UPDATEDATA0025(Ecnstart:byte;RKEY:integer);
   PROCEDURE delete25(RKEY:integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DAMO,common, term, Append_ecn, edit_ecn, ECN_report,
  layersdata_select;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOConnection1) then
  begin
   showmsg('程序起动失败,请联系管理员!',1);
   application.Terminate;
  end;


//  vprev:='4';
//  user_ptr:='785';
//  dm.ADOConnection1.Open;

  self.caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
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

procedure tform1.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
 PopupMenu2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
if  dm.ADOConnection1.Connected then
 begin

  dm.ads273.Close;
  dm.ads273.Parameters.ParamValues['dtpk1']:= getsystem_date(dm.ADOQuery1,1)-6;
  dm.ads273.Parameters.ParamValues['dtpk2']:= getsystem_date(dm.ADOQuery1,1);
  dm.ads273.Open;

  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
  sql_text := dm.ADS273.CommandText;

 for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick := item_click;
   self.PopupMenu2.Items.Add(item);
  end;
end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADs273.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADs273.filter := '';
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.ADs273.IndexFieldNames) then
 dm.ADs273.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;

end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
form_condition.dtpk1.Date:=dm.ADs273.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.ADs273.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin
  dm.ADs273.Close;
  dm.ADs273.CommandText:=sql_text;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.ADs273.CommandText:=dm.ADs273.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  dm.ADs273.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.ADs273.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.ADs273.Open;
 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.ads273RKEY.Value;
 dm.ads273.Close;
 dm.ads273.Open;
if rkey>0 then
 dm.ads273.Locate('rkey',rkey,[]);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption)
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADs273.CommandText)
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
dm.ads273.Close;
if checkbox1.Checked then
 dm.ads273.Parameters.ParamValues['v0']:=9
else
 dm.ads273.Parameters.ParamValues['v0']:=0;

if checkbox2.Checked then
 dm.ads273.Parameters.ParamValues['v1']:=9
else
 dm.ads273.Parameters.ParamValues['v1']:=1;

if checkbox3.Checked then
 dm.ads273.Parameters.ParamValues['v2']:=9
else
 dm.ads273.Parameters.ParamValues['v2']:=2;
dm.ads273.Open;
end;

procedure TForm1.append_ecn(source: byte);
begin
try
 form2:=tform2.Create(application);
 form2.RadioGroup1.ItemIndex:=source-1;
 dm.ads04.Close;
 if source=1 then
 begin
  dm.ads04.Parameters.ParamValues['rkey']:=70;
  Form2.Edit9.Enabled:=False;
 end
 else
  dm.ads04.Parameters.ParamValues['rkey']:=71;
 dm.ads04.Open;
 form2.Edit1.Text:=dm.ads04SEED_VALUE.Value;
 if form2.ShowModal=mrok then
 begin
  try
   form3:=tform3.Create(application);
   DM.adsa273.Refresh;
   DM.adsa273.Edit;
   IF DM.adsa273ECNSTART.Value=1 THEN
    FORM3.DBGrid1.PopupMenu:=NIL;
   if form3.ShowModal=mrok then
   begin
   end
   else
    dm.adsa273.Cancel;
  finally
   form3.Free;
  end;
  dm.ads273.Close;
  dm.ads273.Open;
  dm.ads273.Locate('rkey',dm.adsa273RKEY.Value,[]);
  dm.adsa273.Close;
 end;
finally
 form2.free;
end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else self.append_ecn(1);

end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 self.append_ecn(2);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
 form3:=tform3.Create(application);
 dm.adsa273.Close;
 dm.adsa273.Parameters[0].Value:=dm.ads273RKEY.Value;
 dm.adsa273.Open;
 dm.adsa273.Edit;
 IF DM.adsa273ECNSTART.Value=1 THEN
  FORM3.DBGrid1.PopupMenu:=NIL;
 if form3.ShowModal=mrok then
 begin
  dm.ads273.Close;
  dm.ads273.Open;
  dm.ads273.Locate('rkey',dm.adsa273RKEY.Value,[]);
  dm.adsa273.Close;
 end
 else
  begin
   dm.adsa273.Cancel;
   dm.adsa273.Close;
  end;
finally
 form3.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
WITH tform3.Create(application) DO
try
 dm.adsa273.Close;
 dm.adsa273.Parameters[0].Value:=dm.ads273RKEY.Value;
 dm.adsa273.Open;

 DBGrid1.PopupMenu:=NIL;
 DBGRIDEH1.ReadOnly:=true;
 bitbtn1.Enabled:=false;
 bitbtn11.Enabled:=false;
 dbedit1.ReadOnly:=true;
 dbedit4.ReadOnly:=true;
 dbedit5.ReadOnly:=true;
 dbedit6.ReadOnly:=true;
 dbedit7.ReadOnly:=true;
 dbedit8.ReadOnly:=true;
 dbedit9.ReadOnly:=true;
 dbedit10.ReadOnly:=true;
 dbedit11.ReadOnly:=true;
 dbedit12.ReadOnly:=true;
 dbedit13.ReadOnly:=true;
 dbedit14.ReadOnly:=true;
 dbedit15.ReadOnly:=true;
 dbmemo1.ReadOnly:=true;
 dbmemo2.ReadOnly:=true;
 dbmemo3.ReadOnly:=true;
 speedbutton1.Enabled:=false;
 if ShowModal=mrok then
  begin
  end;
 dm.adsa273.Close;
finally
 Free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
dm.adsa273.Close;
dm.adsa273.Parameters[0].Value:=dm.ads273RKEY.Value;
dm.adsa273.Open;
if dm.adsa273STATUS.Value=dm.ads273STATUS.Value then
begin
 dm.adsa273.Edit;
 dm.adsa273STATUS.Value:=1;
 dm.adsa273.Post;
 BitBtn3Click(sender);
 dm.adsa273.Close;
end
else
 begin
  messagedlg('状态发生变更不能提交!',mtinformation,[mbcancel],0);
  dm.adsa273.Close;
 end;
end;
end;

PROCEDURE TForm1.delete25(RKEY:integer);
BEGIN
  with dm.ADOQuery2 do      //删除第四层
   begin
    close;
    sql.Text:='delete data0025'+#13+
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_3 ON '+#13+
      'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
     'where Data0025_3.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;

  with dm.ADOQuery2 do      //删除第三层
   begin
    close;
    sql.Text:='delete from data0025'+#13+
    'where rkey in(select data0025.rkey'+#13+
       'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
     'where Data0025_2.RKEY = '+inttostr(rkey)+')';
    ExecSQL;
   end;

  with dm.ADOQuery2 do        //删除第二层
   begin
    close;
    sql.Text:='delete data0025'+#13+
             'FROM Data0025 INNER JOIN'+#13+
    'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
    'where Data0025_1.RKEY='+inttostr(rkey);
    ExecSQL;
   end;

  with dm.ADOQuery2 do     //删除顶层
   begin
    close;
    sql.Text:='delete data0025'+#13+
             'FROM Data0025'+#13+
    'where Data0025.RKEY='+inttostr(rkey);
    ExecSQL;
   end;

end;

PROCEDURE TForm1.UPDATEDATA0025(Ecnstart:byte;RKEY:integer);
begin
 if Ecnstart=1 then    //下批生效
 begin
  with dm.ADOQuery2 do     //更新顶层
  begin
   close;
   sql.Text:='update data0025'+#13+
     'set DATA0025.ONHOLD_SALES_FLAG=0'+#13+
     'FROM dbo.Data0025'+#13+
     'where Data0025.RKEY='+inttostr(rkey);
   ExecSQL;
  end;

  with dm.ADOQuery2 do        //更新第二层
  begin
   close;
   sql.Text:='update data0025'+#13+
     'set DATA0025.ONHOLD_SALES_FLAG=0'+#13+
     'FROM Data0025 INNER JOIN'+#13+
     'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
     'where Data0025_1.RKEY='+inttostr(rkey);
   ExecSQL;
  end;

  with dm.ADOQuery2 do      //更新第三层
  begin
   close;
   sql.Text:='update data0025'+#13+
     'set DATA0025.ONHOLD_SALES_FLAG=0'+#13+
     'FROM data0025 INNER JOIN  '+#13+
     'Data0025 Data0025_1 ON'+#13+
     'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
     'Data0025 Data0025_2 ON '+#13+
     'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
     'where Data0025_2.RKEY = '+inttostr(rkey);
   ExecSQL;
  end;

  with dm.ADOQuery2 do      //更新第四层
   begin
    close;
    sql.Text:='update data0025'+#13+
     'set DATA0025.ONHOLD_SALES_FLAG=0'+#13+
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_3 ON '+#13+
      'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
     'where Data0025_3.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;

 end
 else
 begin              //立即生效
  with dm.ADOQuery2 do     //更新顶层
  begin
   close;
   sql.Text:='update data0025'+#13+
      'set DATA0025.ONHOLD_SALES_FLAG=0,'+#13+
      'DATA0025.ONHOLD_RELEASE_FLAG=0,'+#13+
      'data0025.ONHOLD_PLANNING_FLAG=0'+#13+
      'FROM dbo.Data0025'+#13+
      'where Data0025.RKEY='+inttostr(rkey);
   ExecSQL;
  end;

  with dm.ADOQuery2 do        //更新第二层
  begin
   close;
   sql.Text:='update data0025'+#13+
     'set DATA0025.ONHOLD_SALES_FLAG=0,'+#13+
     'DATA0025.ONHOLD_RELEASE_FLAG=0,'+#13+
     'data0025.ONHOLD_PLANNING_FLAG=0'+#13+
     'FROM Data0025 INNER JOIN'+#13+
     'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
     'where Data0025_1.RKEY='+inttostr(rkey);
   ExecSQL;
  end;

  with dm.ADOQuery2 do      //更新第三层
  begin
   close;
   sql.Text:='update data0025'+#13+
     'set DATA0025.ONHOLD_SALES_FLAG=0,'+#13+  //取消暂缓下单
     'DATA0025.ONHOLD_RELEASE_FLAG=0,'+#13+   //取消暂缓发放工单
     'data0025.ONHOLD_PLANNING_FLAG=0'+#13+  //取消暂缓投产
     'FROM data0025 INNER JOIN  '+#13+
     'Data0025 Data0025_1 ON'+#13+
     'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
     'Data0025 Data0025_2 ON '+#13+
     'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
     'where Data0025_2.RKEY = '+inttostr(rkey);
   ExecSQL;
  end;

  with dm.ADOQuery2 do      //更新第四层
   begin
    close;
    sql.Text:='update data0025'+#13+
    'set DATA0025.ONHOLD_SALES_FLAG=0,'+#13+   //取消暂缓下单
    'DATA0025.ONHOLD_RELEASE_FLAG=0,'+#13+   //取消暂缓发放工单
    'data0025.ONHOLD_PLANNING_FLAG=0'+#13+  //取消暂缓投产
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_3 ON '+#13+
      'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
     'where Data0025_3.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;

 end;
end;

procedure TForm1.N5Click(Sender: TObject);
var rkey25:integer;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
 else begin
  dm.adsa273.Close;
  dm.adsa273.Parameters[0].Value:=dm.ads273RKEY.Value;
  dm.adsa273.Open;
  if dm.adsa273STATUS.Value=dm.ads273STATUS.Value then
  begin
   dm.ADOConnection1.BeginTrans;
   try
    if dm.adsa273del.Value=0 then   //升级前产品是允许销售，没有销售暂缓
     UPDATEDATA0025(dm.adsa273ECNSTART.Value,dm.adsa273COPYFROMCUST_PTR.Value);
    rkey25:=dm.adsa273CUSTOMER_PART_PTR.Value;
    dm.adsa273.Delete;
    self.delete25(rkey25); //删除升级后的产品25
    dm.ADOConnection1.CommitTrans;
    BitBtn3Click(sender);
    dm.adsa273.Close;
   except
    on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end; //end try
  end
  else
  begin
   messagedlg('状态发生变更不能删除!',mtinformation,[mbcancel],0);
   dm.adsa273.Close;
  end;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  form_layersdata:=Tform_layersdata.Create(application);
  if form_layersdata.ShowModal=mrok then
  begin
    form_report:=tform_report.Create(application);
    form_report.ads273.Close;
    form_report.ads273.Parameters[0].Value:=dm.ads273RKEY.Value;
    form_report.ads273.Open;

    form_report.ads_ed38.Close;
    form_report.ads_ed38.Parameters[0].Value:=
                         strtoint(form_layersdata.rkey25.Caption);
    form_report.ads_ed38.Open;

    form_report.ppReport1.Reset;
    form_report.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'ECN_Report.rtm';
    form_report.ppReport1.Template.LoadFromFile;
    form_report.ppReport1.SaveAsTemplate:=false;
    form_report.ppReport1.Print;
    form_report.Free;
  end;
  form_layersdata.Free;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  form_report:=tform_report.Create(application);
  form_report.ppReport1.Reset;
  form_report.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'ECN_Report.rtm';
  form_report.ppReport1.Template.LoadFromFile;
  form_report.ppReport1.SaveAsTemplate:=True;
  form_report.ppDesigner1.ShowModal;
  form_report.Free;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if dm.ads273.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n5.Enabled:=false;
   n6.Enabled:=false;
  end
  else begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.Enabled:=true;
   n5.Enabled:=true;
   n6.Enabled:=true;
   case dm.ads273STATUS.Value of
     0:;
     1:
     begin
      n2.Enabled:=false;
      n4.Enabled:=false;
      n5.Enabled:=false;
     end;
     2:
     begin
      n2.Enabled:=false;
      n4.Enabled:=false;
      n5.Enabled:=false;
     end;
   end; //end case
  end;

  end;

end.

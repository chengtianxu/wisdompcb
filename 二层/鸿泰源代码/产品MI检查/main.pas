unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PopupMenu2: TPopupMenu;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    N5: TMenuItem;
    N6: TMenuItem;
    N1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);

  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
   sql_text:tstringlist;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure item_click(sender:TObject);
   procedure updatedata0025(rkey:integer);   
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, term, product_MIDetail, append_productin,
  report_data, reportselect, CHECK_STATUS, MITreeFrm;

{$R *.dfm}

procedure TForm1.NewGridWnd(var Message: TMessage);
var IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else OldGridWnd(Message);
end;

procedure tform1.item_click(sender:TObject);
var i:byte;
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

procedure tform1.updatedata0025(rkey:integer);
begin
//   dm.AQY0025CHECK_BY_PTR.Value:=strtoint(user_ptr);
//   dm.AQY0025CHECK_DATE.Value:= getsystem_date(dm.adoquery1,0);//长格式
//   dm.AQY0025TSTATUS.Value:=4;

  DM.ADOQuery2.Close;
  DM.ADOQuery2.SQL.Text := ' ;WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) ' +
                          ' AS (SELECT RKey,0,MANU_PART_NUMBER,PARENT_PTR ' +
                          ' FROM Data0025 WHERE RKey = ' + IntToStr(rkey) + ' UNION ALL ' +
                          ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR ' +
                          ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ) ' +
                          ' UPDATE Data0025 SET TSTATUS = ' + dm.AQY0025.fieldbyname('TSTATUS').AsString +
                          ' ,CHECK_BY_PTR = ' + dm.AQY0025.fieldbyname('CHECK_BY_PTR').AsString;
                          if dm.AQY0025.fieldbyname('CHECK_DATE').AsDateTime <> 0 then
                            DM.ADOQuery2.SQL.Text := DM.ADOQuery2.SQL.Text +
                            ' ,CHECK_DATE = ' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss',dm.AQY0025.fieldbyname('CHECK_DATE').AsDateTime) );
  DM.ADOQuery2.SQL.Text := DM.ADOQuery2.SQL.Text +
                          ' ,allow_edit_flag = ' + QuotedStr(dm.AQY0025.fieldbyname('allow_edit_flag').AsString) +
                          ' FROM Data0025 D25 ' +
                          ' INNER JOIN CTE ON CTE.RKEY = D25.RKEY ';
  DM.ADOQuery2.ExecSQL;
  Exit;


   with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set Data0025.TSTATUS=Data0025_1.TSTATUS,'+#13+
             'Data0025.CHECK_BY_PTR=Data0025_1.CHECK_BY_PTR,'+#13+
             'Data0025.CHECK_DATE=Data0025_1.CHECK_DATE,'+#13+
             'Data0025.allow_edit_flag=Data0025_1.allow_edit_flag'+#13+
             'FROM dbo.Data0025 INNER JOIN'+#13+
    'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
    'where Data0025_1.RKEY='+inttostr(rkey);
    ExecSQL;
   end;                   //修改第二层子产品字段与父一致

   with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set Data0025.TSTATUS=Data0025_2.TSTATUS,'+#13+
             'Data0025.CHECK_BY_PTR=Data0025_2.CHECK_BY_PTR,'+#13+
             'Data0025.CHECK_DATE=Data0025_2.CHECK_DATE,'+#13+
             'Data0025.allow_edit_flag=Data0025_2.allow_edit_flag'+#13+
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
     'where Data0025_2.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;                   //修改第三层子产品字段与父一致

   with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set Data0025.TSTATUS=Data0025_3.TSTATUS,'+#13+
             'Data0025.CHECK_BY_PTR=Data0025_3.CHECK_BY_PTR,'+#13+
             'Data0025.CHECK_DATE=Data0025_3.CHECK_DATE,'+#13+
             'Data0025.allow_edit_flag=Data0025_3.allow_edit_flag'+#13+
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_3 ON '+#13+
      'Data0025_2.PARENT_PTR = Data0025_3.RKEY '+#13+
     'where Data0025_3.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;                   //修改第四层子产品字段与父一致

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption)
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
if dm.ADOConnection1.Connected then
 begin


 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];

 dm.ADS25.Close;
 dm.ADS25.Parameters.ParamByName('dtpk1').Value:=getsystem_date(dm.adoquery1,1)-30;
 dm.ADS25.Parameters.ParamByName('dtpk2').Value:=getsystem_date(dm.adoquery1,1);
 dm.ADS25.Open;

   sql_text:=tstringlist.Create;
   sql_text.Text := dm.ADS25.CommandText;

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

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then showmessage(dm.ADs25.CommandText);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
 PopupMenu2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.ADs25.IndexFieldNames) then
 dm.ADs25.IndexFieldNames:=column.FieldName;

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

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADs25.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADs25.filter := '';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
rkey:=dm.ads25rKEY.Value;
dm.ADS25.Close;
dm.ADS25.Open;
if rkey>0 then dm.ADS25.Locate('rkey',rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
form_condition.dtpk1.Date:=dm.ADs25.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.ADs25.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin

  sql_text.Delete(31);
  sql_text.Delete(31);
  
  case  form_condition.ComboBox2.ItemIndex of
  0:begin
    sql_text.Insert(31,'where data0025.CUSTPART_ENT_DATE >=:dtpk1 and');
    sql_text.Insert(32,'data0025.CUSTPART_ENT_DATE <=:dtpk2 and');
    end;
  1:begin
    sql_text.Insert(31,'where data0025.LAST_MODIFIED_DATE >=:dtpk1 and');
    sql_text.Insert(32,'data0025.LAST_MODIFIED_DATE-1 <=:dtpk2 and');
    end;
  2:begin
    sql_text.Insert(31,'where data0025.AUDITED_DATE >=:dtpk1 and');
    sql_text.Insert(32,'data0025.AUDITED_DATE <=:dtpk2 and');
    end;
  end;


  dm.ADs25.Close;
  dm.ADs25.CommandText:=sql_text.Text;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.ADs25.CommandText:=dm.ADs25.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  dm.ADs25.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.ADs25.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.ADs25.Open;
 end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
dm.ADS25.Close;
if checkbox1.Checked then
 dm.ADS25.Parameters.ParamValues['v6']:=9
else
 dm.ADS25.Parameters.ParamValues['v6']:=6;

if checkbox2.Checked then
 dm.ADS25.Parameters.ParamValues['v0']:=9
else
 dm.ADS25.Parameters.ParamValues['v0']:=0;

if checkbox3.Checked then
 dm.ADS25.Parameters.ParamValues['v3']:=9
else
 dm.ADS25.Parameters.ParamValues['v3']:=3;

if checkbox4.Checked then
 dm.ADS25.Parameters.ParamValues['v4']:=9
else
 dm.ADS25.Parameters.ParamValues['v4']:=4;

if checkbox5.Checked then
 dm.ADS25.Parameters.ParamValues['v1']:=9
else
 dm.ADS25.Parameters.ParamValues['v1']:=1;

if checkbox6.Checked then
 dm.ADS25.Parameters.ParamValues['v5']:=9
else
 dm.ADS25.Parameters.ParamValues['v5']:=5;

if checkbox7.Checked then
 dm.ADS25.Parameters.ParamValues['v2']:=9
else
 dm.ADS25.Parameters.ParamValues['v2']:=2;

dm.ADS25.Open;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
try
 application.CreateForm(tForm2,Form2);
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
 form2.status.Caption:='1'; //代表检查
 if form2.ShowModal=mrok then
  begin

  end;
finally
 form2.free;
end
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
if dm.AQY0025TSTATUS.Value=dm.ads25TSTATUS.Value then
begin
 form3:=tform3.Create(application);
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select FILE_POINTER,SOURCE_TYPE,memo_text from data0011'+#13+
             'where SOURCE_TYPE=25 and'+#13+
             'FILE_POINTER='+dm.AQY0025RKEY.AsString;
   open;
   if not isempty then
   form3.Memo1.Lines.Text:=fieldbyname('memo_text').AsString;
  end;

 if form3.ShowModal=mrok then
  begin

   if trim(form3.Memo1.Text)<>'' then
    if not dm.ADOQuery1.IsEmpty then
     begin
      dm.ADOQuery1.Edit;
      dm.ADOQuery1.FieldValues['memo_text']:=form3.Memo1.Text;
      dm.ADOQuery1.Post;
     end
    else
     begin
      dm.ADOQuery1.Append;
      dm.ADOQuery1.FieldValues['SOURCE_TYPE']:=25;
      dm.ADOQuery1.FieldValues['FILE_POINTER']:=dm.AQY0025RKEY.Value;
      dm.ADOQuery1.FieldValues['memo_text']:=form3.Memo1.Text;
      dm.ADOQuery1.Post;
     end
   else
    if not dm.ADOQuery1.IsEmpty then
     dm.ADOQuery1.Delete;

   dm.AQY0025.Edit;
   dm.AQY0025CHECK_BY_PTR.Value:=strtoint(user_ptr);
   dm.AQY0025CHECK_DATE.Value:= getsystem_date(dm.adoquery1,0);//长格式
   dm.AQY0025TSTATUS.Value:=4;      //状态变成待审核
   dm.AQY0025.Post;

   self.updatedata0025(dm.AQY0025RKEY.Value);

   bitbtn3click(sender);
   dm.AQY0025.Close;
   dm.ADOQuery1.Close;
   dm.ADOQuery2.Close;
  end;
 form3.Free;
end
else
 messagedlg('状态发生变更不能通过检查!',mtinformation,[mbcancel],0);
end; 
end;

procedure TForm1.N5Click(Sender: TObject);
var
 jt_empl:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
if dm.AQY0025TSTATUS.Value=dm.ads25TSTATUS.Value then
begin
 form3:=tform3.Create(application);
 form3.Caption:='检查退回';
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select FILE_POINTER,SOURCE_TYPE,memo_text,NOTE_PAD_LINE_1 from data0011'+#13+
             'where SOURCE_TYPE=25 and'+#13+
             'FILE_POINTER='+dm.AQY0025RKEY.AsString;
   open;
   if not isempty then
   form3.Memo1.Lines.Text:=fieldbyname('memo_text').AsString;
  end;

 if form3.ShowModal=mrok then
  begin
       // MI退回记录
          DM.qry1.Close;
         DM.qry1.Open;
         dm.qry1.Append;
         DM.qry1.FieldValues['tdatetime']:=getsystem_date(dm.adoquery2,0);
        dm.qry1.FieldValues['ttype']:='检查退回';
        dm.qry1.FieldValues['cust_ptr']:=dm.AQY0025RKEY.Value;
        dm.qry1.FieldValues['NOTE_INFO']:=form3.Memo1.Text;
        dm.qry1.FieldValues['EMPL_PTR']:=user_ptr;
         if  form3.DBCheckBox2.Checked= True  then
           begin
              DM.qry1.FieldValues['ONHOLD_PLANNING_FLAG']:=1;
           end
           else
           begin
              DM.qry1.FieldValues['ONHOLD_PLANNING_FLAG']:=0;
           end;
           if  form3.DBCheckBox3.Checked= True  then
           begin
              DM.qry1.FieldValues['ONHOLD_RELEASE_FLAG']:=1;
           end
           else
           begin
              DM.qry1.FieldValues['ONHOLD_RELEASE_FLAG']:=1;
           end;
           if  form3.DBCheckBox4.Checked= True  then
           begin
              DM.qry1.FieldValues['EDIT_FLAG']:=1;
           end
           else
           begin
             DM.qry1.FieldValues['EDIT_FLAG']:=0;
           end;
         dm.qry1.Post;
         DM.qry1.Close;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Text:='select EMPLOYEE_NAME from data0005 where rkey='+user_ptr;
     open;
     if not IsEmpty then
     jt_empl := fieldbyname('EMPLOYEE_NAME').AsString;
    end;


   jt_empl := jt_empl+'日期:'+ datetimetostr(getsystem_date(dm.adoquery2,0));
   if trim(form3.Memo1.Text)<>'' then
    begin
      if not dm.ADOQuery1.IsEmpty then
       begin
        dm.ADOQuery1.Edit;
        dm.ADOQuery1.FieldValues['memo_text']:=form3.Memo1.Text;
        dm.ADOQuery1.FieldValues['NOTE_PAD_LINE_1']:=jt_empl;
        dm.ADOQuery1.Post;
       end
      else
       begin
        dm.ADOQuery1.Append;
        dm.ADOQuery1.FieldValues['SOURCE_TYPE']:=25;
        dm.ADOQuery1.FieldValues['FILE_POINTER']:=dm.AQY0025RKEY.Value;
        dm.ADOQuery1.FieldValues['memo_text']:=form3.Memo1.Text;
        dm.ADOQuery1.FieldValues['NOTE_PAD_LINE_1']:=jt_empl;
        dm.ADOQuery1.Post;
       end;

     dm.AQY0025.Edit;
     dm.AQY0025ALLOW_EDIT_FLAG.Value:='Y';
     dm.AQY0025TSTATUS.Value:=5;      //状态变成检查退回
     dm.AQY0025.Post;

     self.updatedata0025(dm.AQY0025RKEY.Value);
     bitbtn3click(sender);
     dm.ADOQuery1.Close;
     dm.ADOQuery2.Close;
    end
   else
    messagedlg('备注为空不能退回!',mterror,[mbcancel],0);
  end;

 dm.AQY0025.Close;
 form3.Free;
end
else
 messagedlg('状态发生变更不能检查退回!',mtinformation,[mbcancel],0);
end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
form_reportselect:=tform_reportselect.Create(application);
if form_reportselect.ShowModal=mrok then
 begin
  form_report:=tform_report.Create(application);
  with form_report do
  begin
    ppReport1.Reset;
    ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'Manu_instruction.rtm';   //R:\NIERP\Report\Manu_instruction.rtm
    ppReport1.Template.LoadFromFile;
    ppreport1.SaveAsTemplate:=false;

   ads192.Open;
   ads279.Close;
   ads279.Parameters.ParamValues['rkey']:=dm.ADS25rkey.Value;
   if ads192ENG_CONTROL16.Value=1 then       //不显示为空的全局参数
    ads279.Parameters.ParamValues['value']:=''
   else
    ads279.Parameters.ParamValues['value']:='#@#@#';
   ads279.Open;

   ads25.Close;
   ads25.Parameters[0].Value:=dm.ADS25rkey.Value;
   ads25.Open;
    ads494.Close;
    ads494.Parameters.ParamValues['source_ptr']:=dm.ADS25rkey.Value;
    if ads192ENG_CONTROL2.Value=1 then       //不显示为空的制程参数
     ads494.Parameters.ParamValues['value']:=''
    else
     ads494.Parameters.ParamValues['value']:='#@#@#';
    ads494.Open;

   ads38.Close;
   ads38.Parameters.ParamValues['rkey']:=dm.ADS25rkey.Value;
   if form_reportselect.CheckBox3.Checked then
    ads38.Parameters.ParamValues['visible']:=1
   else
    ads38.Parameters.ParamValues['visible']:=2;
   ads38.Open;
   ads502.Open;
   ads29.Open;
   form_report.ppImage3.Picture.Assign(Load_JPG_Pic_From_DB(ads502DSDesigner));
   if ads502A3.Value>0 then
    form_report.ppimage1.Picture.Assign(Load_JPG_Pic_From_DB(ads502A));
   if ads502B3.Value>0 then
    form_report.ppimage2.Picture.Assign(Load_JPG_Pic_From_DB(ads502B));

    if (not ADS25DSDesigner35.IsNull) and
       (form_reportselect.CheckBox6.Checked) then
     begin
      form_report.ppImage4.Visible:=True;
      form_report.ppImage4.Picture.Assign(Load_JPG_Pic_From_DB(ADS25DSDesigner35));
     end
    else
     form_report.ppImage4.Visible:=False;

   if not form_reportselect.CheckBox1.Checked then
    form_report.ppSubReport1.Visible:=false;
   if not form_reportselect.CheckBox2.Checked then
    form_report.ppSubReport2.Visible:=false;
   if not form_reportselect.CheckBox4.Checked then
   begin
    form_report.ppSubReport3.Visible:=false;
    form_report.ppSubReport6.Visible:=false;
   end;

   if not form_reportselect.CheckBox5.Checked then
    form_report.ppSubReport4.Visible:=false;
  end;

  form_report.ppReport1.Print;
  form_report.Free;
 end;
form_reportselect.Free;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin

  n2.Enabled:=false;    //检查
  n3.Enabled:=false;   //通过
  n4.Enabled:=false;   //取消
  n5.Enabled:=false;   //退回
  n6.Enabled:=false;   //打印
case dm.ADS25TSTATUS.Value of
6:
 begin
  n2.Enabled:=true;
 end;
0:
 begin
  n2.Enabled:=true;

  n6.Enabled:=true;
 end;
3:
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  n5.Enabled:=true;
  n6.Enabled:=true;
 end;
4:
 begin
  n2.Enabled:=true;
  n4.Enabled:=true;
  n6.Enabled:=true;
 end;
1:
 begin
  n2.Enabled:=true;
  n6.Enabled:=true;
 end;
5:
 begin

  n2.Enabled:=true;
  n6.Enabled:=true;
 end;
2:
 begin

  n2.Enabled:=true;
  n6.Enabled:=true;
 end;
end;
if dm.ADS25.IsEmpty then
begin
  n2.Enabled:=false;    //检查
  n3.Enabled:=false;   //通过
  n4.Enabled:=false;   //取消
  n5.Enabled:=false;   //退回
  n6.Enabled:=false;   //打印
end;

end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (dm.ADS25TSTATUS.Value=5) or
    (dm.ADS25TSTATUS.Value=2) then
  DBGrid1.Canvas.Font.Color := clred
 else
  if (dm.ADS25TSTATUS.Value=6) then
   DBGrid1.Canvas.Font.Color := cllime;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;



procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
if dm.AQY0025TSTATUS.Value=dm.ads25TSTATUS.Value then
begin
 form3:=tform3.Create(application);

 form3.Caption:='取消检查';
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select FILE_POINTER,SOURCE_TYPE,memo_text from data0011'+#13+
             'where SOURCE_TYPE=25 and'+#13+
             'FILE_POINTER='+dm.AQY0025RKEY.AsString;
   open;
   if not isempty then
   form3.Memo1.Lines.Text:=fieldbyname('memo_text').AsString;
  end;



 if form3.ShowModal=mrok then
  begin

   if trim(form3.Memo1.Text)<>'' then
    if not dm.ADOQuery1.IsEmpty then
     begin
      dm.ADOQuery1.Edit;
      dm.ADOQuery1.FieldValues['memo_text']:=form3.Memo1.Text;
      dm.ADOQuery1.Post;
     end
    else
     begin
      dm.ADOQuery1.Append;
      dm.ADOQuery1.FieldValues['SOURCE_TYPE']:=25;
      dm.ADOQuery1.FieldValues['FILE_POINTER']:=dm.AQY0025RKEY.Value;
      dm.ADOQuery1.FieldValues['memo_text']:=form3.Memo1.Text;
      dm.ADOQuery1.Post;
     end
   else
    if not dm.ADOQuery1.IsEmpty then
     dm.ADOQuery1.Delete;
     
   dm.AQY0025.Edit;
   dm.AQY0025CHECK_BY_PTR.AsVariant:=null;
   dm.AQY0025CHECK_DATE.AsVariant :=null;
   dm.AQY0025TSTATUS.Value:=3;      //状态变成待检查
   dm.AQY0025.Post;

   self.updatedata0025(dm.AQY0025RKEY.Value);
   bitbtn3click(sender);
   dm.AQY0025.Close;
   dm.ADOQuery1.Close;
   dm.ADOQuery2.Close;

  end;
 form3.Free;
end
else
 messagedlg('状态发生变更不能取消检查!',mtinformation,[mbcancel],0);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;

  self.caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.N7Click(Sender: TObject);
var
  LFrm: TfrmMITree;
  LRkey,LBackNote: string;
  lsql: string;
  I: Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;

  LFrm := TfrmMITree.Create(Self);
  try
    LFrm.CreateTreeWithTopMiRkey25(DM.ADS25.fieldbyname('rkey').AsInteger);
    for I := 0 to Length(LFrm.FNodeArr) - 1 do
    begin
      case LFrm.FNodeArr[I].d25status of
        0,6,5: LFrm.FNodeArr[I].lockedcheck := 0;
        1,2,4: LFrm.FNodeArr[I].lockedcheck := 1;
        3: LFrm.FNodeArr[I].lockedcheck := -1;
      end;

    end;
    
    if LFrm.ShowModal = mrOK then
    begin
      LRkey := LFrm.GetCheckRkey25;
      for I := 0 to Length(LFrm.FNodeArr) - 1 do
      begin
        if LFrm.IsNodeChecked(LFrm.FNodeArr[I].Node) then
          LBackNote := LBackNote + LFrm.FNodeArr[I].Node.Text + ' , ';
      end;

      DM.ADOConnection1.BeginTrans;
      try
        //日志更新
        if not DM.SqlOpen(' select EMPLOYEE_NAME, getdate() as dttime from data0005 where rkey= ' + user_ptr) then Exit;
        LBackNote := DM.qryTmp.fieldbyname('EMPLOYEE_NAME').AsString + ' 日期：' + DM.qryTmp.fieldbyname('dttime').AsString +  ' 分层通过MI检查：' + LBackNote;
        lsql := 'insert into data0011(SOURCE_TYPE,FILE_POINTER,NOTE_PAD_LINE_1) ' +
                ' values(25,' + dm.ADS25rkey.AsString + ',' + QuotedStr(LBackNote) + ')';
        if not DM.SqlExec(lsql) then Exit;

        //提交层次
        lsql := ' update data0025 set TSTATUS = 4, CHECK_BY_PTR = ' + user_ptr;
        if LFrm.cbxyxbj.Checked then
          lsql := lsql + ' ,ALLOW_EDIT_FLAG = ''Y'''
        else
          lsql := lsql + ' ,ALLOW_EDIT_FLAG = ''N''';
        lsql := lsql + ' ,ONHOLD_RELEASE_FLAG = ' + IntToStr(Ord(LFrm.cbxgdfczh.Checked)) +
                ' ,ONHOLD_PLANNING_FLAG = ' + IntToStr(Ord(LFrm.cbxtczh.Checked)) +
                ' ,ONHOLD_SALES_FLAG = ' + IntToStr(LFrm.rgxgyx.ItemIndex) +
                ' ,CHECK_DATE = getdate() where rkey in ' + LRkey +
                ' and TSTATUS in (3)';
        if not DM.SqlExec(lsql) then Exit;
        
        DM.ADOConnection1.CommitTrans;
        ShowMessage('操作成功');
      finally
        if DM.ADOConnection1.InTransaction then
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('提交失败');
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
var
  LFrm: TfrmMITree;
  LRkey,LBackNote: string;
  lsql: string;
  I: Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;

  LFrm := TfrmMITree.Create(Self);
  try
    LFrm.CreateTreeWithTopMiRkey25(DM.ADS25.fieldbyname('rkey').AsInteger);
    for I := 0 to Length(LFrm.FNodeArr) - 1 do
    begin
      case LFrm.FNodeArr[I].d25status of
        0,3,6,5,1,2: LFrm.FNodeArr[I].lockedcheck := 0;
        //1,2: LFrm.FNodeArr[I].lockedcheck := 1;
        4: LFrm.FNodeArr[I].lockedcheck := -1;
      end;

    end;
    
    if LFrm.ShowModal = mrOK then
    begin
      LRkey := LFrm.GetCheckRkey25;
      for I := 0 to Length(LFrm.FNodeArr) - 1 do
      begin
        if LFrm.IsNodeChecked(LFrm.FNodeArr[I].Node) then
          LBackNote := LBackNote + LFrm.FNodeArr[I].Node.Text + ' , ';
      end;

      DM.ADOConnection1.BeginTrans;
      try
        //日志更新
        if not DM.SqlOpen(' select EMPLOYEE_NAME, getdate() as dttime from data0005 where rkey= ' + user_ptr) then Exit;
        LBackNote := DM.qryTmp.fieldbyname('EMPLOYEE_NAME').AsString + ' 日期：' + DM.qryTmp.fieldbyname('dttime').AsString +  ' 分层取消MI检查：' + LBackNote;
        lsql := 'insert into data0011(SOURCE_TYPE,FILE_POINTER,NOTE_PAD_LINE_1) ' +
                ' values(25,' + dm.ADS25rkey.AsString + ',' + QuotedStr(LBackNote) + ')';
        if not DM.SqlExec(lsql) then Exit;

        //提交层次
        lsql := ' update data0025 set TSTATUS = 3, CHECK_BY_PTR = null ';
        if LFrm.cbxyxbj.Checked then
          lsql := lsql + ' ,ALLOW_EDIT_FLAG = ''Y'''
        else
          lsql := lsql + ' ,ALLOW_EDIT_FLAG = ''N''';
        lsql := lsql + ' ,ONHOLD_RELEASE_FLAG = ' + IntToStr(Ord(LFrm.cbxgdfczh.Checked)) +
                ' ,ONHOLD_PLANNING_FLAG = ' + IntToStr(Ord(LFrm.cbxtczh.Checked)) +
                ' ,ONHOLD_SALES_FLAG = ' + IntToStr(LFrm.rgxgyx.ItemIndex) +
                ' ,CHECK_DATE = null where rkey in ' + LRkey +
                ' and TSTATUS in (4)';
        if not DM.SqlExec(lsql) then Exit;
        
        DM.ADOConnection1.CommitTrans;
        ShowMessage('操作成功');
      finally
        if DM.ADOConnection1.InTransaction then
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('提交失败');
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.N9Click(Sender: TObject);
var
  LFrm: TfrmMITree;
  LRkey,LBackNote: string;
  lsql: string;
  I: Integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;

  LFrm := TfrmMITree.Create(Self);
  try
    LFrm.CreateTreeWithTopMiRkey25(DM.ADS25.fieldbyname('rkey').AsInteger);
    for I := 0 to Length(LFrm.FNodeArr) - 1 do
    begin
      case LFrm.FNodeArr[I].d25status of
        0,6,1,2,4,5: LFrm.FNodeArr[I].lockedcheck := 0;
        //: LFrm.FNodeArr[I].lockedcheck := 1;
        3: LFrm.FNodeArr[I].lockedcheck := -1;
      end;

    end;
    
    if LFrm.ShowModal = mrOK then
    begin
      LRkey := LFrm.GetCheckRkey25;
      for I := 0 to Length(LFrm.FNodeArr) - 1 do
      begin
        if LFrm.IsNodeChecked(LFrm.FNodeArr[I].Node) then
          LBackNote := LBackNote + LFrm.FNodeArr[I].Node.Text + ' , ';
      end;

      DM.ADOConnection1.BeginTrans;
      try
        //日志更新
        if not DM.SqlOpen(' select EMPLOYEE_NAME, getdate() as dttime from data0005 where rkey= ' + user_ptr) then Exit;
        LBackNote := DM.qryTmp.fieldbyname('EMPLOYEE_NAME').AsString + ' 日期：' + DM.qryTmp.fieldbyname('dttime').AsString +  ' 分层退回MI检查：' + LBackNote;
        lsql := 'insert into data0011(SOURCE_TYPE,FILE_POINTER,NOTE_PAD_LINE_1) ' +
                ' values(25,' + dm.ADS25rkey.AsString + ',' + QuotedStr(LBackNote) + ')';
        if not DM.SqlExec(lsql) then Exit;

        //提交层次
        lsql := ' update data0025 set TSTATUS = 5, CHECK_BY_PTR = null ' ;
        if LFrm.cbxyxbj.Checked then
          lsql := lsql + ' ,ALLOW_EDIT_FLAG = ''Y'''
        else
          lsql := lsql + ' ,ALLOW_EDIT_FLAG = ''N''';
        lsql := lsql + ' ,ONHOLD_RELEASE_FLAG = ' + IntToStr(Ord(LFrm.cbxgdfczh.Checked)) +
                ' ,ONHOLD_PLANNING_FLAG = ' + IntToStr(Ord(LFrm.cbxtczh.Checked)) +
                ' ,ONHOLD_SALES_FLAG = ' + IntToStr(LFrm.rgxgyx.ItemIndex) +
                ' ,CHECK_DATE = null where rkey in ' + LRkey +
                ' and TSTATUS in (3)';
        if not DM.SqlExec(lsql) then Exit;
        
        DM.ADOConnection1.CommitTrans;
        ShowMessage('操作成功');
      finally
        if DM.ADOConnection1.InTransaction then
        begin
          DM.ADOConnection1.RollbackTrans;
          ShowMessage('提交失败');
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

end.

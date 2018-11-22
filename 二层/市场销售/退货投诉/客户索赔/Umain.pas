unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, ComCtrls,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,DB,
  ppReport;

type
  TForm_main = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Panel4: TPanel;
    DBGridEh2: TDBGridEh;
    N8: TMenuItem;
    N9: TMenuItem;
    BitBtn5: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel5: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    BitBtn7: TBitBtn;
    N10: TMenuItem;
    BitBtn8: TBitBtn;
    N11: TMenuItem;
    N13: TMenuItem;
    PopupMenu2: TPopupMenu;
    N12: TMenuItem;
    N14: TMenuItem;
    DBGridEh3: TDBGridEh;
    N15: TMenuItem;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
//    procedure BitBtn5Click(Sender: TObject);
  private
  sSql, sqlmx,ssql1:string;
     PreColumn: TColumnEh;
    procedure checkform ;
    procedure insert_data099(rkey:integer;quantity_:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses Udemo,common, Unusual, Uadd, Uspzt, Unit2, Usel, Uhelp, Unit4,
  Uweixin, Uresponsibility;

{$R *.dfm}

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssCtrl in Shift) and (Key=46 ) then Key := 0;
 if (key=VK_Insert)then
 begin
  KEY:=0;
  Shift:=[];
 end;
 if (chr(key)='V') and (ssalt in shift) then
 showmessage(dm.ado597.CommandText);
 
end;

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;

end;

procedure TForm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssCtrl in Shift) and (Key=46 ) then Key := 0;
 if (key=VK_Insert)then
 begin
  KEY:=0;
  Shift:=[];
 end;
 if (chr(key)='V') and (ssalt in shift) then
 showmessage(dm.ado609.CommandText);
end;

procedure TForm_main.BitBtn3Click(Sender: TObject);
begin
 DM.ADO597.Close;
 DM.ADO597.Open;
 DM.ADO597AfterScroll(DM.ADO597);
end;

procedure TForm_main.BitBtn6Click(Sender: TObject);
begin
if strtoint(vprev)<>4 then
 begin
 messagedlg('对不起!您没有该功能权限',mtinformation,[mbok],0);
 Exit;
 end;
 Application.CreateForm(TFrm_Unusual,Frm_Unusual);
 Frm_Unusual.ShowModal;
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
//  dm.ADOConnection1.Open;
//  rkey73:= '3687';
//  user_ptr:='4330';
//  vprev:= '2';

end;

procedure TForm_main.N1Click(Sender: TObject);
var statusa :Integer;
begin
 if(StrToInt(vprev)<>4)and(StrToInt(vprev)<>2) then
 begin
  messagedlg('对不起!您没有该程序的新建权限',mtinformation,[mbok],0);
  Exit;
 end;
 try
  Form_add:= TForm_add.Create(Application);
  statusa:=  DM.ADO597ststusr.Value;
  Form_add.Memo1.Enabled :=  StrToInt(vprev) in[2,4] ;
  Form_add.Memo2.Enabled := StrToInt(vprev) in[3,4] ;
  Form_add.status := 1;
  if Form_add.ShowModal=mrok then
  begin
   dm.ADo597.Close;
   dm.ADo597.Prepared;
   dm.ADo597.Open;
   dm.ADo597.Locate('rkey',Form_add.rkey600,[]);
  end;
 finally

  Form_add.free;
 end;
end;

procedure TForm_main.PopupMenu1Popup(Sender: TObject);
begin
 if DM.ADO597.IsEmpty then
 begin
  N2.Enabled:=False;
  N3.Enabled:=False;
  N4.Enabled:=False;
  N6.Enabled:=False;
  N7.Enabled:=False;
  //N8.Enabled:=False;
  N10.Enabled:=False;
 end
 else N3.Enabled:=True;
 N4.Enabled:=(DM.ADO597ststusr.Value=1) or (DM.ADO597ststusr.Value=4);
 N2.Enabled:=(DM.ADO597ststusr.Value=1) or (DM.ADO597ststusr.Value=4);
 N6.Enabled:=(DM.ADO597ststusr.Value=2) or (DM.ADO597ststusr.Value=4);
 N7.Enabled:=(DM.ADO597ststusr.Value=1) or (DM.ADO597ststusr.Value=4);
 n10.Enabled:= vprev='4';

end;

procedure TForm_main.FormShow(Sender: TObject);
begin
 sqlmx:=DM.ADODSmx.CommandText;
 PreColumn := DBGridEh1.Columns[0];
 DM.ADO597.Open;
 ssql1:=DM.ADO597.CommandText;

 DateTimePicker1.Date:=date-30;
 DateTimePicker2.Date:=date+2;
 DM.ADO597.Close;
 if StrToInt(vprev)=2 then
 begin
  DM.ADO597.CommandText:= DM.ADO597.CommandText+' and rkey73= '+ QuotedStr( rkey73);
 end;
 sSql:=DM.ADO597.CommandText ;
 DM.ADO597.Parameters[4].Value:=FormatDateTime('YYYY/MM/DD',DateTimePicker1.Date);
 DM.ADO597.Parameters[5].Value:=FormatDateTime('YYYY/MM/DD',DateTimePicker2.Date);
 DM.ADO597.Open;
 DateTimePicker1.Visible:=False;
 DateTimePicker2.Visible:=False;
 CheckBox3.Checked:=False;
 checkform();


end;

procedure TForm_main.N9Click(Sender: TObject);
begin
 try
  Form1:= TForm1.Create(Application);
  if Form1.ShowModal=mrok then

   finally
     Form1.Free;
     
     end;
end;

procedure TForm_main.N2Click(Sender: TObject);
var statusa :Integer;
begin
 if(StrToInt(vprev)=1) then
 begin
  messagedlg('对不起!您没有该程序的编辑权限',mtinformation,[mbok],0);
  Exit;
 end;

// with DM.ADOQuery2 do
// begin
//  Close;
//  SQL.Text := ' select rkey597 from data0609  WHERE rkey597= '+ IntToStr(DM.ADO597rkey.Value);
//  Open;
// end;
// if (not DM.ADOQuery2.IsEmpty) and((StrToInt(vprev)=2)) then
// begin
//  ShowMessage('客诉已经导入明细,不允许修改!');
//  exit;
// end ;

 try
  Form_add:= TForm_add.Create(Application);
  statusa:=  DM.ADO597ststusr.Value;
  Form_add.Memo1.Enabled := ((statusa = 1) or (statusa = 4)) and ( StrToInt(vprev) in[2,4]) ;
  Form_add.Memo2.Enabled := ((statusa = 1) or (statusa = 4)) and ( StrToInt(vprev) in[3,4]) ;  
  Form_add.status := 2;
  DM.edit597.Close;
  DM.edit597.Parameters[0].Value := DM.ADO597rkey.Value;
  DM.edit597.Open;
  if Form_add.ShowModal=mrok then
  begin
   dm.ADo597.Close;
   dm.ADo597.Open;
   dm.ADo597.Locate('rkey',Form_add.rkey600,[]);
   
  end;
 finally
  Form_add.free;
 end;

end;

procedure TForm_main.N3Click(Sender: TObject);
begin
 try
  Form_add:= TForm_add.Create(Application);
  Form_add.status := 3;
  Form_add.N7.Enabled:=False;
  Form_add.N8.Enabled:=False;
  DM.edit597.Close;
  DM.edit597.Parameters[0].Value := DM.ADO597rkey.Value;
  DM.edit597.Open;
  if Form_add.ShowModal=mrok then
  begin
   dm.ADo597.Close;
   dm.ADo597.Open;
  

  end;
 finally
  Form_add.free;
 end;

end;

procedure TForm_main.N4Click(Sender: TObject);
var i :Integer;
 dx:string;
begin
 if(StrToInt(vprev)<>4)and(StrToInt(vprev)<>3) then
 begin
  messagedlg('对不起!需要客诉人员提交',mtinformation,[mbok],0);
  Exit;
 end;
  with DM.ADOQuery2 do
  begin
   Close;
   SQL.Text := ' select rkey597 from data0609  WHERE rkey597= '+ IntToStr(DM.ADO597rkey.Value);
   Open;
  end;
  if  DM.ADOQuery2.IsEmpty then
  begin
   ShowMessage('请导入明细后提交!');
   exit;
  end ;

  with DM.ADOQuery2 do
  begin
   Close;
   SQL.Text := ' SELECT  rkey597 FROM data0599 where rkey597= '+ IntToStr(DM.ADO597rkey.Value);
   Open;
  end;
  if not DM.ADOQuery2.IsEmpty then
  begin
   with DM.ADOQuery3 do
   begin
    Close;
    SQL.Text := ' DELETE data0599 WHERE rkey597= '+ inttostr(DM.ADO597rkey.Value);
    ExecSQL;
   end;
  end ;
  insert_data099(DM.ADO597rkey.Value,DM.ado597v_ttype.value);

   dx:=' (*＾-＾*) 客户品质索赔申请需要您审批.索赔编号 : '+dm.ADO597spNumber.Value+'. 申请人:'+dm.ADO597USER_FULL_NAME.Value+' 数量: '+dm.ADO597Number.AsString+' 金额: '+dm.ADO597spmoney.AsString +'币种:'+dm.ADO597CURR_NAME.Value;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT mark, rkey597, rkey73, seq_no FROM  dbo.data0599 where rkey597='+quotedstr(DM.ADO597rkey.AsString));
  SQL.Add('order by seq_no');
  Open;
 end;
 dm.ADOQuery1.First;
 while not dm.ADOQuery1.Eof do
 begin
  if DM.ADOQuery1.FieldByName('seq_no').Value=1 then
  begin

   with DM.ADOQuery2 do
   begin
    Close;
    SQL.Text:='UPDATE data0599 SET mark=1 WHERE rkey597= '+ QuotedStr(dm.ADO597rkey.AsString)+' and rkey73= '+ QuotedStr(dm.ADOQuery1.fieldbyname('rkey73').AsString);
    ExecSQL;
    Close;
    sql.clear;
    SQL.Add('declare @classid as int');
    SQL.Add('INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES('+ QuotedStr( dx)+',GETDATE(),'+rkey73+')'+'select @classid=@@identity');
    SQL.Add('INSERT INTO data0314(emp_ptr,d14_ptr)VALUES('+dm.ADOQuery1.fieldbyname('rkey73').AsString+','+ '@classid'+')');
    ExecSQL;
   end;
  end;

  i:=DM.ADO597rkey.Value;
  DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:=' UPDATE data0597 SET status=2 ,submit_date=GETDATE() WHERE rkey='+dm.ADO597rkey.AsString;
  DM.ADOQuery1.ExecSQL;
  BitBtn3Click(Sender);
  dm.ADo597.Locate('rkey',i,[]);
 end;
end;

procedure TForm_main.N6Click(Sender: TObject);
var i:Integer;
begin
 if(StrToInt(vprev)<>4)and(StrToInt(vprev)<>3) then
 begin
  messagedlg('对不起!您没有该程序取消提交权限',mtinformation,[mbok],0);
  Exit;
 end;
  with DM.ADOQuery1 do
  begin
   Close;
   SQL.Text:=' select * from data0599  WHERE auth_date IS not NULL  AND rkey597='+dm.ADO597rkey.AsString;
   Open;
   if not DM.ADOQuery1.IsEmpty then
   begin
     ShowMessage('已经有人员审核,不能取消提交!');
     exit;
   end;
   Close;
   SQL.Text:=' UPDATE data0597 SET status=1 WHERE rkey='+dm.ADO597rkey.AsString;
   ExecSQL;
  end;
   i:=DM.ADO597rkey.Value;
   BitBtn3Click(Sender);
   dm.ADo597.Locate('rkey',i,[]);
end;

procedure TForm_main.N7Click(Sender: TObject);
begin
 if(StrToInt(vprev)<>4)and(StrToInt(vprev)<>2) then
 begin
  messagedlg('对不起!您没有该程序删除权限',mtinformation,[mbok],0);
  Exit;
 end;
 if messagedlg('确认删除?',mtconfirmation,[mbyes,mbno],1)<>mryes then exit
 else

  with DM.ADOQuery1 do
  begin
   DM.ADOQuery1.Close;
   DM.ADOQuery1.SQL.Text:='DELETE data0597 WHERE  rkey='+dm.ADO597rkey.AsString;
   DM.ADOQuery1.ExecSQL;
  end;
  BitBtn3Click(Sender);
  DM.ADO597AfterScroll(DM.ADO597);
end;



procedure TForm_main.insert_data099(rkey: integer; quantity_: string);
begin
 with DM.ADOQuery3 do
 begin
  Close;
  SQL.Text := 'INSERT INTO data0599(rkey597,rkey73,seq_no) SELECT '+ IntToStr(rkey) +',rkey73, seq_no FROM Data0608  WHERE v_ttype= '+ QuotedStr(quantity_);
  ExecSQL;
 end;
end;

procedure TForm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DM.ADO597ststusr.Value = 2 then
    DBGrideh1.Canvas.Font.Color := clGreen;
  if dm.ADO597ststusr.value = 3 then
    DBGrideh1.Canvas.Font.Color := clBlue;
  if dm.ADO597ststusr.value = 4 then
    DBGrideh1.Canvas.Font.Color := clRed;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);


end;

procedure TForm_main.N8Click(Sender: TObject);
begin
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ado597.close;
  Form_Report.ado597.Parameters[0].Value:=DM.ADO597rkey.Value;
  Form_Report.ado597.open;
  Form_Report.ado609.close;
  Form_Report.ado609.Parameters[0].Value:=DM.ADO597rkey.Value;
  Form_Report.ado609.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  '597.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  Form_Report.free;
end;

procedure TForm_main.BitBtn4Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
 if Form_sel.ShowModal=mrok then
 begin
  DBGrideh1.FooterRowCount:=0;
  DM.ADO597.Close;
  DM.ADO597.Parameters[4].Value:=FormatDateTime('YYYY/MM/DD',Form_sel.DateTimePicker1.Date);
  DM.ADO597.Parameters[5].Value:=FormatDateTime('YYYY/MM/DD',Form_sel.DateTimePicker2.Date);
  with Form_sel do
  begin
   for i:=1 to StringGrid1.RowCount-2 do
   if StringGrid1.cells[2,i]<>'' then  Sqlstr :=Sqlstr+StringGrid1.cells[2,i];
   DM.ADO597.CommandText:=sSql+sqlstr;
   DM.ADO597.Open;
  end;
 end;
 DM.ADO597AfterScroll(DM.ADO597);
end;
 
procedure TForm_main.CheckBox1Click(Sender: TObject);
begin
 checkform();
end;

procedure TForm_main.checkform;
begin
   dm.ADO597.Close;
  if not checkbox1.Checked then
   dm.ADO597.Parameters[0].Value:=1
  else
   dm.ADO597.Parameters[0].Value:=0;
  if not checkbox2.Checked then
   dm.ADO597.Parameters[1].Value:=2
  else
   dm.ADO597.Parameters[1].Value:=0;
  if not checkbox3.Checked then
   dm.ADO597.Parameters[2].Value:=3
  else
   dm.ADO597.Parameters[2].Value:=0;
  if not checkbox4.Checked then
   dm.ADO597.Parameters[3].Value:=4
  else
   dm.ADO597.Parameters[3].Value:=0;
   dm.ADO597.Prepared;
   DM.ADO597.open;
   if DM.ADO597.IsEmpty then DM.ADO609.Close;

end;

procedure TForm_main.BitBtn5Click(Sender: TObject);
begin
 try
  form3:= Tform3.Create(Application);
  if form3.ShowModal=mrok then
  begin

  end;
 finally

  form3.free;
 end;
end;

procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADO597.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADO597.Sort:=Column.FieldName+' DESC';
  end;


 if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label4.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_main.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';

end;

procedure TForm_main.BitBtn2Click(Sender: TObject);
var
  p: TPoint;
begin
  GetCursorPos(p);
  PopupMenu2.Popup(p.x ,p.y);
end;

procedure TForm_main.BitBtn7Click(Sender: TObject);
begin
 Form4:=TForm4.Create(Application);
 if Form4.ShowModal=Mrok then Form4.Free;
 DM.ADOhz.Close;

end;

procedure TForm_main.N10Click(Sender: TObject);
begin
 Form_Report:=TForm_Report.Create(application);
 Form_Report.ppReport1.Reset;
 Form_Report.ppReport1.Template.FileName:= StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  '597.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=True;
  Form_Report.ppDesigner1.ShowModal;

end;

procedure TForm_main.BitBtn8Click(Sender: TObject);
begin
 form5:=TForm5.Create(Application);
 Form5.ShowModal;
 Form5.Free;
end;

procedure TForm_main.N11Click(Sender: TObject);
begin

 if DM.ADO597ststusr.Value<>3 then
 begin
   ShowMessage('审批完成才可以打印');
   exit;
 end;
  Form_Report:=TForm_Report.Create(application);
  Form_Report.ado597.close;
  Form_Report.ado597.Parameters[0].Value:=DM.ADO597rkey.Value;
  Form_Report.ado597.open;
  Form_Report.ado599.close;
  Form_Report.ado599.Parameters[0].Value:=DM.ADO597rkey.Value;
  Form_Report.ado599.open;
  Form_Report.ppReport1.Reset;
  Form_Report.ppReport1.Template.FileName :=
  StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
  '597qd.rtm';
  Form_Report.ppReport1.Template.LoadFromFile;
  Form_Report.ppReport1.SaveAsTemplate:=false;
  Form_Report.ppReport1.OutlineSettings.Enabled:=False;
  Form_Report.ppReport1.Print;
  N8Click(Sender);
end;

procedure TForm_main.N13Click(Sender: TObject);
begin
begin
 try
  Form4:=TForm4.Create(Application);
  with DM.ADOhz do
  begin
   Close;
   SQL.Text:='SELECT  YEAR(spmonth)*100+month(spmonth) as 月份,Number25 as 本厂编号,SUM(spUnitPrice ) '+
                     'as 金额 FROM data0609 WHERE rkey597= '+dm.ADO597rkey.AsString+ 'GROUP BY YEAR(spmonth)*100+month(spmonth), '+
                     ' Number25 ORDER BY YEAR(spmonth)*100+month(spmonth) ';
   Open;
   Form4.BitBtn1.Enabled:=False;
  end;
  if Form4.ShowModal=Mrok then
 finally
  Form4.Free;
 end;
end;
end;

procedure TForm_main.N12Click(Sender: TObject);
begin
 if DM.ado597.IsEmpty then exit;
 Export_dbGridEH_to_Excel(DBGridEh1,'品质索赔申请')
end;

procedure TForm_main.N14Click(Sender: TObject);
var where,wherea:string;
begin
 if DM.ADO597.IsEmpty then Exit;
 DM.ADO597.First;
 while not DM.ADO597.Eof do
 begin
  where:=where+dm.ADO597rkey.AsString+',';
  DM.ADO597.Next;
 end;
 wherea:=Copy(where,1,Length(where)-1);
 DM.ADODSmx.Close;
 DM.ADODSmx.CommandText:= sqlmx+ wherea+')';
 DM.ADODSmx.Open;

 Export_dbGridEH_to_Excel(DBGridEh3,'品质索赔申请明细') ;
end;
procedure TForm_main.N15Click(Sender: TObject);
begin
 Form_FT:=TForm_FT.Create(Application);
 dm.adoft.close;
 DM.adoft.Parameters[0].Value:=DM.ADO597rkey.Value;
 DM.adoft.open;
 Form_FT .ShowModal;
end;

end.



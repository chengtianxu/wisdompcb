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
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    N6: TMenuItem;
    ComboBox1: TComboBox;
    Label2: TLabel;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    nN5: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure nN5Click(Sender: TObject);

  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
   sqltxt:tstringlist;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, term, product_MIDetail, 
  report_data, reportselect, note_information, DB, ADODB;

{$R *.dfm}

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
  dm.ADS25.Parameters.ParamByName('dtpk2').Value:=getsystem_date(dm.adoquery1,1)+1;
  dm.ADS25.Prepared;
  dm.ADS25.Open;

  sqltxt := tstringlist.Create;
  sqltxt.Text := dm.ADS25.CommandText;

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

if (column.Field.DataType in [ftString]) and (field_name<>column.FieldName) then
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
dm.ADs25.Prepared;
dm.ADS25.Open;
if rkey>0 then dm.ADS25.Locate('rkey',rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
form_condition.dtpk1.Date:=dm.ADs25.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.ADs25.Parameters.ParamValues['dtpk2']-1;
if form_condition.ShowModal=mrok then
 begin
  dm.ADs25.Close;
  dm.ADs25.CommandText:=sqltxt.Text;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.ADs25.CommandText:=dm.ADs25.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  dm.ADs25.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.ADs25.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date+1;
  dm.ADS25.Prepared;
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
dm.ADS25.Prepared;
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
   ads494.Parameters.ParamValues['source_ptr'] := dm.ADS25rkey.Value;
   if ads192ENG_CONTROL2.Value=1 then  //不显示为空的制程参数
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
  n6.Enabled:=dm.ADS25TSTATUS.Value=1;
  n3.Enabled := dm.ADS25TSTATUS.Value=1;
  N4.Enabled:=dm.ADS25TSTATUS.Value=1;
if dm.ADS25.IsEmpty then
begin
  n1.Enabled:=false;
  n2.Enabled:=false;    //检查
end
else
 begin
  n1.Enabled:=True;
  n2.Enabled:=true;
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



procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
 if not dm.ADS25.IsEmpty then
 n2click(sender);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  sql_text:tstringlist;
begin
 sql_text:=tstringlist.Create;
 sql_text.Text := dm.ADS25.CommandText;

 sql_text.Delete(sqltxt.Count -1);
 sqltxt.Delete(sqltxt.Count -1);

if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 begin
  sql_text.Insert(sqltxt.Count,'and  data0025.ONHOLD_SALES_FLAG = '+inttostr(combobox1.ItemIndex));
  sqltxt.Insert(sqltxt.Count,'and  data0025.ONHOLD_SALES_FLAG = '+inttostr(combobox1.ItemIndex));
 end
else
 begin
  sql_text.Insert(sql_text.Count,'');
  sqltxt.Insert(sqltxt.Count,'');
 end;
 dm.ADS25.Close;
 dm.ADS25.CommandText:=sql_text.Text;
 dm.ADs25.Prepared;
 dm.ADS25.open;
 sql_text.Free;
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

// rkey73:='1752';
// user_ptr := '1752';
// vprev := '4';
end;

procedure TForm1.N1Click(Sender: TObject);
begin
form11:=tform11.Create(application);
form11.Caption := dm.ADS25MANU_PART_NUMBER.Value+':变更记录';
with dm.ADOQuery2 do
 begin
  close;
  sql.Clear;
  sql.Add('select user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, ');
  sql.Add('FROM_STRING,TO_STRING,file_number');
  sql.Add('from data0318 inner join data0073 on');
  sql.Add('data0318.user_ptr=data0073.rkey');
  sql.Add('where CUSTOMER_PART_PTR='+dm.ADS25rkey.AsString);
  open;
 end;
while not dm.ADOQuery2.Eof do
 begin
  form11.Memo1.Lines.Add(dm.ADOQuery2.fieldbyname('trans_date').AsString+
  ' 系统用户:'+dm.ADOQuery2.fieldbyname('user_id').AsString+' '+
  dm.ADOQuery2.fieldbyname('user_full_name').AsString+
  dm.ADOQuery2.fieldbyname('TRANS_DESCRIPTION').AsString);
  form11.Memo1.Lines.Add(' 原值: '+dm.ADOQuery2.fieldbyname('from_string').AsString+
  ' 变更后: '+dm.ADOQuery2.fieldbyname('to_string').AsString+
  '   关联文件号:'+dm.ADOQuery2.fieldbyname('file_number').AsString);

  dm.ADOQuery2.Next;
 end;
form11.ShowModal;
form11.Free;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if (StrToInt(vprev)=2) or (StrToInt(vprev)=4) then
try
 application.CreateForm(tForm2,Form2);
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
 form2.status.Caption:='1'; //代表检查
 Form2.BitBtn1.Enabled := True;
 Form2.BitBtn11.Enabled := True;
 Form2.FMode := 1;
 if form2.ShowModal=mrok then
  begin

  end;
finally
 form2.free;
end
else
 ShowMsg('您无权限编辑钻孔研磨次数及数量!',1);
end;


procedure TForm1.N4Click(Sender: TObject);
begin
  if (StrToInt(vprev)=2) or (StrToInt(vprev)=4) then
  try
   application.CreateForm(tForm2,Form2);
   dm.AQY0025.Close;
   dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
   dm.AQY0025.Open;
//   form2.status.Caption:='1'; //代表检查
   Form2.BitBtn1.Enabled := True;
   Form2.BitBtn11.Enabled := True;
   Form2.EMode:=1;//编辑制作信息表
   if form2.ShowModal=mrok then
    begin

    end;
  finally
   form2.free;
  end
  else
   ShowMsg('您无权限编辑产品制作信息附件存储表!',1);
end;

procedure TForm1.nN5Click(Sender: TObject);
begin
 with dm.ADOQuery1 do
 begin
  close;
   sql.Text:='select FILE_POINTER,SOURCE_TYPE,memo_text,NOTE_PAD_LINE_1 from data0011'+#13+
             'where SOURCE_TYPE=25 and'+#13+
             'FILE_POINTER='+dm.ADS25rkey.AsString;
  open;
  if not isempty then
  messagedlg('备注如下:'+#13+fieldbyname('memo_text').AsString+#13+
                             fieldbyname('NOTE_PAD_LINE_1').AsString,
                             mtinformation,[mbok],0);
 end;
end;

end.

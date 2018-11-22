unit Main_Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainTem_Unit1, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls, DB, ADODB;

type
  TMainTemForm2 = class(TMainTemForm1)
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Temp_DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    vs3:string;
    procedure MenuItemClick(Sender: TObject);

  public
    { Public declarations }
    
  end;

var
  MainTemForm2: TMainTemForm2;

implementation

uses
   DMUnit1,IF_Unit1
   ,common;
{$R *.dfm}

procedure TMainTemForm2.FormShow(Sender: TObject);
var
  vn2:array of TMenuItem;
  i,n:integer;
begin
  inherited;
  //showmessage(self.db_ptr+' : '+db_ptr);
  {if not dm.ADOConnection1.Connected then
      begin
           if db_ptr = '' then
               begin
                   showmessage('连接出错，请在主程序下运行程序');
                   close;
               end;
           dm.ADOConnection1.ConnectionString := db_ptr;
      end
  else
  begin
    showmessage('连接出错，请与程序员联系');
    close;
  end;
  {}

  n:=Temp_DBGridEh1.Columns.Count-1  ;
  //showmessage(inttostr(n));
  setlength(vn2,n+1);
  for i:=0 to n do
  begin
    vn2[i]:=TMenuItem.Create(PopupMenu2) ;
    vn2[i].Name :=trim(Temp_DBGridEh1.Name)+'_'+inttostr(i);
    vn2[i].Caption := Temp_DBGridEh1.Columns[i].Title.Caption;
    vn2[i].OnClick := MenuItemClick;
    vn2[i].Checked :=true;
    PopupMenu2.Items.Add(vn2[i]) ;
  end;
end;

procedure TMainTemForm2.MenuItemClick(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to Temp_DBGridEh1.FieldCount-1 do
  if Temp_DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    Temp_DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to Temp_DBGridEh1.FieldCount-1 do
  if Temp_DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    Temp_DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;


procedure TMainTemForm2.BitBtn5Click(Sender: TObject);
begin
  inherited;
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);

end;

procedure TMainTemForm2.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if Temp_DBGridEh1.DataSource.DataSet.RecordCount <= 1 then exit;

  // self.TitleBtnSort1(sender,acol,column,adoquery,1)
  TitleBtnSort1(sender,acol,column,dm.wzcx96_1);

end;

procedure TMainTemForm2.BitBtn2Click(Sender: TObject);
begin
  inherited;
  self.DbgridEHToExcel2(Temp_DBGridEh1,'材料报废与退货');

end;

procedure TMainTemForm2.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If_Form1:=TIf_Form1.Create(application) ;
  try
    if If_Form1.ShowModal=mrok then
    begin
       If_Form1.Hide;
       //showmessage('k');
       //If_Form1.Hide;
       if dm.wzcx96_1.Active then dm.wzcx96_1.Close;
       dm.wzcx96_1.Parameters.ParamValues['@if1']:=1;

       dm.wzcx96_1.Parameters.ParamValues['@wher1']:=If_Form1.parametersvalue1;
       dm.wzcx96_1.Parameters.ParamValues['@wher2']:=If_Form1.parametersvalue1;
       dm.wzcx96_1.Parameters.ParamValues['@wher3']:=If_Form1.parametersvalue2;
       dm.wzcx96_1.Parameters.ParamValues['@wher4']:=If_Form1.parametersvalue3;
       dm.wzcx96_1.Parameters.ParamValues['@wher5']:=If_Form1.parametersvalue4;
       dm.wzcx96_1.Parameters.ParamValues['@wher6']:=If_Form1.parametersvalue5;
       dm.wzcx96_1.Parameters.ParamValues['@wher7']:=If_Form1.parametersvalue7;
       dm.wzcx96_1.Parameters.ParamValues['@ISSUE_DATE1']:=FormatDateTime('yyyy-MM-dd',(If_Form1.DateTimePicker1.Date))+ ' ' +FormatDateTime('HH:mm:ss',(If_Form1.dtp2.Time));
       dm.wzcx96_1.Parameters.ParamValues['@ISSUE_DATE2']:=FormatDateTime('yyyy-MM-dd',(If_Form1.DateTimePicker2.Date))+ ' ' +FormatDateTime('HH:mm:ss',(If_Form1.dtp4.Time));

       //dm.wzcx96_1.Parameters.ParamValues['@ISSUE_DATE1']:=DateToStr(If_Form1.DateTimePicker1.Date) + ' ' + TimeToStr(If_Form1.dtp2.Time);
       //dm.wzcx96_1.Parameters.ParamValues['@ISSUE_DATE2']:=DateToStr(If_Form1.DateTimePicker2.Date) + ' ' + TimeToStr(If_Form1.dtp4.Time);
       dm.wzcx96_1.Parameters.ParamValues['@if2']:=If_Form1.RadioGroup1.ItemIndex;
       //dm.wzcx96_1.Prepared;
       dm.wzcx96_1.Open;

       Temp_DBGridEh1.SetFocus;
    end;
  finally
    If_Form1.Free;
  end;

end;

procedure TMainTemForm2.BitBtn4Click(Sender: TObject);
var
  s,s2,s3:string;
  b2:boolean;
  V2: Variant;
begin
  inherited;
 try
   if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
   if Temp_DBGridEh1.DataSource.DataSet.RecordCount <=1 then exit;
   if self.vColumn1 = nil then
   begin
     s :='INV_PART_NUMBER';
     s3 := '材料编码：  ';
   end
   else
   begin
     s := self.vColumn1.FieldName;
     s3 := self.vColumn1.Title.Caption+':             '  ;
   end;
   //vColumn1.Field.DataType =
   //ftDate, ftTime, ftDateTime

   s2:=inputbox('输入--'+s3, s3, vs3);
   vs3 :=s2 ;
   v2:=vs3;
   if s2='' then exit;
   //DBGridEH1.DataSource.DataSet.Lookup()
   b2 := Temp_DBGridEh1.DataSource.DataSet.Locate(s,v2,[]);
   if not b2 then showmessage('没有找到您要求的记录！！请确认是否输入正确');
 except
 end;

end;

procedure TMainTemForm2.FormCreate(Sender: TObject);

begin
  inherited;

  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;
  Temp_DBGridEh1.DataSource := dm.DataSource1 ;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

end.
